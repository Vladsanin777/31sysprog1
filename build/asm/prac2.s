main:
	subq	$24, %rsp
	leaq	_ZSt3cin(%rip), %rdi
	movq	%rsp, %rsi
	call	_ZNSirsERi@PLT
	leaq	4(%rsp), %rsi
	movq	%rax, %rdi
	call	_ZNSirsERi@PLT
	leaq	8(%rsp), %rsi
	movq	%rax, %rdi
	call	_ZNSirsERi@PLT
	leaq	12(%rsp), %rsi
	movq	%rax, %rdi
	call	_ZNSirsERi@PLT
	movl	4(%rsp), %esi
	movl	8(%rsp), %eax
	leaq	_ZSt4cout(%rip), %rdi
	addl	(%rsp), %esi
	subl	12(%rsp), %eax
	imull	%eax, %esi
	call	_ZNSolsEi@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	xorl	%eax, %eax
	addq	$24, %rsp
	ret
