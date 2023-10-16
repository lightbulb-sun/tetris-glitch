SECTION "my_code", ROM0[$00da]
; integrate additional row into logic
my_code::
        ld      a, h
        cp      $c7
        jp      nz, clear_lines_loop
        ld      a, l
        cp      $c2
        jp      nz, clear_lines_loop
        jp      clear_line_cont

; add row to top of board
SECTION "set_up_board_1", ROM0[$03cb]
        ld      hl, $c800-$20
SECTION "set_up_board_2", ROM0[$03d6]
        ld      hl, $c801-$20
SECTION "set_up_board_3", ROM0[$03dc]
        ld      hl, $c80c-$20
SECTION "set_up_board_4", ROM0[$26a9]
        ld      b, $20+1

SECTION "clear_lines_loop", ROM0[$2265]
clear_lines_loop::

SECTION "injection", ROM0[$2275]
        jp      my_code

SECTION "clear_line_cont", ROM0[$227a]
clear_line_cont::
