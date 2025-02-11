# zx-test-ecs

Unit test for zx-core and others

Для срабатывания ошибок в юнит-тестах нужно скомпилировать программу и только потом запускать юнит-тесты :( )

# пробы ECS

Inspired by [Space station 14](https://docs.spacestation14.com/en/ss14-by-example/adding-a-simple-bikehorn.html)


Мысли и заметки:


; параметры - однобайтовый параметр + значение

; таблица действий для атрибута (напр. Standable)
; [action][reaction.....]
; [_endByte]
;    reaction - может быть проверить в чем одет герой или что у него в руках

; имитацию атрибутов и таблицу действий с ними можно просто сделать макросами
; с указателями на reaction
  MACRO STANDABLE
    db stand_action
    dw stand_reaction_ptr
  ENDM

  MACRO RED_BIONIC_WASTE
    db use
    dw pickable_bio_ptr
  ENDM

  MACRO GREEN_BIONIC_WASTE
    db use
    dw pickable_bio_ptr
  ENDM

pickable_bio_ptr:
  если в руках не биоконтейнер - ...
  если в руках полный биоконтейнер - ... "контейнер уже полон"
  если поднимаем зеленое(?) - set in hand GREEN_FULL_TANK
  если поднимаем красное(?) - set in hand RED_FULL_TANK
  call BREAKABLE

; Entity:
; ------
; [parent_ptr] - родительский предмет (?) или #ffff
; [info_text_ptr] - текстовое описание предмета или #ffff
; ------
; [attribute]
;   - Breakable
;   - Standable
; ...
; [attribute]
; [_endByte]
; [params]
; ...
; [params]
; [_endByte]
; ------

Reaction:
  Type: ... code.... go_to XXXX ...
  [_endByte]

;
; реакции на основные типы обьектов (поднимаемый, разбиваемый, забираемый в контейнер)
;
[Attribute1_ptr]
  [Action-Reaction table]
    [ActionA][Reaction ptr]
    [ActionB][Reaction ptr]
    ...
    [_endByte]


;
; Описание объединенного типа ячеек
;
[CellType]
  [Attribute1_ptr]
  [Attribute2_ptr]
    ...
  [_endByte]


;
; Таблица указателей на данные ячеек по каждому номеру ячейки 0..255 - 256*4 = 1024 байт
; CELL_TYPE_LIST
;
[Cell type]
  [InfoText_ptr] - текстовое описание предмета
  [CellType_ptr1] - указатель на описание типа ячеек
  [Break_cell] - во что превращается предмет после разрушения, байт (#ff)
  ...


; Унифицированые параметры для каждой динамической ячейки : entity_size * 100 ;  массив в 100 ячеек
; ENTITY_LIST
;
[Entity]
  [CellType_ptr1] - тип предмета
  Entity params:
    <X,Y>
    <Owner_ptr>
    <Internal param value>
    <HP>


Экаунтеры:

- мягкая стенка

- стенка с дыркой

- бронеплита

- керамит

- решетка

- дверь шлюза


- дверь жилая
Metall

- дверь 
Metall

- кровать
Plastic

- стул
Plastic

- стол
Plastic

- плитка разнообразная :)
Standable

- компьютер
Metall => DESTROY


Предметы:

  - кусачки
Metall, Sharp

  - лом
Metall, Lever, Sharp

  - острый обломок
Plastic, Sharp

  - биоконтейнер красный
Metall, Biobattery

  - биоконтейнер зеленый
Metall, Biobattery

  - биоконтейнер пустой
Metall, Container

  - лужица кислотного сока
Bio, Acid