#Importacion de librerias...---------------------------------------------------
from keras.models import model_from_yaml
import numpy as np
from PIL import Image
import os
alto_imagen = 64
ancho_imagen = 64
#---Cargar YAML y crear el modelo...-------------------------------------------
model_path = os.path.join(os.path.dirname(__file__), 'modelo\\eli_cnn_model.yaml')
model_weights_path = os.path.join(os.path.dirname(__file__), 'modelo\\eli_cnn_weights.h5')

yaml_file = open(model_path, 'r')
loaded_model_yaml = yaml_file.read()
yaml_file.close()
model = model_from_yaml(loaded_model_yaml)
# Cargar pesos dentro del nuevo modelo...
model.load_weights(model_weights_path)
print("Loaded model from disk")

file_test_to_predict = os.path.join(os.path.dirname(__file__), 'oscar.jpg')

px = []

file_in_gray = Image.open(file_test_to_predict).resize((alto_imagen, ancho_imagen)).convert('L')

px.append(np.array(file_in_gray))    
x = np.array(px, 'f')
x = x.reshape(x.shape[0], alto_imagen, ancho_imagen, 1)
x = x.astype('float32')
x /= 255

suma = model.predict(x, batch_size = 128, verbose = 1)
clases = ['perro', 'baez', 'edua', 'Desconocido']
index = 3
tempAcc = 0.95
for i in range(len(suma[0])):
    if tempAcc < suma[0][i]:
        index = i
        tempAcc = suma[0][i]

print('La predicción es un:' + clases[index])
