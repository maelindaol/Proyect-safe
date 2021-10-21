
#Importacion de librerias...---------------------------------------------------
from keras.models import Sequential
from keras.layers.core import Dense, Dropout, Activation, Flatten
from keras.layers import Conv2D, MaxPooling2D, AveragePooling2D, GlobalAveragePooling2D
from keras.optimizers import SGD,RMSprop,adam
from keras.utils import np_utils
from keras import optimizers, initializers
from keras.layers.normalization import BatchNormalization
import numpy as np
import matplotlib.pyplot as plt
import os
from PIL import Image
from sklearn.utils import shuffle
from keras import backend as K
K.set_image_dim_ordering('tf')

#Pre-procesamiento de la imagenes (entrenamiento)...---------------------------
path1 = 'C:\SP Project\Training Data\RAW'
path2 = 'C:\SP Project\Training Data\PROCESSING'

listing = os.listdir(path1) 
num_muestras = len(listing)

for archivo in listing:
    imR = Image.open(path1 + '\\' + archivo)   
    img = imR.resize((64, 64))
    gray = img.convert('L')
    gray.save(path2 +'\\' +  archivo, "JPEG")
    
x = []
listing2 = os.listdir(path2)
for i in range(len(listing2)):
    temp = np.array(Image.open(path2 + '\\' + listing2[i]))
    x.append(temp)
    
X_train = np.array(x, 'f')

X_train = X_train.reshape(X_train.shape[0], 64, 64, 1)

X_train = X_train.astype('float32')

X_train /= 255

label=np.ones((num_muestras,),dtype = int)

num_clases = 4
npc = 30
for i in range(num_clases):
    label[npc*i : npc*(i + 1)] = i

Y_train = np_utils.to_categorical(label, num_clases)

#Pre-procesamiento de la imagenes (entrenamiento)...---------------------------
path1 = 'C:\SP Project\Testing Data\RAW'
path2 = 'C:\SP Project\Testing Data\PROCESSING'

listing = os.listdir(path1) 
num_muestras = len(listing)

for archivo in listing:
    imR = Image.open(path1 + '\\' + archivo)
    img = imR.resize((64, 64))
    gray = img.convert('L')
    gray.save(path2 +'\\' +  archivo, "JPEG")
    
x = []
listing2 = os.listdir(path2)
for i in range(len(listing2)):
    temp = np.array(Image.open(path2 + '\\' + listing2[i]))
    x.append(temp)
    
X_test = np.array(x, 'f')

X_test = X_test.reshape(X_test.shape[0], 64, 64, 1)

X_test = X_test.astype('float32')

X_test /= 255

label=np.ones((num_muestras,),dtype = int)

num_clases = 4
npc = 10
for i in range(num_clases):
    label[npc*i : npc*(i + 1)] = i
    
Y_test = np_utils.to_categorical(label, num_clases)

#Blanco y negro
i = 90
plt.imshow(X_train[i,:,:,0], interpolation='nearest')
print("label : ", Y_train[i,:])

#Color
i = 29
plt.imshow(X_train[i], interpolation='nearest')
print("label : ", Y_train[i])
#Creacion de la red neuronal...------------------------------------------------

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
model.add(Dense(4, activation = 'softmax'))

sgd = optimizers.SGD(lr=0.01, momentum=0.9, decay=0.0005, nesterov = True)

model.compile(loss = 'categorical_crossentropy',
             optimizer = sgd,
             metrics = ['accuracy'])



#Entrenamiento del modelo...---------------------------------------------------
model.fit(X_train, Y_train, batch_size = 128, epochs = 64, verbose = 1)
#Evaluacion del aprendizaje y el model en general
score = model.evaluate(X_test, Y_test, verbose=0)
print(score)


#---Salvar/Cargar el Modelo..-------------------------------------------------
#Importar librerias necesarias...
from keras.models import model_from_yaml

#---Alamacenar Modelo...-------------------------------------------------------
# Serializar el modelo a YAML
model_yaml = model.to_yaml()
with open("C:/Users/JoseSantiago/Documents/tecnologico_guias/Semestre 7/Sistemas programables/Proyecto de S.P/MiArquitectura.yaml", "w") as yaml_file:
    yaml_file.write(model_yaml)
# Serializar los pesos a HDF5
model.save_weights("C:/Users/JoseSantiago/Documents/tecnologico_guias/Semestre 7/Sistemas programables/Proyecto de S.P/MiArquitectura.h5")
print("Saved model to disk")


#---Cargar YAML y crear el modelo...-------------------------------------------
yaml_file = open('C:/Users/JoseSantiago/Documents/tecnologico_guias/Semestre 7/Sistemas programables/Proyecto de S.P/MiArquitectura.yaml', 'r')
loaded_model_yaml = yaml_file.read()
yaml_file.close()
model = model_from_yaml(loaded_model_yaml)
# Cargar pesos dentro del nuevo modelo...
model.load_weights("C:/Users/JoseSantiago/Documents/tecnologico_guias/Semestre 7/Sistemas programables/Proyecto de S.P/MiArquitectura.h5")
print("Loaded model from disk")

px = []

px.append(np.array(Image.open("C:\SP Project\TEMP\WIN_20171028_123257(faces).JPG").resize((224, 224))))    

x = np.array(px, 'f')

x = x.reshape(x.shape[0], 224, 224, 3)

x = x.astype('float32')

x /= 255


suma = model.predict(x, batch_size = 128, verbose = 1)

suma
temp = 0
for i in suma[0]:
    temp += i

print(temp)