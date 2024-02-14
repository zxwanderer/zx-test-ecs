
@__component_number__ = 1

; как RuGuevara завещал

  MACRO DefineAttribute name?
name? equ @__component_number__
@__component_number__ = @__component_number__ + 1
  ASSERT @__component_number__ < 100
  ENDM

; аттрибуты - однобайтовые параметры
  DefineAttribute Breakable ; разбивается
  DefineAttribute Standable ; можно встать на предмет
  DefineAttribute Pickable  ; можно взять предмет
  DefineAttribute Wearable  ; можно одеть предмет
  DefineAttribute Door

; Entity:
; ------
; [parent_ptr] - родительский предмет (?) или #ffff
; [info_text_ptr] - текстовое описание предмета или #ffff
; ------
; [attribute] 
; ...
; [attribute]
; [_endByte]
; ------
