	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 11, 3
	.globl	_getword                        ## -- Begin function getword
	.p2align	4, 0x90
_getword:                               ## @getword
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	movl	%esi, -20(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	callq	_getch
	movl	%eax, -24(%rbp)
	movl	%eax, %edi
	callq	_isspace
	cmpl	$0, %eax
	je	LBB0_3
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	jmp	LBB0_1
LBB0_3:
	cmpl	$-1, -24(%rbp)
	je	LBB0_5
## %bb.4:
	movl	-24(%rbp), %eax
                                        ## kill: def $al killed $al killed $eax
	movq	-32(%rbp), %rcx
	movq	%rcx, %rdx
	addq	$1, %rdx
	movq	%rdx, -32(%rbp)
	movb	%al, (%rcx)
LBB0_5:
	movl	-24(%rbp), %edi
	callq	_isalpha
	cmpl	$0, %eax
	jne	LBB0_7
## %bb.6:
	movq	-16(%rbp), %rax
	movb	$0, (%rax)
	movl	-24(%rbp), %ecx
	movl	%ecx, -4(%rbp)
	jmp	LBB0_14
LBB0_7:
	jmp	LBB0_8
LBB0_8:                                 ## =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -20(%rbp)
	cmpl	$0, %eax
	jle	LBB0_13
## %bb.9:                               ##   in Loop: Header=BB0_8 Depth=1
	callq	_getch
                                        ## kill: def $al killed $al killed $eax
	movq	-32(%rbp), %rcx
	movb	%al, (%rcx)
	movsbl	%al, %edi
	callq	_isalnum
	cmpl	$0, %eax
	jne	LBB0_11
## %bb.10:
	movq	-32(%rbp), %rax
	movsbl	(%rax), %edi
	callq	_ungetch
	jmp	LBB0_13
LBB0_11:                                ##   in Loop: Header=BB0_8 Depth=1
	jmp	LBB0_12
LBB0_12:                                ##   in Loop: Header=BB0_8 Depth=1
	movq	-32(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -32(%rbp)
	jmp	LBB0_8
LBB0_13:
	movq	-32(%rbp), %rax
	movb	$0, (%rax)
	movq	-16(%rbp), %rax
	movsbl	(%rax), %ecx
	movl	%ecx, -4(%rbp)
LBB0_14:
	movl	-4(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_getch                          ## -- Begin function getch
	.p2align	4, 0x90
_getch:                                 ## @getch
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	cmpl	$0, _bufp(%rip)
	jle	LBB1_2
## %bb.1:
	movq	_buf@GOTPCREL(%rip), %rax
	movl	_bufp(%rip), %ecx
	addl	$-1, %ecx
	movl	%ecx, _bufp(%rip)
	movslq	%ecx, %rdx
	movsbl	(%rax,%rdx), %ecx
	movl	%ecx, -4(%rbp)                  ## 4-byte Spill
	jmp	LBB1_3
LBB1_2:
	callq	_getchar
	movl	%eax, -4(%rbp)                  ## 4-byte Spill
LBB1_3:
	movl	-4(%rbp), %eax                  ## 4-byte Reload
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_ungetch                        ## -- Begin function ungetch
	.p2align	4, 0x90
_ungetch:                               ## @ungetch
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	cmpl	$100, _bufp(%rip)
	jl	LBB2_2
## %bb.1:
	leaq	L_.str(%rip), %rdi
	movb	$0, %al
	callq	_printf
	jmp	LBB2_3
LBB2_2:
	movq	_buf@GOTPCREL(%rip), %rax
	movl	-4(%rbp), %ecx
                                        ## kill: def $cl killed $cl killed $ecx
	movl	_bufp(%rip), %edx
	movl	%edx, %esi
	addl	$1, %esi
	movl	%esi, _bufp(%rip)
	movslq	%edx, %rdi
	movb	%cl, (%rax,%rdi)
LBB2_3:
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$208, %rsp
	movq	_unseenHead@GOTPCREL(%rip), %rax
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	movq	%rcx, -8(%rbp)
	movl	$0, -132(%rbp)
	movq	$0, (%rax)
LBB3_1:                                 ## =>This Inner Loop Header: Depth=1
	leaq	-32(%rbp), %rdi
	movl	$20, %esi
	callq	_getword
	cmpl	$-1, %eax
	je	LBB3_32
## %bb.2:                               ##   in Loop: Header=BB3_1 Depth=1
	leaq	-32(%rbp), %rdi
	leaq	L_.str.1(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB3_4
## %bb.3:                               ##   in Loop: Header=BB3_1 Depth=1
	leaq	-32(%rbp), %rdi
	movl	$20, %esi
	callq	_getword
	leaq	-32(%rbp), %rdi
	movl	%eax, -136(%rbp)                ## 4-byte Spill
	callq	_insertFront2D
	jmp	LBB3_31
LBB3_4:                                 ##   in Loop: Header=BB3_1 Depth=1
	leaq	-32(%rbp), %rdi
	leaq	L_.str.2(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB3_9
## %bb.5:                               ##   in Loop: Header=BB3_1 Depth=1
	leaq	-32(%rbp), %rdi
	movl	$20, %esi
	callq	_getword
	leaq	-32(%rbp), %rdi
	movl	%eax, -140(%rbp)                ## 4-byte Spill
	callq	_find2D
	testb	$1, %al
	jne	LBB3_6
	jmp	LBB3_7
LBB3_6:                                 ##   in Loop: Header=BB3_1 Depth=1
	leaq	L_.str.3(%rip), %rdi
	movb	$0, %al
	callq	_printf
	jmp	LBB3_8
LBB3_7:                                 ##   in Loop: Header=BB3_1 Depth=1
	leaq	L_.str.4(%rip), %rdi
	movb	$0, %al
	callq	_printf
LBB3_8:                                 ##   in Loop: Header=BB3_1 Depth=1
	jmp	LBB3_30
LBB3_9:                                 ##   in Loop: Header=BB3_1 Depth=1
	leaq	-32(%rbp), %rdi
	leaq	L_.str.5(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB3_11
## %bb.10:                              ##   in Loop: Header=BB3_1 Depth=1
	leaq	-32(%rbp), %rdi
	movl	$20, %esi
	callq	_getword
	leaq	-32(%rbp), %rsi
	leaq	-64(%rbp), %rdi
	movl	$20, %edx
	movl	%eax, -144(%rbp)                ## 4-byte Spill
	callq	___strcpy_chk
	leaq	-32(%rbp), %rdi
	movl	$20, %esi
	movq	%rax, -152(%rbp)                ## 8-byte Spill
	callq	_getword
	leaq	-32(%rbp), %rsi
	leaq	-64(%rbp), %rdi
	movl	%eax, -156(%rbp)                ## 4-byte Spill
	callq	_insertBefore2D
	jmp	LBB3_29
LBB3_11:                                ##   in Loop: Header=BB3_1 Depth=1
	leaq	-32(%rbp), %rdi
	leaq	L_.str.6(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB3_13
## %bb.12:                              ##   in Loop: Header=BB3_1 Depth=1
	leaq	-32(%rbp), %rdi
	movl	$20, %esi
	callq	_getword
	leaq	-32(%rbp), %rsi
	leaq	-96(%rbp), %rdi
	movl	$20, %edx
	movl	%eax, -160(%rbp)                ## 4-byte Spill
	callq	___strcpy_chk
	leaq	-32(%rbp), %rdi
	movl	$20, %esi
	movq	%rax, -168(%rbp)                ## 8-byte Spill
	callq	_getword
	leaq	-32(%rbp), %rsi
	leaq	-96(%rbp), %rdi
	movl	%eax, -172(%rbp)                ## 4-byte Spill
	callq	_insertFront1D
	jmp	LBB3_28
LBB3_13:                                ##   in Loop: Header=BB3_1 Depth=1
	leaq	-32(%rbp), %rdi
	leaq	L_.str.7(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB3_18
## %bb.14:                              ##   in Loop: Header=BB3_1 Depth=1
	leaq	-32(%rbp), %rdi
	movl	$20, %esi
	callq	_getword
	leaq	-32(%rbp), %rdi
	movl	%eax, -176(%rbp)                ## 4-byte Spill
	callq	_find1D
	testb	$1, %al
	jne	LBB3_15
	jmp	LBB3_16
LBB3_15:                                ##   in Loop: Header=BB3_1 Depth=1
	leaq	L_.str.3(%rip), %rdi
	movb	$0, %al
	callq	_printf
	jmp	LBB3_17
LBB3_16:                                ##   in Loop: Header=BB3_1 Depth=1
	leaq	L_.str.4(%rip), %rdi
	movb	$0, %al
	callq	_printf
LBB3_17:                                ##   in Loop: Header=BB3_1 Depth=1
	jmp	LBB3_27
LBB3_18:                                ##   in Loop: Header=BB3_1 Depth=1
	leaq	-32(%rbp), %rdi
	leaq	L_.str.8(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB3_20
## %bb.19:                              ##   in Loop: Header=BB3_1 Depth=1
	leaq	-32(%rbp), %rdi
	movl	$20, %esi
	callq	_getword
	leaq	-32(%rbp), %rdi
	movl	%eax, -180(%rbp)                ## 4-byte Spill
	callq	_print1DList
	jmp	LBB3_26
LBB3_20:                                ##   in Loop: Header=BB3_1 Depth=1
	leaq	-32(%rbp), %rdi
	leaq	L_.str.9(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB3_22
## %bb.21:                              ##   in Loop: Header=BB3_1 Depth=1
	leaq	-32(%rbp), %rdi
	movl	$20, %esi
	callq	_getword
	leaq	-32(%rbp), %rsi
	leaq	-128(%rbp), %rdi
	movl	$20, %edx
	movl	%eax, -184(%rbp)                ## 4-byte Spill
	callq	___strcpy_chk
	leaq	-32(%rbp), %rdi
	movl	$20, %esi
	movq	%rax, -192(%rbp)                ## 8-byte Spill
	callq	_getword
	leaq	-32(%rbp), %rsi
	leaq	-128(%rbp), %rdi
	movl	%eax, -196(%rbp)                ## 4-byte Spill
	callq	_insertBefore1D
	jmp	LBB3_25
LBB3_22:                                ##   in Loop: Header=BB3_1 Depth=1
	leaq	-32(%rbp), %rdi
	leaq	L_.str.10(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB3_24
## %bb.23:                              ##   in Loop: Header=BB3_1 Depth=1
	callq	_printAll
LBB3_24:                                ##   in Loop: Header=BB3_1 Depth=1
	jmp	LBB3_25
LBB3_25:                                ##   in Loop: Header=BB3_1 Depth=1
	jmp	LBB3_26
LBB3_26:                                ##   in Loop: Header=BB3_1 Depth=1
	jmp	LBB3_27
LBB3_27:                                ##   in Loop: Header=BB3_1 Depth=1
	jmp	LBB3_28
LBB3_28:                                ##   in Loop: Header=BB3_1 Depth=1
	jmp	LBB3_29
LBB3_29:                                ##   in Loop: Header=BB3_1 Depth=1
	jmp	LBB3_30
LBB3_30:                                ##   in Loop: Header=BB3_1 Depth=1
	jmp	LBB3_31
LBB3_31:                                ##   in Loop: Header=BB3_1 Depth=1
	jmp	LBB3_1
LBB3_32:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	cmpq	%rcx, %rax
	jne	LBB3_34
## %bb.33:
	xorl	%eax, %eax
	addq	$208, %rsp
	popq	%rbp
	retq
LBB3_34:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.globl	_insertFront2D                  ## -- Begin function insertFront2D
	.p2align	4, 0x90
_insertFront2D:                         ## @insertFront2D
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	$24, %edi
	callq	_malloc
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rdi
	callq	_strlen
	addq	$1, %rax
	movq	%rax, %rdi
	callq	_malloc
	movq	-16(%rbp), %rcx
	movq	%rax, 16(%rcx)
	movq	-16(%rbp), %rax
	movq	16(%rax), %rdi
	movq	-8(%rbp), %rsi
	movq	$-1, %rdx
	callq	___strcpy_chk
	movq	_unseenHead@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rdx
	movq	-16(%rbp), %rsi
	movq	%rdx, 8(%rsi)
	movq	-16(%rbp), %rdx
	movq	$0, (%rdx)
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rcx)
	movq	(%rcx), %rcx
	movq	16(%rcx), %rsi
	leaq	L_.str.11(%rip), %rdi
	movq	%rax, -24(%rbp)                 ## 8-byte Spill
	movb	$0, %al
	callq	_printf
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_find2D                         ## -- Begin function find2D
	.p2align	4, 0x90
_find2D:                                ## @find2D
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	_unseenHead@GOTPCREL(%rip), %rax
	movq	%rdi, -16(%rbp)
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
LBB5_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpq	$0, -24(%rbp)
	je	LBB5_6
## %bb.2:                               ##   in Loop: Header=BB5_1 Depth=1
	movq	-24(%rbp), %rax
	movq	16(%rax), %rdi
	movq	-16(%rbp), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB5_4
## %bb.3:
	movb	$1, -1(%rbp)
	jmp	LBB5_7
LBB5_4:                                 ##   in Loop: Header=BB5_1 Depth=1
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
## %bb.5:                               ##   in Loop: Header=BB5_1 Depth=1
	jmp	LBB5_1
LBB5_6:
	movb	$0, -1(%rbp)
LBB5_7:
	movb	-1(%rbp), %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_insertBefore2D                 ## -- Begin function insertBefore2D
	.p2align	4, 0x90
_insertBefore2D:                        ## @insertBefore2D
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$24, %edi
	callq	_malloc
	movq	%rax, -24(%rbp)
	movq	-8(%rbp), %rdi
	callq	_strlen
	addq	$1, %rax
	movq	%rax, %rdi
	callq	_malloc
	movq	-24(%rbp), %rcx
	movq	%rax, 16(%rcx)
	movq	-24(%rbp), %rax
	movq	16(%rax), %rdi
	movq	-8(%rbp), %rsi
	movq	$-1, %rdx
	callq	___strcpy_chk
	movq	-24(%rbp), %rcx
	movq	$0, (%rcx)
	cmpq	$0, -24(%rbp)
	jne	LBB6_2
## %bb.1:
	leaq	L_.str.12(%rip), %rdi
	movb	$0, %al
	callq	_printf
	jmp	LBB6_13
LBB6_2:
	movq	_unseenHead@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	movq	%rcx, -32(%rbp)
	movq	(%rax), %rax
	movq	16(%rax), %rdi
	movq	-16(%rbp), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB6_4
## %bb.3:
	movq	_unseenHead@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	movq	-24(%rbp), %rdx
	movq	%rcx, 8(%rdx)
	movq	-24(%rbp), %rcx
	movq	%rcx, (%rax)
	leaq	L_.str.13(%rip), %rdi
	movb	$0, %al
	callq	_printf
	jmp	LBB6_13
LBB6_4:
	jmp	LBB6_5
LBB6_5:                                 ## =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
                                        ## kill: def $al killed $al killed $eax
	cmpq	$0, -32(%rbp)
	movb	%al, -33(%rbp)                  ## 1-byte Spill
	je	LBB6_7
## %bb.6:                               ##   in Loop: Header=BB6_5 Depth=1
	movq	-32(%rbp), %rax
	cmpq	$0, 8(%rax)
	setne	%cl
	movb	%cl, -33(%rbp)                  ## 1-byte Spill
LBB6_7:                                 ##   in Loop: Header=BB6_5 Depth=1
	movb	-33(%rbp), %al                  ## 1-byte Reload
	testb	$1, %al
	jne	LBB6_8
	jmp	LBB6_12
LBB6_8:                                 ##   in Loop: Header=BB6_5 Depth=1
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	16(%rax), %rdi
	movq	-16(%rbp), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB6_10
## %bb.9:
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, 8(%rcx)
	movq	-24(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	%rax, 8(%rcx)
	leaq	L_.str.13(%rip), %rdi
	movb	$0, %al
	callq	_printf
	jmp	LBB6_13
LBB6_10:                                ##   in Loop: Header=BB6_5 Depth=1
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -32(%rbp)
## %bb.11:                              ##   in Loop: Header=BB6_5 Depth=1
	jmp	LBB6_5
LBB6_12:
	leaq	L_.str.14(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movq	-24(%rbp), %rcx
	movq	%rcx, %rdi
	movl	%eax, -40(%rbp)                 ## 4-byte Spill
	callq	_free
LBB6_13:
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_insertFront1D                  ## -- Begin function insertFront1D
	.p2align	4, 0x90
_insertFront1D:                         ## @insertFront1D
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$16, %edi
	callq	_malloc
	movq	%rax, -24(%rbp)
	movq	-8(%rbp), %rdi
	callq	_strlen
	addq	$1, %rax
	movq	%rax, %rdi
	callq	_malloc
	movq	-24(%rbp), %rcx
	movq	%rax, 8(%rcx)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdi
	movq	-8(%rbp), %rsi
	movq	$-1, %rdx
	callq	___strcpy_chk
	cmpq	$0, -24(%rbp)
	jne	LBB7_2
## %bb.1:
	leaq	L_.str.15(%rip), %rdi
	movb	$0, %al
	callq	_printf
	jmp	LBB7_9
LBB7_2:
	movq	_unseenHead@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
LBB7_3:                                 ## =>This Inner Loop Header: Depth=1
	cmpq	$0, -32(%rbp)
	je	LBB7_8
## %bb.4:                               ##   in Loop: Header=BB7_3 Depth=1
	movq	-32(%rbp), %rax
	movq	16(%rax), %rdi
	movq	-16(%rbp), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB7_6
## %bb.5:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-24(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
	leaq	L_.str.16(%rip), %rdi
	movb	$0, %al
	callq	_printf
	jmp	LBB7_9
LBB7_6:                                 ##   in Loop: Header=BB7_3 Depth=1
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -32(%rbp)
## %bb.7:                               ##   in Loop: Header=BB7_3 Depth=1
	jmp	LBB7_3
LBB7_8:
	leaq	L_.str.17(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movq	-24(%rbp), %rcx
	movq	%rcx, %rdi
	movl	%eax, -36(%rbp)                 ## 4-byte Spill
	callq	_free
LBB7_9:
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_find1D                         ## -- Begin function find1D
	.p2align	4, 0x90
_find1D:                                ## @find1D
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	_unseenHead@GOTPCREL(%rip), %rax
	movq	%rdi, -16(%rbp)
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	LBB8_2
## %bb.1:
	movb	$0, -1(%rbp)
	jmp	LBB8_15
LBB8_2:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
LBB8_3:                                 ## =>This Inner Loop Header: Depth=1
	cmpq	$0, -24(%rbp)
	je	LBB8_14
## %bb.4:                               ##   in Loop: Header=BB8_3 Depth=1
	cmpq	$0, -32(%rbp)
	je	LBB8_9
## %bb.5:                               ##   in Loop: Header=BB8_3 Depth=1
	movq	-32(%rbp), %rax
	movq	8(%rax), %rdi
	movq	-16(%rbp), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB8_7
## %bb.6:
	movb	$1, -1(%rbp)
	jmp	LBB8_15
LBB8_7:                                 ##   in Loop: Header=BB8_3 Depth=1
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
## %bb.8:                               ##   in Loop: Header=BB8_3 Depth=1
	jmp	LBB8_13
LBB8_9:                                 ##   in Loop: Header=BB8_3 Depth=1
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	LBB8_11
## %bb.10:                              ##   in Loop: Header=BB8_3 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	jmp	LBB8_12
LBB8_11:
	jmp	LBB8_14
LBB8_12:                                ##   in Loop: Header=BB8_3 Depth=1
	jmp	LBB8_13
LBB8_13:                                ##   in Loop: Header=BB8_3 Depth=1
	jmp	LBB8_3
LBB8_14:
	movb	$0, -1(%rbp)
LBB8_15:
	movb	-1(%rbp), %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print1DList                    ## -- Begin function print1DList
	.p2align	4, 0x90
_print1DList:                           ## @print1DList
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	_unseenHead@GOTPCREL(%rip), %rax
	movq	%rdi, -8(%rbp)
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
LBB9_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpq	$0, -16(%rbp)
	je	LBB9_6
## %bb.2:                               ##   in Loop: Header=BB9_1 Depth=1
	movq	-16(%rbp), %rax
	movq	16(%rax), %rdi
	movq	-8(%rbp), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	je	LBB9_4
## %bb.3:                               ##   in Loop: Header=BB9_1 Depth=1
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	LBB9_5
LBB9_4:
	jmp	LBB9_6
LBB9_5:                                 ##   in Loop: Header=BB9_1 Depth=1
	jmp	LBB9_1
LBB9_6:
	cmpq	$0, -16(%rbp)
	jne	LBB9_8
## %bb.7:
	leaq	L_.str.21(%rip), %rdi
	movb	$0, %al
	callq	_printf
	jmp	LBB9_11
LBB9_8:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	16(%rax), %rsi
	leaq	L_.str.22(%rip), %rdi
	movb	$0, %al
	callq	_printf
LBB9_9:                                 ## =>This Inner Loop Header: Depth=1
	cmpq	$0, -24(%rbp)
	je	LBB9_11
## %bb.10:                              ##   in Loop: Header=BB9_9 Depth=1
	movq	-24(%rbp), %rax
	movq	8(%rax), %rsi
	leaq	L_.str.22(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movq	-24(%rbp), %rcx
	movq	(%rcx), %rcx
	movq	%rcx, -24(%rbp)
	jmp	LBB9_9
LBB9_11:
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_insertBefore1D                 ## -- Begin function insertBefore1D
	.p2align	4, 0x90
_insertBefore1D:                        ## @insertBefore1D
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	_unseenHead@GOTPCREL(%rip), %rax
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	LBB10_2
## %bb.1:
	leaq	L_.str.18(%rip), %rdi
	movb	$0, %al
	callq	_printf
	jmp	LBB10_20
LBB10_2:
	movl	$16, %edi
	callq	_malloc
	movq	%rax, -32(%rbp)
	movq	-8(%rbp), %rdi
	callq	_strlen
	addq	$1, %rax
	movq	%rax, %rdi
	callq	_malloc
	movq	-32(%rbp), %rcx
	movq	%rax, 8(%rcx)
	movq	-32(%rbp), %rax
	movq	8(%rax), %rdi
	movq	-8(%rbp), %rsi
	movq	$-1, %rdx
	callq	___strcpy_chk
	cmpq	$0, -32(%rbp)
	jne	LBB10_4
## %bb.3:
	leaq	L_.str.12(%rip), %rdi
	movb	$0, %al
	callq	_printf
	jmp	LBB10_20
LBB10_4:
	jmp	LBB10_5
LBB10_5:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB10_7 Depth 2
	cmpq	$0, -24(%rbp)
	je	LBB10_19
## %bb.6:                               ##   in Loop: Header=BB10_5 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
LBB10_7:                                ##   Parent Loop BB10_5 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpq	$0, -40(%rbp)
	je	LBB10_18
## %bb.8:                               ##   in Loop: Header=BB10_7 Depth=2
	movq	-16(%rbp), %rdi
	movq	-40(%rbp), %rax
	movq	8(%rax), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB10_11
## %bb.9:                               ##   in Loop: Header=BB10_7 Depth=2
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	cmpq	-40(%rbp), %rax
	jne	LBB10_11
## %bb.10:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	leaq	L_.str.19(%rip), %rdi
	movb	$0, %al
	callq	_printf
	jmp	LBB10_20
LBB10_11:                               ##   in Loop: Header=BB10_7 Depth=2
	movq	-40(%rbp), %rax
	cmpq	$0, (%rax)
	je	LBB10_16
## %bb.12:                              ##   in Loop: Header=BB10_7 Depth=2
	movq	-16(%rbp), %rdi
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB10_14
## %bb.13:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-32(%rbp), %rax
	movq	-40(%rbp), %rcx
	movq	%rax, (%rcx)
	leaq	L_.str.19(%rip), %rdi
	movb	$0, %al
	callq	_printf
	jmp	LBB10_20
LBB10_14:                               ##   in Loop: Header=BB10_7 Depth=2
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
## %bb.15:                              ##   in Loop: Header=BB10_7 Depth=2
	jmp	LBB10_17
LBB10_16:
	leaq	L_.str.20(%rip), %rdi
	movb	$0, %al
	callq	_printf
	jmp	LBB10_20
LBB10_17:                               ##   in Loop: Header=BB10_7 Depth=2
	jmp	LBB10_7
LBB10_18:                               ##   in Loop: Header=BB10_5 Depth=1
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
	jmp	LBB10_5
LBB10_19:
	leaq	L_.str.20(%rip), %rdi
	movb	$0, %al
	callq	_printf
LBB10_20:
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_printAll                       ## -- Begin function printAll
	.p2align	4, 0x90
_printAll:                              ## @printAll
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	_unseenHead@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	LBB11_2
## %bb.1:
	leaq	L_.str.23(%rip), %rdi
	movb	$0, %al
	callq	_printf
	jmp	LBB11_18
LBB11_2:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
LBB11_3:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB11_8 Depth 2
	cmpq	$0, -8(%rbp)
	je	LBB11_17
## %bb.4:                               ##   in Loop: Header=BB11_3 Depth=1
	movq	-8(%rbp), %rax
	cmpq	$0, (%rax)
	jne	LBB11_6
## %bb.5:                               ##   in Loop: Header=BB11_3 Depth=1
	movq	-8(%rbp), %rax
	movq	16(%rax), %rsi
	leaq	L_.str.24(%rip), %rdi
	movb	$0, %al
	callq	_printf
	jmp	LBB11_7
LBB11_6:                                ##   in Loop: Header=BB11_3 Depth=1
	movq	-8(%rbp), %rax
	movq	16(%rax), %rsi
	leaq	L_.str.25(%rip), %rdi
	movb	$0, %al
	callq	_printf
LBB11_7:                                ##   in Loop: Header=BB11_3 Depth=1
	jmp	LBB11_8
LBB11_8:                                ##   Parent Loop BB11_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpq	$0, -16(%rbp)
	je	LBB11_13
## %bb.9:                               ##   in Loop: Header=BB11_8 Depth=2
	movq	-16(%rbp), %rax
	cmpq	$0, (%rax)
	je	LBB11_11
## %bb.10:                              ##   in Loop: Header=BB11_8 Depth=2
	movq	-16(%rbp), %rax
	movq	8(%rax), %rsi
	leaq	L_.str.26(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movq	-16(%rbp), %rcx
	movq	(%rcx), %rcx
	movq	%rcx, -16(%rbp)
	jmp	LBB11_12
LBB11_11:                               ##   in Loop: Header=BB11_8 Depth=2
	movq	-16(%rbp), %rax
	movq	8(%rax), %rsi
	leaq	L_.str.27(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movq	-16(%rbp), %rcx
	movq	(%rcx), %rcx
	movq	%rcx, -16(%rbp)
LBB11_12:                               ##   in Loop: Header=BB11_8 Depth=2
	jmp	LBB11_8
LBB11_13:                               ##   in Loop: Header=BB11_3 Depth=1
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	LBB11_15
## %bb.14:                              ##   in Loop: Header=BB11_3 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	LBB11_16
LBB11_15:
	jmp	LBB11_17
LBB11_16:                               ##   in Loop: Header=BB11_3 Depth=1
	jmp	LBB11_3
LBB11_17:
	jmp	LBB11_18
LBB11_18:
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_bufp                           ## @bufp
.zerofill __DATA,__common,_bufp,4,2
	.comm	_buf,100,4                      ## @buf
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"ungetch: too many chars\n"

	.comm	_unseenHead,8,3                 ## @unseenHead
L_.str.1:                               ## @.str.1
	.asciz	"insertFront2D"

L_.str.2:                               ## @.str.2
	.asciz	"find2D"

L_.str.3:                               ## @.str.3
	.asciz	"Found"

L_.str.4:                               ## @.str.4
	.asciz	"Not found"

L_.str.5:                               ## @.str.5
	.asciz	"insertBefore2D"

L_.str.6:                               ## @.str.6
	.asciz	"insertFront1D"

L_.str.7:                               ## @.str.7
	.asciz	"find1D"

L_.str.8:                               ## @.str.8
	.asciz	"print1DList"

L_.str.9:                               ## @.str.9
	.asciz	"insertBefore1D"

L_.str.10:                              ## @.str.10
	.asciz	"printAll"

L_.str.11:                              ## @.str.11
	.asciz	"\nNode inserted is %s"

L_.str.12:                              ## @.str.12
	.asciz	"Invalid input value."

L_.str.13:                              ## @.str.13
	.asciz	"Succeed."

L_.str.14:                              ## @.str.14
	.asciz	"No such before name."

L_.str.15:                              ## @.str.15
	.asciz	"Invalid input value"

L_.str.16:                              ## @.str.16
	.asciz	"Succeed 1d node insertion"

L_.str.17:                              ## @.str.17
	.asciz	"NO such 2D node to add the 1D node."

L_.str.18:                              ## @.str.18
	.asciz	"Cannot insert the 1D node before the 1D node you specified since there's no 2D node yet."

L_.str.19:                              ## @.str.19
	.asciz	"Insertion Succeed!"

L_.str.20:                              ## @.str.20
	.asciz	"Cannot add the 1d node. All have been searched."

L_.str.21:                              ## @.str.21
	.asciz	"No way to print the 1D list since no such 2D node exists."

L_.str.22:                              ## @.str.22
	.asciz	"%s\t"

L_.str.23:                              ## @.str.23
	.asciz	"No way to print anything as nothing are implemented."

L_.str.24:                              ## @.str.24
	.asciz	"2d node name is %s\n"

L_.str.25:                              ## @.str.25
	.asciz	"2d node name is %s\n\t"

L_.str.26:                              ## @.str.26
	.asciz	"1d node name is %s\n\t"

L_.str.27:                              ## @.str.27
	.asciz	"1d node is %s\n"

.subsections_via_symbols
