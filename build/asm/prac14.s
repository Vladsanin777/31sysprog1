main:
	pushq	%r14
	movl	$32, %edi
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$64, %rsp
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
	movl	$200, %r8d
	movl	$320, %ecx
	movl	$536805376, %edx
	movl	$536805376, %esi
	leaq	.LC1(%rip), %rdi
	call	SDL_CreateWindow@PLT
	movq	%rax, %r12
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
	movl	$1, %ebp
	jmp	.L1
	movl	$2, %edx
	movl	$-1, %esi
	movq	%rax, %rdi
	call	SDL_CreateRenderer@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L6
	leaq	.LC3(%rip), %rsi
	leaq	_ZSt4cerr(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rbx
	call	SDL_GetError@PLT
	movq	%rbx, %rdi
	movq	%rax, %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	movq	%r12, %rdi
	call	SDL_DestroyWindow@PLT
	jmp	.L14
	movl	$255, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%rax, %rdi
	xorl	%ebp, %ebp
	call	SDL_SetRenderDrawColor@PLT
	movq	%rbx, %rdi
	call	SDL_RenderClear@PLT
	movl	$255, %r8d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$255, %esi
	movq	%rbx, %rdi
	call	SDL_SetRenderDrawColor@PLT
	movl	%ebp, %esi
	xorl	%edx, %edx
	movq	%rbx, %rdi
	incl	%ebp
	call	SDL_RenderDrawPoint@PLT
	cmpl	$100, %ebp
	jne	.L7
	movl	$255, %r8d
	movl	$255, %ecx
	movl	$255, %edx
	movq	%rbx, %rdi
	movl	$255, %esi
	call	SDL_SetRenderDrawColor@PLT
	movq	%rbx, %rdi
	movl	$150, %r8d
	movl	$150, %ecx
	movl	$50, %edx
	movl	$50, %esi
	call	SDL_RenderDrawLine@PLT
	movq	%rbx, %rdi
	call	SDL_RenderPresent@PLT
	xorl	%r13d, %r13d
	leaq	8(%rsp), %rdi
	call	SDL_PollEvent@PLT
	movl	%eax, %ebp
	testl	%eax, %eax
	je	.L16
	movl	8(%rsp), %eax
	andb	$-3, %ah
	cmpl	$256, %eax
	sete	%al
	orl	%eax, %r13d
	jmp	.L11
	testb	%r13b, %r13b
	je	.L8
	movq	%rbx, %rdi
	call	SDL_DestroyRenderer@PLT
	movq	%r12, %rdi
	call	SDL_DestroyWindow@PLT
	call	SDL_Quit@PLT
	addq	$64, %rsp
	movl	%ebp, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
