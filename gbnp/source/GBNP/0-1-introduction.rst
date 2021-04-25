.. role:: underline
    :class: underline

Introducción
==============================================

Instalación
----------------

Para instalar **GBNP**, primero descarguemos de `aquí <http://mathdox.org/products/gbnp/GBNP-1.0.3.tar.gz>`_ el código fuente, luego descomprimos el archivo ``GBNP-1.0.3.tar.gz`` en el subdirectorio ``pkg`` de su instalación de **GAP** ( o en el subdirectorio pkg de cualquier otro directorio raíz de **GAP**, por ejemplo uno agregado con el argumento ``-l``) con el siguiente comando: ``tar -xvzf GBNP-1.0.3.tar.gz``.

Luego, **GBNP** se carga con el comando **GAP**

.. code-block:: gap

    gap> LoadPackage( "GBNP" );


Aquellos que quieran descargar esta documentación pueden encontrarla en este `link <http://mathdox.org/products/gbnp/GBNPdoc-1.0.3.tar.gz>`_ y extraerla con ``tar -xvzf GBNPdoc-1.0.3.tar.gz``. También está incluido en el paquete.


Usos del paquete
--------------------

Si deseamos calcular una *base de Gröbner*, creamos una lista de ``NP`` (polinomios no conmutativos en formato ``NP``), como se describe en la ``Sección 2.1``. Esto se puede hacer directamente o mediante el uso de las funciones de transición descritas en la ``Sección 3.1``. Para ejecutar el algoritmo estándar, use las funciones de la ``Sección 3.4``. Con estas funciones, podemos intentar encontrar una **base de Gröbner**. La palabra ``try`` se incluye porque :underline:`no se garantiza que el algoritmo para calcular las bases de Gröbner termine`. Los problemas de impresión de polinomios en formato ``NP`` se analizan en la ``Sección 3.2``. Si se encuentra la **base de Gröbner** y la dimensión del álgebra del cociente :math:`Q` (consulte la ``Sección 2.9``) es finita, puede encontrar una base de monomios para :math:`Q` con las funciones de la ``Sección 3.5``. Para un análisis más avanzado de :math:`Q`, como una prueba de dimensionalidad finita o infinita, o para determinar su crecimiento o su serie parcial de Hilbert, use las funciones de la ``Sección 3.6``.

Hay tres variantes del algoritmo básico de *Gröbner*:
    - la versión truncada,
    - la versión de seguimiento y
    - la versión del módulo.
    
En :underline:`el caso homogéneo` (ponderado) (descrito en la ``Sección 2.6``), la versión truncada, dada por las funciones descritas en la ``Sección 3.8``, calcula la parte de una base de Gröbner hasta un peso indicado.

:underline:`La versión de traza` (descrita en la ``Sección 2.5``), dada por las funciones descritas en la ``Sección 3.7``, calcula una expresión de los polinomios de la base de Gröbner encontrados en términos de los generadores originales.

:underline:`La versión del módulo` (descrita en las ``Secciones 2.2``, ``2.7`` y ``2.8``), dada por las funciones descritas en la ``Sección 3.9``, calcula una **base de Gröbner** para un submódulo de un módulo :math:`Q` libre de rango finito.

Pemos ver los archivos de ejemplo en el ``Capítulo A`` para inspirarnos. El código fuente de los archivos se puede examinar para funciones auxiliares, que a menudo se utilizan en las funciones principales, pero no se consideran necesarias para un usuario nuevo.