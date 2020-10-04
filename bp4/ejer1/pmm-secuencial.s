	.file	"pmm-secuencial.c"
	.text
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
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movl	%ecx, -44(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L2
.L7:
	movl	$0, -8(%rbp)
	jmp	.L3
.L6:
	movl	$0, -4(%rbp)
	jmp	.L4
.L5:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm2
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm2, %xmm0
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -4(%rbp)
.L4:
	movl	-4(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L5
	addl	$1, -8(%rbp)
.L3:
	movl	-8(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L6
	addl	$1, -12(%rbp)
.L2:
	movl	-12(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L7
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	multiplicacion, .-multiplicacion
	.section	.rodata
	.align 8
.LC0:
	.string	"Faltan las dimensiones de la matriz y vector"
.LC2:
	.string	"resultado[0][0]=%f"
.LC3:
	.string	"\nresultado[N-1][N-1]=%f\n"
.LC4:
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
	pushq	%rbx
	subq	$104, %rsp
	.cfi_offset 3, -24
	movl	%edi, -84(%rbp)
	movq	%rsi, -96(%rbp)
	cmpl	$2, -84(%rbp)
	je	.L9
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L9:
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -64(%rbp)
	movl	$0, -80(%rbp)
	jmp	.L10
.L11:
	movl	-68(%rbp), %eax
	cltq
	salq	$3, %rax
	movl	-80(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-64(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, (%rbx)
	addl	$1, -80(%rbp)
.L10:
	movl	-80(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jl	.L11
	movl	-68(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -56(%rbp)
	movl	$0, -80(%rbp)
	jmp	.L12
.L13:
	movl	-68(%rbp), %eax
	cltq
	salq	$3, %rax
	movl	-80(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-56(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, (%rbx)
	addl	$1, -80(%rbp)
.L12:
	movl	-80(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jl	.L13
	movl	-68(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -48(%rbp)
	movl	$0, -80(%rbp)
	jmp	.L14
.L15:
	movl	-68(%rbp), %eax
	cltq
	salq	$3, %rax
	movl	-80(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-48(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, (%rbx)
	addl	$1, -80(%rbp)
.L14:
	movl	-80(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jl	.L15
	movl	$1, -72(%rbp)
	movl	$0, -80(%rbp)
	jmp	.L16
.L19:
	movl	$0, -76(%rbp)
	jmp	.L17
.L18:
	movl	-80(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-76(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	cvtsi2sd	-72(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -72(%rbp)
	addl	$1, -76(%rbp)
.L17:
	movl	-76(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jl	.L18
	addl	$1, -80(%rbp)
.L16:
	movl	-80(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jl	.L19
	movl	$1, -72(%rbp)
	movl	$0, -80(%rbp)
	jmp	.L20
.L23:
	movl	$0, -76(%rbp)
	jmp	.L21
.L22:
	movl	-80(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-76(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	cvtsi2sd	-72(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -72(%rbp)
	addl	$1, -76(%rbp)
.L21:
	movl	-76(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jl	.L22
	addl	$1, -80(%rbp)
.L20:
	movl	-80(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jl	.L23
	movl	$0, -80(%rbp)
	jmp	.L24
.L27:
	movl	$0, -76(%rbp)
	jmp	.L25
.L26:
	movl	-80(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-76(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -76(%rbp)
.L25:
	movl	-76(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jl	.L26
	addl	$1, -80(%rbp)
.L24:
	movl	-80(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jl	.L27
	call	omp_get_wtime@PLT
	movq	%xmm0, %rax
	movq	%rax, -40(%rbp)
	movl	-68(%rbp), %ecx
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	multiplicacion
	call	omp_get_wtime@PLT
	movq	%xmm0, %rax
	movq	%rax, -32(%rbp)
	movsd	-32(%rbp), %xmm0
	subsd	-40(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -104(%rbp)
	movsd	-104(%rbp), %xmm0
	leaq	.LC2(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	-68(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-68(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	subq	$8, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -104(%rbp)
	movsd	-104(%rbp), %xmm0
	leaq	.LC3(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-24(%rbp), %rax
	movq	%rax, -104(%rbp)
	movsd	-104(%rbp), %xmm0
	leaq	.LC4(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, -80(%rbp)
	jmp	.L28
.L29:
	movl	-80(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	addl	$1, -80(%rbp)
.L28:
	movl	-80(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jl	.L29
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, -80(%rbp)
	jmp	.L30
.L31:
	movl	-80(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	addl	$1, -80(%rbp)
.L30:
	movl	-80(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jl	.L31
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, -80(%rbp)
	jmp	.L32
.L33:
	movl	-80(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	addl	$1, -80(%rbp)
.L32:
	movl	-80(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jl	.L33
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
	addq	$104, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
