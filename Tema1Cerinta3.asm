.data
     a: .long 0
     b: .long 0
     c: .long 0
     d: .long 0
     e: .long 0
     f: .long 0
     g: .long 0
     h: .long 0
     i: .long 0
     j: .long 0
     k: .long 0
     l: .long 0
     m: .long 0
     n: .long 0
     o: .long 0
     p: .long 0
     q: .long 0
     r: .long 0
     s: .long 0
     t: .long 0
     u: .long 0
     v: .long 0
     w: .long 0
     x1: .long 0
     y: .long 0
     z: .long 0
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
     movl %eax,%edi
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,res
     
     cmp $0,res
     je operatie
     
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
     incl %ecx
     movb (%edi,%ecx,1),%bl
     xorl %ecx,%ecx
     
     cmp $0,%bl
     je variabila
     
     movb (%edi,%ecx,1),%bl
     
     cmp $97,%bl
     je opADD
     
     cmp $100,%bl
     je opDIV
     
     cmp $109,%bl
     je opMUL
     
     cmp $115,%bl
     je opSUB
     
     jmp for
     
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
     
variabila:
     movb (%edi,%ecx,1),%bl
     
     cmp $97,%bl
     je Vara
     
     cmp $98,%bl
     je Varb
     
     cmp $99,%bl
     je Varc
     
     cmp $100,%bl
     je Vard
     
     cmp $101,%bl
     je Vare
     
     cmp $102,%bl
     je Varf
     
     cmp $103,%bl
     je Varg
     
     cmp $104,%bl
     je Varh
     
     cmp $105,%bl
     je Vari
     
     cmp $106,%bl
     je Varj
     
     cmp $107,%bl
     je Vark
     
     cmp $108,%bl
     je Varl
     
     cmp $109,%bl
     je Varm
     
     cmp $110,%bl
     je Varn
     
     cmp $111,%bl
     je Varo
     
     cmp $112,%bl
     je Varp
     
     cmp $113,%bl
     je Varq
     
     cmp $114,%bl
     je Varr
     
     cmp $115,%bl
     je Vars
     
     cmp $116,%bl
     je Vart
     
     cmp $117,%bl
     je Varu
     
     cmp $118,%bl
     je Varv
     
     cmp $119,%bl
     je Varw
     
     cmp $120,%bl
     je Varx
     
     cmp $121,%bl
     je Vary
     
     cmp $122,%bl
     je Varz
     
Vara:
     cmp $0,a
     je Inita
     
     pushl a
     jmp for
     
Inita:
     pushl $chDelim
     pushl $0
     call strtok
     popl %ebx
     popl %ebx
     
     movl %eax, res
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,a
     
     jmp for

Varb:
     cmp $0,b
     je Initb
     
     pushl b
     jmp for
     
Initb:
     pushl $chDelim
     pushl $0
     call strtok
     popl %ebx
     popl %ebx
     
     movl %eax, res
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,b
     
     jmp for
Varc:
     cmp $0,c
     je Initc
     
     pushl c
     jmp for
     
Initc:
     pushl $chDelim
     pushl $0
     call strtok
     popl %ebx
     popl %ebx
     
     movl %eax, res
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,c
     
     jmp for
Vard:
     cmp $0,d
     je Initd
     
     pushl d
     jmp for
     
Initd:
     pushl $chDelim
     pushl $0
     call strtok
     popl %ebx
     popl %ebx
     
     movl %eax, res
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,d
     
     jmp for
Vare:
     cmp $0,e
     je Inite
     
     pushl e
     jmp for
     
Inite:
     pushl $chDelim
     pushl $0
     call strtok
     popl %ebx
     popl %ebx
     
     movl %eax, res
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,e
     
     jmp for
Varf:
     cmp $0,f
     je Initf
     
     pushl f
     jmp for
     
Initf:
     pushl $chDelim
     pushl $0
     call strtok
     popl %ebx
     popl %ebx
     
     movl %eax, res
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,f
     
     jmp for
Varg:
     cmp $0,g
     je Initg
     
     pushl g
     jmp for
     
Initg:
     pushl $chDelim
     pushl $0
     call strtok
     popl %ebx
     popl %ebx
     
     movl %eax, res
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,g
     
     jmp for
Varh:
     cmp $0,h
     je Inith
     
     pushl h
     jmp for
     
Inith:
     pushl $chDelim
     pushl $0
     call strtok
     popl %ebx
     popl %ebx
     
     movl %eax, res
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,h
     
     jmp for
Vari:
     cmp $0,i
     je Initi
     
     pushl i
     jmp for
     
Initi:
     pushl $chDelim
     pushl $0
     call strtok
     popl %ebx
     popl %ebx
     
     movl %eax, res
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,i
     
     jmp for
Varj:
     cmp $0,j
     je Initj
     
     pushl j
     jmp for
     
Initj:
     pushl $chDelim
     pushl $0
     call strtok
     popl %ebx
     popl %ebx
     
     movl %eax, res
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,j
     
     jmp for
Vark:
     cmp $0,k
     je Initk
     
     pushl k
     jmp for
     
Initk:
     pushl $chDelim
     pushl $0
     call strtok
     popl %ebx
     popl %ebx
     
     movl %eax, res
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,k
     
     jmp for
Varl:
     cmp $0,l
     je Initl
     
     pushl l
     jmp for
     
Initl:
     pushl $chDelim
     pushl $0
     call strtok
     popl %ebx
     popl %ebx
     
     movl %eax, res
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,l
     
     jmp for
Varm:
     cmp $0,m
     je Initm
     
     pushl m
     jmp for
     
Initm:
     pushl $chDelim
     pushl $0
     call strtok
     popl %ebx
     popl %ebx
     
     movl %eax, res
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,m
     
     jmp for
Varn:
     cmp $0,n
     je Initn
     
     pushl n
     jmp for
     
Initn:
     pushl $chDelim
     pushl $0
     call strtok
     popl %ebx
     popl %ebx
     
     movl %eax, res
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,n
     
     jmp for
Varo:
     cmp $0,o
     je Inito
     
     pushl o
     jmp for
     
Inito:
     pushl $chDelim
     pushl $0
     call strtok
     popl %ebx
     popl %ebx
     
     movl %eax, res
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,o
     
     jmp for
Varp:
     cmp $0,p
     je Initp
     
     pushl p
     jmp for
     
Initp:
     pushl $chDelim
     pushl $0
     call strtok
     popl %ebx
     popl %ebx
     
     movl %eax, res
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,p
     
     jmp for
Varq:
     cmp $0,q
     je Initq
     
     pushl q
     jmp for
     
Initq:
     pushl $chDelim
     pushl $0
     call strtok
     popl %ebx
     popl %ebx
     
     movl %eax, res
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,q
     
     jmp for
Varr:
     cmp $0,r
     je Initr
     
     pushl r
     jmp for
     
Initr:
     pushl $chDelim
     pushl $0
     call strtok
     popl %ebx
     popl %ebx
     
     movl %eax, res
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,r
     
     jmp for
Vars:
     cmp $0,s
     je Inits
     
     pushl s
     jmp for
     
Inits:
     pushl $chDelim
     pushl $0
     call strtok
     popl %ebx
     popl %ebx
     
     movl %eax, res
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,s
     
     jmp for
Vart:
     cmp $0,t
     je Initt
     
     pushl t
     jmp for
     
Initt:
     pushl $chDelim
     pushl $0
     call strtok
     popl %ebx
     popl %ebx
     
     movl %eax, res
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,t
     
     jmp for
Varu:
     cmp $0,u
     je Initu
     
     pushl u
     jmp for
     
Initu:
     pushl $chDelim
     pushl $0
     call strtok
     popl %ebx
     popl %ebx
     
     movl %eax, res
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,u
     
     jmp for
Varv:
     cmp $0,v
     je Initv
     
     pushl v
     jmp for
     
Initv:
     pushl $chDelim
     pushl $0
     call strtok
     popl %ebx
     popl %ebx
     
     movl %eax, res
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,v
     
     jmp for
Varw:
     cmp $0,w
     je Initw
     
     pushl w
     jmp for
     
Initw:
     pushl $chDelim
     pushl $0
     call strtok
     popl %ebx
     popl %ebx
     
     movl %eax, res
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,w
     
     jmp for
Varx:
     cmp $0,x1
     je Initx
     
     pushl x1
     jmp for
     
Initx:
     pushl $chDelim
     pushl $0
     call strtok
     popl %ebx
     popl %ebx
     
     movl %eax, res
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,x1
     
     jmp for
Vary:
     cmp $0,y
     je Inity
     
     pushl y
     jmp for
     
Inity:
     pushl $chDelim
     pushl $0
     call strtok
     popl %ebx
     popl %ebx
     
     movl %eax, res
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,y
     
     jmp for
Varz:
     cmp $0,z
     je Initz
     
     pushl z
     jmp for
     
Initz:
     pushl $chDelim
     pushl $0
     call strtok
     popl %ebx
     popl %ebx
     
     movl %eax, res
     
     pushl res
     call atoi
     popl %ebx
     
     movl %eax,z
     
     jmp for
exit:   
     pushl $formatPrintfDEC
     call printf
     popl %ebx
     popl %ebx
     
     movl $1,%eax
     xorl %ebx,%ebx
     int $0x80
