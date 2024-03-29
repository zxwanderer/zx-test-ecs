  include "lib/zx-core/libs/defines_h.asm"
  include "lib/zx-core/libs/tables/scan_by_index.asm"

  MODULE TestSuite_TABLE_SCAN_BY_INDEX_PTR

_findIndex equ #CC
_findPointer equ #DD00

UT_not_found:
  
  ld A, _findIndex
  ld HL, empty_table
  call TABLE_SCAN_BY_INDEX_PTR
  TEST_FLAG_NC
  TC_END

UT_found:
  
  ld A, _findIndex
  ld HL, non_empty_table
  call TABLE_SCAN_BY_INDEX_PTR
  TEST_FLAG_C
  nop ; ASSERTION HL == TestSuite_TABLE_SCAN_BY_INDEX_PTR._findPointer
  TC_END

non_empty_table:
  defb _findIndex
  defw _findPointer
empty_table:
  defb _endByte

  ENDMODULE
