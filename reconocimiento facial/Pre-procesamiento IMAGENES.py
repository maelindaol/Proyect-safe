#Importacion de librerias...---------------------------------------------------
import os
from PIL import Image

clases = ['baez', 'edua', 'perro']
alto_imagen = 64
ancho_imagen = 64

#Pre-procesamiento de la imagenes (entrenamiento)...---------------------------
training_path_raw = os.path.join(os.path.dirname(__file__), 'data\\entrenamiento\\raw\\%s')
training_path_processing = os.path.join(os.path.dirname(__file__), 'data\\entrenamiento\\processing\\%s')

for clase in clases:
    archivos = os.listdir(training_path_raw%clase)
    for archivo in archivos:
        imR = Image.open((training_path_raw%clase) + '\\' + archivo)
        img = imR.resize((alto_imagen, ancho_imagen))
        gray = img.convert('L')
        gray.save((training_path_processing%clase) + '\\' + archivo, 'JPEG')

#Pre-procesamiento de la imagenes (validacion)...---------------------------
clases = ['baez', 'edua', 'perro']
training_path_raw = os.path.join(os.path.dirname(__file__), 'data\\validacion\\raw\\%s')
training_path_processing = os.path.join(os.path.dirname(__file__), 'data\\validacion\\processing\\%s')

for clase in clases:
    archivos = os.listdir(training_path_raw%clase)
    for archivo in archivos:
        imR = Image.open((training_path_raw%clase) + '\\' + archivo)
        img = imR.resize((alto_imagen, ancho_imagen))
        gray = img.convert('L')
        gray.save((training_path_processing%clase) + '\\' + archivo, 'JPEG')