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
org $c0decb
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

org $c0df02
cont_p1:

org $c0df26
end_p1:



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Player 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
org $c0e5f0
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

org $c0e62b
cont_p2:

org $c0e64f
end_p2:
