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

## Objetivo

El objetivo de esta práctica es obtener las bases necesarias para poder generar e interpretar cálculos de estadísticos descriptivos y análisis de estructura poblacional en vectores, y poder contextualizar dichos resultados en un escenario biogegráfico para entender los procesos evolutivos que pueden modificar la diversidad genética y la estructura poblacional de una población de interés.

## Análisis de la diversidad genética y estructura poblacional de _Psammolestes_

<p align = "justify">

Los insectos de la subfamilia Triatominae se caracterizan por ser insectos hematófagos, lo cual hace que sean potenciales vectores de _Trypanosoma cruzi_, el agente causal de la enfermedad de Chagas. Dentro de esta subfamilia se encuentra el género _Psammolestes_, el cual está compuesto por tres especies: _Psammolestes arthuri_, _Psammolestes tertius_ y _Psammolestes coreodes_. Si bien las especies de este género no son vectores importantes en el panorama epidemiológico latinoamericano, se han registrado individuos infectados naturalmente con _T. cruzi_, por lo cual resulta de gran relevancia estudiar estas especies a profundidad dado que se sabe muy poco de su ecología y comportamiento. Mientras que las pocas investigaciones moleculares enfocadas en este género han determinado que las tres especies no difieren en su cariotipo, existe muy poca información a nivel molecular para evaluar la separación de estas especies a nivel genómico. Es por esto que las especies del género _Psammolestes_ son comunmente diferenciadas mediante rasgos morfológicos (más detalles en el artículo incluido en las lecturas recomendadas) y no mediante aproximaciones moleculares. Por otro lado, la distribución de estas especies es bastante particular, ya que _P. arthuri_ se encuentra distribuida en los llanos orientales en Colombia y Venezuela, mientra que _P. coreodes se encuentra en la región del Chaco y parte de Brasil, mientras que _P. tertius_ se encuentra en las regiones costeras cerca al Cerrado, Caatinga y la Mata Atlántica en Brasil (Figura 1). 
</p>

![Figura 1.](https://raw.githubusercontent.com/malvaradol/CABBIO/main/imagenes/fig_1.png)

<p align = "justify">

Teniendo en cuenta el contexto biogeográfico de las especies del género _Psammolestes_, vamos a describir la diversidad y la estructura genética de las poblaciones muestreadas para evaluar las diferencias a nivel molecular entre las especies e identificar posibles patrones evolutivos que puedan estar causando las diferencias en la diversidad y estructura, si las hay.

> Tip: Es importante empezar a pensar en diferentes hipótesis teniendo en cuenta la historia geográfica de la zona de interés, en este ejemplo, hay una clara separación entre una especie de _Psammolestes_ respecto a las otras dos. La historia geográfica de la zona ha dado origen a diferentes hipótesis para explicar la diversidad en los trópicos, entre las cuales se encuentra la hipótesis del arco del pleistoceno, estas hipótesis nos permitirán evaluar como los diferentes eventos biogeográficos han moldeado la diversidad y estructura de nuestra población de interés.

<p>

### Análisis de la diversidad genética

<p align = "justify">

En esta primera parte, analizaremos los alineamientos de siete marcadores moleculares diferentes (los detalles de los marcadores los pueden encontrar en el artículo) obtenidos de individuos de las tres especies de _Psammolestes_ para verificar que los datos están listos para los análisis posteriores.


1. **Cargar y visualizar los alineamientos**: Es importante verificar que todas las secuencias estén correctamente alineadas y que se pueda reducir al máximo los espacios o gaps que se puedan identificar como errores de secuenciación. Aquí pueden usar su programa de preferencia. Exporten sus alineamientos en formato FASTA para más fácilidad en los pasos posteriores.

2. **Abrir DnaSP y cargar datos**: Una vez hemos rectificado los alineamientos, procederemos a ejecutar DnaSP. En este programa realizaremos todos los calculos de los estadísticos que vamos a analizar posteriormente. Es importante mencionar que todos los pasos se deben hacer para cada marcador de manera individual, por lo que toma un buen tiempo.

    - Si sus alineamientos tienen ambigüedades: **File - Open Unphase/Genotype Data File - Number of iterations (1000) - Run**. Luego de "phasear" sus alineamientos, se creará un nuevo archivo fasta en el cual se duplicarán todas las secuencias sin importar si tenían ambigüedades o no. Deben eliminar los archivos duplicados de las secuencias que **NO** tengan ambigüedades y así ya tendrán listo el archivo.
    - Si sus alinieamientos no tienen ambigüedades: **File - Open Data File**. Al no tener ambigüedades DnaSP no arrojará ningún mensaje de error y podremos seguir con el siguiente paso.

3. **Modificar el formato de nuestros datos**: DnaSP por defecto carga todos los marcadores como autosomales de DNA y diploides (importante tener en cuenta la biología del organismo del cual se extrae la información), por lo que en caso de ser necesario se debe ajustar cualquiera de estos tres valores en dependencia de nuestro organismo de estudio. En este caso, dicha modificación solo se debe realizar una vez y es con el marcador CYTB, ya que este es mitocondrial mientras que el resto son nucleares (autosomales).

    - Para esto: **Data - Format**. En "format" encontrarán un cuadro con todas las opciones disponibles.

4. **Definir sets de secuencias**: En nuestro contexto, ya tenemos claro que en cada marcador encontraremos secuencias de cada una de las especies de _Psammolestes_, sin embargo para el programa no lo es, por lo que tendremos que especificarle las agrupaciones de las secuencias por especie para poder obtener nuestros calculos de diversidad para cada una de estas.

    - Para definir las agrupaciones: **Data - Define Sequence Sets**. A la izquierda encontrarán una lista de todas las secuencias que hay en su alineamiento, por lo que deben seleccionar todas las secuencias que correspondan primero a _P. arthuri_ y utilizar el botón **">>"** que se encuentra en medio del cuadro de dialogo. Una vez seleccionadas todas las secuencias de _P. arthuri_, oprimir "Add new sequence Set" y nombrar la agrupación de acuerdo al nombre de la especie. Repetir para las otras dos especies.

    - Una vez definan los tres sets de especies, el siguiente paso será exportar el archivo en formato Nexus. Este formato ya tendrá especificado las particiones que definimos para que en caso de que sea necesario realizar alguna corrección, no se deba repetir el proceso completamente. Para esto: **File - Save / Export Data as - NEXUS file format**.

5. **Calculos de los estadísticos de diversidad genética**: El siguiente paso es entonces obtener los primeros cálculos de diversidad genética.

    - Para esto, carguen el archivo en formato NEXUS que guardamos en el númeral anterior y vayan a: **Analysis - DNA Polymorphism**. Se abrirá un nuevo cuadro de dialogo con diferentes opciones, por lo que primero se debe seleccionar el dataset al cual se le realizarán los cálculos, para esto seleccione cualquiera de las tres especies del menú desplegable. Luego, en la seccion "Options" seleccione "Compute Variance of Pi" y "Compute Pi", finalmente presione OK.

    - Se abrirá un nuevo cuadro de diálogo con los resultados, compare los resultados con la tabla 2 del artículo de _Psammolestes_. Los resultados de interés corresponden a la primera linea de cada párrafo, también es clave el número de sitios segregantes y el número de haplotipos.

Idealmente, tal como se mencionó antes, este proceso se debe repetir para cada marcador y los resultados se deben registrar en una tabla como la tabla 2 del artículo de referencia, es un proceso largo y repetitivo pero posteriormente nos permitirá inferir diferentes procesos evolutivos que puedan estar ocurriendo en nuestras poblaciones.

![Tabla 2.](https://raw.githubusercontent.com/malvaradol/CABBIO/main/imagenes/tabla_2.png)

6. **Cálculo de estadísticos adicionales**: Existen otros estadísticos que fueron creados para detectar señales evolutivas y son mucho más sensibles que los estadísticos tradicionales que calculamos en el punto anterior. En este caso calcularemos la **D de Tajima**, el **R2 de Ramos-Onsins y Rozas** y la **F y la D de Fu y Li**, y los resultados obtenidos serán registrados en la tabla creada en el punto anterior.

    - Para calcular la D de Tajima: **Analysis - Tajima's Test** y luego en el nuevo cuadro de dialogo seleccionar la especie a analizar. Repetir para las tres especies.
    - Para calcular el R2 de Ramos-Onsins y Rozas: **Analysis - Population Size Changes** y seleccionar una especie en el menú desplegable. Repetir para las tres especies.
    - Para calcular la F y la D de Fu y Li: **Analysis - Fu and Li's (and other) tests** y seleccionar una especie en el menú desplegable. Repetir para las tres especies.

</p>

### Análisis de estructura genética

Ahora procederemos a realizar los análisis de estructura genética, para esto llevaremos a cabo dos análisis: un análisis de estructura utilizando el algoritmo STRUCTURE y otro análisis utilizando un test de barrera en R.

#### STRUCTURE

<p align = "justify">

La preparación del archivo input de STURCTURE es larga y tediosa, inicialmente se debe concatenar los siete marcadores asegurandose que en los marcadores donde una secuencia no tenga información, esta esté completa con gaps (- o N). Posteriormente, se debe "phasear" el archivo como en el punto 2 de los análisis de diversidad genética, asegurandose de eliminar las secuencias duplicadas sin ambigüedades, y posteriormente transformando el archivo de formato fasta a formato STRUCTURE utilizando la herramienta [PGDSpider](http://www.cmpg.unibe.ch/software/PGDSpider/). Por cuestiones de tiempo, el archivo final está en la carpeta [archivos_curso]() y lo siguiente será correr STRUCTURE.

1. El primer paso entonces será abrir STRUCTURE y crear un nuevo proyecto en **File - New Project** y asignar un nuevo nombre para el proyecto (e.g. structure_psammolestes), seleccionar un directorio donde se almacenarán nuestros resultados, y finalmente seleccionar el input para el programa.

2. El segundo paso será introducir el número de individuos que en este caso es 92, la ploidia de los datos (diploides), el número de loci (7) y el valor a los datos faltantes, que en este caso es -9.

3. Luego, debemos seleccionar los indicadores que incluimos en nuestro input. Las primeras tres columnas de dicho archivo contienen valores especiales que reflejan la especie (1, 2 y 3), si se usará la secuencia o no (0 o 1, en este caso todas tienen 1) y el lugar de recolección (número a discreción de cada uno). Es importante mencionar que el cuadro de dialogo titulado "Step 3 of 4" se debe saltar ya que no incluimos ningun tipo de información adicional indicada en ese cuadro, por lo que saltaremos al "Step 4 of 4". En este cuadro marcaremos las 4 primeras opciones **Individual ID - Putative population... - USEPOPINFO... - Sampling location information** y presionaremos finalizar. Esto le dirá al programa el formato de nuestros datos.

4. Una vez identificado el formato de los datos, crearemos un nuevo archivo de parametros que el programa tendrá en cuenta para la corrida. Para esto seleccionaremos **Parameter Set - New...**. En el primer cuadro de dialogo, el valor del burnin y del número de repeticiones después del burnin dependerá de la cantidad de datos que tengamos, entre más datos mayor tendrá que ser el valor del burnin y de las repeticiones posteriores para que el modelo pueda realizar una estimación más certera. Inicialmente le pondremos 100.000 a ambos valores.

5. Nos moveremos a la pestaña de "Ancestry model" y seleccionaremos la casilla **Use sampling locations as prior (LOCPRIOR)**.

6. Finalmente seleccionaremos la pestaña **"Advanced"** y marcaremos las casillas de **"Update allele frequencies using only individuals..."** y la casilla **"Initialize at POPINFO"** dejando el valor de la frecuencia de metropolis como el predeterminado. Finalmente presionamos OK y nombramos el set de parametros que se guardará dentro de la carpeta del proyecto.

7. Una vez configurado el archivo de parametros y guardado el proyecto, ya se puede poner a correr desde **"Project - Start a Job"**. Se abrirá una nueva pestaña donde indicaremos el proyecto a correr y le daremos un rango de números de K que el modelo evaluará para encontrar el K que mejor explique la estructura genética. En nuestro caso correremos el programa de 2 a 10 K. El tiempo de corrida depende del número de burnin y de corridas posteriores que le especificamos en los parámetros.

8. Una vez terminada la corrida, iremos a la carpeta del proyecto y comprimiremos la carpeta "Results" en formato .zip. Luego iremos a la página de [STRUCTURE harvester](https://taylor0.biology.ucla.edu/structureHarvester/), aqui cargaremos la carpeta comprimida y procederemos a analizar los resultados.

9. Dentro del output de STRUCTURE harvester, la página nos ofrece una sección llamada Clumpp files de la cual descargaremos los archivos .indfile y .popfile correspondientes a K = 3. Posteriormente abriremos 

</p>