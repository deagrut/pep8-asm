;§> PEP/8 Syntax Highlighting Example =========================================;
;
; @author deagrut
; @version 0.0.0
;
;§<============================================================================;

CALL      MAIN
STOP

;§> Struct ====================================================================;
rListVal:.EQUATE 0           ; #2d Value.
rListPre:.EQUATE 2           ; #2h Address of precedent value.
rListNex:.EQUATE 4           ; #2h Address of next value.
rListSiz:.EQUATE 6           ; Total size of struct.
;§<============================================================================;




;§> MAIN ======================================================================;
tmpVal:  .EQUATE 0           ; #1d2a local variable
tmp1:    .EQUATE 2           ; #2h local variable
tmp2:    .EQUATE 4           ; #2h local variable

MAIN:    SUBSP   6,i         ; allocate #tmp2 #tmp1 #tmpVal
         DECI    tmpVal,s    ; tmpVal = DECI();
         LDA     rListSiz,i  ; tmp1 = new struct();
         CALL    new         ; #rListVal #rListPre #rListNex
         STX     tmp1,s
         LDA     tmpVal,s
         STA     rListVal,x  ; tmp1.rListVal = tmpVal;
         LDA     0x0000,i
         STA     rListPre,x  ; tmp1.rListPre = 0x0000;
         LDA     rListSiz,i  ; tmp2 = new struct();
         CALL    new         ; #rListVal #rListPre #rListNex
         STX     tmp2,s
         LDA     tmp1,s
         STA     rListPre,x  ; tmp2.rListPre = tmp1;
         LDA     '@',i
         STA     rListVal,x  ; tmp2.rListVal = '@';
         LDA     0x0000,i
         STA     rListNex,x  ; tmp2.rListNex = 0x0000;

         LDX     tmp1,s
         LDA     tmp2,s
         STA     rListNex,x  ; tmp1.rListNex = tmp2;

         ADDSP   6,i         ; deallocate #tmp2 #tmp1 #tmpVal
         RET0
;§<============================================================================;

;§>-----------------------------------------------------------------------------
; new:      Dynamic memory allocation on heap.
; In:       A = Number of byte(s).
; Out:      X = Address of first allocated byte (pointer).
;§<-----------------------------------------------------------------------------
new:     LDX     hpPtr,d     ;returned pointer
         ADDA    hpPtr,d     ;allocate (A) bytes from heap
         STA     hpPtr,d     ;update hpPtr
         RET0
hpPtr:   .ADDRSS heap        ; address of next free byte
heap:    .BLOCK  1           ; first byte in the heap
         .END