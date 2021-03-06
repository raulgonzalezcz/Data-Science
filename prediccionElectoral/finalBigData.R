# -------------------------------------------------------------------------
# ---------- ELECTION PREDICTION ---------- BIG DATA ----------------------
# -------------------------------------------------------------------------

# Data source: http://oraculus.mx/poll-of-polls/

# ----------- DATA VISUALIZATION ------------------------------------------

library(ggplot2)
#setwd("C:/Users/itzy/Desktop/Big Data/finalBigData")
encuestas <- read.csv("encuestas.csv")
dim(encuestas)
head(encuestas)

candidatos <- unique(encuestas$�..candidato)
candidatos
select <- encuestas[encuestas$�..candidato %in% candidatos, ]
select

# Grafica porcentaje de votos (encuestas) por a�os dependiendo del candidato 
theme_set(theme_classic())

g <- ggplot(select, aes(x=encuestas$fecha, y=encuestas$porcentaje)) + 
  labs(subtitle="", title="Resultados Encuestas (peri�dicos) para Elecciones 2018") +
  labs(x = "Fecha de encuesta", y = "Porcentaje (%)") + theme(axis.text.x = element_text(angle = 90, hjust = 1))

g + geom_jitter(aes(col=�..candidato, size=porcentaje)) + 
  geom_smooth(aes(col=encuestas$�..candidato), method="lm", se=F) +
  labs(x = "Fecha de encuesta",y = "Porcentaje (%)", color = "Candidato\n")

gridEncuestas <- ggplot(encuestas, aes(x = encuestas$fecha, y = encuestas$porcentaje, colour=encuestas$�..candidato)) + 
  geom_point() + facet_grid(~ encuestas$�..candidato) + 
  labs(x = "Fecha de encuesta", y = "Porcentaje (%)", color = "Candidato\n") +
  theme(axis.text.x = element_text(angle=90, vjust=0.6)) 
gridEncuestas

#We have the interest to analyze, for example, AMLO data
amloData <- select[select$�..candidato == "AMLO",]
amloData
#Number of polls related to AMLO
nrow(amloData)
#We predict the next values for AMLO
prefAMLO <- data.frame(encuestas=1:nrow(amloData), porcentaje=amloData$porcentaje)
prefAMLO

ggplot(prefAMLO, aes(x=encuestas, y=porcentaje)) + 
  labs(subtitle="", title="Predicci�n de preferencia para AMLO en las pr�ximas 5 encuestas", x = "N�mero de encuesta", y = "Porcentaje (%)") +
  geom_point(color='blue') + 
  geom_smooth(method="lm", fullrange=T, color='darkblue') + 
  xlim(1, nrow(amloData) + 5)

#Linear regression using all data
select
#Current data per candidate
ggplot(select, aes(x=fecha, y=porcentaje, group=�..candidato)) + 
  labs(subtitle="", title="Datos al momento de preferencia por cada candidato", x = "Fecha de encuesta", y = "Porcentaje (%)", color = "Candidato\n") +
  stat_smooth(aes(col=�..candidato)) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) 

#We modify the column "data" in order to predict the next values
select$fecha
#Regular expresion to substitute "."
select$fechaT <- gsub("[.]", "-", select$fecha)
select$fechaT

ggplot(select, aes(x=as.Date(fechaT), y=porcentaje, group=�..candidato)) + 
  labs(subtitle="Periodo previo a las elecciones", title="Predicci�n de preferencia por cada candidato", x = "Periodo de encuesta", y = "Porcentaje (%)", color = "Candidato\n") +
  stat_smooth(aes(col=�..candidato), method="lm",fullrange=TRUE) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme_bw() +
  xlim(as.Date("2017-12-18"), as.Date("2018-06-29"))

#Prediction after "Primer debate"
select$fecha
#Regular expresion to substitute "."
select$fechaT <- gsub("[.]", "-", select$fecha)
select$fechaT
afterDebate <- select[select$fechaT < as.Date("2018-04-22"),]
ggplot(afterDebate, aes(x=fecha, y=porcentaje, group=�..candidato)) + 
  labs(subtitle="", title="Datos antes del debate por cada candidato", x = "Fecha de encuesta", y = "Porcentaje (%)", color = "Candidato\n") +
  stat_smooth(aes(col=�..candidato)) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) 

ggplot(afterDebate, aes(x=as.Date(fechaT), y=porcentaje, group=�..candidato)) + 
  labs(subtitle="", title="Predicci�n de preferencia por cada candidato antes del debate", x = "Periodo de encuesta", y = "Porcentaje (%)", color = "Candidato\n") +
  stat_smooth(aes(col=�..candidato), method="lm",fullrange=TRUE) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme_bw() +
  xlim(as.Date("2017-12-18"), as.Date("2018-06-29"))
