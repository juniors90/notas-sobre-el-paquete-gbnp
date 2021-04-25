.. role:: underline
    :class: underline

Nivel de información
==========================================

Introduction
------------------------

Muchas funciones del paquete ``GBNP`` pueden producir resultados adicionales. Este resultado puede ser útil para cálculos largos, para ver dónde está el cálculo o para obtener más información sobre el cálculo en sí.

**GAP** proporciona las herramientas para poder ajustar la salida de las funciones. Todas las funciones de este paquete usan ``InfoClass`` ``InfoGBNP (4.2.1)`` y algunas usan ``InfoClass`` ``InfoGBNPTime (4.3.1)``.

Como es habitual con **GAP** cuando se deja en ``0``, las funciones difícilmente imprimirán información adicional. Se puede establecer en ``1`` o ``2`` con ``SetInfoLevel`` (se puede encontrar más información sobre esta función en ``Reference: SetInfoLevel``). En las siguientes secciones se ofrecerá una breve explicación sobre cada nivel de información.


InfoGBNP
-------------------------------------

InfoGBNP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La clase de infromación (info class) ``InfoGBNP``. 
The InfoClass for this package is used in almost all functions. To change this level to 1 (some information) or 2 (more information, also information from calculation loops) use the function SetInfoLevel.

Qué se imprimirá a nivel ``0``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

En el nivel ``0`` no se imprime información más allá de lo que las funciones mismas ordenan imprimir.

Estas incluyen funciones como ``PrintNP (3.2.1)``, ``PrintNPList (3.2.3)``, ``PrintTraceList (3.7.2)`` y ``PrintNPListTrace (3.7.4)``, pero también incluye la función ``DetermineGrowthQA (3.6.1)``, que solo imprime una o dos líneas y ``DimsQATrunc (3.8.5)`` que produce información sobre una base Gröbner truncada.

Qué se imprimirá a nivel ``1``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

El infolevel se puede establecer en ``1`` con el siguiente comando:

.. code-block:: gap
    :caption: InfoGBNP
    :name: InfoGBNP
    
    gap> SetInfoLevel(InfoGBNP,1);


En el nivel ``1``, un gran conjunto de funciones producirá un poco de salida. La mayor parte de esta información informa sobre la fase del algoritmo en el que se encuentran los cálculos o algunas estadísticas simples sobre la entrada o la salida.

Qué se imprimirá a nivel ``2``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

El ``infolevel`` se puede establecer en ``2`` con el siguiente comando

.. code-block:: gap
    :caption: InfoGBNP
    :name: InfoGBNP_2
    
    gap> SetInfoLevel(InfoGBNP,2);


En el nivel ``2``, un gran conjunto de funciones producirá una gran cantidad de resultados. Esto se refiere principalmente a información sobre bucles en los cálculos. También se imprimirá la información de tiempo.

InfoGBNPTime
-------------------------------------

InfoGBNPTime
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La clase de infromación (info class) ``InfoGBNPTime``.

La InfoClass para cronometraje se utiliza para producir información sobre el tiempo de ejecución del algoritmo en ciertos cálculos posiblemente largos.

Para cambiar este nivel a ``1`` (las funciones de Gröbner dan información) o ``2`` (más información, también información de otras funciones, que no siempre pueden llevar mucho tiempo y desde bucles internos) utilice la función ``SetInfoLevel``.

Qué se imprimirá a nivel ``0``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

No se imprimirá información de tiempo en el nivel ``0``. Esto puede ser deseable para pequeños ejemplos o cuando se produce una salida de prueba, para usar con ``ReadTest``.

Qué se imprimirá a nivel ``1``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

El infolevel se puede establecer en ``1`` con el siguiente comando:

.. code-block:: gap
    :caption: InfoGBNPTime
    :name: InfoGBNPTime
    
    gap> SetInfoLevel(InfoGBNPTime,1);

En el nivel ``1`` habrá información de tiempo impresa por las funciones de diferentes variantes del algoritmo de base de Gröbner: ``Grobner (3.4.1)``, ``SGrobner (3.4.2)``, ``SGrobnerTrace (3.7.5)`` y ``SGrobnerTrunc (3.8.2)``.

Qué se imprimirá a nivel ``2``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

El infolevel se puede establecer en ``2`` con el siguiente comando:

.. code-block:: gap
    :caption: InfoGBNPTime
    :name: InfoGBNPTime_2
    
    gap> SetInfoLevel(InfoGBNPTime,2);

En el nivel dos también habrá información impresa desde un bucle desde dentro de ``SGrobnerTrunc (3.8.2)``.







