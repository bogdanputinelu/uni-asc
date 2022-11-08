.data
     matrix: .space 1600
     lineIndex: .space 4
     columnIndex: .space 4
     lines: .space 4
     columns: .space 4
     formatScanfCHAR: .asciz "%s"
     formatScanf: .asciz "%d"
     formatPrintf: .asciz "%d "
     formatPrintfENTER: .asciz "\n"
     name: .space 4
     x: .space 4
     res: .space 4
     contor: .space 4
     
     
.text

.global main

main:
     pushl $name
     pushl $formatScanfCHAR
     call scanf
     popl %ebx
     popl %ebx
     
     pushl $lines
     pushl $formatScanf
     call scanf
     popl %ebx
     popl %ebx
	
     pushl $columns
     pushl $formatScanf
     call scanf
     popl %ebx
     popl %ebx
     
     xorl %ecx,%ecx
     movl %ecx,lineIndex
     movl %ecx,columnIndex
     
fori:
     movl lineIndex,%ecx
     cmp lines,%ecx
     je program
     movl $0,columnIndex
     
     forj:
          movl columnIndex,%ecx
          cmp columns,%ecx
          je cont
          
          pushl $x
          pushl $formatScanf
          call scanf
          popl %ebx
          popl %ebx
          
          movl lineIndex,%eax
          xorl %edx,%edx
          mull columns
          addl columnIndex,%eax
          lea matrix,%edi
          movl x,%ecx
          movl %ecx,(%edi,%eax,4)
          
          incl columnIndex
          jmp forj
          
cont:
     incl lineIndex
     jmp fori
     
program:
     
     pushl $name
     pushl $formatScanfCHAR
     call scanf
     popl %ebx
     popl %ebx
     
     pushl $name
     pushl $formatScanfCHAR
     call scanf
     popl %ebx
     popl %ebx
     
     pushl $name
     pushl $formatScanfCHAR
     call scanf
     popl %ebx
     popl %ebx
     
     movl name,%eax
     movl %eax, res
     
     pushl $res
     call atoi
     popl %ebx
     
     movl %eax,res
     
     cmp $0,res
     je rot90d
     
     pushl $name
     pushl $formatScanfCHAR
     call scanf
     popl %ebx
     popl %ebx
     
     movl $name, %esi
     xorl %ecx,%ecx
     
     movb (%esi,%ecx,1), %bl
     
     cmp $97,%bl
     je matadd
     
     cmp $100,%bl
     je matdiv
     
     cmp $109,%bl
     je matmul
     
     cmp $115,%bl
     je matsub
     
matadd:
     xorl %ecx,%ecx
     movl %ecx,lineIndex
     foraddi:
          movl lineIndex,%ecx
          cmp lines,%ecx
          je afis
          movl $0,columnIndex
          
          foraddj:
               movl columnIndex,%ecx
               cmp columns, %ecx
               je contadd
               
               movl lineIndex,%eax
               xorl %edx,%edx
               mull columns
               addl columnIndex,%eax
               movl (%edi,%eax,4),%ebx
               addl res,%ebx
               movl %ebx,(%edi,%eax,4)
               
               
               incl columnIndex
               jmp foraddj
          
     contadd:
          incl lineIndex
          jmp foraddi
matdiv:
     xorl %ecx,%ecx
     movl %ecx,lineIndex
     fordivi:
          movl lineIndex,%ecx
          cmp lines,%ecx
          je afis
          movl $0,columnIndex
          
          fordivj:
               movl columnIndex,%ecx
               cmp columns, %ecx
               je contdiv
               
               movl lineIndex,%eax
               xorl %edx,%edx
               mull columns
               addl columnIndex,%eax
               movl (%edi,%eax,4),%ebx
               
               movl %eax,contor
               movl %ebx,%eax
               cdq
               idivl res
               movl %eax,%ebx
               movl contor,%eax
               
               movl %ebx,(%edi,%eax,4)
               
               
               incl columnIndex
               jmp fordivj
          
     contdiv:
          incl lineIndex
          jmp fordivi
matmul:
     xorl %ecx,%ecx
     movl %ecx,lineIndex
     formuli:
          movl lineIndex,%ecx
          cmp lines,%ecx
          je afis
          movl $0,columnIndex
          
          formulj:
               movl columnIndex,%ecx
               cmp columns, %ecx
               je contmul
               
               movl lineIndex,%eax
               xorl %edx,%edx
               mull columns
               addl columnIndex,%eax
               movl (%edi,%eax,4),%ebx
               
               movl %eax,contor
               movl %ebx,%eax
               imull res
               movl %eax,%ebx
               movl contor,%eax
               
               movl %ebx,(%edi,%eax,4)
               
               
               incl columnIndex
               jmp formulj
          
     contmul:
          incl lineIndex
          jmp formuli
matsub:
     xorl %ecx,%ecx
     movl %ecx,lineIndex
     forsubi:
          movl lineIndex,%ecx
          cmp lines,%ecx
          je afis
          movl $0,columnIndex
          
          forsubj:
               movl columnIndex,%ecx
               cmp columns, %ecx
               je contsub
               
               movl lineIndex,%eax
               xorl %edx,%edx
               mull columns
               addl columnIndex,%eax
               movl (%edi,%eax,4),%ebx
               subl res,%ebx
               movl %ebx,(%edi,%eax,4)
               
               
               incl columnIndex
               jmp forsubj
          
     contsub:
          incl lineIndex
          jmp forsubi
rot90d:
     pushl columnIndex
     pushl $formatPrintf
     call printf
     popl %ebx
     popl %ebx
     
     pushl lineIndex
     pushl $formatPrintf
     call printf
     popl %ebx
     popl %ebx

     xorl %ecx,%ecx
     movl %ecx,columnIndex
     forroti:
          movl columnIndex,%ecx
          cmp columns,%ecx
          je exit
          movl lines,%ecx
          subl $1,%ecx
          movl %ecx,lineIndex
          forrotj:
               movl lineIndex,%ecx
               incl %ecx
               cmp $0,%ecx
               je conrot
               
               movl lineIndex,%eax
               xorl %edx,%edx
               mull columns
               addl columnIndex,%eax
               movl (%edi,%eax,4),%ebx
               
               pushl %ebx
               pushl $formatPrintf
               call printf
               popl %ebx
               popl %ebx
               
               movl lineIndex,%ecx
               subl $1,%ecx
               movl %ecx,lineIndex
               jmp forrotj
     conrot:
          incl columnIndex
          jmp forroti
afis:
     pushl lineIndex
     pushl $formatPrintf
     call printf
     popl %ebx
     popl %ebx
     
     pushl columnIndex
     pushl $formatPrintf
     call printf
     popl %ebx
     popl %ebx
     
     xorl %ecx,%ecx
     movl %ecx,lineIndex
     forai:
          movl lineIndex,%ecx
          cmp lines,%ecx
          je exit
          movl $0,columnIndex
          
          foraj:
               movl columnIndex,%ecx
               cmp columns,%ecx
               je continue
          
               movl lineIndex,%eax
               xorl %edx,%edx
               mull columns
               addl columnIndex,%eax
               movl (%edi,%eax,4),%ebx
               
               pushl %ebx
               pushl $formatPrintf
               call printf
               popl %ebx
               popl %ebx
               
               incl columnIndex
               jmp foraj
          
     continue:
          incl lineIndex
          jmp forai
     
     
     
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
