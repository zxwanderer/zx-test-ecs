
@__component_number__ = 0

; как RuGuevara завещал

  MACRO DefineAttribute name?
name? equ @__component_number__
@__component_number__ = @__component_number__ + 1
  ASSERT @__component_number__ < 3
  ENDM

  DefineAttribute Tools
  DefineAttribute Door
