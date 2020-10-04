	.file	"figura1-modificado_a.c"
	.text
	.comm	s,40000,32
	.globl	multiplicacion
	.type	multiplicacion, @function
multiplicacion:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -72(%rbp)
	movl	$0, -60(%rbp)
	jmp	.L2
.L10:
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -16(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -8(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -48(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -40(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -32(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -24(%rbp)
	movl	$0, -56(%rbp)
	jmp	.L3
.L4:
	movl	-56(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	s(%rip), %rax
	movl	(%rdx,%rax), %eax
	leal	(%rax,%rax), %edx
	movl	-60(%rbp), %eax
	addl	%edx, %eax
	cvtsi2sd	%eax, %xmm0
	movsd	-48(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -48(%rbp)
	movl	-56(%rbp), %eax
	addl	$1, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	s(%rip), %rax
	movl	(%rdx,%rax), %eax
	leal	(%rax,%rax), %edx
	movl	-60(%rbp), %eax
	addl	%edx, %eax
	cvtsi2sd	%eax, %xmm0
	movsd	-40(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movl	-56(%rbp), %eax
	addl	$2, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	s(%rip), %rax
	movl	(%rdx,%rax), %eax
	leal	(%rax,%rax), %edx
	movl	-60(%rbp), %eax
	addl	%edx, %eax
	cvtsi2sd	%eax, %xmm0
	movsd	-32(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	movl	-56(%rbp), %eax
	addl	$3, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	s(%rip), %rax
	movl	(%rdx,%rax), %eax
	leal	(%rax,%rax), %edx
	movl	-60(%rbp), %eax
	addl	%edx, %eax
	cvtsi2sd	%eax, %xmm0
	movsd	-24(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	addl	$4, -56(%rbp)
.L3:
	cmpl	$4999, -56(%rbp)
	jle	.L4
	movsd	-48(%rbp), %xmm0
	addsd	-40(%rbp), %xmm0
	addsd	-32(%rbp), %xmm0
	movsd	-24(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -48(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -40(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -32(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -24(%rbp)
	movl	$0, -52(%rbp)
	jmp	.L5
.L6:
	movl	-52(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	4+s(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	subl	-60(%rbp), %eax
	cvtsi2sd	%eax, %xmm0
	movsd	-48(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -48(%rbp)
	movl	-52(%rbp), %eax
	addl	$1, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	4+s(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	subl	-60(%rbp), %eax
	cvtsi2sd	%eax, %xmm0
	movsd	-40(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movl	-52(%rbp), %eax
	addl	$2, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	4+s(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	subl	-60(%rbp), %eax
	cvtsi2sd	%eax, %xmm0
	movsd	-32(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	movl	-52(%rbp), %eax
	addl	$3, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	4+s(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	subl	-60(%rbp), %eax
	cvtsi2sd	%eax, %xmm0
	movsd	-24(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	addl	$4, -52(%rbp)
.L5:
	cmpl	$4999, -52(%rbp)
	jle	.L6
	movsd	-48(%rbp), %xmm0
	addsd	-40(%rbp), %xmm0
	addsd	-32(%rbp), %xmm0
	movsd	-24(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	movsd	-8(%rbp), %xmm0
	ucomisd	-16(%rbp), %xmm0
	jbe	.L12
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movsd	-16(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	jmp	.L9
.L12:
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movsd	-8(%rbp), %xmm0
	movsd	%xmm0, (%rax)
.L9:
	addl	$1, -60(%rbp)
.L2:
	cmpl	$39999, -60(%rbp)
	jle	.L10
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	multiplicacion, .-multiplicacion
	.section	.rodata
.LC1:
	.string	"R[0]=%f"
.LC2:
	.string	"\nR[N-1]=%f\n"
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
	subq	$64, %rsp
	movl	$40000, -36(%rbp)
	movl	-36(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -32(%rbp)
	movl	$0, -40(%rbp)
	jmp	.L14
.L15:
	movl	-40(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	s(%rip), %rax
	movl	-40(%rbp), %edx
	movl	%edx, (%rcx,%rax)
	movl	-40(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	4+s(%rip), %rax
	movl	-40(%rbp), %edx
	movl	%edx, (%rcx,%rax)
	addl	$1, -40(%rbp)
.L14:
	cmpl	$4999, -40(%rbp)
	jle	.L15
	call	omp_get_wtime@PLT
	movq	%xmm0, %rax
	movq	%rax, -24(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	multiplicacion
	call	omp_get_wtime@PLT
	movq	%xmm0, %rax
	movq	%rax, -16(%rbp)
	movsd	-16(%rbp), %xmm0
	subsd	-24(%rbp), %xmm0
	movsd	%xmm0, -8(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -56(%rbp)
	movsd	-56(%rbp), %xmm0
	leaq	.LC1(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	-36(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -56(%rbp)
	movsd	-56(%rbp), %xmm0
	leaq	.LC2(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movq	%rax, -56(%rbp)
	movsd	-56(%rbp), %xmm0
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
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
