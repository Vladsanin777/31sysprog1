_Z13AudioCallbackPvPhi:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	movslq	%edx, %r13
	pushq	%r12
	shrq	%r13
	xorl	%r12d, %r12d
	pushq	%rbp
	leaq	audio_data(%rip), %rbp
	pushq	%rbx
	subq	$40, %rsp
	movq	_ZL11frequencies(%rip), %r15
	movq	8+_ZL11frequencies(%rip), %r14
	movq	_ZL12durations_ms(%rip), %r8
	subq	%r15, %r14
	sarq	$3, %r14
	cmpl	%r12d, %r13d
	jle	.L9
	movl	8(%rbp), %ebx
	testl	%ebx, %ebx
	jne	.L3
	movq	0(%rbp), %r9
	cmpq	%r14, %r9
	jnb	.L4
	imull	$44100, (%r8,%r9,4), %eax
	movl	$1000, %ecx
	incq	%r9
	movq	$0x000000000, 16+audio_data(%rip)
	movq	%r9, 0(%rbp)
	cltd
	idivl	%ecx
	movl	%eax, %ebx
	jmp	.L3
	movw	$0, (%rsi,%r12,2)
	jmp	.L5
	movq	0(%rbp), %rax
	movsd	16(%rbp), %xmm1
	movq	%rsi, 24(%rsp)
	decl	%ebx
	movq	%r8, 16(%rsp)
	movsd	-8(%r15,%rax,8), %xmm2
	movaps	%xmm1, %xmm0
	movsd	%xmm1, (%rsp)
	movsd	%xmm2, 8(%rsp)
	call	sin@PLT
	movq	24(%rsp), %rsi
	movq	16(%rsp), %r8
	mulsd	.LC1(%rip), %xmm0
	cvttsd2sil	%xmm0, %eax
	movsd	.LC2(%rip), %xmm0
	mulsd	8(%rsp), %xmm0
	divsd	.LC3(%rip), %xmm0
	addsd	(%rsp), %xmm0
	movw	%ax, (%rsi,%r12,2)
	movl	%ebx, 8(%rbp)
	movsd	%xmm0, 16(%rbp)
	incq	%r12
	jmp	.L2
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
_ZNSt6vectorIiSaIiEED2Ev:
	movq	%rdi, %rax
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L10
	movq	16(%rax), %rsi
	subq	%rdi, %rsi
	jmp	_ZdlPvm@PLT
	ret
_ZNSt6vectorIdSaIdEED2Ev:
	movq	%rdi, %rax
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L12
	movq	16(%rax), %rsi
	subq	%rdi, %rsi
	jmp	_ZdlPvm@PLT
	ret
main:
	pushq	%rbp
	movl	$16, %edi
	pushq	%rbx
	subq	$40, %rsp
	call	SDL_Init@PLT
	testl	%eax, %eax
	jns	.L15
	leaq	.LC4(%rip), %rsi
	leaq	_ZSt4cerr(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rbx
	call	SDL_GetError@PLT
	movq	%rbx, %rdi
	movq	%rax, %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	jmp	.L16
	movl	$32, %edx
	xorl	%esi, %esi
	movq	%rsp, %rdi
	call	SDL_memset@PLT
	leaq	audio_data(%rip), %rbp
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	leaq	_Z13AudioCallbackPvPhi(%rip), %rax
	xorl	%r8d, %r8d
	movq	%rsp, %rdx
	xorl	%edi, %edi
	movl	$44100, (%rsp)
	movw	$-32752, 4(%rsp)
	movb	$1, 6(%rsp)
	movw	$4096, 8(%rsp)
	movq	%rax, 16(%rsp)
	movq	%rbp, 24(%rsp)
	call	SDL_OpenAudioDevice@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.L17
	leaq	.LC5(%rip), %rsi
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
	movl	$1, %eax
	jmp	.L14
	movl	%eax, %edi
	xorl	%esi, %esi
	call	SDL_PauseAudioDevice@PLT
	leaq	_ZSt4cout(%rip), %rdi
	leaq	.LC6(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	movq	8+_ZL11frequencies(%rip), %rax
	subq	_ZL11frequencies(%rip), %rax
	sarq	$3, %rax
	incq	%rax
	cmpq	0(%rbp), %rax
	jb	.L22
	movl	$100, %edi
	call	SDL_Delay@PLT
	jmp	.L19
	leaq	.LC7(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	movl	%ebx, %edi
	call	SDL_CloseAudioDevice@PLT
	call	SDL_Quit@PLT
	xorl	%eax, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
_GLOBAL__sub_I_audio_data:
	pushq	%rax
	movl	$64, %edi
	call	_Znwm@PLT
	leaq	C.5.0(%rip), %rsi
	movl	$16, %ecx
	movq	%rax, %rdi
	leaq	64(%rax), %rdx
	movq	%rax, _ZL11frequencies(%rip)
	rep movsl
	movq	%rdx, 16+_ZL11frequencies(%rip)
	leaq	_ZL11frequencies(%rip), %rsi
	leaq	_ZNSt6vectorIdSaIdEED1Ev(%rip), %rdi
	movq	%rdx, 8+_ZL11frequencies(%rip)
	leaq	__dso_handle(%rip), %rdx
	call	__cxa_atexit@PLT
	movl	$32, %edi
	call	_Znwm@PLT
	movaps	.LC8(%rip), %xmm0
	leaq	_ZL12durations_ms(%rip), %rsi
	leaq	_ZNSt6vectorIiSaIiEED1Ev(%rip), %rdi
	leaq	32(%rax), %rdx
	movq	%rax, _ZL12durations_ms(%rip)
	movups	%xmm0, (%rax)
	movaps	.LC9(%rip), %xmm0
	movq	%rdx, 16+_ZL12durations_ms(%rip)
	movq	%rdx, 8+_ZL12durations_ms(%rip)
	leaq	__dso_handle(%rip), %rdx
	movups	%xmm0, 16(%rax)
	popq	%rcx
	jmp	__cxa_atexit@PLT
C.5.0:
audio_data:
