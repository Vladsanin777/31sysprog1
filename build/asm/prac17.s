main:
	pushq	%r13
	movl	$16416, %edi
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$72, %rsp
	call	SDL_Init@PLT
	testl	%eax, %eax
	jns	.L2
	leaq	.LC0(%rip), %rsi
	leaq	_ZSt4cerr(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rbx
	call	SDL_GetError@PLT
	movq	%rbx, %rdi
	movq	%rax, %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	jmp	.L3
	movl	$4, %r9d
	movl	$480, %r8d
	movl	$640, %ecx
	movl	$536805376, %edx
	movl	$536805376, %esi
	leaq	.LC1(%rip), %rdi
	call	SDL_CreateWindow@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L4
	leaq	.LC2(%rip), %rsi
	leaq	_ZSt4cerr(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rbx
	call	SDL_GetError@PLT
	movq	%rbx, %rdi
	movq	%rax, %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	call	SDL_Quit@PLT
	movl	$1, %ebx
	jmp	.L1
	movl	$1, %edi
	call	SDL_ShowCursor@PLT
	xorl	%r12d, %r12d
	leaq	8(%rsp), %rdi
	call	SDL_PollEvent@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	je	.L18
	movl	8(%rsp), %eax
	cmpl	$256, %eax
	je	.L14
	cmpl	$1024, %eax
	jne	.L8
	movl	28(%rsp), %r13d
	leaq	.LC3(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movl	32(%rsp), %ebx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	movl	%r13d, %esi
	call	_ZNSolsEi@PLT
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	%ebx, %esi
	movq	%rax, %rdi
	call	_ZNSolsEi@PLT
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	jmp	.L16
	cmpl	$1025, %eax
	jne	.L13
	leaq	.LC6(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movsbl	24(%rsp), %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	jmp	.L13
	movb	$1, %r12b
	jmp	.L13
	testb	%r12b, %r12b
	je	.L6
	movq	%rbp, %rdi
	call	SDL_DestroyWindow@PLT
	call	SDL_Quit@PLT
	addq	$72, %rsp
	movl	%ebx, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
