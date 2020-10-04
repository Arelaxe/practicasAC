	.file	"daxpy.c"
	.text
	.p2align 4,,15
	.globl	daxpy
	.type	daxpy, @function
daxpy:
.LFB41:
	.cfi_startproc
	leaq	8(%rsi), %rcx
	leaq	24(%rdi), %rax
	leaq	8(%rdi), %rdx
	cmpq	%rax, %rcx
	jnb	.L10
	leaq	24(%rsi), %rax
	cmpq	%rax, %rdx
	jb	.L8
.L10:
	shrq	$3, %rdx
	movl	$1, %eax
	andl	$1, %edx
	je	.L4
	movsd	8(%rsi), %xmm1
	movl	$2, %eax
	mulsd	%xmm0, %xmm1
	addsd	8(%rdi), %xmm1
	movsd	%xmm1, 8(%rdi)
.L4:
	movapd	%xmm0, %xmm2
	movl	%edx, %r8d
	movl	$100000000, %r11d
	subl	%edx, %r11d
	addq	$1, %r8
	xorl	%edx, %edx
	unpcklpd	%xmm2, %xmm2
	salq	$3, %r8
	movl	%r11d, %r10d
	leaq	(%rsi,%r8), %r9
	xorl	%ecx, %ecx
	shrl	%r10d
	addq	%rdi, %r8
	.p2align 4,,10
	.p2align 3
.L5:
	movupd	(%r9,%rdx), %xmm1
	addl	$1, %ecx
	mulpd	%xmm2, %xmm1
	addpd	(%r8,%rdx), %xmm1
	movaps	%xmm1, (%r8,%rdx)
	addq	$16, %rdx
	cmpl	%r10d, %ecx
	jb	.L5
	movl	%r11d, %edx
	andl	$-2, %edx
	addl	%edx, %eax
	cmpl	%edx, %r11d
	je	.L1
	cltq
	mulsd	(%rsi,%rax,8), %xmm0
	leaq	(%rdi,%rax,8), %rdx
	addsd	(%rdx), %xmm0
	movsd	%xmm0, (%rdx)
	ret
.L8:
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
.L1:
	rep ret
	.cfi_endproc
.LFE41:
	.size	daxpy, .-daxpy
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC5:
	.string	"y[0]=%f"
.LC6:
	.string	"\ny[N-1]=%f\n"
.LC7:
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
	movq	%rax, %rbp
	movq	%rbx, %rax
	shrq	$3, %rax
	andl	$1, %eax
	je	.L22
	movq	$0x000000000, (%rbx)
	movq	$0x000000000, 0(%rbp)
	movl	$99999999, %r8d
	movl	$1, (%rsp)
.L16:
	movd	(%rsp), %xmm4
	movl	$100000000, %edi
	xorl	%ecx, %ecx
	subl	%eax, %edi
	movl	%eax, %eax
	pshufd	$0, %xmm4, %xmm1
	salq	$3, %rax
	movl	%edi, %esi
	movdqa	.LC2(%rip), %xmm3
	leaq	(%rbx,%rax), %rdx
	shrl	$2, %esi
	addq	%rbp, %rax
	paddd	.LC1(%rip), %xmm1
	.p2align 4,,10
	.p2align 3
.L17:
	pshufd	$238, %xmm1, %xmm0
	addl	$1, %ecx
	cvtdq2pd	%xmm1, %xmm2
	addq	$32, %rdx
	addq	$32, %rax
	paddd	%xmm3, %xmm1
	movaps	%xmm2, -32(%rdx)
	cvtdq2pd	%xmm0, %xmm0
	movups	%xmm2, -32(%rax)
	movaps	%xmm0, -16(%rdx)
	movups	%xmm0, -16(%rax)
	cmpl	%esi, %ecx
	jb	.L17
	movl	(%rsp), %eax
	movl	%edi, %ecx
	movl	%r8d, %edx
	andl	$-4, %ecx
	subl	%ecx, %edx
	addl	%ecx, %eax
	cmpl	%ecx, %edi
	je	.L18
	pxor	%xmm0, %xmm0
	movslq	%eax, %rcx
	cmpl	$1, %edx
	cvtsi2sd	%eax, %xmm0
	movsd	%xmm0, (%rbx,%rcx,8)
	movsd	%xmm0, 0(%rbp,%rcx,8)
	leal	1(%rax), %ecx
	je	.L18
	pxor	%xmm0, %xmm0
	movslq	%ecx, %rsi
	addl	$2, %eax
	cmpl	$2, %edx
	cvtsi2sd	%ecx, %xmm0
	movsd	%xmm0, (%rbx,%rsi,8)
	movsd	%xmm0, 0(%rbp,%rsi,8)
	je	.L18
	pxor	%xmm0, %xmm0
	movslq	%eax, %rdx
	cvtsi2sd	%eax, %xmm0
	movsd	%xmm0, (%rbx,%rdx,8)
	movsd	%xmm0, 0(%rbp,%rdx,8)
.L18:
	call	omp_get_wtime@PLT
	leaq	8(%rbx), %rcx
	movsd	%xmm0, (%rsp)
	movl	$1, %edx
	shrq	$3, %rcx
	andl	$1, %ecx
	je	.L19
	movsd	.LC3(%rip), %xmm0
	movl	$2, %edx
	mulsd	8(%rbp), %xmm0
	addsd	8(%rbx), %xmm0
	movsd	%xmm0, 8(%rbx)
.L19:
	movl	%ecx, %edi
	movl	$100000000, %r9d
	xorl	%esi, %esi
	subl	%ecx, %r9d
	addq	$1, %rdi
	xorl	%ecx, %ecx
	salq	$3, %rdi
	movl	%r9d, %r8d
	movapd	.LC4(%rip), %xmm1
	leaq	0(%rbp,%rdi), %rax
	shrl	%r8d
	addq	%rbx, %rdi
	.p2align 4,,10
	.p2align 3
.L20:
	movupd	(%rax,%rcx), %xmm0
	addl	$1, %esi
	mulpd	%xmm1, %xmm0
	addpd	(%rdi,%rcx), %xmm0
	movaps	%xmm0, (%rdi,%rcx)
	addq	$16, %rcx
	cmpl	%r8d, %esi
	jb	.L20
	movl	%r9d, %eax
	andl	$-2, %eax
	addl	%eax, %edx
	cmpl	%eax, %r9d
	je	.L21
	movsd	.LC3(%rip), %xmm0
	movslq	%edx, %rdx
	leaq	(%rbx,%rdx,8), %rcx
	mulsd	0(%rbp,%rdx,8), %xmm0
	addsd	(%rcx), %xmm0
	movsd	%xmm0, (%rcx)
.L21:
	call	omp_get_wtime@PLT
	leaq	.LC5(%rip), %rsi
	movsd	%xmm0, 8(%rsp)
	movl	$1, %edi
	movsd	(%rbx), %xmm0
	movl	$1, %eax
	call	__printf_chk@PLT
	movsd	799999992(%rbx), %xmm0
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movsd	8(%rsp), %xmm1
	leaq	.LC7(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	subsd	(%rsp), %xmm1
	movapd	%xmm1, %xmm0
	call	__printf_chk@PLT
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L22:
	.cfi_restore_state
	movl	$100000000, %r8d
	movl	$0, (%rsp)
	jmp	.L16
	.cfi_endproc
.LFE42:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC2:
	.long	4
	.long	4
	.long	4
	.long	4
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	0
	.long	1079574528
	.section	.rodata.cst16
	.align 16
.LC4:
	.long	0
	.long	1079574528
	.long	0
	.long	1079574528
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
