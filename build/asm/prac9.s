_ZSt9factoriali:
	movl	%edi, %edi
	xorl	%eax, %eax
	movl	$1, %edx
	cmpq	%rdi, %rax
	je	.L5
	incq	%rax
	imulq	%rax, %rdx
	jmp	.L2
	movq	%rdx, %rax
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
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	xorl	%eax, %eax
	addq	$24, %rsp
	ret
