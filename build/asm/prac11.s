_Z14ThreadFunctionPv:
	pushq	%rax
	movl	(%rdi), %esi
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rdi
	call	printf@PLT
	xorl	%eax, %eax
	popq	%rdx
	ret
main:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	xorl	%ebx, %ebx
	subq	$64, %rsp
	leaq	4(%rsp), %rbp
	movl	%ebx, 0(%rbp)
	leaq	24(%rsp), %r12
	movq	%rbp, %rcx
	xorl	%esi, %esi
	leaq	(%r12,%rbx,8), %rdi
	leaq	_Z14ThreadFunctionPv(%rip), %rdx
	incq	%rbx
	addq	$4, %rbp
	call	pthread_create@PLT
	cmpq	$5, %rbx
	jne	.L4
	xorl	%ebx, %ebx
	movq	(%r12,%rbx,8), %rdi
	xorl	%esi, %esi
	incq	%rbx
	call	pthread_join@PLT
	cmpq	$5, %rbx
	jne	.L5
	addq	$64, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
