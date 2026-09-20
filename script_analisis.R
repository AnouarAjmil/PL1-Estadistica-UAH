# 1. Cargar el archivo de datos
datos <- read.csv("300228-2-accidentes-trafico-detalle-csv (1).csv", sep=";", encoding="latin1")

# 2. Filtrar y separar en dos grupos (Centro y Puente de Vallecas)
centro <- subset(datos, distrito == "CENTRO")
vallecas <- subset(datos, distrito == "PUENTE DE VALLECAS")

# 3. Extraer solo el número de la hora
centro$hora_num <- as.numeric(substr(centro$hora, 1, 2))
vallecas$hora_num <- as.numeric(substr(vallecas$hora, 1, 2))

# 4. Medidas estadísticas del distrito Centro
length(centro$hora_num)
mean(centro$hora_num, na.rm=TRUE)
median(centro$hora_num, na.rm=TRUE)
sd(centro$hora_num, na.rm=TRUE)
var(centro$hora_num, na.rm=TRUE)
min(centro$hora_num, na.rm=TRUE)
max(centro$hora_num, na.rm=TRUE)
quantile(centro$hora_num, na.rm=TRUE)
IQR(centro$hora_num, na.rm=TRUE)

# 5. Medidas estadísticas de Puente de Vallecas
length(vallecas$hora_num)
mean(vallecas$hora_num, na.rm=TRUE)
median(vallecas$hora_num, na.rm=TRUE)
sd(vallecas$hora_num, na.rm=TRUE)
var(vallecas$hora_num, na.rm=TRUE)
min(vallecas$hora_num, na.rm=TRUE)
max(vallecas$hora_num, na.rm=TRUE)
quantile(vallecas$hora_num, na.rm=TRUE)
IQR(vallecas$hora_num, na.rm=TRUE)

# 6. Dibujar los diagramas
boxplot(centro$hora_num, vallecas$hora_num, 
        names=c("Centro", "Puente de Vallecas"),
        main="Hora del accidente segun el distrito",
        ylab="Hora del dia (0-23)")

hist(centro$hora_num, main="Histograma - Centro", xlab="Hora del dia", col="lightblue")
hist(vallecas$hora_num, main="Histograma - Puente de Vallecas", xlab="Hora del dia", col="lightgreen")
