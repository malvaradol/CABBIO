#libraries
library(adegenet)
library(ape)

# Cargar el alineamiento
dna<-read.dna("concatenado_completo_VFinal_barrier.fas",format="fasta")
gen<-DNAbin2genind(dna)

#Cargar las coordenadas y las asignaciones por población.
coords<-read.csv("coords_concatenado.csv",head=T)

#Graficar los puntos
coords$x<-jitter(coords$x,factor=1,amount=0.1)
coords$y<-jitter(coords$y,factor=1,amount=0.1)

#Añadir las coordenadas y las asignaciones por población al objeto genind de la linea 7
gen$other$xy<-coords[,2:3]
gen$pop<-as.factor(coords[,4])

#Establecer el fondo de la gráfica
gab<-chooseCN(gen$other$xy,ask=F,type=1)

#Calcular las distancias genéticas
D<-dist(gen$tab)

#Calculo del algoritmo de monmonier (linea puntuada en la gráfica indica el valor del limite que pide la consola)
mon1 <- monmonier(gen$other$xy,D,gab)

#Graficar
plot(mon1,add.arrows=FALSE,bwd=10,col="black")
points(gen$other$xy, cex=2, pch=20,col=fac2col(pop(gen), col.pal=spectral))
legend("bottomleft",leg=c("Psammolestes arthuri", "Psammolestes tertius", "Psammolestes coreodes"),pch=c(20),col=spectral(3), pt.cex=2)
