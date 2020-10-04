	.file	"daxpy.c"
	.text
	.p2align 4,,15
	.globl	daxpy
	.type	daxpy, @function
daxpy:
.LFB41:
	.cfi_startproc
	movl	$8, %eax
	.p2align 4,,10
	.p2align 3
.L2:
	movsd	(%rsi,%rax), %xmm1
	mulsd	%xmm0, %xmm1
	addsd	(%rdi,%rax), %xmm1
	movsd	%xmm1, (%rdi,%rax)
	addq	$8, %rax
	cmpq	$800000008, %rax
	jne	.L2
	rep ret
	.cfi_endproc
.LFE41:
	.size	daxpy, .-daxpy
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"y[0]=%f"
.LC2:
	.string	"\ny[N-1]=%f\n"
.LC3:
	.string	"Tiempo: %f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB42:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	$800000000, %edi
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	call	malloc@PLT
	movl	$800000000, %edi
	movq	%rax, %rbx
	call	malloc@PLT
	xorl	%edx, %edx
	movq	%rax, %rbp
	.p2align 4,,10
	.p2align 3
.L6:
	pxor	%xmm0, %xmm0
	cvtsi2sd	%edx, %xmm0
	movsd	%xmm0, (%rbx,%rdx,8)
	movsd	%xmm0, 0(%rbp,%rdx,8)
	addq	$1, %rdx
	cmpq	$100000000, %rdx
	jne	.L6
	call	omp_get_wtime@PLT
	movsd	.LC0(%rip), %xmm1
	movl	$8, %edx
	movsd	%xmm0, (%rsp)
	.p2align 4,,10
	.p2align 3
.L7:
	movsd	0(%rbp,%rdx), %xmm0
	mulsd	%xmm1, %xmm0
	addsd	(%rbx,%rdx), %xmm0
	movsd	%xmm0, (%rbx,%rdx)
	addq	$8, %rdx
	cmpq	$800000008, %rdx
	jne	.L7
	call	omp_get_wtime@PLT
	leaq	.LC1(%rip), %rsi
	movsd	%xmm0, 8(%rsp)
	movl	$1, %edi
	movsd	(%rbx), %xmm0
	movl	$1, %eax
	call	__printf_chk@PLT
	movsd	799999992(%rbx), %xmm0
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movsd	8(%rsp), %xmm1
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	subsd	(%rsp), %xmm1
	movapd	%xmm1, %xmm0
	call	__printf_chk@PLT
	addq	$24, %rsp
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE42:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1079574528
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
