#include "riscv_test.h"
#undef RVTEST_RV64S
#define RVTEST_RV64S RVTEST_RV32S

#include "../rv64si/ill_csr.S"
