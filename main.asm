
  DEVICE ZXSPECTRUM48

  SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION

  org #6000

  include "helpers/defines.inc"
  include "ecs.asm"

main:
  ld sp, stack_top
  xor a

.loop
  inc a
  out (#fe), a
  jr .loop
  
  include "unit_tests.asm"
  ; include "helpers/stack.asm"

  SAVESNA "z80-sample-program.sna", main
