#Teste para SOM em Dorks
install.packages("kohonen")
install.packages("som")
install.packages("viridis")

library(kohonen)
library(viridis)

#Data
data <- read.csv(file.choose(),header = FALSE, sep = ";", check.names = FALSE)

#Elimina-se o Cabeçalho na Variável para Aplicar a SOM
x <- scale(data[,])

#Visualização
str(x)

#Aplicação da SOM
set.seed(250)

#Caracterização da SOM
dimension = somgrid(15, 15, "hexagonal")

#Execução da SOM
map <- som(x, grid = dimension, alpha = 0.5)

plot(map, type = 'changes')
plot(map, type = 'codes')
plot(map, type = 'counts')
plot(map, type = 'dist.neighbours')
plot(map, type = 'mapping')


# Kohonen Heatmap creation
plot(map, type = "property", 
     property = getCodes(map)[,4], 
     main=colnames(getCodes(map))[4], 
     palette.name=viridis)

#Erro da SOM
mean(map$distances)

#Biblioteca Gráfica para Aplicação da SOM
sombreroGUI()