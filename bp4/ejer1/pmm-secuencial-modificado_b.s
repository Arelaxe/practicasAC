	.file	"pmm-secuencial-modificado_b.c"
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
	movl	$0, -16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L4
.L5:
	cvtsi2sd	-16(%rbp), %xmm1
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
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, -16(%rbp)
	addl	$1, -4(%rbp)
.L4:
	movl	-4(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L5
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
	cvtsi2sd	-16(%rbp), %xmm0
	movsd	%xmm0, (%rax)
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
	subq	$120, %rsp
	.cfi_offset 3, -24
	movl	%edi, -100(%rbp)
	movq	%rsi, -112(%rbp)
	cmpl	$2, -100(%rbp)
	je	.L9
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L9:
	movq	-112(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -76(%rbp)
	movl	-76(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -72(%rbp)
	movl	$0, -88(%rbp)
	jmp	.L10
.L11:
	movl	-76(%rbp), %eax
	cltq
	salq	$3, %rax
	movl	-88(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-72(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, (%rbx)
	addl	$1, -88(%rbp)
.L10:
	movl	-88(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jl	.L11
	movl	-76(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -64(%rbp)
	movl	$0, -88(%rbp)
	jmp	.L12
.L13:
	movl	-76(%rbp), %eax
	cltq
	salq	$3, %rax
	movl	-88(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-64(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, (%rbx)
	addl	$1, -88(%rbp)
.L12:
	movl	-88(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jl	.L13
	movl	-76(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -56(%rbp)
	movl	$0, -88(%rbp)
	jmp	.L14
.L15:
	movl	-76(%rbp), %eax
	cltq
	salq	$3, %rax
	movl	-88(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-56(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, (%rbx)
	addl	$1, -88(%rbp)
.L14:
	movl	-88(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jl	.L15
	movl	$1, -80(%rbp)
	movl	$0, -88(%rbp)
	jmp	.L16
.L19:
	movl	$0, -84(%rbp)
	jmp	.L17
.L18:
	movl	-88(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-84(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	cvtsi2sd	-80(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -80(%rbp)
	addl	$1, -84(%rbp)
.L17:
	movl	-84(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jl	.L18
	addl	$1, -88(%rbp)
.L16:
	movl	-88(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jl	.L19
	movl	$1, -80(%rbp)
	movl	$0, -88(%rbp)
	jmp	.L20
.L23:
	movl	$0, -84(%rbp)
	jmp	.L21
.L22:
	movl	-88(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-84(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	cvtsi2sd	-80(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -80(%rbp)
	addl	$1, -84(%rbp)
.L21:
	movl	-84(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jl	.L22
	addl	$1, -88(%rbp)
.L20:
	movl	-88(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jl	.L23
	movl	$0, -88(%rbp)
	jmp	.L24
.L27:
	movl	$0, -84(%rbp)
	jmp	.L25
.L26:
	movl	-88(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-84(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -84(%rbp)
.L25:
	movl	-84(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jl	.L26
	addl	$1, -88(%rbp)
.L24:
	movl	-88(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jl	.L27
	movl	$0, -88(%rbp)
	jmp	.L28
.L31:
	movl	-88(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -84(%rbp)
	jmp	.L29
.L30:
	movl	-88(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-84(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movsd	%xmm0, -24(%rbp)
	movl	-84(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-88(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movl	-88(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	movl	-84(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movsd	(%rdx), %xmm0
	movsd	%xmm0, (%rax)
	movl	-84(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-88(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	-24(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -84(%rbp)
.L29:
	movl	-84(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jl	.L30
	addl	$1, -88(%rbp)
.L28:
	movl	-88(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jl	.L31
	call	omp_get_wtime@PLT
	movq	%xmm0, %rax
	movq	%rax, -48(%rbp)
	movl	-76(%rbp), %ecx
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rsi
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	multiplicacion
	call	omp_get_wtime@PLT
	movq	%xmm0, %rax
	movq	%rax, -40(%rbp)
	movsd	-40(%rbp), %xmm0
	subsd	-48(%rbp), %xmm0
	movsd	%xmm0, -32(%rbp)
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -120(%rbp)
	movsd	-120(%rbp), %xmm0
	leaq	.LC2(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	-76(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-76(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	subq	$8, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -120(%rbp)
	movsd	-120(%rbp), %xmm0
	leaq	.LC3(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-32(%rbp), %rax
	movq	%rax, -120(%rbp)
	movsd	-120(%rbp), %xmm0
	leaq	.LC4(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, -88(%rbp)
	jmp	.L32
.L33:
	movl	-88(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	addl	$1, -88(%rbp)
.L32:
	movl	-88(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jl	.L33
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, -88(%rbp)
	jmp	.L34
.L35:
	movl	-88(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	addl	$1, -88(%rbp)
.L34:
	movl	-88(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jl	.L35
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, -88(%rbp)
	jmp	.L36
.L37:
	movl	-88(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	addl	$1, -88(%rbp)
.L36:
	movl	-88(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jl	.L37
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
	addq	$120, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
