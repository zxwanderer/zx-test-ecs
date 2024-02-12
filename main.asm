
  DEVICE ZXSPECTRUM48

  SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION

  org #6000

  include "defines.inc"
main:
  ld sp, stack_top
  xor a

.loop
  inc a
  out (#fe), a
  jr .loop
  
  include "unit_tests.asm"
  include "stack.asm"

  SAVESNA "z80-sample-program.sna", main
