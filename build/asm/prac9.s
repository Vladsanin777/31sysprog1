_ZSt9factoriali:
	movl	$1, %eax
	testl	%edi, %edi
	je	.L5
	decl	%edi
	leaq	1(%rax,%rax), %rax
	jmp	.L2
	ret
main:
	subq	$24, %rsp
	leaq	_ZSt3cin(%rip), %rdi
	leaq	12(%rsp), %rsi
	call	_ZNSirsERi@PLT
	movl	12(%rsp), %edi
	call	_ZSt9factoriali
	leaq	_ZSt4cout(%rip), %rdi
	movq	%rax, %rsi
	call	_ZNSo9_M_insertIxEERSoT_@PLT
	xorl	%eax, %eax
	addq	$24, %rsp
	ret
