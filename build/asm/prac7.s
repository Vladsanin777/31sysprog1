_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEEliNS0_5__ops15_Iter_less_iterEEvT_T0_SA_T1_T2_.isra.0:
	leaq	-1(%rdx), %rax
	movq	%rsi, %r8
	movl	%ecx, %r9d
	movq	%rdx, %rsi
	movl	$2, %ecx
	cqto
	idivq	%rcx
	movq	%r8, %rcx
	cmpq	%rax, %r8
	jl	.L18
	testl	$1, %esi
	jne	.L12
	subq	$2, %rsi
	sarq	%rsi
	cmpq	%rsi, %r8
	jne	.L12
	leaq	1(%r8,%r8), %rcx
	leaq	(%rdi,%r8,4), %rax
	movl	(%rdi,%rcx,4), %edx
	movl	%edx, (%rax)
	leaq	-1(%rcx), %rax
	movl	$2, %esi
	cqto
	idivq	%rsi
	leaq	(%rdi,%rcx,4), %rdx
	cmpq	%rcx, %r8
	jge	.L16
	movl	(%rdi,%rax,4), %ecx
	cmpl	%ecx, %r9d
	jle	.L16
	movl	%ecx, (%rdx)
	movq	%rax, %rcx
	decq	%rax
	jmp	.L20
	movl	%r9d, (%rdx)
	ret
	pushq	%rbx
	leaq	1(%rcx), %rdx
	addq	%rdx, %rdx
	leaq	-1(%rdx), %r11
	movl	(%rdi,%rdx,4), %ebx
	movl	(%rdi,%r11,4), %r10d
	cmpl	%r10d, %ebx
	cmovge	%ebx, %r10d
	cmovl	%r11, %rdx
	movl	%r10d, (%rdi,%rcx,4)
	movq	%rdx, %rcx
	cmpq	%rax, %rdx
	jl	.L4
	testl	$1, %esi
	jne	.L5
	subq	$2, %rsi
	sarq	%rsi
	cmpq	%rsi, %rdx
	jne	.L5
	leaq	1(%rdx,%rdx), %rcx
	leaq	(%rdi,%rdx,4), %rax
	movl	(%rdi,%rcx,4), %edx
	movl	%edx, (%rax)
	leaq	-1(%rcx), %rax
	movl	$2, %esi
	cqto
	idivq	%rsi
	leaq	(%rdi,%rcx,4), %rdx
	cmpq	%rcx, %r8
	jge	.L6
	movl	(%rdi,%rax,4), %ecx
	cmpl	%ecx, %r9d
	jle	.L6
	movl	%ecx, (%rdx)
	movq	%rax, %rcx
	decq	%rax
	jmp	.L19
	movl	%r9d, (%rdx)
	popq	%rbx
	ret
_ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEENS0_5__ops15_Iter_less_iterEEvT_S9_T0_.isra.0:
	cmpq	%rsi, %rdi
	jne	.L34
	ret
	pushq	%r13
	movq	%rsi, %r13
	pushq	%r12
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
	leaq	4(%rdi), %rbx
	pushq	%rdx
	cmpq	%rbx, %r13
	je	.L38
	movl	(%rbx), %r12d
	movl	0(%rbp), %ecx
	cmpl	%ecx, %r12d
	jge	.L32
	movq	%rbx, %rdx
	subq	%rbp, %rdx
	movq	%rdx, %rax
	salq	$62, %rax
	subq	%rdx, %rax
	leaq	4(%rbx,%rax), %rdi
	cmpq	$4, %rdx
	jle	.L26
	movq	%rbp, %rsi
	call	memmove@PLT
	jmp	.L27
	jne	.L27
	movl	%ecx, (%rdi)
	movl	%r12d, 0(%rbp)
	jmp	.L28
	movq	%rbx, %rax
	movl	-4(%rax), %edx
	cmpl	%edx, %r12d
	jge	.L39
	movl	%edx, (%rax)
	subq	$4, %rax
	jmp	.L25
	movl	%r12d, (%rax)
	addq	$4, %rbx
	jmp	.L24
	popq	%rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
_ZSt16__introsort_loopIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEElNS0_5__ops15_Iter_less_iterEEvT_S9_T0_T1_.isra.0:
	pushq	%r14
	movq	%rdx, %r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	movq	%rdi, %rbx
	movq	%rbp, %r12
	subq	%rbx, %r12
	cmpq	$64, %r12
	jle	.L40
	movq	%r12, %r13
	sarq	$3, %r12
	sarq	$2, %r13
	testq	%r14, %r14
	jne	.L42
	decq	%r12
	movq	%r13, %rdx
	movq	%rbx, %rdi
	movl	(%rbx,%r12,4), %ecx
	movq	%r12, %rsi
	call	_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEEliNS0_5__ops15_Iter_less_iterEEvT_T0_SA_T1_T2_.isra.0
	testq	%r12, %r12
	jne	.L62
	movq	%rbp, %rax
	subq	%rbx, %rax
	cmpq	$4, %rax
	jle	.L40
	movl	(%rbx), %eax
	subq	$4, %rbp
	movl	0(%rbp), %ecx
	xorl	%esi, %esi
	movq	%rbp, %rdx
	movq	%rbx, %rdi
	movl	%eax, 0(%rbp)
	subq	%rbx, %rdx
	sarq	$2, %rdx
	call	_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEEliNS0_5__ops15_Iter_less_iterEEvT_T0_SA_T1_T2_.isra.0
	jmp	.L45
	leaq	(%rbx,%r12,4), %r8
	movl	4(%rbx), %edi
	movl	-4(%rbp), %ecx
	decq	%r14
	movl	(%r8), %esi
	movl	(%rbx), %eax
	leaq	4(%rbx), %rdx
	cmpl	%esi, %edi
	jge	.L48
	cmpl	%esi, %ecx
	jg	.L54
	cmpl	%edi, %ecx
	jle	.L51
	jmp	.L63
	cmpl	%edi, %ecx
	jle	.L53
	movl	%edi, (%rbx)
	movl	%eax, 4(%rbx)
	movq	%rbp, %rax
	jmp	.L52
	cmpl	%esi, %ecx
	jle	.L54
	movl	%ecx, (%rbx)
	movl	%eax, -4(%rbp)
	jmp	.L50
	movl	%esi, (%rbx)
	movl	%eax, (%r8)
	jmp	.L50
	movl	%esi, (%r12)
	movl	%ecx, (%rdx)
	leaq	4(%r12), %rdx
	movl	(%rbx), %edi
	movq	%rdx, %r12
	movl	(%rdx), %ecx
	leaq	4(%rdx), %rdx
	cmpl	%edi, %ecx
	jl	.L55
	subq	$4, %rax
	movq	%rax, %rdx
	movl	(%rax), %esi
	subq	$4, %rax
	cmpl	%esi, %edi
	jl	.L56
	movq	%rdx, %rax
	cmpq	%rdx, %r12
	jb	.L57
	movq	%rbp, %rsi
	movq	%r14, %rdx
	movq	%r12, %rdi
	movq	%r12, %rbp
	call	_ZSt16__introsort_loopIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEElNS0_5__ops15_Iter_less_iterEEvT_S9_T0_T1_.isra.0
	jmp	.L41
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
main:
	pushq	%r12
	leaq	_ZSt3cin(%rip), %rdi
	pushq	%rbp
	pushq	%rbx
	subq	$16, %rsp
	leaq	12(%rsp), %rsi
	call	_ZNSirsERi@PLT
	movl	12(%rsp), %r12d
	movl	$4, %edi
	call	_Znwm@PLT
	leaq	_ZSt3cin(%rip), %rdi
	movl	%r12d, (%rax)
	movq	%rax, %rbx
	leaq	4(%rax), %rbp
	movq	%rax, %rsi
	call	_ZNSirsERi@PLT
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	_ZSt16__introsort_loopIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEElNS0_5__ops15_Iter_less_iterEEvT_S9_T0_T1_.isra.0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	_ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEENS0_5__ops15_Iter_less_iterEEvT_S9_T0_.isra.0
	movl	(%rbx), %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSolsEi@PLT
	movb	$32, 11(%rsp)
	movq	%rax, %rdi
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	cmpq	$0, 16(%rdi,%rax)
	jne	.L65
	movl	$32, %esi
	call	_ZNSo3putEc@PLT
	jmp	.L66
	leaq	11(%rsp), %rsi
	movl	$1, %edx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	movq	%rbx, %rdi
	movl	$4, %esi
	call	_ZdlPvm@PLT
	addq	$16, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
