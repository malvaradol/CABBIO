# Análisis de secuencias para la descripción de diversidad y estructura genética poblacional

<p align = "justify">
Con la introducción de métodos cada vez más rápidos y baratos para la generación de grandes cantidades de secuencias de DNA de poblaciones naturales, los modelos alélicos tradicionales no siempre son la mejor alternativa para analizar dichos sets de datos. Adicionalmente, las secuencias de ADN contienen información acerca del pasado evolutivo que se perdería si simplemente se trataran diferentes secuencias como diferentes alelos. Es por esto que muchos de los avances bioinformáticos más recientes se han enfocado en buscar nuevas alternativas para poder análizar grandes cantidades de datos de forma eficiente y así poder inferir procesos evolutivos de forma más precisa a partir de esta información.

El estudio de la diversidad genetica es de gran importancia a la hora de estudiar los patrones evolutivos que han moldeado la distribución y estructura genética de las poblaciones de interés. Es por esto que este módulo se enfocará en explicar a detalle como se pueden inferir dichos patrones a partir de calculos realizados con un set de secuencias obtenido de tres especies del género _Psammolestes_.
</p>

## Prerrequisitos

- Lectura de documentos recomendados
- Computador personal
- Instalación de DnaSP (http://www.ub.edu/dnasp/), STRUCTURE (https://web.stanford.edu/group/pritchardlab/structure.html), CLUMPP (https://rosenberglab.stanford.edu/clumpp.html), distruct (https://rosenberglab.stanford.edu/distruct.html).
- En R, instalar los siguientes paquetes: 

## Lecturas recomendadas para antes de la sesión

Pueden encontrar las lecturas recomendadas en la carpeta [lecturas_recomendadas](https://github.com/malvaradol/CABBIO/tree/main/lecturas_recomendadas)

## Análisis de la diversidad genética y estructura poblacional de _Psammolestes_

<p align = "justify">
Los insectos de la subfamilia Triatominae se caracterizan por ser insectos hematófagos, lo cual hace que sean potenciales vectores de _Trypanosoma cruzi_, el agente causal de la enfermedad de Chagas. Dentro de esta subfamilia se encuentra el género _Psammolestes_, el cual está compuesto por tres especies: _Psammolestes arthuri_, _Psammolestes tertius_ y _Psammolestes coreodes_. Si bien las especies de este género no son vectores importantes en el panorama epidemiológico latinoamericano, se han registrado individuos infectados naturalmente con _T. cruzi_, por lo cual es importante estudiar estas especies a profundidad dado que se sabe muy poco de su ecología y comportamiento. Mientras que las pocas investigaciones moleculares enfocadas en este género han determinado que las tres especies no difieren en su cariotipo, existe muy poca información a nivel molecular para evaluar la separación de estas especies a nivel genómico. Es por esto que las especies del género _Psammolestes_ son comunmente diferenciadas mediante rasgos morfológicos (más detalles en el artículo incluido en las lecturas recomendadas) y no mediante aproximaciones moleculares. Por otro lado, la distribución de estas especies es bastante particular, ya que _P. arthuri_ se encuentra distribuida en los llanos orientales en Colombia y Venezuela, mientra que _P. coreodes se encuentra en la región del Chaco y parte de Brasil, mientras que _P. tertius_ se encuentra en las regiones costeras cerca al Cerrado, Caatinga y la Mata Atlántica en Brasil (Figura 1). 
</p>

![Figura 1.](https://github.com/malvaradol/CABBIO/tree/main/imagenes/fig_1.pdf)


