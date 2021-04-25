.. role:: underline
    :class: underline

Descripción
=========================

Recordemos inicializar GAP de la siguiente manera:

.. code-block:: gap

    ┌───────┐   GAP 4.10.2 of 19-Jun-2019
    │  GAP  │   https://www.gap-system.org
    └───────┘   Architecture: i686-pc-cygwin-default32-kv3
    Configuration:  gmp 6.1.2, readline
    Loading the library and packages ...
    Packages: AClib 1.3.1, Alnuth 3.1.1, AtlasRep 2.1.0, AutoDoc 2019.05.20, AutPGrp 1.10, Browse 1.8.8,
             CRISP 1.4.4, Cryst 4.1.19, CrystCat 1.1.9, CTblLib 1.2.2, FactInt 1.6.2, FGA 1.4.0,
             Forms 1.2.5, GAPDoc 1.6.2, genss 1.6.5, IO 4.6.0, IRREDSOL 1.4, LAGUNA 3.9.3, orb 4.8.2,
             Polenta 1.3.8, Polycyclic 2.14, PrimGrp 3.3.2, RadiRoot 2.8, recog 1.3.2, ResClasses 4.7.2,
             SmallGrp 1.3, Sophus 1.24, SpinSym 1.5.1, TomLib 1.2.8, TransGrp 2.0.4, utils 0.63
    Try '??help' for help. See also '?copyright', '?cite' and '?authors'
    gap> LoadPackage( "GBNP" );
    ─────────────────────────────────────────────────────────────────────────────────────────────────────
    Loading  GBNP 1.0.3 (Non-commutative Gröbner bases)
    by A.M. Cohen (http://www.win.tue.nl/~amc) and
    J.W. Knopper (J.W.Knopper@tue.nl).
    Homepage: http://mathdox.org/products/gbnp/
    ─────────────────────────────────────────────────────────────────────────────────────────────────────
    true
    gap>

Polinomios no conmutativos (NPs)
-------------------------------------

El tipo de datos principal del ``paquete GBNP`` es una lista de polinomios no conmutativos (NP). El tipo de datos de un polinomio no conmutativo, denominado formato ``NP``, es una lista de dos listas:

    - La primera lista es una lista ``m`` de monomios.
    - La segunda lista es una lista ``c`` de coeficientes de estos monomios.

Las dos listas tienen la misma longitud. El polinomio representado por el par ordenado ``[ m, c ]`` es

.. math::
    
    \displaystyle\sum_{i}c_im_i.

Un monomio es una lista de números enteros positivos. Se interpretan como los índices de las variables. Entonces, si ``k = [ 1,2,3,2,1 ]`` y las variables son ``x``, ``y``, ``z`` (en este orden), entonces ``k`` representa el monomio ``xyzyx``.

.. note::
    
    El nombre de las variables no tiene ningún significado. Hay varias formas de imprimirlas, pero la predeterminada es :math:`a`, :math:`b`, :math:`c`, :math:`\dots` (ver más abajo).

.. important::
    
    - El polinomio cero o nulo está representado por ``[ [ ], [ ] ]``.
    - El polinomio :math:`1` está representado por ``[ [ [ ] ], [ 1 ] ]``.

Los algoritmos funcionan para el álgebra :math:`\mathbb{F} \langle\langle x_{1}, x_{2},\dots, x_{t} \rangle\rangle` de polinomios no conmutativos en :math:`t` variables sobre el campo :math:`\mathbb{F}`. En consecuencia, la lista ``c`` debe contener elementos de :math:`\mathbb{F}`. No siempre es fácil recuperar :math:`\mathbb{F}` de la lista ``C``. Las funciones ``One`` y ``Zero`` de **GAP** pueden ser de alguna ayuda.

Para facilitar la visualización de los polinomios, proporcionamos la función ``PrintNP``. Por ejemplo

.. code-block:: gap
    :caption: función PrintNP
    :name: funcion_PrintNP

    gap> PrintNP([ [[1,2],[2,1]],[3,-1] ]);
    3ab - ba

De hecho, tenemos los nombres: :math:`a`, :math:`b`, :math:`c`, :math:`\dots` para :math:`x_1`, :math:`x_2`, :math:`x_3`, :math:`\dots`, excepto que todo lo que está más allá de ``l`` (la ``12ª`` letra) se llama :math:`x`. Esto se puede cambiar fácilmente llamando a la función ``GBNP.ConfigPrint``, que se puede encontrar en la ``Sección 3.2`` (**cambiar el número de esta sección**).

La función ``PrintNPList`` está disponible para imprimir una lista de ``NP`` (= polinomios no conmutativos).

Para facilitar la prueba de si dos estructuras de datos representan el mismo ``NP``, usamos la convención de que los polinomios son "limpios". Esto significa que parece que son una salida de la función ``CleanNP``. En otras palabras:

    - cada monomio aparece como máximo una vez en la lista de monomios,
    - no se producen monomios cuyos coeficientes sean cero,
    - Los monomios están ordenados (primero el grado total, luego lexicográficamente) de mayor a menor.

Una ventaja del ordenamiento es que el monomio principal de un ``NP``, ``p`` es solo ``p[1][1]`` y su coeficiente principal es ``p[2][1]``. Los usuarios que quieran trabajar con otros pedidos pueden utilizar las funciones definidas en la extensión ``NMO`` `[aquí] <http://www.mathdox.org/grobner/nmo/manual.pdf>`_ de ``GBNP``.

Polynomios No Conmutativos para Modulos (NPMs)
----------------------------------------------------

En la ``Sección 2.1`` se describe el formato NP para elementos de un álgebra libre :math:`A` de polinomios no conmutativos en un número fijo de variables. Este formato se puede ajustar ligeramente para permitir el uso de un módulo de derecho libre :math:`A^{n}` de rango finito :math:`n` sobre :math:`A`. El formato interno de un elemento del módulo es similar al de un polinomio no conmutativo. El único cambio es que cada monomio comenzará con un número negativo. El valor absoluto de este número es el índice del vector base estándar del módulo libre.

Por ejemplo, en el módulo libre :math:`\mathbb{F} \langle\langle x_{1}, x_{2},\dots, x_{t} \rangle\rangle` de rango :math:`3`, la expresión ``[ [ [ -1 ] ], [ 1 ] ]`` representa ``[1, 0, 0]`` y ``[ [ [-1, 1, 2 ], [ -1, 2, 1 ], [ - 3, 2, 2, 2 ] ], [ 6, -7, 9 ] ]`` representa :math:`[6x_{1}x_{2} - 7x_{2}x_{1}, 0, 9x_{2}^{3}]`. El vector cero se representa de la misma manera que su contraparte en formato ``NP`` en la ``Sección 2.1`` y es el único sin una entrada negativa: ``[ [ ], [ ] ]``. Nos referimos a este formato como formato ``NPM``.

Los elementos de los módulos se imprimen como vectores. Consulte la ``Sección 3.9`` sobre cómo utilizar los módulos. También se recomiendan los ejemplos ``A.19,`` ``A.21`` y ``A.20``.

Funciones Principales
-------------------------------------

:underline:`La función principal` es ``SGrobner (3.4.2)`` (que es la abreviatura de ``Strong Gröbner``, ya que usamos la **Forma Normal Fuerte**, discutida en la ``Sección StrongNormalFormNPM (3.9.5)``, la mayor parte del tiempo). Toma una lista de ``NP`` en un álgebra libre :math:`A` y prepara dos listas para su tratamiento en un ciclo:

    - Primero la lista en sí, llamada :math:`G`. Antes de ingresar al ciclo, :math:`G` se limpia, ordena y sus elementos se hacen mónicos, es decir, se multiplican por un escalar para que el coeficiente principal se convierta en uno. El pedido se realiza mediante la comparación de los principales monomios. El orden de los principales monomios es lexicográfico de longitud. Para otros pedidos, se pueden utilizar las funciones de la extensión ``NMO``; ver ``[5]``.

    - En segundo lugar, la lista de todas las formas normales con respecto a :math:`G` de :math:`S`-polinomios de elementos de :math:`G`. Esta lista se llama :math:`D`. Para una base de Gröbner, los :math:`S`-polinomios de polinomios en :math:`D` (posiblemente con un elemento de :math:`G`) deben ser calculado. Si :math:`D` está vacío, :math:`G` es una base de Gröbner.


Luego, la función llama a la rutina ``GBNP.SGrobnerLoop`` en los argumentos ``G``, ``D`` que se cambian en un intento de modificar ``G`` conservando las siguientes dos propiedades.

    1. ``G`` genera el mismo ideal bilateral :math:`I` en :math:`A` que antes.
    2. ``D`` contiene todas las formas normales con respecto a ``G`` de :math:`S`-polinomios de elementos de ``G`` que necesitan reducirse a cero para que la base sea una **base de Gröbner**.

La importancia de esta característica es que, en caso de grandes cálculos, el usuario puede almacenar ``G`` y ``D`` en casi cualquier momento y reanudar el cálculo recargando ``G`` y ``D`` y llamando a la función de bucle ``GBNP.SGrobnerLoop`` cuando sea conveniente. El único detalle técnico que se debe manejar es que el último elemento de la lista ``G`` debe copiarse en la lista ``D``. El bucle en sí da un paso para hacer que ``G`` se parezca más a una **base de Gröbner** de :math:`I`. Como en el caso conmutativo, el progreso se puede indicar mediante el uso de un orden en el conjunto de monomios principales de los elementos de ``G``.

Sin embargo, a diferencia del caso conmutativo, este ordenamiento no está bien fundado y no hay garantía a priori de que se saldrá del bucle después de un número finito de iteraciones. El ciclo termina cuando la lista ``D`` está vacía, en cuyo caso el trabajo está esencialmente hecho: después de una limpieza interna y un poco de reescritura adicional, el cálculo termina.

En muchas de nuestras propias aplicaciones, el módulo de anillo polinomial completo, el ideal de dos lados I generado por ``G`` es un álgebra de cociente de dimensión finita. En tales casos, uno quisiera saber la dimensión (de donde la función ``DimQA (3.5.2)``, ``QA`` para álgebra de cocientes), encontrar una base (de donde la función ``BaseQA (3.5.1))``, o simplemente los monomios hasta un cierto grado que no son divisibles por un término principal de ``G`` (de ahí la función ``GBNP.NondivMons``). En realidad, mediante el uso de ``MulQA (3.5.5)``, incluso puede multiplicar elementos del álgebra del cociente. En caso de que se desconozca si el álgebra del cociente es finito o infinito, se pueden usar las funciones ``FinCheckQA (3.6.2)`` y ``DetermineGrowthQA (3.6.1)``. Cuando el álgebra del cociente es de dimensión infinita, es posible que desee determinar su serie de Hilbert parcial. Esto se puede hacer con la función ``HilbertSeriesQA (3.6.3)``.

Sobre la implementación
----------------------------------------------------

En lugar de almacenar todas las obstrucciones, el algoritmo de base de Gröbner calcula la forma normal (fuerte) de las obstrucciones a partir de ``G`` y las coloca en ``D`` siempre que no sean cero. Al comienzo del ciclo, tomamos el primer elemento de la lista ``D`` y lo preparamos para agregarlo a ``G``. Luego nos ocupamos de dos objetivos:


    1. para restaurar las propiedades invariantes,
    2. para limpiar ``G`` (es decir, reducirlo a un conjunto más breve y breve).

Esto se hace principalmente mediante cálculos adicionales de polinomio ``S`` y de forma normal.

En cuanto a la gestión de datos, hemos optado por trabajar con listas in situ, es decir, no copiar la lista sino realizar todas las operaciones en una y la misma lista. Para ello usamos operaciones como ``RemoveElmList`` y ``Add``, ver ``Referencia: Add``. La idea aquí es economizar espacio para grandes cálculos. No utilizamos operaciones in situ en todas partes, pero nos hemos concentrado en las listas potencialmente más grandes: ``G`` y ``D``.

Para comprobar si se puede reducir un monomio, se utiliza una estructura de árbol interna.

Variante de rastreo
----------------------------------------------------


Al calcular con pequeños ejemplos, puede resultar útil proporcionar a los elementos de la base de Gröbner una forma de expresarlos como elementos en ``I``, es decir, como combinaciones de elementos de la entrada. Esto se puede hacer, no solo para elementos de ``G``, sino para cualquier elemento, mediante las funciones en el archivo ``trace.g``. Este archivo llama al archivo ``nparith.g`` para realizar un seguimiento aritmético de las expresiones de polinomios como combinaciones de elementos de la base original. Con respecto a una base de entrada dada ``B``, un polinomio ``p`` en la versión trazada es un ``registro`` o ``record``, llamado polinomio trazado, con dos campos. Un campo, denominado ``p.pol``, es el polinomio habitual en formato ``NP``. El otro, denotado ``p.trace``, es una lista de elementos indexados por ``B``. Cada elemento de ``p.trace`` es una lista cuyos elementos son cuatro tuplas ``[ml, i, mr, c]`` donde ``ml`` y ``mr`` son monomios, ``i`` es un índice de un elemento de ``B`` y ``c`` es un escalar. La interpretación de esta estructura de datos es que ``p.pol`` se puede escribir como la suma de las cuatro tuplas ``[ml, i, mr, c]`` de :math:`c \ast ml \ast B_{i} \ast mr`. Las funciones para imprimir estas expresiones de una manera comprensible para los humanos se describen en la ``Sección 3.7``.

Variante de truncamiento
----------------------------------------------------


Para cálculos con ejemplos grandes y/o infinitos, puede ser conveniente truncar todo por encima de cierto grado. De hecho, nos encontramos con varios ejemplos en los que los polinomios son (ponderados) homogéneos y entonces tiene mucho sentido truncar los polinomios, es decir, descartar todo lo que supere un cierto grado. Porque entonces la base de Gröbner, si existe, también será homogénea y la parte que consiste en todos sus polinomios de grado menor que un grado dado es igual a la base de Gröbner de la unión de la lista original de polinomios con todos los monomios. de grado :math:`d + 1`. Aquí un polinomio ``NP`` en n variables se llama homogéneo de grado :math:`d` con respecto a :math:`v`, un vector con enteros no negativos de longitud :math:`n`, si, para cada uno de sus monomios :math:`[t_{1}, \dots, t_{k} ]`, la suma de todos los :math:`v_{t_{i}}` es igual a :math:`d`. La elección más clásica para :math:`v` es el vector todo-uno, en cuyo caso a menudo se habla de homogéneo sin mencionar el vector todo-uno. Si dos polinomios son homogéneos con respecto a :math:`v`, entonces también lo son sus :math:`S-polinomios`. Si ``K`` es una lista de polinomios homogéneos con respecto a :math:`v`, entonces la forma normal con respecto a ``K`` de cualquier polinomio homogéneo de grado :math:`d` con respecto a :math:`v` es de nuevo homogénea de grado :math:`d` con respecto a :math:`v`. En particular, la base de Gröbner de una lista de polinomios que son homogéneos con respecto a :math:`v`, consta de polinomios homogéneos, y los polinomios de entrada que contribuyen a los polinomios en la base de Gröbner de grado como máximo :math:`d` tienen grado como máximo :math:`d` ellos mismos. Estos hechos permiten el cálculo de la base de Gröbner truncada. Las funciones de esta variante se pueden encontrar en la ``Sección 3.8``.

Variante de módulo
----------------------------------------------------

Suponga que se nos da un conjunto finito :math:`G` de polinomios en un álgebra :math:`A` libre no conmutativa generada por, digamos :math:`t` indeterminados, y un entero positivo :math:`s`. Denote por :math:`I` el ideal bilateral de :math:`A` generado por :math:`G`. Podemos trabajar con los módulos :math:`A / I` libres derechos :math:`(A / I)^{s}`. Consulte la ``Sección 2.2`` sobre cómo representar vectores de :math:`(A / I)^{s}` mediante elementos del módulo libre As. Dado un subconjunto :math:`W` de :math:`A^{s}`, cuyos elementos se denominan relaciones de prefijo, sea :math:`W_{0}` el submódulo generado por la imagen de :math:`W` en :math:`(A / I)^{s}`. La función ``SGrobnerModule (3.9.1)`` está destinada a determinar el módulo de cociente :math:`(A / I)^{s} / W_{0}`. Si el algoritmo termina, proporciona una base de Gröbner para :math:`I`, así como un conjunto adecuado de generadores para :math:`W_{0}`, con propiedades similares a las de Gröbner. Esto implica que ``StrongNormalFormNPM (3.9.5)``, un cálculo de forma normal fuerte, se puede usar para encontrar el representante canónico en :math:`A^{s} / W_{0}` de un elemento en :math:`(A / I)^{s} / W_{0}`. Los detalles teóricos se pueden encontrar en [2]. Si :math:`(A / I)^{s} / W_{0}` es un espacio vectorial de dimensión finita sobre el campo de coeficientes de :math:`A`, entonces se puede encontrar una base usando ``BaseQM (3.9.2)`` y su dimensión se puede calcular usando ``DimQM (3.9.3)``


Registros de bases de Gröbner
----------------------------------------------------

La función ``SGrobnerModule (3.9.1)`` calcula una base de Gröbner que consta de algunas relaciones de dos lados en el álgebra y algunas relaciones de prefijo o módulo en el espacio vectorial. Estos se devuelven en un ``registro`` o ``record`` ``GBR``. Las relaciones bilaterales se pueden encontrar bajo el nombre ``GBR.ts`` y las relaciones de prefijo bajo el nombre ``GBR.p``. También se almacena alguna otra información en este registro.

Las condiciones de prefijo están en formato ``NPM`` (ver ``Sección 2.2``) y las relaciones de dos lados están en formato ``NP``.

Algebras Cocientes
----------------------------------------------------

Una vez que se calcula una base de Gröbner de una lista :math:`G` de polinomios en formato ``NP``, que definen elementos de un álgebra libre :math:`A`, el álgebra cociente :math:`QA` de :math:`A` por el ideal bilateral generado por :math:`G` (o, que equivale a lo mismo, el Base de Gröbner). Hay varias funciones disponibles para determinar si :math:`QA` es de dimensión finita o no.

Los elementos de :math:`QA` están representados por elementos de :math:`A`. Dos elementos son iguales si y sólo si sus formas normales fuertes coinciden; consulte ``StrongNormalFormNP (3.5.6)``. La multiplicación está a cargo de ``MulQA (3.5.5)``, que es poco más que la forma normal fuerte del producto de dos polinomios en formato ``NP`` que representan elementos de :math:`QA`.

Si :math:`QA` es de dimensión finita, ``BaseQA (3.5.1)`` puede encontrar una base sobre el campo. El tamaño de la base, en otras palabras, la dimensión de :math:`QA`, se puede calcular con ``DimQA (3.5.2)``. La multiplicación correcta por un elemento de :math:`QA` es una transformación lineal. La matriz de esta transformación lineal con respecto a la base, en caso de que el elemento pertenezca a la base, puede ser calculada por ``MatrixQA (3.5.3)`` o, para todos los elementos base, ``MatricesQA (3.5.4)``.

Se puede construir una lista de términos principales de la base de Gröbner :math:`G` con ``LMonsNP (3.3.10)``. La dimensión de :math:`QA` solo depende de esta lista y es computacionalmente más fácil trabajar con ella que :math:`G`. La mayoría de las funciones diseñadas para analizar la dimensionalidad trabajan con un ideal monomial generado por una fuerte base de Gröbner, lo que en este caso significa que ningún elemento divide a ningún otro elemento.

La función ``FinCheckQA (3.6.2)`` determina si :math:`QA` es de dimensión finita o infinita. De manera más general, el crecimiento de :math:`QA` se puede determinar mediante la función ``DetermineGrowthQA (3.6.1)``, que devuelve la información de que :math:`QA` es de dimensión finita o que :math:`QA` tiene un crecimiento polinomial, en cuyo caso da límites para el grado de crecimiento polinomial, o que :math:`QA` tiene un crecimiento exponencial.

Finalmente, con la función ``HilbertSeriesQA (3.6.3)`` se pueden calcular los coeficientes de la serie de Hilbert.

El propósito de las funciones ``FinCheckQA (3.6.2)`` y ``DetermineGrowthQA (3.6.1)`` están estrechamente relacionados. El primero es más rápido, mientras que el segundo proporciona más información, como se ilustra en la siguiente tabla.

========================  ========================  ==========================
:math:`\text{ }`           ``DetermineGrowthQA``      ``DetermineGrowthQA``
========================  ========================  ==========================
finito                       true                    ``0``
crecimiento polinomial       false                   ``d`` o ``[ d1, d2 ]``
crecimiento exponencial      false                   crecimiento exponencial
========================  ========================  ==========================

La función ``DetermineGrowthQA (3.6.1)`` puede encontrar el grado exacto de crecimiento polinomial (si está disponible). Si este es el caso, se devuelve ese título. También puede suceder que solo se devuelva un intervalo ``[ d1, d2 ]`` en el que se encuentra la dimensión. Para forzar una respuesta exacta, su tercer argumento debería ser ``true``.

Con la función ``PreprocessAnalysisQA (3.6.4)``, los cálculos realizados por estas :math:`3` funciones pueden acelerarse. Sin embargo, tenga en cuenta que al aplicar el preprocesamiento de los datos, el conjunto de monomios en la base ideal cambia y ya no corresponde al mismo álgebra de cociente (sino a un álgebra de cociente con el mismo crecimiento).