_Z13factorial_cppi:
	movl	$1, %eax
	cmpl	$1, %edi
	jle	.L4
	imull	%edi, %eax
	decl	%edi
	jmp	.L3
	ret
_Z13factorial_asmi:
	movl	$1, %eax
	testl	%edi, %edi
	jle	.L7
	movl	$-2147483648, %eax
	xorl	%edx, %edx
	subl	%edi, %eax
	cmpl	$2, %edi
	cmovg	%edx, %eax
	addl	%edi, %eax
	ret
main:
	pushq	%r13
	leaq	_ZSt3cin(%rip), %rdi
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$24, %rsp
	leaq	12(%rsp), %rsi
	call	_ZNSirsERi@PLT
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movl	12(%rsp), %edi
	movq	%rax, %rbx
	call	_Z13factorial_cppi
	movl	%eax, %r12d
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	%rbx, %rax
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC0(%rip), %xmm0
	movq	%xmm0, %rbp
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movl	12(%rsp), %edi
	movq	%rax, %rbx
	call	_Z13factorial_asmi
	movl	%eax, %r13d
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	leaq	.LC1(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	subq	%rbx, %rax
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC0(%rip), %xmm0
	movq	%xmm0, %rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	%r12d, %esi
	movq	%rax, %rdi
	call	_ZNSolsEi@PLT
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rbp, %xmm0
	movq	%rax, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC4(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	%r13d, %esi
	movq	%rax, %rdi
	call	_ZNSolsEi@PLT
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rbx, %xmm0
	movq	%rax, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	addq	$24, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
