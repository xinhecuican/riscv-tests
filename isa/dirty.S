
rv32si-p-dirty：     文件格式 elf32-littleriscv


Disassembly of section .text.init:

80000000 <_start>:
80000000:	0540006f          	j	80000054 <reset_vector>

80000004 <trap_vector>:
80000004:	34202f73          	csrr	t5,mcause
80000008:	00800f93          	li	t6,8
8000000c:	03ff0a63          	beq	t5,t6,80000040 <write_tohost>
80000010:	00900f93          	li	t6,9
80000014:	03ff0663          	beq	t5,t6,80000040 <write_tohost>
80000018:	00b00f93          	li	t6,11
8000001c:	03ff0263          	beq	t5,t6,80000040 <write_tohost>
80000020:	00000f17          	auipc	t5,0x0
80000024:	200f0f13          	addi	t5,t5,512 # 80000220 <mtvec_handler>
80000028:	000f0463          	beqz	t5,80000030 <trap_vector+0x2c>
8000002c:	000f0067          	jr	t5
80000030:	34202f73          	csrr	t5,mcause
80000034:	000f5463          	bgez	t5,8000003c <handle_exception>
80000038:	0040006f          	j	8000003c <handle_exception>

8000003c <handle_exception>:
8000003c:	5391e193          	ori	gp,gp,1337

80000040 <write_tohost>:
80000040:	00001f17          	auipc	t5,0x1
80000044:	fc3f2023          	sw	gp,-64(t5) # 80001000 <tohost>
80000048:	00001f17          	auipc	t5,0x1
8000004c:	fa0f2e23          	sw	zero,-68(t5) # 80001004 <tohost+0x4>
80000050:	ff1ff06f          	j	80000040 <write_tohost>

80000054 <reset_vector>:
80000054:	00000093          	li	ra,0
80000058:	00000113          	li	sp,0
8000005c:	00000193          	li	gp,0
80000060:	00000213          	li	tp,0
80000064:	00000293          	li	t0,0
80000068:	00000313          	li	t1,0
8000006c:	00000393          	li	t2,0
80000070:	00000413          	li	s0,0
80000074:	00000493          	li	s1,0
80000078:	00000513          	li	a0,0
8000007c:	00000593          	li	a1,0
80000080:	00000613          	li	a2,0
80000084:	00000693          	li	a3,0
80000088:	00000713          	li	a4,0
8000008c:	00000793          	li	a5,0
80000090:	00000813          	li	a6,0
80000094:	00000893          	li	a7,0
80000098:	00000913          	li	s2,0
8000009c:	00000993          	li	s3,0
800000a0:	00000a13          	li	s4,0
800000a4:	00000a93          	li	s5,0
800000a8:	00000b13          	li	s6,0
800000ac:	00000b93          	li	s7,0
800000b0:	00000c13          	li	s8,0
800000b4:	00000c93          	li	s9,0
800000b8:	00000d13          	li	s10,0
800000bc:	00000d93          	li	s11,0
800000c0:	00000e13          	li	t3,0
800000c4:	00000e93          	li	t4,0
800000c8:	00000f13          	li	t5,0
800000cc:	00000f93          	li	t6,0
800000d0:	f1402573          	csrr	a0,mhartid
800000d4:	00051063          	bnez	a0,800000d4 <reset_vector+0x80>
800000d8:	00000297          	auipc	t0,0x0
800000dc:	01028293          	addi	t0,t0,16 # 800000e8 <reset_vector+0x94>
800000e0:	30529073          	csrw	mtvec,t0
800000e4:	18005073          	csrwi	satp,0
800000e8:	30405073          	csrwi	mie,0
800000ec:	00000297          	auipc	t0,0x0
800000f0:	01428293          	addi	t0,t0,20 # 80000100 <reset_vector+0xac>
800000f4:	30529073          	csrw	mtvec,t0
800000f8:	30205073          	csrwi	medeleg,0
800000fc:	30305073          	csrwi	mideleg,0
80000100:	00000193          	li	gp,0
80000104:	00000297          	auipc	t0,0x0
80000108:	f0028293          	addi	t0,t0,-256 # 80000004 <trap_vector>
8000010c:	30529073          	csrw	mtvec,t0
80000110:	00100513          	li	a0,1
80000114:	01f51513          	slli	a0,a0,0x1f
80000118:	00054463          	bltz	a0,80000120 <reset_vector+0xcc>
8000011c:	0000000b          	.word	0x0000000b
80000120:	00000293          	li	t0,0
80000124:	00028a63          	beqz	t0,80000138 <reset_vector+0xe4>
80000128:	10529073          	csrw	stvec,t0
8000012c:	0000b2b7          	lui	t0,0xb
80000130:	10928293          	addi	t0,t0,265 # b109 <_start-0x7fff4ef7>
80000134:	30229073          	csrw	medeleg,t0
80000138:	30005073          	csrwi	mstatus,0
8000013c:	00002537          	lui	a0,0x2
80000140:	80050513          	addi	a0,a0,-2048 # 1800 <_start-0x7fffe800>
80000144:	30052073          	csrs	mstatus,a0
80000148:	00000297          	auipc	t0,0x0
8000014c:	01428293          	addi	t0,t0,20 # 8000015c <reset_vector+0x108>
80000150:	34129073          	csrw	mepc,t0
80000154:	f1402573          	csrr	a0,mhartid
80000158:	30200073          	mret
8000015c:	80000537          	lui	a0,0x80000
80000160:	00002597          	auipc	a1,0x2
80000164:	ea058593          	addi	a1,a1,-352 # 80002000 <begin_signature>
80000168:	00c5d593          	srli	a1,a1,0xc
8000016c:	00a5e5b3          	or	a1,a1,a0
80000170:	18059073          	csrw	satp,a1
80000174:	12000073          	sfence.vma
80000178:	000215b7          	lui	a1,0x21
8000017c:	80058593          	addi	a1,a1,-2048 # 20800 <_start-0x7ffdf800>
80000180:	3005a073          	csrs	mstatus,a1
80000184:	00200193          	li	gp,2
80000188:	00100393          	li	t2,1
8000018c:	80002517          	auipc	a0,0x80002
80000190:	e6752e23          	sw	t2,-388(a0) # 2008 <_start-0x7fffdff8>
80000194:	00300193          	li	gp,3
80000198:	000415b7          	lui	a1,0x41
8000019c:	80058593          	addi	a1,a1,-2048 # 40800 <_start-0x7ffbf800>
800001a0:	3005a073          	csrs	mstatus,a1
800001a4:	80002297          	auipc	t0,0x80002
800001a8:	e642a283          	lw	t0,-412(t0) # 2008 <_start-0x7fffdff8>
800001ac:	0e029063          	bnez	t0,8000028c <die>
800001b0:	80002517          	auipc	a0,0x80002
800001b4:	e4752c23          	sw	t2,-424(a0) # 2008 <_start-0x7fffdff8>
800001b8:	80002297          	auipc	t0,0x80002
800001bc:	e502a283          	lw	t0,-432(t0) # 2008 <_start-0x7fffdff8>
800001c0:	0c729663          	bne	t0,t2,8000028c <die>
800001c4:	000202b7          	lui	t0,0x20
800001c8:	3002b073          	csrc	mstatus,t0
800001cc:	00002297          	auipc	t0,0x2
800001d0:	e342a283          	lw	t0,-460(t0) # 80002000 <begin_signature>
800001d4:	0c000513          	li	a0,192
800001d8:	00a2f2b3          	and	t0,t0,a0
800001dc:	0aa29863          	bne	t0,a0,8000028c <die>
800001e0:	000202b7          	lui	t0,0x20
800001e4:	3002a073          	csrs	mstatus,t0
800001e8:	00400193          	li	gp,4
800001ec:	80002517          	auipc	a0,0x80002
800001f0:	e1452503          	lw	a0,-492(a0) # 2000 <_start-0x7fffe000>
800001f4:	40056513          	ori	a0,a0,1024
800001f8:	80002297          	auipc	t0,0x80002
800001fc:	e0a2a423          	sw	a0,-504(t0) # 2000 <_start-0x7fffe000>
80000200:	12000073          	sfence.vma
80000204:	80002297          	auipc	t0,0x80002
80000208:	dea2ae23          	sw	a0,-516(t0) # 2000 <_start-0x7fffe000>
8000020c:	0800006f          	j	8000028c <die>
80000210:	0000000b          	.word	0x0000000b
80000214:	00301463          	bne	zero,gp,8000021c <pass>

80000218 <fail>:
80000218:	0010000b          	.word	0x0010000b

8000021c <pass>:
8000021c:	0000000b          	.word	0x0000000b

80000220 <mtvec_handler>:
80000220:	342022f3          	csrr	t0,mcause
80000224:	ff128293          	addi	t0,t0,-15
80000228:	06029263          	bnez	t0,8000028c <die>
8000022c:	00200313          	li	t1,2
80000230:	02619263          	bne	gp,t1,80000254 <skip+0x10>
80000234:	00002297          	auipc	t0,0x2
80000238:	dcc2a283          	lw	t0,-564(t0) # 80002000 <begin_signature>
8000023c:	0802f313          	andi	t1,t0,128
80000240:	04031663          	bnez	t1,8000028c <die>

80000244 <skip>:
80000244:	341022f3          	csrr	t0,mepc
80000248:	00428293          	addi	t0,t0,4
8000024c:	34129073          	csrw	mepc,t0
80000250:	30200073          	mret
80000254:	00300313          	li	t1,3
80000258:	02619463          	bne	gp,t1,80000280 <skip+0x3c>
8000025c:	00002297          	auipc	t0,0x2
80000260:	da42a283          	lw	t0,-604(t0) # 80002000 <begin_signature>
80000264:	0802f313          	andi	t1,t0,128
80000268:	02031263          	bnez	t1,8000028c <die>
8000026c:	0802e293          	ori	t0,t0,128
80000270:	00002317          	auipc	t1,0x2
80000274:	d8532823          	sw	t0,-624(t1) # 80002000 <begin_signature>
80000278:	12000073          	sfence.vma
8000027c:	30200073          	mret
80000280:	00400313          	li	t1,4
80000284:	00619463          	bne	gp,t1,8000028c <die>
80000288:	f95ff06f          	j	8000021c <pass>

8000028c <die>:
8000028c:	0010000b          	.word	0x0010000b
80000290:	c0001073          	unimp
	...
