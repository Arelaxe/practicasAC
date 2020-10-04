	.file	"daxpy.c"
	.text
	.globl	daxpy
	.type	daxpy, @function
daxpy:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movsd	%xmm0, -24(%rbp)
	movq	%rdi, -32(%rbp)
	movq	%rsi, -40(%rbp)
	movl	$1, -4(%rbp)
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	mulsd	-24(%rbp), %xmm0
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -4(%rbp)
.L2:
	cmpl	$100000000, -4(%rbp)
	jle	.L3
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	daxpy, .-daxpy
	.section	.rodata
.LC1:
	.string	"y[0]=%f"
.LC2:
	.string	"\ny[N-1]=%f\n"
.LC3:
	.string	"Tiempo: %f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm0, -48(%rbp)
	movl	$800000000, %edi
	call	malloc@PLT
	movq	%rax, -40(%rbp)
	movl	$800000000, %edi
	call	malloc@PLT
	movq	%rax, -32(%rbp)
	movl	$0, -52(%rbp)
	jmp	.L5
.L6:
	movl	-52(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	cvtsi2sd	-52(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	movl	-52(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	cvtsi2sd	-52(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -52(%rbp)
.L5:
	cmpl	$99999999, -52(%rbp)
	jle	.L6
	call	omp_get_wtime@PLT
	movq	%xmm0, %rax
	movq	%rax, -24(%rbp)
	movq	-32(%rbp), %rcx
	movq	-40(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	call	daxpy
	call	omp_get_wtime@PLT
	movq	%xmm0, %rax
	movq	%rax, -16(%rbp)
	movsd	-16(%rbp), %xmm0
	subsd	-24(%rbp), %xmm0
	movsd	%xmm0, -8(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	leaq	.LC1(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-40(%rbp), %rax
	addq	$799999992, %rax
	movq	(%rax), %rax
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	leaq	.LC2(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	leaq	.LC3(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1079574528
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
