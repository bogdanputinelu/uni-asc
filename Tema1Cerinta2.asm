.data
     x: .space 4
     sir: .space 100
     formatPrintfDEC: .asciz "%d\n"
     chDelim: .asciz " "
     res: .space 4
.text

.global main

main:
     pushl $sir
     call gets
     popl %ebx
     
     pushl $chDelim
     pushl $sir
     call strtok
     popl %ebx
     popl %ebx
     
     movl %eax,res
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,res
     
     pushl res
     
for:
     pushl $chDelim
     pushl $0
     call strtok
     popl %ebx
     popl %ebx
     
     cmp $0,%eax
     je exit
     
     movl %eax, res
     movl %eax,%edi
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,res
     
     cmp $0,res
     je operatie
     
     pushl res
     
     jmp for
     
operatie:
     xorl %ecx,%ecx
     movb (%edi,%ecx,1),%bl
     cmp $97,%bl
     je opADD
     
     cmp $100,%bl
     je opDIV
     
     cmp $109,%bl
     je opMUL
     
     cmp $115,%bl
     je opSUB
     
opADD:
     popl %eax
     popl %ebx
     movl %ebx,x
     addl x,%eax
     pushl %eax
     jmp for
     
opMUL:
     popl %eax
     popl %ebx
     movl %ebx,x
     xorl %edx,%edx
     mull x
     pushl %eax
     jmp for
     
opSUB:
     popl %ebx
     popl %eax
     movl %ebx,x
     subl x,%eax
     pushl %eax
     jmp for
     
opDIV:
     popl %ebx
     popl %eax
     movl %ebx,x
     xorl %edx,%edx
     divl x
     pushl %eax
     jmp for
exit:   
     pushl $formatPrintfDEC
     call printf
     popl %ebx
     popl %ebx
     
     movl $1,%eax
     xorl %ebx,%ebx
     int $0x80
