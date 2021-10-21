
_teclado:

;configuracion.h,19 :: 		int teclado(){
;configuracion.h,20 :: 		kp = 0;
	CLRF        _kp+0 
;configuracion.h,21 :: 		do{
L_teclado0:
;configuracion.h,23 :: 		kp = Keypad_Key_Click();
	CALL        _Keypad_Key_Click+0, 0
	MOVF        R0, 0 
	MOVWF       _kp+0 
;configuracion.h,24 :: 		}while (!kp);
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado0
;configuracion.h,26 :: 		switch (kp) {
	GOTO        L_teclado3
;configuracion.h,27 :: 		case  1: kp = 49; break; // 1
L_teclado5:
	MOVLW       49
	MOVWF       _kp+0 
	GOTO        L_teclado4
;configuracion.h,28 :: 		case  2: kp = 50; break; // 2
L_teclado6:
	MOVLW       50
	MOVWF       _kp+0 
	GOTO        L_teclado4
;configuracion.h,29 :: 		case  3: kp = 51; break; // 3
L_teclado7:
	MOVLW       51
	MOVWF       _kp+0 
	GOTO        L_teclado4
;configuracion.h,30 :: 		case  4: kp = 65; break; // A
L_teclado8:
	MOVLW       65
	MOVWF       _kp+0 
	GOTO        L_teclado4
;configuracion.h,31 :: 		case  5: kp = 52; break; // 4
L_teclado9:
	MOVLW       52
	MOVWF       _kp+0 
	GOTO        L_teclado4
;configuracion.h,32 :: 		case  6: kp = 53; break; // 5
L_teclado10:
	MOVLW       53
	MOVWF       _kp+0 
	GOTO        L_teclado4
;configuracion.h,33 :: 		case  7: kp = 54; break; // 6
L_teclado11:
	MOVLW       54
	MOVWF       _kp+0 
	GOTO        L_teclado4
;configuracion.h,34 :: 		case  8: kp = 66; break; // B
L_teclado12:
	MOVLW       66
	MOVWF       _kp+0 
	GOTO        L_teclado4
;configuracion.h,35 :: 		case  9: kp = 55; break; // 7
L_teclado13:
	MOVLW       55
	MOVWF       _kp+0 
	GOTO        L_teclado4
;configuracion.h,36 :: 		case 10: kp = 56; break; // 8
L_teclado14:
	MOVLW       56
	MOVWF       _kp+0 
	GOTO        L_teclado4
;configuracion.h,37 :: 		case 11: kp = 57; break; // 9
L_teclado15:
	MOVLW       57
	MOVWF       _kp+0 
	GOTO        L_teclado4
;configuracion.h,38 :: 		case 12: kp = 67; break; // C
L_teclado16:
	MOVLW       67
	MOVWF       _kp+0 
	GOTO        L_teclado4
;configuracion.h,39 :: 		case 13: kp = 42; break; // *
L_teclado17:
	MOVLW       42
	MOVWF       _kp+0 
	GOTO        L_teclado4
;configuracion.h,40 :: 		case 14: kp = 48; break; // 0
L_teclado18:
	MOVLW       48
	MOVWF       _kp+0 
	GOTO        L_teclado4
;configuracion.h,41 :: 		case 15: kp = 35; break; // #
L_teclado19:
	MOVLW       35
	MOVWF       _kp+0 
	GOTO        L_teclado4
;configuracion.h,42 :: 		case 16: kp = 68; break; // D
L_teclado20:
	MOVLW       68
	MOVWF       _kp+0 
	GOTO        L_teclado4
;configuracion.h,43 :: 		}
L_teclado3:
	MOVF        _kp+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado5
	MOVF        _kp+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado6
	MOVF        _kp+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado7
	MOVF        _kp+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado8
	MOVF        _kp+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado9
	MOVF        _kp+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado10
	MOVF        _kp+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado11
	MOVF        _kp+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado12
	MOVF        _kp+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado13
	MOVF        _kp+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado14
	MOVF        _kp+0, 0 
	XORLW       11
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado15
	MOVF        _kp+0, 0 
	XORLW       12
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado16
	MOVF        _kp+0, 0 
	XORLW       13
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado17
	MOVF        _kp+0, 0 
	XORLW       14
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado18
	MOVF        _kp+0, 0 
	XORLW       15
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado19
	MOVF        _kp+0, 0 
	XORLW       16
	BTFSC       STATUS+0, 2 
	GOTO        L_teclado20
L_teclado4:
;configuracion.h,44 :: 		return kp;
	MOVF        _kp+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;configuracion.h,45 :: 		}
L_end_teclado:
	RETURN      0
; end of _teclado

_main:

;CLAVE_TECLADO.c,10 :: 		void main() {
;CLAVE_TECLADO.c,11 :: 		ADCON1 = 0x0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;CLAVE_TECLADO.c,12 :: 		TRISC = 0x00;
	CLRF        TRISC+0 
;CLAVE_TECLADO.c,13 :: 		Lcd_init();
	CALL        _Lcd_Init+0, 0
;CLAVE_TECLADO.c,14 :: 		Lcd_cmd(12);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;CLAVE_TECLADO.c,15 :: 		Keypad_init();
	CALL        _Keypad_Init+0, 0
;CLAVE_TECLADO.c,16 :: 		Lcd_out(1,1,"DIGITE CONTRASENA");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_CLAVE_TECLADO+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_CLAVE_TECLADO+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;CLAVE_TECLADO.c,17 :: 		Lcd_out(2,1,"CONTRA: ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_CLAVE_TECLADO+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_CLAVE_TECLADO+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;CLAVE_TECLADO.c,18 :: 		while(1){
L_main21:
;CLAVE_TECLADO.c,19 :: 		usuario[i]= teclado();
	MOVLW       _usuario+0
	ADDWF       _i+0, 0 
	MOVWF       FLOC__main+0 
	MOVLW       hi_addr(_usuario+0)
	ADDWFC      _i+1, 0 
	MOVWF       FLOC__main+1 
	CALL        _teclado+0, 0
	MOVFF       FLOC__main+0, FSR1
	MOVFF       FLOC__main+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;CLAVE_TECLADO.c,20 :: 		Lcd_chr_cp('*');
	MOVLW       42
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;CLAVE_TECLADO.c,21 :: 		i++;
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;CLAVE_TECLADO.c,22 :: 		if(i==4){
	MOVLW       0
	XORWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main34
	MOVLW       4
	XORWF       _i+0, 0 
L__main34:
	BTFSS       STATUS+0, 2 
	GOTO        L_main23
;CLAVE_TECLADO.c,23 :: 		Lcd_cmd(1);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;CLAVE_TECLADO.c,24 :: 		Lcd_out(1,1,"VALIDANDO");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_CLAVE_TECLADO+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_CLAVE_TECLADO+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;CLAVE_TECLADO.c,25 :: 		for(i=0; i<=3; i++){
	CLRF        _i+0 
	CLRF        _i+1 
L_main24:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _i+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main35
	MOVF        _i+0, 0 
	SUBLW       3
L__main35:
	BTFSS       STATUS+0, 0 
	GOTO        L_main25
;CLAVE_TECLADO.c,26 :: 		if(fija[i] != usuario[i]){
	MOVLW       _fija+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_fija+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVLW       _usuario+0
	ADDWF       _i+0, 0 
	MOVWF       FSR2 
	MOVLW       hi_addr(_usuario+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC0+0, 0 
	XORWF       POSTINC2+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_main27
;CLAVE_TECLADO.c,27 :: 		error++;
	INFSNZ      _error+0, 1 
	INCF        _error+1, 1 
;CLAVE_TECLADO.c,28 :: 		}
L_main27:
;CLAVE_TECLADO.c,29 :: 		Lcd_chr(2,i+1,'*');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _i+0, 0 
	ADDLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       42
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;CLAVE_TECLADO.c,30 :: 		delay_ms(200);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main28:
	DECFSZ      R13, 1, 1
	BRA         L_main28
	DECFSZ      R12, 1, 1
	BRA         L_main28
	DECFSZ      R11, 1, 1
	BRA         L_main28
	NOP
;CLAVE_TECLADO.c,25 :: 		for(i=0; i<=3; i++){
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;CLAVE_TECLADO.c,31 :: 		}
	GOTO        L_main24
L_main25:
;CLAVE_TECLADO.c,32 :: 		if(error==0){
	MOVLW       0
	XORWF       _error+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main36
	MOVLW       0
	XORWF       _error+0, 0 
L__main36:
	BTFSS       STATUS+0, 2 
	GOTO        L_main29
;CLAVE_TECLADO.c,33 :: 		verde=1;
	BSF         PORTC+0, 0 
;CLAVE_TECLADO.c,34 :: 		rojo = 0;
	BCF         PORTC+0, 1 
;CLAVE_TECLADO.c,35 :: 		Lcd_cmd(1);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;CLAVE_TECLADO.c,36 :: 		Lcd_out(1,1,"CONTRASENA VALIDA");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_CLAVE_TECLADO+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_CLAVE_TECLADO+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;CLAVE_TECLADO.c,37 :: 		}
	GOTO        L_main30
L_main29:
;CLAVE_TECLADO.c,39 :: 		verde=0;
	BCF         PORTC+0, 0 
;CLAVE_TECLADO.c,40 :: 		rojo = 1;
	BSF         PORTC+0, 1 
;CLAVE_TECLADO.c,41 :: 		Lcd_cmd(1);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;CLAVE_TECLADO.c,42 :: 		Lcd_out(1,1,"ERROR CONTRASENA");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_CLAVE_TECLADO+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_CLAVE_TECLADO+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;CLAVE_TECLADO.c,43 :: 		}
L_main30:
;CLAVE_TECLADO.c,44 :: 		delay_ms(2000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main31:
	DECFSZ      R13, 1, 1
	BRA         L_main31
	DECFSZ      R12, 1, 1
	BRA         L_main31
	DECFSZ      R11, 1, 1
	BRA         L_main31
	NOP
	NOP
;CLAVE_TECLADO.c,45 :: 		lcd_cmd(1);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;CLAVE_TECLADO.c,46 :: 		Lcd_out(1,1,"DIGITE CONTRASENA");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_CLAVE_TECLADO+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_CLAVE_TECLADO+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;CLAVE_TECLADO.c,47 :: 		Lcd_out(2,1,"CONTRA: ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_CLAVE_TECLADO+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_CLAVE_TECLADO+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;CLAVE_TECLADO.c,48 :: 		i=0;
	CLRF        _i+0 
	CLRF        _i+1 
;CLAVE_TECLADO.c,49 :: 		error=0;
	CLRF        _error+0 
	CLRF        _error+1 
;CLAVE_TECLADO.c,50 :: 		}
L_main23:
;CLAVE_TECLADO.c,52 :: 		}
	GOTO        L_main21
;CLAVE_TECLADO.c,53 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
