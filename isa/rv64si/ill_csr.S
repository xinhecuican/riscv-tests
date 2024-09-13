#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64S
RVTEST_CODE_BEGIN

  li TESTNUM, 2;

illegal_csr_read:
  .word 0x80009173; # csrrw
  j fail;
  csrr t0, mstatus;
  j fail;
  j pass;


mtvec_handler:
  li t1, CAUSE_ILLEGAL_INSTRUCTION;
  csrr t0, mcause;
  beq t0, t1, m_ill_inst;
  j fail;
m_ill_inst:
  csrr t1, mepc;
  addi t1, t1, 0x8;
  csrw mepc, t1;
  mret;

stvec_handler:
  li t1, CAUSE_ILLEGAL_INSTRUCTION;
  csrr t0, scause;
  beq t0, t1, s_ill_inst;
  j fail;
s_ill_inst:
  csrr t1, sepc;
  addi t1, t1, 0x8;
  csrw sepc, t1;
  mret;

  TEST_PASSFAIL
RVTEST_CODE_END

RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END