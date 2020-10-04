	.file	"daxpy.c"
	.text
	.globl	daxpy
	.type	daxpy, @function
daxpy:
.LFB23:
	.cfi_startproc
	movl	$8, %eax
.L2:
	movsd	(%rsi,%rax), %xmm1
	mulsd	%xmm0, %xmm1
	addsd	(%rdi,%rax), %xmm1
	movsd	%xmm1, (%rdi,%rax)
	addq	$8, %rax
	cmpq	$800000008, %rax
	jne	.L2
	ret
	.cfi_endproc
.LFE23:
	.size	daxpy, .-daxpy
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"y[0]=%f"
.LC2:
	.string	"\ny[N-1]=%f\n"
.LC3:
	.string	"Tiempo: %f\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB24:
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
.L6:
	cvtsi2sd	%edx, %xmm0
	movsd	%xmm0, (%rbx,%rdx,8)
	movsd	%xmm0, 0(%rbp,%rdx,8)
	incq	%rdx
	cmpq	$100000000, %rdx
	jne	.L6
	call	omp_get_wtime@PLT
	movsd	%xmm0, (%rsp)
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	movsd	.LC0(%rip), %xmm0
	call	daxpy
	call	omp_get_wtime@PLT
	leaq	.LC1(%rip), %rsi
	movsd	%xmm0, 8(%rsp)
	movl	$1, %edi
	movsd	(%rbx), %xmm0
	movb	$1, %al
	call	__printf_chk@PLT
	movsd	799999992(%rbx), %xmm0
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	movb	$1, %al
	call	__printf_chk@PLT
	movsd	8(%rsp), %xmm1
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	movb	$1, %al
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
.LFE24:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1079574528
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
