main:
	pushq	%rbx
	leaq	_ZSt3cin(%rip), %rdi
	subq	$32, %rsp
	leaq	16(%rsp), %rax
	movq	%rsp, %rsi
	movb	$0, 16(%rsp)
	movq	%rax, (%rsp)
	xorl	%eax, %eax
	movq	%rax, 8(%rsp)
	call	_ZStrsIcSt11char_traitsIcESaIcEERSt13basic_istreamIT_T0_ES7_RNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
	movq	%rsp, %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	movq	%rsp, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@PLT
	addq	$32, %rsp
	xorl	%eax, %eax
	popq	%rbx
	ret
