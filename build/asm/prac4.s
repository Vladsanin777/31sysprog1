_ZNSt12_Vector_baseIiSaIiEED2Ev:
	movq	%rdi, %rax
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L1
	movq	16(%rax), %rsi
	subq	%rdi, %rsi
	jmp	_ZdlPvm@PLT
	ret
main:
	pushq	%rbp
	leaq	_ZSt3cin(%rip), %rdi
	pushq	%rbx
	subq	$72, %rsp
	leaq	12(%rsp), %rsi
	call	_ZNSirsERi@PLT
	movl	$4, %edi
	movl	12(%rsp), %ebp
	call	_Znwm@PLT
	leaq	_ZSt3cin(%rip), %rdi
	movq	%rax, %rbx
	movq	%rax, 16(%rsp)
	leaq	4(%rax), %rax
	movl	%ebp, (%rbx)
	movq	%rbx, %rsi
	movq	%rax, 32(%rsp)
	movq	%rax, 24(%rsp)
	call	_ZNSirsERi@PLT
	movl	$4, %edi
	call	_Znwm@PLT
	movl	(%rbx), %ecx
	xorl	%esi, %esi
	leaq	_ZSt4cout(%rip), %rdi
	leaq	4(%rax), %rdx
	movq	%rax, 40(%rsp)
	movl	%ecx, (%rax)
	movq	%rdx, 56(%rsp)
	movq	%rdx, 48(%rsp)
	call	_ZNSolsEi@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	leaq	40(%rsp), %rdi
	call	_ZNSt12_Vector_baseIiSaIiEED2Ev
	leaq	16(%rsp), %rdi
	call	_ZNSt12_Vector_baseIiSaIiEED2Ev
	addq	$72, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	ret
