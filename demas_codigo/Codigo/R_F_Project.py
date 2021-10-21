
#Librerias necesarias para trabajar...
from Hilo_webCam import webCam
import serial, time


#Metodo que activa la camara para el reconocimiento facial, le pasamos como parametro
#la comunicacion serial
def actWebCam():
    global arduino
    valArd = ""
    wC = webCam()
    wC. ()
    wC.arduino = arduino
    while valArd != "C":
        valArd = arduino.readline().decode(encoding='UTF-8').replace("\r\n", "")
        wC.valArd = valArd
    

#Funcion para validar la contraseña que se introduzco, con la del archivo de texto
def valContra(cad):
    #Diccionario para realizar la traduccion de la contraseña
    dicc = {"A":"0", "b":"1", "X":"2", "c":"3", "Y":"4", "l":"5", "M":"6", "q":"7", "P":"8", "z":"9"}
    
    #Abrir el fichero y asignar la contraseña cifrada en la direccion que se muestra a la variable 'f'
    p = open("C:/Users/JoseSantiago/Documents/tecnologico_guias/Semestre 7/Sistemas programables/Proyecto de S.P/KeyPad/Pass.txt").readline()
    
    #Variable temporal que contiene la contraseña del fichero
    temp = ""
    
    #Hacemos la traduccion de la contraseña caracter por caracter, usando el dicccionario
    for i in(p):
        temp += dicc[i]
    #Codicion para verificar si la contraseña que introduccio el usuario (cad) con la
    #del fichero (temp)
    if cad == temp:
        return True
    else:
        return False

        
#----------Ejecucion del hilo principal...---------------------------------------------
arduino = serial.Serial('COM6', 9600)#Iniciamos la conexion por el purto serial y
#asignamos el objeto de la comunicacion serial
time.sleep(2) #Damos tiempo para que empiece la comunicacion
valArd = "" #Variable temporarl que contiene el caracter actual que se lee de Arduino
contra = "" #Variable que contiene la contraseña que esta introduciendo el usuario.
print("COMIENZA EL PROGRAMA!!!")
while True:
    rawString = arduino.readline()
    valArd = rawString.decode(encoding='UTF-8')
    valArd = valArd.replace("\r\n", "")
    
    if 48 <= ord(valArd) and ord(valArd) <= 57 and len(contra) < 4:
        contra += valArd
        print(contra)
    
    if valArd == "A":
        if(valContra(contra)):
            print("Contraseña correcta")
            arduino.write('C'.encode());
            actWebCam()
            print("Continua el programa...")
        else:
            arduino.write('ACTIVAR_ALERTA'.encode());
            print("Contraseña incorrecta")
        contra = ""
    if valArd == "D":
        contra = contra[0:len(contra)-1]
        print(contra)
        
    if valArd == "C":
        contra = ""
    if valArd == "*":
        contra = ""
arduino.close() #Cerramos la comunicacion por el puerto serial, con el mismo objeto
# arduino
#--------------------------------------------------------------------------------------

