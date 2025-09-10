_ZNSt15basic_streambufIcSt11char_traitsIcEE6sbumpcEv.isra.0:
	movq	16(%rdi), %rax
	cmpq	24(%rdi), %rax
	jnb	.L2
	incq	%rax
	movq	%rax, 16(%rdi)
	ret
	movq	(%rdi), %rax
	jmp	*80(%rax)
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
	jbe	.L7
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
_ZNSolsEPFRSoS_E.isra.0:
	jmp	*%rsi
_ZNKSt19istreambuf_iteratorIcSt11char_traitsIcEE6_M_getEv:
	movl	8(%rdi), %eax
	movq	(%rdi), %rdx
	cmpl	$-1, %eax
	jne	.L20
	testq	%rdx, %rdx
	je	.L20
	pushq	%rbx
	movq	%rdi, %rbx
	movq	%rdx, %rdi
	call	_ZNSt15basic_streambufIcSt11char_traitsIcEE5sgetcEv@PLT
	cmpl	$-1, %eax
	jne	.L10
	xorl	%edx, %edx
	movq	%rdx, (%rbx)
	popq	%rbx
	ret
	ret
main:
	pushq	%r15
	leaq	11+.LC0(%rip), %rdx
	pushq	%r14
	leaq	-11(%rdx), %rsi
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$1224, %rsp
	leaq	104(%rsp), %rax
	leaq	88(%rsp), %rdi
	movq	%rax, 88(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag.isra.0
	leaq	120(%rsp), %rax
	leaq	15+.LC1(%rip), %rdx
	movq	%rax, 8(%rsp)
	movq	8(%rsp), %rdi
	leaq	-15(%rdx), %rsi
	leaq	136(%rsp), %rax
	movq	%rax, 120(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag.isra.0
	movl	$48, %edx
	leaq	88(%rsp), %rsi
	leaq	184(%rsp), %rdi
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1ERKNSt7__cxx1112basic_stringIcS1_SaIcEEESt13_Ios_Openmode@PLT
	testb	$5, 464(%rsp)
	je	.L24
	leaq	.LC2(%rip), %rsi
	leaq	_ZSt4cerr(%rip), %rdi
	movl	$1, %ebp
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rsi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E.isra.0
	jmp	.L25
	leaq	.LC3(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rsi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E.isra.0
	movq	8(%rsp), %rsi
	leaq	184(%rsp), %rdi
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
	leaq	184(%rsp), %rdi
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEE5closeEv@PLT
	movl	$8, %edx
	leaq	88(%rsp), %rsi
	leaq	696(%rsp), %rax
	movq	%rax, %rdi
	movq	%rax, 16(%rsp)
	call	_ZNSt14basic_ifstreamIcSt11char_traitsIcEEC1ERKNSt7__cxx1112basic_stringIcS1_SaIcEEESt13_Ios_Openmode@PLT
	movl	984(%rsp), %ebp
	andl	$5, %ebp
	je	.L26
	leaq	.LC4(%rip), %rsi
	leaq	_ZSt4cerr(%rip), %rdi
	movl	$1, %ebp
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rsi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E.isra.0
	jmp	.L27
	leaq	.LC5(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	xorl	%ebx, %ebx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rsi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E.isra.0
	movq	696(%rsp), %rax
	xorl	%edx, %edx
	movl	$-1, 64(%rsp)
	movq	%rdx, 72(%rsp)
	movq	-24(%rax), %rax
	movl	$-1, 80(%rsp)
	movq	$15, 48(%rsp)
	movq	928(%rsp,%rax), %r15
	leaq	168(%rsp), %rax
	movq	%rax, 152(%rsp)
	xorl	%eax, %eax
	movq	%rax, 160(%rsp)
	leaq	56(%rsp), %rdi
	movq	%r15, 56(%rsp)
	call	_ZNKSt19istreambuf_iteratorIcSt11char_traitsIcEE6_M_getEv
	leaq	72(%rsp), %rdi
	movq	56(%rsp), %r15
	movl	%eax, 24(%rsp)
	call	_ZNKSt19istreambuf_iteratorIcSt11char_traitsIcEE6_M_getEv
	incl	%eax
	sete	%dl
	cmpl	$-1, 24(%rsp)
	sete	%al
	cmpb	%al, %dl
	je	.L28
	cmpq	48(%rsp), %rbx
	jnb	.L28
	leaq	56(%rsp), %rdi
	incq	%rbx
	call	_ZNKSt19istreambuf_iteratorIcSt11char_traitsIcEE6_M_getEv
	movq	56(%rsp), %r15
	movb	%al, 167(%rsp,%rbx)
	movq	%r15, %rdi
	call	_ZNSt15basic_streambufIcSt11char_traitsIcEE6sbumpcEv.isra.0
	movl	$-1, 64(%rsp)
	jmp	.L29
	leaq	72(%rsp), %rax
	movq	%rax, 32(%rsp)
	leaq	56(%rsp), %rdi
	movq	%r15, 56(%rsp)
	call	_ZNKSt19istreambuf_iteratorIcSt11char_traitsIcEE6_M_getEv
	movq	32(%rsp), %rdi
	movl	%eax, %r15d
	call	_ZNKSt19istreambuf_iteratorIcSt11char_traitsIcEE6_M_getEv
	incl	%eax
	sete	%dl
	incl	%r15d
	sete	%al
	cmpb	%al, %dl
	je	.L34
	leaq	1(%rbx), %rax
	movq	%rax, 24(%rsp)
	cmpq	%rbx, 48(%rsp)
	jne	.L30
	leaq	152(%rsp), %rcx
	leaq	48(%rsp), %rsi
	movq	%rbx, %rdx
	movq	%rax, 48(%rsp)
	movq	%rcx, %rdi
	movq	%rcx, 40(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@PLT
	movq	152(%rsp), %rsi
	movq	%rbx, %rdx
	movq	%rax, %rdi
	movq	%rax, %r15
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_S_copyEPcPKcm@PLT
	movq	40(%rsp), %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@PLT
	movq	48(%rsp), %rax
	movq	%r15, 152(%rsp)
	movq	%rax, 168(%rsp)
	leaq	56(%rsp), %rdi
	call	_ZNKSt19istreambuf_iteratorIcSt11char_traitsIcEE6_M_getEv
	movq	152(%rsp), %rdx
	movq	56(%rsp), %r15
	movb	%al, (%rdx,%rbx)
	movq	%r15, %rdi
	call	_ZNSt15basic_streambufIcSt11char_traitsIcEE6sbumpcEv.isra.0
	movl	$-1, 64(%rsp)
	movq	24(%rsp), %rbx
	jmp	.L31
	movq	152(%rsp), %rax
	movq	%rbx, 160(%rsp)
	leaq	.LC6(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movb	$0, (%rax,%rbx)
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	152(%rsp), %rsi
	movq	%rax, %rdi
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rsi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E.isra.0
	movq	16(%rsp), %rdi
	call	_ZNSt14basic_ifstreamIcSt11char_traitsIcEE5closeEv@PLT
	leaq	152(%rsp), %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@PLT
	movq	16(%rsp), %rdi
	call	_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev@PLT
	leaq	184(%rsp), %rdi
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev@PLT
	movq	8(%rsp), %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@PLT
	leaq	88(%rsp), %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@PLT
	addq	$1224, %rsp
	movl	%ebp, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
