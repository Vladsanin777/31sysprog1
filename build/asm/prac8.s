_ZSt17is_low_reg_symbolRKc:
	movb	(%rdi), %al
	subl	$97, %eax
	cmpb	$25, %al
	setbe	%al
	ret
_ZSt8to_upperRc:
	subb	$32, (%rdi)
	ret
_ZSt8to_upperRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
	movq	(%rdi), %rax
	movq	8(%rdi), %rcx
	addq	%rax, %rcx
	cmpq	%rcx, %rax
	je	.L8
	movb	(%rax), %dl
	leal	-97(%rdx), %esi
	cmpb	$25, %sil
	ja	.L5
	subl	$32, %edx
	movb	%dl, (%rax)
	incq	%rax
	jmp	.L4
	ret
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
	movq	%rsp, %rdi
	call	_ZSt8to_upperRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	movq	8(%rsp), %rdx
	movq	(%rsp), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%rsp, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@PLT
	addq	$32, %rsp
	xorl	%eax, %eax
	popq	%rbx
	ret
