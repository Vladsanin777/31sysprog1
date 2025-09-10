_Z20RunAndWaitForProcessv:
	subq	$40, %rsp
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rdi
	movq	%rax, 24(%rsp)
	call	strdup@PLT
	leaq	.LC1(%rip), %rdi
	movq	%rax, 8(%rsp)
	call	strdup@PLT
	movq	%rax, 16(%rsp)
	call	fork@PLT
	cmpl	$-1, %eax
	jne	.L2
	leaq	.LC2(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
	testl	%eax, %eax
	jne	.L3
	leaq	8(%rsp), %rsi
	leaq	.LC0(%rip), %rdi
	call	execvp@PLT
	leaq	.LC3(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	_exit@PLT
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	%eax, %edi
	call	waitpid@PLT
	incl	%eax
	jne	.L4
	leaq	.LC4(%rip), %rdi
	call	perror@PLT
	movb	$1, %al
	addq	$40, %rsp
	ret
main:
	pushq	%rax
	call	_Z20RunAndWaitForProcessv
	movl	$1, %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIbEERSoT_@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	xorl	%eax, %eax
	popq	%rdx
	ret
