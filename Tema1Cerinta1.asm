.data
     contor: .space 4
     x: .long 16
     sirb16: .space 100
     formatScanf: .asciz "%s"
     formatPrintfLET: .asciz "let "
     formatPrintfADD: .asciz "add "
     formatPrintfSUB: .asciz "sub "
     formatPrintfMUL: .asciz "mul "
     formatPrintfDIV: .asciz "div " 
     formatPrintfCHAR: .asciz "%c "
     formatPrintfPOZ: .asciz "%d "
     formatPrintfNEG: .asciz "-%d "
     formatPrintfENTER: .asciz "\n"
     
.text

.global main

main:
    pushl $sirb16
    pushl $formatScanf
    call scanf
    popl %ebx
    popl %ebx
    
    movl $sirb16, %edi
    xorl %ecx,%ecx
    
for:
    movb (%edi,%ecx,1),%bl
    cmp $0,%bl
    je exit
    
    cmp $56,%bl
    je cif8
    
    cmp $57,%bl
    je cif9
    
    cmp $65,%bl
    je cifA
    
    cmp $67,%bl
    je cifC
    
cont:   
    incl %ecx
    jmp for
    
cif8:
    movl $1,contor
comparari:
    incl %ecx
    movb (%edi,%ecx,1),%bl
       
    cmp $48,%bl
    je PrimCif0
    
    cmp $49,%bl
    je PrimCif1
    
    cmp $50,%bl
    je PrimCif2
    
    cmp $51,%bl
    je PrimCif3
    
    cmp $52,%bl
    je PrimCif4
    
    cmp $53,%bl
    je PrimCif5
    
    cmp $54,%bl
    je PrimCif6
    
    cmp $55,%bl
    je PrimCif7
    
    cmp $56,%bl
    je PrimCif8
    
    cmp $57,%bl
    je PrimCif9
    
    cmp $65,%bl
    je PrimCif10
    
    cmp $66,%bl
    je PrimCif11
    
    cmp $67,%bl
    je PrimCif12
    
    cmp $68,%bl
    je PrimCif13
    
    cmp $69,%bl
    je PrimCif14
    
    cmp $70,%bl
    je PrimCif15
    
cont8:
    incl %ecx
    movb (%edi,%ecx,1),%bl
    
    cmp $48,%bl
    je SecCif0
    
    cmp $49,%bl
    je SecCif1
    
    cmp $50,%bl
    je SecCif2
    
    cmp $51,%bl
    je SecCif3
    
    cmp $52,%bl
    je SecCif4
    
    cmp $53,%bl
    je SecCif5
    
    cmp $54,%bl
    je SecCif6
    
    cmp $55,%bl
    je SecCif7
    
    cmp $56,%bl
    je SecCif8
    
    cmp $57,%bl
    je SecCif9
    
    cmp $65,%bl
    je SecCif10
    
    cmp $66,%bl
    je SecCif11
    
    cmp $67,%bl
    je SecCif12
    
    cmp $68,%bl
    je SecCif13
    
    cmp $69,%bl
    je SecCif14
    
    cmp $70,%bl
    je SecCif15
    
cif9:
    movl $2,contor
    jmp comparari
    
    
cifA:
    movl $3,contor
    jmp comparari
    
cifC:
    addl $2,%ecx
    movb (%edi,%ecx,1),%bl
    
    cmp $48, %bl
    je oper0
    
    cmp $49, %bl
    je oper1
    
    cmp $50, %bl
    je oper2
    
    cmp $51, %bl
    je oper3
    
    cmp $52, %bl
    je oper4
    
    
oper0:
    pushl %ecx
    pushl $formatPrintfLET
    call printf
    popl %ebx
    popl %ecx
    jmp cont
    
oper1:
    pushl %ecx
    pushl $formatPrintfADD
    call printf
    popl %ebx
    popl %ecx
    jmp cont
    
oper2:
    pushl %ecx
    pushl $formatPrintfSUB
    call printf
    popl %ebx
    popl %ecx
    jmp cont  
    
oper3:
    pushl %ecx
    pushl $formatPrintfMUL
    call printf
    popl %ebx
    popl %ecx
    jmp cont
    
oper4:
    pushl %ecx
    pushl $formatPrintfDIV
    call printf
    popl %ebx
    popl %ecx
    jmp cont

PrimCif0:
    movl $0,%eax
    mull x
    jmp cont8
    
PrimCif1:
    movl $1,%eax
    mull x
    jmp cont8
    
PrimCif2:
    movl $2,%eax
    mull x
    jmp cont8
    
PrimCif3:
    movl $3,%eax
    mull x
    jmp cont8
    
PrimCif4:
    movl $4,%eax
    mull x
    jmp cont8
    
PrimCif5:
    movl $5,%eax
    mull x
    jmp cont8
    
PrimCif6:
    movl $6,%eax
    mull x
    jmp cont8
    
PrimCif7:
    movl $7,%eax
    mull x
    jmp cont8

PrimCif8:
    movl $8,%eax
    mull x
    jmp cont8
    
PrimCif9:
    movl $9,%eax
    mull x
    jmp cont8
    
PrimCif10:
    movl $10,%eax
    mull x
    jmp cont8
    
PrimCif11:
    movl $11,%eax
    mull x
    jmp cont8
    
PrimCif12:
    movl $12,%eax
    mull x
    jmp cont8
    
PrimCif13:
    movl $13,%eax
    mull x
    jmp cont8
    
PrimCif14:
    movl $14,%eax
    mull x
    jmp cont8

PrimCif15:
    movl $15,%eax
    mull x
    jmp cont8
    
SecCif0:
    addl $0, %eax
    jmp afis
    
SecCif1:
    addl $1, %eax
    jmp afis

SecCif2:
    addl $2, %eax
    jmp afis

SecCif3:
    addl $3, %eax
    jmp afis
    
SecCif4:
    addl $4, %eax
    jmp afis

SecCif5:
    addl $5, %eax
    jmp afis
    
SecCif6:
    addl $6, %eax
    jmp afis
    
SecCif7:
    addl $7, %eax
    jmp afis

SecCif8:
    addl $8, %eax
    jmp afis

SecCif9:
    addl $9, %eax
    jmp afis
    
SecCif10:
    addl $10, %eax
    jmp afis

SecCif11:
    addl $11, %eax
    jmp afis
    
SecCif12:
    addl $12, %eax
    jmp afis

SecCif13:
    addl $13, %eax
    jmp afis
    
SecCif14:
    addl $14, %eax
    jmp afis

SecCif15:
    addl $15, %eax
    jmp afis
afis:
    cmp $1,contor
    je afispoz
    
    cmp $2,contor
    je afisneg
    
    cmp $3,contor
    je afisvar

afispoz:
    pushl %ecx
    
    pushl %eax
    pushl $formatPrintfPOZ
    call printf
    popl %ebx
    popl %ebx
    
    popl %ecx
    jmp cont

afisneg:
    pushl %ecx
    
    pushl %eax
    pushl $formatPrintfNEG
    call printf
    popl %ebx
    popl %ebx
    
    popl %ecx
    jmp cont
    
afisvar:
    pushl %ecx
    
    pushl %eax
    pushl $formatPrintfCHAR
    call printf
    popl %ebx
    popl %ebx
    
    popl %ecx
    jmp cont
exit:
    pushl $formatPrintfENTER
    call printf
    popl %ebx
    pushl $0
    call fflush
    popl %ebx
    movl $1,%eax
    xorl %ebx,%ebx
    int $0x80
    
