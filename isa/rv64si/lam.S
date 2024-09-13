#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64S
RVTEST_CODE_BEGIN

  li TESTNUM, 2;

misalign_read:
  lw a0, dummy + 2
  j fail;
  li TESTNUM, 3
  li a1, 1
  sw a1, dummy + 2, a0
  j fail;
  j pass;


mtvec_handler:
  li t1, CAUSE_MISALIGNED_LOAD;
  csrr t0, mcause;
  beq t0, t1, load_misalign;
  li t1, CAUSE_MISALIGNED_STORE;
  beq t0, t1, store_misalign;
  j fail;
load_misalign:
  li a0, 2;
  beq a0, gp, epc_add;
  j fail;
store_misalign:
  li a0, 3;
  beq a0, gp, epc_add;
  j fail;
epc_add:
  csrr t1, mepc;
  addi t1, t1, 0x8;
  csrw mepc, t1;
  mret;

  TEST_PASSFAIL
RVTEST_CODE_END

RVTEST_DATA_BEGIN

  TEST_DATA
dummy: .dword 0

RVTEST_DATA_END