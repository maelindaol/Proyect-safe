#Importacion de librerias...---------------------------------------------------
from keras.models import Sequential
from keras.layers.core import Dense, Dropout, Flatten
from keras.layers import Conv2D, MaxPooling2D
from keras.utils import np_utils
from keras.optimizers import Adam
import numpy as np
import os
from PIL import Image
from functools import reduce

clases = ['baez', 'edua', 'perro']
alto_imagen = 64
ancho_imagen = 64
#Procesamiento de la imagenes (entrenamiento)...---------------------------
muestras_por_clases = []
training_path_raw = os.path.join(os.path.dirname(__file__), 'data\\entrenamiento\\raw\\%s')
training_path_processing = os.path.join(os.path.dirname(__file__), 'data\\entrenamiento\\processing\\%s')

array_of_iamges = []
for clase in clases:
    archivos = os.listdir(training_path_processing%clase)
    muestras_por_clases.append(len(archivos))
    for archivo in archivos:
        temp = np.array(Image.open((training_path_processing%clase) + '\\' + archivo))
        array_of_iamges.append(temp)

X_train = np.array(array_of_iamges, 'f')
X_train = X_train.reshape(X_train.shape[0], alto_imagen, ancho_imagen, 1)
X_train = X_train.astype('float32')
X_train /= 255

etiquetas = np.ones(reduce(lambda acc, cval: acc + cval, muestras_por_clases), dtype=int)
li_var_aux = 0
for index in range(len(muestras_por_clases)):
    muestras_por_clase = muestras_por_clases[index] 
    etiquetas[li_var_aux : li_var_aux + muestras_por_clase] = index
    li_var_aux += muestras_por_clase

Y_train = np_utils.to_categorical(etiquetas, len(clases))

#Pre-procesamiento de la imagenes (validacion)...---------------------------
muestras_por_clases = []
test_path_raw = os.path.join(os.path.dirname(__file__), 'data\\validacion\\raw\\%s')
test_path_processing = os.path.join(os.path.dirname(__file__), 'data\\validacion\\processing\\%s')

array_of_iamges = []
for clase in clases:
    archivos = os.listdir(test_path_processing%clase)
    muestras_por_clases.append(len(archivos))
    for archivo in archivos:
        temp = np.array(Image.open((test_path_processing%clase) + '\\' + archivo))
        array_of_iamges.append(temp)

X_test = np.array(array_of_iamges, 'f')
X_test = X_test.reshape(X_test.shape[0], alto_imagen,ancho_imagen, 1)
X_test = X_test.astype('float32')
X_test /= 255

etiquetas = np.ones(reduce(lambda acc, cval: acc + cval, muestras_por_clases), dtype=int)
li_var_aux = 0
for index in range(len(muestras_por_clases)):
    muestras_por_clase = muestras_por_clases[index] 
    etiquetas[li_var_aux : li_var_aux + muestras_por_clase] = index
    li_var_aux += muestras_por_clase

Y_test = np_utils.to_categorical(etiquetas, len(clases))

#Creacion de la red neuronal...------------------------------------------------

model = Sequential()
model.add(Conv2D(32, (3, 3), padding='same', input_shape=(alto_imagen, ancho_imagen, 1), activation='relu'))
model.add(MaxPooling2D(pool_size=(2, 2)))
model.add(Conv2D(64, (2, 2),padding='same',activation='relu'))
model.add(MaxPooling2D(pool_size=(2, 2)))

model.add(Flatten())
model.add(Dense(256,activation='relu'))
model.add(Dropout(0.5))
model.add(Dense(len(clases),activation='softmax'))

model.compile(loss='categorical_crossentropy',optimizer=Adam(learning_rate=0.005, amsgrad=True),metrics=['accuracy'])


'''
model = Sequential()
model.add(Conv2D(128, (2, 2), activation='relu', input_shape = (64, 64, 1)))

model.add(Conv2D(32, (3, 3), activation = 'relu'))
model.add(Conv2D(32, (3, 3), activation = 'relu'))
model.add(Conv2D(32, (3, 3), activation = 'relu'))
model.add(Conv2D(32, (3, 3), activation = 'relu'))

model.add(MaxPooling2D(pool_size = (2,2)))
model.add(Dropout(0.25))

model.add(Flatten())
model.add(Dense(128, activation = 'relu'))

model.add(Dense(32, activation = 'relu'))
model.add(Dense(32, activation = 'relu'))
model.add(Dense(32, activation = 'relu'))

model.add(Dropout(0.5))
model.add(Dense(len(clases), activation = 'softmax'))

sgd = optimizers.SGD(lr=0.01, momentum=0.9, decay=0.0005, nesterov = True)

model.compile(loss = 'categorical_crossentropy',
             optimizer = sgd,
             metrics = ['accuracy'])
'''


#Entrenamiento del modelo...---------------------------------------------------
model.fit(X_train, Y_train, batch_size = 128, epochs = 64, verbose = 1)
#Evaluacion del aprendizaje y el model en general
score = model.evaluate(X_test, Y_test, verbose=0)
print(score)


#---Alamacenar Modelo...-------------------------------------------------------
model_path = os.path.join(os.path.dirname(__file__), 'modelo\\eli_cnn_model.yaml')
model_weights_path = os.path.join(os.path.dirname(__file__), 'modelo\\eli_cnn_weights.h5')
# Serializar el modelo a YAML
model_yaml = model.to_yaml()
with open(model_path, "w") as yaml_file:
    yaml_file.write(model_yaml)
# Serializar los pesos a HDF5
model.save_weights(model_weights_path)
print("Modelo y pesos de la red neuronal, guardados en disco <3!!!")