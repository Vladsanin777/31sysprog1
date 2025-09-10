main:
	subq	$24, %rsp
	leaq	_ZSt3cin(%rip), %rdi
	leaq	8(%rsp), %rsi
	call	_ZNSirsERi@PLT
	leaq	12(%rsp), %rsi
	movq	%rax, %rdi
	call	_ZNSirsERi@PLT
	movl	8(%rsp), %eax
	leaq	_ZSt4cout(%rip), %rdi
	imull	%eax, %eax
	imull	12(%rsp), %eax
	cvtsi2sdl	%eax, %xmm0
	mulsd	.LC0(%rip), %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	xorl	%eax, %eax
	addq	$24, %rsp
	ret
