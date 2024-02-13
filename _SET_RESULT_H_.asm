  MODULE TestSuite_SET_RESULT_

  include "lib/zx-core/libs/result/set_result_h.asm"
  include "lib/zx-core/libs/result/set_result.asm"

UT_set_C:
  SCF
  TEST_FLAG_C
  CALL ret_false
  TEST_FLAG_NC
  TC_END

UT_reset_C:
  SCF ; устанавливаем бит переноса и инвертируем его ))
  CCF
  TEST_FLAG_NC
  CALL ret_true
  TEST_FLAG_C
  
  TC_END


  ENDMODULE