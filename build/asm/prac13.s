main:
	pushq	%rbx
	subq	$32, %rsp
	call	initscr@PLT
	call	cbreak@PLT
	call	noecho@PLT
	call	has_colors@PLT
	testb	%al, %al
	je	.L2
	call	start_color@PLT
	movl	$4, %edx
	movl	$3, %esi
	movl	$1, %edi
	call	init_pair@PLT
	xorl	%edx, %edx
	movl	$7, %esi
	movl	$2, %edi
	call	init_pair@PLT
	movl	$20, %esi
	movl	$10, %edi
	call	move@PLT
	movq	stdscr(%rip), %rdi
	xorl	%edx, %edx
	movl	$256, %esi
	call	wattr_on@PLT
	movq	stdscr(%rip), %rdi
	movl	$65, %esi
	call	waddch@PLT
	movq	stdscr(%rip), %rdi
	xorl	%edx, %edx
	movl	$256, %esi
	call	wattr_off@PLT
	movl	$30, %esi
	movl	$12, %edi
	call	move@PLT
	movq	stdscr(%rip), %rdi
	xorl	%edx, %edx
	movl	$512, %esi
	call	wattr_on@PLT
	leaq	16(%rsp), %rdi
	movl	$11, %edx
	leaq	.LC0(%rip), %rsi
	movq	%rdi, (%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_S_copyEPcPKcm@PLT
	movq	(%rsp), %rsi
	movl	$-1, %edx
	movq	$11, 8(%rsp)
	movq	stdscr(%rip), %rdi
	movb	$0, 11(%rsi)
	call	waddnstr@PLT
	movq	stdscr(%rip), %rdi
	xorl	%edx, %edx
	movl	$512, %esi
	call	wattr_off@PLT
	call	refresh@PLT
	movq	stdscr(%rip), %rdi
	call	wgetch@PLT
	call	endwin@PLT
	movq	%rsp, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@PLT
	addq	$32, %rsp
	xorl	%eax, %eax
	popq	%rbx
	ret
