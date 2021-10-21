#include "configuracion.h"
#define rojo PORTC.RC1
#define verde PORTC.RC0
#fuses INTRC_IO 
#use delay(clock=500000)

#byte porta = 0xf80
int i,servo=1;

char kp;
char usuario[5]=" ";
char fija[5]="1234";

int i=0, error=0;

void main() {
       setup_oscillator(OSC_500KHZ|OSC_INTRC); //Cristal interno de 500KHz
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
                         verde=1;
                         rojo = 0;
                         Lcd_cmd(1);
                         Lcd_out(1,1,"CONTRASENA VALIDA");
                   }
                   else{
                         verde=0;
                         rojo = 1;
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
