_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag.isra.0:
	pushq	%r12
	subq	%rsi, %rdx
	movq	%rsi, %r12
	pushq	%rbp
	movq	%rdx, %rbp
	pushq	%rbx
	movq	%rdi, %rbx
	subq	$16, %rsp
	movq	%rdx, 8(%rsp)
	cmpq	$15, %rdx
	jbe	.L2
	leaq	8(%rsp), %rsi
	xorl	%edx, %edx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@PLT
	movq	%rax, (%rbx)
	movq	8(%rsp), %rax
	movq	%rax, 16(%rbx)
	movq	(%rbx), %rdi
	movq	%rbp, %rdx
	movq	%r12, %rsi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_S_copyEPcPKcm@PLT
	movq	8(%rsp), %rax
	movq	(%rbx), %rdx
	movq	%rax, 8(%rbx)
	movb	$0, (%rdx,%rax)
	addq	$16, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
main:
	pushq	%rbp
	leaq	17+.LC0(%rip), %rdx
	pushq	%rbx
	leaq	-17(%rdx), %rsi
	subq	$72, %rsp
	leaq	16(%rsp), %rax
	movq	%rsp, %rdi
	leaq	32(%rsp), %rbp
	movq	%rax, (%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag.isra.0
	leaq	15+.LC1(%rip), %rdx
	leaq	48(%rsp), %rax
	movq	%rbp, %rdi
	leaq	-15(%rdx), %rsi
	movq	%rax, 32(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag.isra.0
	movq	%rbp, %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	movq	%rsp, %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	movq	%rbp, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@PLT
	movq	%rsp, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@PLT
	addq	$72, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	ret
