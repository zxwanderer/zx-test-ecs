;========================================================
; unit_tests.asm
;
; Collects and executes all unit tests.
;========================================================

    include "unit_tests.inc"

; Initialization routine called before all unit tests are
; started.
    UNITTEST_INITIALIZE
    ; Do your initialization here ...
    ; ...
    ; ...
    ; For this simple example we don't need any special initialization.
    ; So we simply return.
    ; Please note: the stack pointer does not need to be setup explicitly
    ; for the unit tests.
    ret

    MODULE TestSuite_ClearScreen

; A unit testcase needs to start with "UT_" (upper case letters).
; DeZog will collect all these labels and offer them for execution.

; Tests that the screen is cleared/filled with 0's.
UT_clear_screen:
    ; Write some bytes to the screen area
    ld a,0xFF
    ld (SCREEN),a
    ld (SCREEN+SCREEN_SIZE/2),a
    ld (SCREEN+SCREEN_SIZE-1),a
    ld (SCREEN+SCREEN_SIZE),a

    ; Now clear the screen
    ; call clear_screen

    ; Test that all values inside the screen area are cleared
    TEST_MEMORY_BYTE SCREEN, 0
    TEST_MEMORY_BYTE SCREEN+SCREEN_SIZE/2, 0
    TEST_MEMORY_BYTE SCREEN+SCREEN_SIZE-1, 0

    TEST_MEMORY_BYTE SCREEN+SCREEN_SIZE, 0xFF
    nop
 TC_END

    ENDMODULE
