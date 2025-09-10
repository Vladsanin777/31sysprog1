main:
	pushq	%rbx
	movl	$30, %edi
	call	sysconf@PLT
	leaq	.LC0(%rip), %rdi
	incq	%rax
	je	.L12
	xorl	%r9d, %r9d
	movl	$-1, %r8d
	movl	$34, %ecx
	xorl	%edx, %edx
	movl	$1048576, %esi
	xorl	%edi, %edi
	call	mmap@PLT
	movq	%rax, %rbx
	cmpq	$-1, %rax
	jne	.L4
	leaq	.LC1(%rip), %rdi
	call	perror@PLT
	movl	$1, %eax
	jmp	.L1
	movl	$3, %edx
	movl	$4096, %esi
	movq	%rax, %rdi
	call	mprotect@PLT
	incl	%eax
	movl	$0, %eax
	jne	.L6
	leaq	.LC2(%rip), %rdi
	call	perror@PLT
	movl	$1048576, %esi
	movq	%rbx, %rdi
	call	munmap@PLT
	jmp	.L3
	movl	%eax, (%rbx,%rax,4)
	incq	%rax
	cmpq	$1024, %rax
	jne	.L6
	movl	400(%rbx), %esi
	leaq	.LC3(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movq	%rbx, %rdi
	movl	$1048576, %esi
	call	munmap@PLT
	leaq	.LC4(%rip), %rdi
	incl	%eax
	movl	$0, %eax
	je	.L12
	popq	%rbx
	ret
