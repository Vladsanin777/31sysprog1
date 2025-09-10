main:
	pushq	%rbp
	leaq	_ZSt3cin(%rip), %rdi
	pushq	%rbx
	subq	$24, %rsp
	leaq	12(%rsp), %rsi
	call	_ZNSirsERi@PLT
	movl	12(%rsp), %ebp
	movl	$4, %edi
	call	_Znwm@PLT
	leaq	_ZSt3cin(%rip), %rdi
	movl	%ebp, (%rax)
	movq	%rax, %rbx
	movq	%rax, %rsi
	call	_ZNSirsERi@PLT
	movl	(%rbx), %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSolsEi@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	movq	%rbx, %rdi
	movl	$4, %esi
	call	_ZdlPvm@PLT
	addq	$24, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	ret
