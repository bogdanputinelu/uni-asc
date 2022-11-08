.data
	n: .space 4
	nrelem: .long 3
	m: .space 4 
	chDelim: .asciz " \n"
	formatPrintf: .asciz "%d "
	enter: .asciz "\n"
	formatInexistenta: .asciz "-1"
	formatPrintf1: .asciz "%d %d %d\n"
	formatPrintf2: .asciz "%d %d\n"
	sir: .space 250
	vect: .space 500
	fr: .space 500
	sol: .space 500

.text
valid:
	pushl %ebp
	movl %esp,%ebp
	
	movl 8(%ebp),%ebx         #%ebx=k
	
	lea fr, %edi
	lea sol, %esi
	
	movl (%esi,%ebx,4),%edx   #sol[k]
	movl (%edi,%edx,4),%eax   # fr[sol[k]]
	
	cmp $3, %eax              # fr[sol[k]]>3
	jg zero_valid
	
	lea vect,%edi
	movl (%edi,%ebx,4), %edx
	
	cmp $0,%edx               #v[k]!=0
	je pozitie_libera
	
	movl (%esi,%ebx,4),%eax
	
	cmp %eax,%edx              #v[k]!=sol[k]
	jne zero_valid
	
	pozitie_libera:
	
	xorl %ecx,%ecx             # i=0
	cmp m,%ebx
	jle neverif
	
	movl %ebx,%ecx
	subl m,%ecx          # %ecx=%ebx-m    i=k-m
	
	neverif:             # for
	
		cmp %ecx,%ebx
		je unu_valid
		
		movl (%esi,%ecx,4),%eax   # %eax=sol[i]
		movl (%esi,%ebx,4), %edx  # %edx=sol[k]
		
		cmp %eax,%edx
		je zero_valid
		
		incl %ecx
		jmp neverif
		
	zero_valid:
		xorl %eax,%eax   
		popl %ebp
		ret
	unu_valid:
		movl $1,%eax
		popl %ebp
		ret

succesor:
	pushl %ebp
	movl %esp,%ebp
	
	movl 8(%ebp),%ebx              # %ebx=k
	
	lea sol,%edi                   #%edi=sol
	lea fr,%esi                    #%esi=fr
	
	movl (%edi,%ebx,4),%eax        # %eax=sol[k]
	
	cmp n,%eax
	jge fara_succesor
	
	cmp $0,%eax
	je frecventa_zero
	
	movl (%esi,%eax,4),%ecx      # %ecx=fr[sol[k]]
	decl %ecx
	movl %ecx, (%esi,%eax,4)     
	
	frecventa_zero:
		incl %eax			#sol[k]++
		movl %eax, (%edi,%ebx,4)
		
		movl (%esi,%eax,4), %ecx       #%ecx=fr[sol[k]]
		incl %ecx
		movl %ecx, (%esi,%eax,4)
		
		movl $1,%eax                  # return 1
		jmp sfarsit_succesor
		
	
	fara_succesor:
		movl (%esi,%eax,4),%ebx       # fr[sol[k]]--
		decl %ebx
		movl %ebx,(%esi,%eax,4)
		
		movl $0,%eax                  # return 0
		jmp sfarsit_succesor
	
	sfarsit_succesor:
		popl %ebp
		ret
back:
	pushl %ebp
	movl %esp,%ebp
	
	movl 8(%ebp),%ebx               # %ebx=k
	cmp nrelem,%ebx
	jne solutionare
	
	xorl %ecx,%ecx
	lea sol, %edi
		for_tipar:
			cmp nrelem,%ecx
			je exit
			
			pushl %ecx
			
			pushl (%edi,%ecx,4)
			pushl $formatPrintf
			call printf
			popl %ebx
			popl %ebx
			
			popl %ecx
			
			incl %ecx
			jmp for_tipar
	
	
	solutionare:
	
	lea sol,%edi                   # %edi=sol
	movl $0, (%edi,%ebx,4)		# sol[k]=0
	
	while:
		movl 8(%ebp),%ebx
		
		pushl %ebx
		call succesor
		popl %edx
		
		cmp $0,%eax
		je finish
		
		movl 8(%ebp),%ebx
		
		pushl %ebx
		call valid
		popl %edx
		
		cmp $0,%eax
		je continuare_while
		
		movl 8(%ebp),%ebx
		
		movl %ebx,%ecx          #%ecx=k
		incl %ecx
		
		pushl %ecx
		call back
		popl %edx
		
		continuare_while:
			jmp while
	
	
	finish:
		popl %ebp
		ret

.global main

main:
	movl $3, %eax
	movl $2, %ebx
	movl $sir, %ecx
	movl $250, %edx
	int $0x80
	
	pushl $chDelim
	pushl $sir
	call strtok
	popl %ebx
	popl %ebx
	
	pushl %eax
	call atoi
	popl %ebx
	
	movl %eax,n
	
	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	
	pushl %eax
	call atoi
	popl %ebx
	
	movl %eax, m
	
	xorl %edx,%edx
	movl n,%eax
	mull nrelem
	movl %eax,nrelem
	
	lea vect, %edi
	lea fr, %esi
	xorl %ecx,%ecx
	
citire:
	pushl %ecx
	
	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	
	popl %ecx
	
	cmp $0,%eax
	je citire_final
	
	pushl %ecx
	
	pushl %eax
	call atoi
	popl %ebx
	
	popl %ecx
	
	movl %eax, (%edi,%ecx,4)
	movl $0, (%esi,%ecx,4)
	
	incl %ecx
	jmp citire

citire_final:
	
	xorl %ecx,%ecx
	pushl %ecx
	call back
	popl %ebx
	
	pushl $formatInexistenta
	call printf
	popl %ebx

exit:
	pushl $enter
	call printf
	popl %ebx
	
	movl $1,%eax
	xorl %ebx,%ebx
	int $0x80
