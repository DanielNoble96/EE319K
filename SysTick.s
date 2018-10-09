; SysTick.s
; Module written by: **-UUU-*Your Names**update this***
; Date Created: 2/14/2017
; Last Modified: 8/29/2018 
; Brief Description: Initializes SysTick

NVIC_ST_CTRL_R        EQU 0xE000E010
NVIC_ST_RELOAD_R      EQU 0xE000E014
NVIC_ST_CURRENT_R     EQU 0xE000E018

        AREA    |.text|, CODE, READONLY, ALIGN=2
        THUMB
; -UUU- You add code here to export your routine(s) from SysTick.s to main.s
        EXPORT SysTick_Init
;------------SysTick_Init------------
; ;-UUU-Complete this subroutine
; Initialize SysTick running at bus clock.
; Make it so NVIC_ST_CURRENT_R can be used as a 24-bit time
; Input: none
; Output: none
; Modifies: ??
SysTick_Init
 ; **-UUU-**Implement this function****
	
	; disable SysTick during setup
	LDR R1, =NVIC_ST_CTRL_R
	MOV R0, #0						; clear ENABLE bit
	STR R0, [R1]
	
	; set the reload value to max
	LDR R1, =NVIC_ST_RELOAD_R
	LDR R0, =0x00FFFFFF			; this is the maximum value in a 24 bit register
	STR R0, [R1]					
  
	; write a value to counter to clear it
	LDR R1, =NVIC_ST_CURRENT_R
	MOV R0, #0						; clear the counter
	STR R0, [R1]
	
	; enable SysTick with the core clock
	LDR R1, =NVIC_ST_CTRL_R
	MOV R0, #0x0005					; Set to run with clock and enable SysTick, no interrupts
	STR R0, [R1]					; Enable bits 0 and 2, ENABLE and CLK_SRC
    BX  LR                          ; return

    ALIGN                           ; make sure the end of this section is aligned
    END                             ; end of file
