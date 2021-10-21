#line 1 "C:/Users/HP/Desktop/EJERCICIOS VIDEOS/Clave_teclado/CLAVE_TECLADO.c"
#line 1 "c:/users/hp/desktop/ejercicios videos/clave_teclado/configuracion.h"
extern char kp;

sbit LCD_RS at RD0_bit;
sbit LCD_EN at RD1_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISD0_bit;
sbit LCD_EN_Direction at TRISD1_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;

char keypadPort at PORTB;

int teclado(){
 kp = 0;
 do{

 kp = Keypad_Key_Click();
 }while (!kp);

 switch (kp) {
 case 1: kp = 49; break;
 case 2: kp = 50; break;
 case 3: kp = 51; break;
 case 4: kp = 65; break;
 case 5: kp = 52; break;
 case 6: kp = 53; break;
 case 7: kp = 54; break;
 case 8: kp = 66; break;
 case 9: kp = 55; break;
 case 10: kp = 56; break;
 case 11: kp = 57; break;
 case 12: kp = 67; break;
 case 13: kp = 42; break;
 case 14: kp = 48; break;
 case 15: kp = 35; break;
 case 16: kp = 68; break;
 }
 return kp;
}
#line 4 "C:/Users/HP/Desktop/EJERCICIOS VIDEOS/Clave_teclado/CLAVE_TECLADO.c"
char kp;
char usuario[5]=" ";
char fija[5]="1234";

int i=0, error=0;

void main() {
 ADCON1 = 0x0F;
 TRISC = 0x00;
 Lcd_init();
 Lcd_cmd(12);
 Keypad_init();
 Lcd_out(1,1,"DIGITE CONTRASENA");
 Lcd_out(2,1,"CONTRA: ");
 while(1){
 usuario[i]= teclado();
 Lcd_chr_cp('*');
 i++;
 if(i==4){
 Lcd_cmd(1);
 Lcd_out(1,1,"VALIDANDO");
 for(i=0; i<=3; i++){
 if(fija[i] != usuario[i]){
 error++;
 }
 Lcd_chr(2,i+1,'*');
 delay_ms(200);
 }
 if(error==0){
  PORTC.RC0 =1;
  PORTC.RC1  = 0;
 Lcd_cmd(1);
 Lcd_out(1,1,"CONTRASENA VALIDA");
 }
 else{
  PORTC.RC0 =0;
  PORTC.RC1  = 1;
 Lcd_cmd(1);
 Lcd_out(1,1,"ERROR CONTRASENA");
 }
 delay_ms(2000);
 lcd_cmd(1);
 Lcd_out(1,1,"DIGITE CONTRASENA");
 Lcd_out(2,1,"CONTRA: ");
 i=0;
 error=0;
 }

 }
}
