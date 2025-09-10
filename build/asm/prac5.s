_ZlsIiERSoS0_RKSt6vectorIT_SaIS2_EE:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
	subq	$24, %rsp
	movq	8(%rsi), %r12
	movq	(%rsi), %rbx
	cmpq	%r12, %rbx
	je	.L8
	movl	(%rbx), %esi
	movq	%rbp, %rdi
	call	_ZNSolsEi@PLT
	movb	$32, 15(%rsp)
	movq	%rax, %rdi
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	cmpq	$0, 16(%rdi,%rax)
	je	.L3
	movl	$1, %edx
	leaq	15(%rsp), %rsi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	jmp	.L4
	movl	$32, %esi
	call	_ZNSo3putEc@PLT
	addq	$4, %rbx
	jmp	.L2
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rsi
	movq	%rbp, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
	addq	$24, %rsp
	movq	%rbp, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
_ZNSt12_Vector_baseIiSaIiEED2Ev:
	movq	%rdi, %rax
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L9
	movq	16(%rax), %rsi
	subq	%rdi, %rsi
	jmp	_ZdlPvm@PLT
	ret
main:
	pushq	%rbp
	movl	$8, %edi
	pushq	%rbx
	movabsq	$4294967301, %rbx
	subq	$56, %rsp
	call	_Znwm@PLT
	movl	$8, %edi
	leaq	24(%rsp), %rbp
	movq	%rbx, (%rax)
	leaq	8(%rax), %rdx
	movq	%rdx, 16(%rsp)
	movq	%rdx, 8(%rsp)
	movq	%rax, (%rsp)
	call	_Znwm@PLT
	movq	%rsp, %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movq	%rbx, (%rax)
	leaq	8(%rax), %rdx
	movq	%rdx, 40(%rsp)
	movq	%rdx, 32(%rsp)
	movq	%rax, 24(%rsp)
	call	_ZlsIiERSoS0_RKSt6vectorIT_SaIS2_EE
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rsi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	_ZlsIiERSoS0_RKSt6vectorIT_SaIS2_EE
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rsi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
	movq	%rbp, %rdi
	call	_ZNSt12_Vector_baseIiSaIiEED2Ev
	movq	%rsp, %rdi
	call	_ZNSt12_Vector_baseIiSaIiEED2Ev
	addq	$56, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	ret
