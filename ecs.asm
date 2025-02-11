
@__component_number__ = 1

; как RuGuevara завещал

  MACRO DefineAttribute name? , nameStr?
  DISPLAY "DefineAttribute ", /H, @name?, ' - ',  nameStr?
name? equ @__component_number__
@__component_number__ = @__component_number__ * 2 
  ; ASSERT @__component_number__ < 100 
  ENDM

; --- materials ---------------------------
  DefineAttribute Metall,     "Metall"
  DefineAttribute Plastic,    "Plastic"
  DefineAttribute Bio,        "Bio"

; --- attributes ---------------------------
  DefineAttribute Standable,  "Standable"
  DefineAttribute Lever,      "Lever"
  DefineAttribute Battery,    "Battery"
  DefineAttribute Sharp,      "Sharp"
  DefineAttribute Acid,       "Acid"

  DISPLAY /B, Metall | Sharp

; аттрибуты - однобайтовые параметры
  ; DefineAttribute Breakable ; разбивается
  ; DefineAttribute Standable ; можно встать на предмет
  ; DefineAttribute Pickable  ; можно взять предмет
  ; DefineAttribute Wearable  ; можно одеть предмет
  ; DefineAttribute Door
