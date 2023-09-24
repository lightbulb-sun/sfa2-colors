hirom

!NEW_BUTTONS_P1     = $ae
!NEW_BUTTONS_P2     = $b4
!MASK_BUTTON_R      = $0010
!MASK_BUTTON_L      = $0020
!MASK_BUTTON_X      = $0040
!MASK_BUTTON_A      = $0080
!MASK_BUTTON_Y      = $4000
!MASK_BUTTON_B      = $8000
!NUM_BUTTONS        = 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Player 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
if defined("US")
org $c0decb
elseif defined("EU")
org $c0defa
else
org $c0def7
endif
check_for_button_presses_p1:
        phb
        lda.b   #(check_for_button_presses_p1>>16)
        pha
        plb
        rep     #$20
        ldy.b   #0
.loop
        lda.w   buttons, y
        bit.b   !NEW_BUTTONS_P1
        bne     .cont
        iny
        iny
        cpy     #(!NUM_BUTTONS*2)
        bne     .loop
.no_presses
        sep     #$30
        plb
        bra     end_p1
.cont
        tya
        lsr
        sep     #$30
        plb
        bra     cont_p1

buttons:
        dw      !MASK_BUTTON_A
        dw      !MASK_BUTTON_B
        dw      !MASK_BUTTON_X
        dw      !MASK_BUTTON_Y
        dw      !MASK_BUTTON_L
        dw      !MASK_BUTTON_R

if defined("US")
org $c0df02
elseif defined("EU")
org $c0df31
else
org $c0df2e
endif
cont_p1:

if defined("US")
org $c0df26
elseif defined("EU")
org $c0df55
else
org $c0df52
endif
end_p1:



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Player 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
if defined("US")
org $c0e5f0
elseif defined("EU")
org $c0e61f
else
org $c0e61c
endif
check_for_button_presses_p2:
        phb
        lda.b   #(check_for_button_presses_p2>>16)
        pha
        plb
        rep     #$20
        ldy.b   #0
.loop
        lda.w   buttons, y
        bit.b   !NEW_BUTTONS_P2
        bne     .cont
        iny
        iny
        cpy     #(!NUM_BUTTONS*2)
        bne     .loop
.no_presses
        sep     #$30
        plb
        bra     end_p2
.cont
        tya
        lsr
        sep     #$30
        plb
        bra     cont_p2

if defined("US")
org $c0e62b
elseif defined("EU")
org $c0e65a
else
org $c0e657
endif
cont_p2:

if defined("US")
org $c0e64f
elseif defined("EU")
org $c0e67e
else
org $c0e67b
endif
end_p2:
