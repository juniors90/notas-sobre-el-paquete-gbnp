.. role:: underline
    :class: underline

Funciones
===================

Conversión de polinomios a diferentes formatos
------------------------------------------------------

GP2NP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``GP2NP( gp )`` devuelve: Si ``gp`` es :underline:`un elemento de un álgebra libre`, entonces el polinomio en formato ``NP`` ``(ver Sección 2.1)`` corresponde a ``gp``; si ``gp`` es :underline:`un elemento de un módulo libre`, entonces el vector en formato ``NPM`` ``(ver Sección 2.2)`` correspondiente a ``gp``.

Esta función convertirá un elemento de un álgebra libre en un polinomio en formato ``NP`` y un elemento de un módulo de derecho libre en un vector en formato ``NPM``.

.. code-block:: gap
    :caption: Ejemplo-GP2NP
    :name: Ejemplo_GP2NP

    gap> # Primero cargamos el paquete gap (antes del ejemplo)
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-GP2NP
    gap> # Sea A el álgebra asociativa libre con uno sobre los racionales de los generadores a y b.
    gap> # Sea e el uno del álgebra.
    gap> A:=FreeAssociativeAlgebraWithOne( Rationals, "a", "b" );;
    gap> a:=A.a;;
    gap> b:=A.b;;
    gap> e:=One(A);;
    gap> z:=Zero(A);;
    gap> # Ahora sea gp el polinomio ba-ab-e.
    gap> gp:=b*a-a*b-e;
    (-1)*<identity ...>+(-1)*a*b+(1)*b*a
    gap> # El polinomio en formato NP, correspondiente a gp ahora se puede obtener con GP2NP:
    gap> GP2NP(gp);
    [ [ [ 2, 1 ], [ 1, 2 ], [  ] ], [ 1, -1, -1 ] ]
    gap> # Sea D el álgebra asociativa libre sobre A de rango 2.
    gap> D := A^2;;
    gap> # Tomamos la siguiente lista R de dos elementos de D.
    gap> R := [ [b-e, z], [e+a*(e+a+b), -e-a*(e+a+b)] ];;
    gap> # Convertimos la lista R a una lista de vectores en formato NPM.
    gap> List(R,GP2NP);
    [ [ [ [ -1, 2 ], [ -1 ] ], [ 1, -1 ] ],
      [ [ [ -1, 1, 2 ], [ -1, 1, 1 ], [ -2, 1, 2 ], [ -2, 1, 1 ], [ -1, 1 ], [ -2, 1 ], [ -1 ], [ -2 ] ],
            [ 1, 1, -1, -1, 1, -1, 1, -1 ] ] ]
    gap>

GP2NPList
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``GP2NPList( Lgp )`` devuelve la lista de polinomios en formato ``NP`` o ``NPM`` correspondiente a elementos de un módulo o álgebra libre que se encuentran en la lista ``Lgp``.

Esta función tiene el mismo efecto que ``List( Lgp, GBNP )``.

.. code-block:: gap
    :caption: Ejemplo-GP2NPList
    :name: Ejemplo_GP2NPList

    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-GP2NPList
    gap> # Sea A el álgebra asociativa libre con uno sobre los racionales de los generadores a y b. 
    gap> # Sea e el uno del álgebra.
    gap> A:=FreeAssociativeAlgebraWithOne(Rationals,"a","b");;
    gap> a:=A.a;;
    gap> b:=A.b;;
    gap> e:=One(A);;
    gap> # Sea Lgp la lista de polinomios [a^2-e,b^2-e,ba-ab-e].
    gap> Lgp:=[a^2-e,b^2-e,b*a-a*b-e];
    [ (-1)*<identity ...>+(1)*a^2, (-1)*<identity ...>+(1)*b^2, (-1)*<identity ...>+(-1)*a*b+(1)*b*a ]
    gap> # El polinomio en formato NP correspondiente a gp se puede obtener con GP2NP:
    gap> GP2NPList(Lgp);
    [ [ [ [ 1, 1 ], [  ] ], [ 1, -1 ] ], [ [ [ 2, 2 ], [  ] ], [ 1, -1 ] ],
      [ [ [ 2, 1 ], [ 1, 2 ], [  ] ], [ 1, -1, -1 ] ] ]
    gap> # El mismo resultado se obtiene mediante una simple aplicación
    gap> # de la función Lista estándar en GAP:
    gap> List(Lgp,GP2NP) = GP2NPList(Lgp);
    true
    gap>

NP2GP
~~~~~~~~~~~~~~~~~~~~~~

La función ``NP2GP(np, A)`` devuelve el formato **GAP** del polinomio ``np`` en formato ``NP``.

Esta función convertirá un polinomio en formato ``NP`` a un polinomio **GAP** en el álgebra asociativa libre ``A`` y un vector en formato ``NPM`` a un vector **GAP** en el módulo ``A`` libre. En el caso del formato ``NP``, el número de variables no debe exceder el rango del álgebra libre ``A``. En el caso del formato ``NPM``, el absoluto de los números negativos no debe exceder el rango del módulo libre ``A``.

.. code-block:: gap
    :caption: Ejemplo-NP2GP
    :name: Ejemplo_NP2GP

    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-NP2GP
    gap> # Sea A el álgebra asociativa libre con uno sobre los racionales de los generadores a y b.
    gap> A:=FreeAssociativeAlgebraWithOne(GF(3),"a","b");;
    gap> # Sea np un polinomio en formato NP.
    gap> np:=[ [ [ 2, 1 ], [ 1, 2 ], [  ] ], [ Z(3)^0, Z(3), Z(3) ] ];;
    gap> # El polinomio se puede convertir al elemento correspondiente de A con NP2GP:
    gap> NP2GP(np,A);
    (Z(3)^0)*b*a+(Z(3))*a*b+(Z(3))*<identity ...>
    gap> # Tenga en cuenta que parte de la información del campo de coeficientes
    gap> # de un polinomio np en formato NP se puede obtener de la segunda lista de np.
    gap> One(np[2][1]);
    Z(3)^0
    gap> # Ahora bien, sea M el módulo A^2 y sea npm un polinomio sobre ese módulo en forma NPM.
    gap> M:=A^2;;
    gap> npm:=[ [ [ -1, 1 ], [ -2, 2 ] ], [ Z(3)^0, Z(3)^0 ] ];;
    gap> # El elemento de M correspondiente a npm es
    gap> NP2GP(npm,M);
    [ (Z(3)^0)*a, (Z(3)^0)*b ]
    gap> # Si M es un módulo de dimensión 2 sobre A y Lnp es una lista de
    gap> # polinomios en formato NPM, entonces los polinomios se pueden convertir
    gap> # a los polinomios correspondientes de M de la siguiente manera:
    gap> M:=A^2;;
    gap> Lnp:=[ [ [ [ -2, 1, 1 ], [ -2, 1 ] ], [ 1, -1 ] ],
    >   [ [ [ -1, 2, 2], [-2, 1 ] ], [ 1, -1 ]*Z(3)^0 ] ];;
    gap> List(Lnp, m -> NP2GP(m,M));
    [ [ <zero> of ..., (Z(3))*a+(Z(3)^0)*a^2 ], [ (Z(3)^0)*b^2, (Z(3))*a ] ]
    gap>

NP2GPList
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``NP2GPList(Lnp, A)`` devuelve la lista de polinomios correspondientes a ``Lnp`` en formato **GAP**.

Esta función convertirá la lista ``Lnp`` de polinomios en formato ``NP`` en una lista de polinomios **GAP** en el álgebra asociativa libre ``A``.

.. code-block:: gap
    :caption: Ejemplo-NP2GPList
    :name: Ejemplo_NP2GPList

    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-NP2GPList
    gap> # Sea A el álgebra asociativa libre con uno sobre los racionales de los generadores a y b.
    gap> A:=FreeAssociativeAlgebraWithOne(Rationals,"a","b");;
    gap> # Sea Lnp una lista de polinomios en formato NP.
    gap> # Entonces Lnp se puede convertir a una lista de polinomios de A con NP2GPList:
    gap> Lnp:=[ [ [ [ 1, 1, 1 ], [ 1 ] ], [ 1, -1 ] ],
    >   [ [ [ 2, 2 ], [ ] ], [ 1, -1 ] ] ];;
    gap> NP2GPList(Lnp,A);
    [ (1)*a^3+(-1)*a, (1)*b^2+(-1)*<identity ...> ]
    gap> # Tiene el mismo efecto que la función List aplicada de la siguiente manera.
    gap> List(Lnp, p -> NP2GP(p,A));
    [ (1)*a^3+(-1)*a, (1)*b^2+(-1)*<identity ...> ]
    gap> # Ahora sea M un módulo de dimensión 2 sobre A y Lnp una lista de vectores en formato NPM.
    gap> # Entonces los polinomios Lnp se pueden convertir a los vectores correspondientes de M
    gap> # con NP2GPList:
    gap> M:=A^2;;
    gap> Lnp:=[ [ [ [ -2, 1, 1 ], [ -2, 1 ] ], [ 1, -1 ] ],
    >   [ [ [ -1, 1 ], [ -2 ] ], [ 1, -1 ] ] ];;
    gap> NP2GPList(Lnp,M);
    [ [ <zero> of ..., (-1)*a+(1)*a^2 ], [ (1)*a, (-1)*<identity ...> ] ]
    gap> # Se puede obtener el mismo resultado mediante la aplicación de la función List estándar:
    gap> List(Lnp, m -> NP2GP(m,M)) = NP2GPList(Lnp,M);
    true
    gap>


Imprimiendo Polinomios en formato NP
---------------------------------------

PrintNP
~~~~~~~~~~~~~~~~~

La función ``PrintNP( np )``

Esta función imprime un polinomio ``np`` en formato ``NP``, utilizando las letras ``a``, ``b``, ``c``, . . . para :math:`x_{1}, x_{2}, x_{3},\dots`, excepto que todo lo que esté más allá de ``l`` (la ``12ª letra``) se imprime como ``x``.

Esta función imprime un polinomio ``np`` en formato ``NP`` configurado por la función ``GBNP.ConfigPrint (3.2.2)``.

.. code-block:: gap
    :caption: Ejemplo-PrintNP
    :name: Ejemplo_PrintNP
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-PrintNP
    gap> # Considere el siguiente polinomio en formato NP.
    gap> p := [ [ [ 1, 1, 2 ], [ 1, 2, 2 ],[ ] ], [ 1, -2 , 3] ];;
    gap> # Se puede imprimir en forma de polinomio en a y b mediante la función PrintNP:
    gap> PrintNP( p );
     a^2b - 2ab^2 + 3
    gap>


GBNP.ConfigPrint
~~~~~~~~~~~~~~~~~~~~~

La función ``GBNP.ConfigPrint( arg )``

Por defecto, los generadores del álgebra se imprimen como ``a``, . . ., ``l`` y todo lo que sigue al duodécimo generador como ``x``. Al llamar a ``ConfigPrint``, es posible modificar esta convención de impresión. El argumento(s) será un álgebra o argumentos usados ​​para nombrar álgebras en **GAP** al momento de su creación. Más específicamente, tenemos las siguientes opciones.

    - ``no arguments``: cuando la función se invoca sin argumentos, la impresión se restablece a los valores predeterminados (ver más arriba).
    - ``algebra``: cuando la función se invoca con un álgebra como argumento, los generadores se imprimirán como estarían en el álgebra.
    - ``algebra,integer``: cuando la función se invoca con un álgebra y un entero ``n`` como argumentos, los generadores se imprimirán como estarían en el álgebra y se separarán en las ``n`` dimensiones.
    - ``leftmodule``: Cuando la función se invoca con un leftmodule :math:`A^{n}` de un álgebra asociativa como argumento, los generadores se imprimirán como estarían en el álgebra, separados en las n dimensiones.
    - ``string``: cuando se invoca la función con una cadena como argumento, se asume que solo hay :math:`1` generador y que debe nombrarse como lo indica la cadena.
    - ``integer``: cuando se invoca la función con un entero como argumento, el generador :math:`n`-ésimo se imprimirá como ``x``. ``<n>``.
    - ``integer``, ``string``: cuando la función se invoca con un entero no negativo y una cadena como argumentos, los generadores se imprimirán como ``<s>``. ``<n>``, donde ``<s>`` es la cadena dada como argumento y ``<n>`` el número del generador. No se puede comprobar si el número dado como argumento es realmente la dimensión. Por lo tanto, es posible que vuelvan números más altos en la salida. Sin embargo, esta forma de entrada es útil porque es una distinción del caso unidimensional y es compatible con la forma en que se crea un álgebra libre.
    - ``string``, ``string``, ``...``, ``string``: cuando la función se invoca con una secuencia de cadenas, los generadores se imprimirán con la cadena correspondiente o ``x`` si la secuencia no es lo suficientemente larga.

.. code-block:: gap
    :caption: Ejemplo-ConfigPrint
    :name: Ejemplo_ConfigPrint
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-ConfigPrint
    gap> # Considere los siguientes dos polinomios en formato NP.
    gap> p1 := [ [ [ 1, 1, 2 ],[ ] ],[ 1,-1 ] ];;
    gap> p2 := [ [ [ 1, 2, 2 ],[ ] ],[ 1,-1 ] ];;
    gap> # Ellos pueden ser impresos por la función PrintNP.
    gap> PrintNP( p1 );
     a^2b - 1
    gap> PrintNP( p2 );
     ab^2 - 1
    gap> # Podemos dejar que las variables se impriman como xey en lugar de a y b
    gap> # mediante GBNP.ConfigPrint
    gap> GBNP.ConfigPrint( "x" , "y" );
    gap> PrintNP( p1 );
     x^2y - 1
    gap> PrintNP( p2 );
     xy^2 - 1
    gap> # También podemos dejar que las variables se impriman como x.1 y x.2 en
    gap> # lugar de a y b mediante GBNP.ConfigPrint.
    gap> GBNP.ConfigPrint( 2 , "x" );
    gap> PrintNP( p1 );
     x.1^2x.2 - 1
    gap> PrintNP( p2 );
     x.1x.2^2 - 1
    gap> # Incluso podemos asignar cadenas a las variables a imprimir como alice y bob
    gap> # en lugar de ayb mediante GBNP.ConfigPrint.
    gap> GBNP.ConfigPrint( "alice" , "bob" );
    gap> PrintNP( p1 );
     alice^2bob - 1
    gap> PrintNP( p2 );
     alicebob^2 - 1
    gap> # Alternativamente, podemos introducir el álgebra libre A con dos generadores
    gap> # e imprimir los polinomios como miembros de A:
    gap> A:=FreeAssociativeAlgebraWithOne(Rationals, "a" , "b" );;
    gap> GBNP.ConfigPrint( A );
    gap> PrintNP( p1 );
     a^2b - 1
    gap> PrintNP( p2 );
     ab^2 - 1
    gap>

PrintNPList
~~~~~~~~~~~~~~~~~~~~~~

La función ``PrintNPList(Lnp)``

Esta función imprime una lista ``Lnp`` de polinomios en formato ``NP``, utilizando la función ``PrintNP``.

.. code-block:: gap
    :caption: Ejemplo-PrintNPList
    :name: Ejemplo_PrintNPList
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-PrintNPList
    gap> # Ponemos dos polinomios en formato NP en la lista Lnp.
    gap> p1 := [ [ [ 1, 1, 2 ] , [ ] ] , [ 1, -1 ] ];;
    gap> p2 := [ [ [ 1, 2, 2 ] , [ ] ] , [ 1, -1 ] ];;
    gap> Lnp := [p1,p2];;
    gap> # Podemos imprimir la lista con PrintNPList.
    gap> PrintNPList(Lnp);
     a^2b - 1
     ab^2 - 1
    gap> # Alternativamente, usando la función GBNP.ConfigPrint, podemos introducir el álgebra
    gap> # libre A con dos generadores e imprimir los polinomios de la lista como miembros de A:
    gap> A:=FreeAssociativeAlgebraWithOne(Rationals,"a","b");;
    gap> GBNP.ConfigPrint(A);
    gap> PrintNPList(Lnp);
     a^2b - 1
     ab^2 - 1
    gap>

Calcular polinomios en formato NP
------------------------------------------------------

NumAlgGensNP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``NumAlgGensNP( np )`` devuelve El número mínimo ``t`` para que ``np`` pertenezca al álgebra libre en ``t`` generadores.

Cuando se llama con un polinomio ``NP`` ``np``, esta función devuelve el número mínimo de generadores necesarios para que el álgebra correspondiente contenga el np. Si np es un polinomio sin generadores, eso es, equivalente a :math:`0` o :math:`1`, luego se devuelve :math:`0`.

.. code-block:: gap
    :caption: Ejemplo-NumAlgGensNP
    :name: Ejemplo_NumAlgGensNP
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-NumAlgGensNP
    gap> # Considere el siguiente polinomio en formato NP.
    gap> np := [ [ [ 2, 2, 2, 1, 1, 1 ],[ 4 ],[ 3, 2, 3 ] ],[ 1, -3, 2 ] ];;
    gap> PrintNP( np );
     b^3a^3 - 3d + 2cbc
    gap> NumAlgGensNP( np );
    4
    gap>

NumAlgGensNPList
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``NumAlgGensNPList( Lnp )`` devuelve el número mínimo ``t`` para que cada polinomio en ``Lnp`` pertenezca al álgebra libre en ``t`` generadores.

Cuando se llama con una lista de polinomios ``NP`` ``Lnp``, esta función devuelve el número mínimo de generadores necesarios para que el álgebra correspondiente contenga los polinomios ``NP`` en ``Lnp``. Si ``Lnp`` solo contiene polinomios sin generadores, que es equivalente a :math:`0` y :math:`1`, se devuelve :math:`0`.

.. code-block:: gap
    :caption: Ejemplo-NumAlgGensNPList
    :name: Ejemplo_NumAlgGensNPList
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-NumAlgGensNPList
    gap> # Considere los siguientes dos polinomios en formato NP.
    gap> p1 := [ [ [ 1, 1, 2, 3, 1 ], [ 2 ], [ 1 ] ], [ 1, -2, 1 ] ];;
    gap> p2 := [ [ [ 2, 2, 1, 4, 3 ], [ ] ], [ 1, -1 ] ];;
    gap> PrintNPList( [ p1, p2 ] );
     a^2bca - 2b + a
     b^2adc - 1
    gap> NumAlgGensNPList( [ p1, p2 ] );
    4
    gap>

NumModGensNP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


La función ``NumModGensNP( npm )`` devuelve el número mínimo ``mt`` para que ``npm`` pertenezca al módulo gratuito en los generadores ``mt``.

Cuando se llama con un polinomio ``npm`` en formato ``NPM``, esta función devuelve el número mínimo de generadores de módulos necesarios para que el álgebra correspondiente contenga ``npm``. Si ``npm`` es un polinomio ``NP`` que no contiene generadores de módulos, se devuelve :math:`0`.

.. code-block:: gap
    :caption: Ejemplo-NumModGensNP
    :name: Ejemplo_NumModGensNP
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-NumModGensNP
    gap> # Considere el siguiente polinomio en formato NPM.
    gap> np := [ [ [ -1, 1, 2, 3, 1 ], [ -2 ], [ -1 ] ], [ 1, -2, 1 ] ];;
    gap> PrintNP( np );
    [ abca + 1 , - 2 ]
    gap> NumModGensNP( np );
    2
    gap>


NumModGensNPList
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``NumModGensNPList( Lnpm )`` devuelve el número mínimo ``mt`` para que cada miembro de ``npm`` pertenezca al módulo libre en los generadores ``mt``.

Cuando se llama con una lista de polinomios ``Lnpm`` en formato ``NPM``, esta función devuelve el número mínimo de generadores de módulos necesarios para contener los polinomios en ``Lnpm``. Si solo hay polinomios en ``Lnpm`` en formato ``NP``, se devuelve :math:`0`.


.. code-block:: gap
    :caption: Ejemplo-NumModGensNPList
    :name: Ejemplo_NumModGensNPList
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> v1 := [ [ [ -1, 1, 2, 3, 1 ], [ -2 ], [ -1 ] ], [ 1, -2, 1 ] ];;
    gap> v2 := [ [ [ -2, 2, 1, 4, 3 ], [ -3 ] ],[ 1, -1 ] ];;
    gap> PrintNPList( [ v1, v2 ] );
    [ abca + 1 , - 2 ]
    [ 0, badc , - 1 ]
    gap> NumModGensNPList( [ v1, v2 ] );
    3
    gap>

AddNP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``AddNP(u, v, c, d)`` devuelve ``c ∗ u + d ∗ v``.

Calcula ``c ∗ u + d ∗ v`` donde ``u`` y ``v`` son polinomios en formato ``NP`` y ``c`` y ``d`` son escalares.

.. code-block:: gap
    :caption: Ejemplo-AddNP
    :name: Ejemplo_AddNP
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-AddNP
    p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -4 ] ];;
    gap> # Considere los siguientes dos polinomios en formato NP.
    gap> p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -3 ] ];;
    gap> p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -4 ] ];;
    gap> # El segundo se puede restar del primero mediante la función AddNP.
    gap> PrintNP( AddNP( p1, p2, 1, -1 ) );
     - ab^2 + a^2b + 1
    gap>

BimulNP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``BimulNP( ga, np, dr )``devuelve  el polinomio ``ga ∗ np ∗ dr`` en format ``NP``.

Cuando se llama con un polinomio ``np`` y dos monomios ``ga``, ``dr``, la función devolverá ``ga ∗ np ∗ dr``. Recuerde de la ``Sección 2.1`` que los monomios se representan como listas.

.. code-block:: gap
    :caption: Ejemplo-BimulNP
    :name: Ejemplo_BimulNP
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-BimulNP
    gap> # Considere los siguientes dos polinomios en formato NP.
    gap> p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -3 ] ];;
    gap> p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -4 ] ];;
    gap> # Multiplicar p1 de la derecha por by multiplicar p2 de
    gap> # la izquierda por a es posible con la función BimulNP:
    gap> PrintNP( BimulNP( [ ], p1, [ 2 ] ) );
     a^2b^2 - 3b
    gap> PrintNP( BimulNP( [ 1 ], p2, [ ] ) );
     a^2b^2 - 4a
    gap>

CleanNP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``CleanNP( u )`` devuelve la versión limpia de ``u``.

Dado un polinomio en formato ``NP``, esta función recopila términos con el mismo monomio, elimina los monomios triviales y ordena los monomios, con el mayor primero.

.. code-block:: gap
    :caption: Ejemplo-CleanNP
    :name: Ejemplo_CleanNP
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-CleanNP
    gap> # Considere el siguiente polinomio en formato NP.
    gap> p := [[[1,1,2],[],[1,1,2],[]],[1,-3,-2,3]];;
    gap> PrintNP(p);
     a^2b - 3 - 2a^2b + 3
    gap> # Los monomios [1,1,2] y [] aparecen dos veces cada uno.
    gap> # Para muchas funciones esta representación de un polinomio en formato NP no está permitida.
    gap> # Necesita ser limpiado, como por CleanNP:
    gap> PrintNP(CleanNP(p));
     - a^2b
    gap> # Para definir un polinomio sobre GF(2), los coeficientes deben definirse sobre este campo.
    gap> # Esta lista de coeficientes se puede obtener en GAP a partir de una lista de números enteros
    gap> # multiplicando por el elemento de identidad del campo.
    gap> # El polinomio resultante no necesita estar limpio, por lo que debe limpiarse nuevamente
    gap> # con CleanNP.
    gap> p := [ [[1,1,2],[]],One(GF(2))*[1,-2]];;
    gap> CleanNP(p);
    [ [ [ 1, 1, 2 ] ], [ Z(2)^0 ] ]
    gap>


GtNP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``GtNP ( u, v )`` devuelve ``true`` si :math:`u > v` y ``false`` si :math:`u \leq v`.

Función mayor que para los monomios u y v representados como en la Sección 2.1. Prueba si u> v.

El ordenamiento se realiza por titulación y luego lexicográficamente.

.. code-block:: gap
    :caption: Ejemplo-GtNP
    :name: Ejemplo_GtNP
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-GtNP
    gap> # Consideremos los dos siguientes monomios.
    gap> u := [1,1,2];
    [ 1, 1, 2 ]
    gap> v := [2,2,1];
    [ 2, 2, 1 ]
    gap> # Probamos si u es mayor que v.
    gap> GtNP(u,v);
    false
    gap>


LtNP
~~~~~~~~~~~~~~~~~~~~~~~

La función ``LtNP( u, v )`` devuelve ``true`` si :math:`u < v` y ``false`` si :math:`u \geq v`.

Función menor que para ``NP`` monomios, prueba si :math:`u < v`. El ordenamiento se realiza por titulación y luego lexicográficamente.

.. code-block:: gap
    :caption: Ejemplo-LtNP
    :name: Ejemplo_LtNP
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-LtNP
    gap> # Considere los siguientes dos monomios.
    gap> u := [1,1,2];
    [ 1, 1, 2 ]
    gap> v := [2,2,1];
    [ 2, 2, 1 ]
    gap> # Probamos si u es menor que v.
    gap> LtNP(u,v);
    true
    gap>


LMonsNP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``LMonsNP( Lnp )`` devuelve una lista de monomios principales.

Esta función devuelve los principales monomios de una lista ``Lnp`` de polinomios en formato ``NP``. Se requiere que los polinomios de ``Lnp`` estén limpios; consulte la ``Sección 3.3.7``.

.. code-block:: gap
    :caption: Ejemplo-LMonsNP
    :name: Ejemplo_LMonsNP
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-LMonsNP
    gap> # Ponemos dos polinomios en formato NP en la lista Lnp.
    gap> p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
    gap> p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -1 ] ];;
    gap> Lnp := [ p1, p2 ];;
    gap> # LMonsNP calcula la lista de los principales monomios:
    gap> LMonsNP( Lnp );
    [ [ 1, 1, 2 ], [ 1, 2, 2 ] ]
    gap> # Para una mejor impresión, los monomios se pueden convertir en polinomios en
    gap> # formato NP y luego enviarlos a PrintNPList:
    gap> PrintNPList( List( LMonsNP( Lnp ), q -> [ [ q ], [ 1 ] ] ) );
     a^2b
     ab^2
    gap>


MkMonicNP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función  ``MkMonicNP( np )`` devuelve ``np`` hecho monic.

Esta función devuelve el múltiplo escalar de un polinomio ``np`` en formato ``NP`` que es monic, es decir, tiene un coeficiente principal igual a :math:`1`.

.. code-block:: gap
    :caption: Ejemplo-MkMonicNP
    :name: Ejemplo_MkMonicNP
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-MkMonicNP
    gap> # Considere el siguiente polinomio en formato NP.
    gap> PrintNP( MkMonicNP( p ) );
    gap> p := [ [ [ 1, 1, 2 ], [ ] ], [ 2, -1 ] ];;
    gap> PrintNP(p);
     2a^2b - 1
    gap> # El coeficiente del término principal es 2. La función MkMonicNP encuentra este
    gap> # coeficiente y divide todos los términos por él:
    gap> PrintNP( MkMonicNP( p ) );
     a^2b - 1/2
    gap>

MulNP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``MulNP( np1, np2 )`` devuelve ``np1 ∗ np2``.

Cuando se invoca con dos polinomios ``np1`` y ``np2`` en formato ``NP``, esta función devolverá el producto ``np1 ∗ np2``.

.. code-block:: gap
    :caption: Ejemplo-MulNP
    :name: Ejemplo_MulNP
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-MulNP
    p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
    p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -1 ] ];;
    gap> # Considere los siguientes dos polinomios en formato NP.
    gap> p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
    gap> p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -1 ] ];;
    gap> # La función MulNP multiplica los dos polinomios.
    gap> PrintNP(MulNP(p1,p2));
     a^2bab^2 - ab^2 - a^2b + 1
    gap> # El hecho de que esta multiplicación no es conmutativa se ilustra con la siguiente comparación,
    gap> # usando MulNP dos veces y AddNP una vez.
    gap> PrintNP(AddNP(MulNP(p1,p2),MulNP(p2,p1),1,-1));
     - ab^2a^2b + a^2bab^2
    gap>


Funciones Gröbner, variante estándar
------------------------------------------------------

Grobner
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``Grobner( Lnp[, D][, max ] )`` devuelve: Si el algoritmo termina, una *Base de Gröbner* o un registro si se especifica ``max`` (ver descripción).

Para una lista ``Lnp`` de polinomios en formato ``NP``, esta función usará el **algoritmo de Buchberger** con forma normal para encontrar una *base de Gröbner* (si es posible, el problema general no tiene solución).

Cuando se llama con el argumento opcional ``max``, que debe ser un entero positivo, el cálculo se interrumpirá si no ha finalizado después de ``max`` iteraciones. El valor de retorno será un registro que contiene listas ``G`` y todo de polinomios en formato ``NP``, un booleano ``completed`` y un número entero de iteraciones ``iterations``.

Aquí ``G`` y todo forman un **par de Gröbner** (``ver [2]``). El número de iteraciones realizadas se colocará en ``iterations``. Si el algoritmo ha terminado, todo será la lista vacía y ``completed`` será igual a verdadero. Si el algoritmo no ha terminado, todo será una lista no vacía de polinomios en formato ``NP`` y ``completed`` será falso.

Mediante el uso del argumento opcional ``D``, es posible reanudar un cálculo previamente interrumpido.


.. code-block:: gap
    :caption: Ejemplo-Grobner
    :name: Ejemplo_Grobner
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-Grobner
    gap> # Considere los siguientes dos polinomios en formato NP.
    gap> p1 := [[[1,1,2],[]],[1,-1]];;
    gap> p2 := [[[1,2,2],[]],[1,-1]];;
    gap> PrintNPList([p1,p2]);
     a^2b - 1
     ab^2 - 1
     gap> # Su base de Gröbner se puede calcular mediante la función Grobner.
     gap> G := Grobner([p1,p2]);;
     gap> PrintNPList(G);
      b - a
     a^3 - 1
    gap> # Se invoca una iteración de los cálculos de Gröbner mediante el uso del parámetro max:
    gap> R := Grobner([p1,p2],1);;
    gap> PrintNPList(R.G);
     b - a
    gap> PrintNPList(R.todo);
     a^3 - 1
    gap> R.iterations;
    1
    gap> R.completed;
    false
    gap> # La lista anterior R.todo se puede utilizar para reanudar el cálculo del cálculo de la
    gap> # base de Gröbner con el par de Gröbner R.G, R.todo:
    gap> PrintNPList(Grobner(R.G,R.todo));
     b - a
     a^3 - 1
    gap> # Para realizar el cálculo de la base de Gröbner con polinomios en un álgebra libre sobre
    gap> # el campo GF(2), es necesario definir los coeficientes de los polinomios sobre ese campo.
    gap> PrintNPList(Grobner([[p1[1],One(GF(2))*p1[2]],[p2[1],One(GF(2))*p1[2]]]));
     b + a
     a^3 + Z(2)^0
    gap>


SGrobner
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``SGrobner( Lnp[, todo][, max] )`` devuelve: Si el algoritmo termina, una Base de Gröbner o un registro si ``max`` es especificado (``ver descripción``).

Para obtener una lista ``Lnp`` de polinomios en formato ``NP``, esta función utilizará el algoritmo de Buchberger con forma normal fuerte (``ver [2]``) para encontrar una **base de Gröbner** (si es posible, el problema general no tiene solución).

Cuando se llama con el argumento opcional ``max``, que debe ser un entero positivo, el cálculo se interrumpirá si no ha finalizado después de ``max`` iteraciones. El valor de retorno será un registro que contiene listas ``G`` y todo de polinomios en formato ``NP``, un booleano completado y un número entero de iteraciones.

Aquí ``G`` y todo forman **un par de Gröbner** (``ver [2]``). El número de iteraciones realizadas se colocará en iteraciones. Si el algoritmo ha terminado, todo será la lista vacía y completado será igual a verdadero. Si el algoritmo no ha terminado, todo será una lista no vacía de polinomios en formato ``NP`` y completado será falso.

Mediante el uso del argumento opcional ``D``, es posible reanudar un cálculo previamente interrumpido.

.. code-block:: gap
    :caption: Ejemplo-SGrobner
    :name: Ejemplo_SGrobner
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-SGrobner
    gap> # Considere los siguientes dos polinomios en formato NP.
    gap> p1 := [[[1,1,2],[]],[1,-1]];;
    gap> p2 := [[[1,2,2],[]],[1,-1]];;
    gap> PrintNPList([p1,p2]);
     a^2b - 1
     ab^2 - 1
    gap> # Su base de Gröbner se puede calcular mediante la función Grobner.
    gap> G := SGrobner([p1,p2]);;
    gap> PrintNPList(G);
     b - a
     a^3 - 1
    gap> # Se invoca una iteración de los cálculos de Gröbner mediante el uso del parámetro max:
    gap> R := SGrobner([p1,p2],1);;
    gap> PrintNPList(R.G);
     b - a
    gap> PrintNPList(R.todo);
     a^3 - 1
    gap> R.iterations;
    1
    gap> R.completed;
    false
    gap> # La lista anterior R.todo se puede utilizar para reanudar el cálculo del cálculo de la
    gap> # base de Gröbner con el par de Gröbner R.G, R.todo:
    gap> PrintNPList(SGrobner(R.G,R.todo));
     b - a
     a^3 - 1
    gap>


IsGrobnerBasis
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``IsGrobnerBasis( G )`` revuelve: ``true`` si ``G`` es una **base de Gröbner** y ``false`` en caso contrario.

Cuando se invoca con una lista ``G`` de polinomios en formato ``NP`` (ver ``Sección 2.1``), esta función verificará si la lista es una **base de Gröbner**. La comprobación se basa en el ``Teorema 1.4`` de ``[2]``.

Los polinomios que representan cero están permitidos en ``G``.

.. code-block:: gap
    :caption: Ejemplo-IsGrobnerBasis
    :name: Ejemplo_IsGrobnerBasis
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-IsGrobnerBasis
    gap> # Considere la siguiente lista de dos polinomios en formato NP.
    gap> Lnp := [[[[1,1,2],[]],[1,-1]], [[[1,2,2],[]],[1,-1]]];;
    gap> PrintNPList(Lnp);
     a^2b - 1
     ab^2 - 1
    gap> # La función IsGrobner comprueba si la lista es una base Gröbner.
    gap> IsGrobnerBasis(Lnp);
    false
    gap> # Entonces, la respuesta debería ser cierta para el resultado de un cálculo de Gröbner:
    gap> IsGrobnerBasis(Grobner(Lnp));
    true
    gap>


IsStrongGrobnerBasis
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``IsStrongGrobnerBasis( G )`` devuelve ``true`` si ``G`` es una **base fuerte de Gröbner** y ``false`` en caso contrario.

Cuando se invoca con una lista ``G`` de polinomios en formato ``NP`` (consulte la ``Sección 2.1``), esta función comprobará si los polinomios de esta lista forman una **base de Gröbner sólida** (consulte ``[2]``).

Los polinomios que representan cero están permitidos en ``G``.


.. code-block:: gap
    :caption: Ejemplo-IsStrongGrobnerBasis
    :name: Ejemplo_IsStrongGrobnerBasis
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-IsStrongGrobnerBasis
    gap> # Considere la siguiente lista de dos polinomios en formato NP.
    gap> Lnp := [[[[1,1,2],[]],[1,-1]], [[[1,2,2],[]],[1,-1]]];;
    gap> PrintNPList(Lnp);
     a^2b - 1
     ab^2 - 1
    gap> # La función IsStrongGrobner comprueba si la lista tiene una base sólida de Gröbner.
    gap> IsStrongGrobnerBasis(Lnp);
    false
    gap> # Pero la respuesta debería ser cierta para el resultado de un cálculo sólido de Gröbner:
    gap> IsStrongGrobnerBasis(SGrobner(Lnp));
    true
    gap> # Una base de Gröbner que no es una base de Gröbner fuerte:
    gap> B := SGrobner(Lnp);;
    gap> Add(B,AddNP(Lnp[1],B[1],1,-1));;
    gap> PrintNPList(B);
     b - a
     a^3 - 1
     a^2b - b + a - 1
    gap> IsGrobnerBasis(B);
    true
    gap> IsStrongGrobnerBasis(B);
    false
    gap>


IsGrobnerPair
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``IsGrobnerPair( G, D )`` devuelve: un valor booleano, que tiene el valor verdadero si la entrada forma un par de Gröbner.

Cuando se llama con dos listas de polinomios en formato ``NP``, esta función devuelve verdadero si forman un **par de Gröbner**. Probar si ``D`` es un conjunto básico de ``G`` podría implicar calcular la **base de Gröbner**.

En lugar de esto, solo se realizan algunos cálculos simples para ver si se puede probar fácilmente que ``D`` es un conjunto básico para ``G``. Si esto no se puede probar fácilmente, entonces se devuelve falso, aunque ``G``, ``D`` todavía podría ser un **par de Gröbner**.


.. code-block:: gap
    :caption: Ejemplo-IsGrobnerPair
    :name: Ejemplo_IsGrobnerPair
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-IsGrobnerPair
    gap> # Considere los siguientes cuatro polinomios en formato NP.
    gap> p1 := [[[1,1,2],[]],[1,-1]];;
    gap> p2 := [[[1,2,2],[]],[1,-1]];;
    gap> q1 := [[[2],[1]],[1,-1]];;
    gap> q2 := [[[1,1,1],[]],[1,-1]];;
    gap> # La función IsGrobnerPair se utiliza para comprobar si algunas combinaciones de 
    gap> # estos polinomios en dos listas proporcionan pares de Gröbner.
    gap> IsGrobnerPair([p1,p2,q1],[q2]);
    true
    gap> IsGrobnerPair([q1,q2],[p1,p2]);
    false
    gap> # La función IsGrobnerPair aplicada con una lista vacía como segundo argumento es
    gap> # una verificación de si el primer argumento es una base de Gröbner.
    gap> IsGrobnerPair([p1,p2],[]) = IsGrobnerBasis([p1,p2]);
    true
    gap>

MakeGrobnerPair
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``MakeGrobnerPair( G, D )`` devuelve un registro que contiene un nuevo **par de Gröbner**.

Cuando se llama con un par de argumentos ``G``, ``D``, esta función limpia ``G`` y ``D`` y agrega algunas obstrucciones a ``D`` hasta que se puede demostrar fácilmente que ``D`` es un conjunto básico para ``G`` (ver ``[2]``). El resultado es un registro que contiene los campos ``G`` y todo que representan el **par de Gröbner**.



.. code-block:: gap
    :caption: Ejemplo-MakeGrobnerPair
    :name: Ejemplo_MakeGrobnerPair
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-MakeGrobnerPair
    gap> # Considere los siguientes dos polinomios en formato NP.
    gap> p1 := [[[1,1,2],[]],[1,-1]];;
    gap> p2 := [[[1,2,2],[]],[1,-1]];;
    gap> # La función MakeGrobnerPair convierte la lista con estos dos polinomios en
    gap> # un par de Gröbner, una vez que se agrega la lista vacía como segundo argumento.
    gap> # El resultado es un registro cuyos campos G y todo
    gap> GP := MakeGrobnerPair([p1,p2],[]);;
    gap> PrintNPList(GP.G);
     a^2b - 1
     ab^2 - 1
    gap> PrintNPList(GP.todo);
     b - a
    gap> # Estos campos están listos para su uso en Grobner
    gap> GB := Grobner(GP.G,GP.todo);;
    gap> PrintNPList(GB);
     b - a
     a^3 - 1
    gap>


Álgebras de cocientes de dimensión finita
------------------------------------------------------

BaseQA
~~~~~~~~~~~~~~~~~~~

La función ``BaseQA(G, t, maxno )`` devuelve: Una lista de términos que forman una base del álgebra cociente del álgebra polinomial (no conmutativa) en ``t`` variables por el ideal de dos lados generado por ``G``.

Cuando se llama con una **base de Gröbner** ``G``, el número ``t`` de generadores del álgebra y un número máximo de términos que se pueden encontrar ``maxno``, ``BaseQA`` devolverá una base (parcial) del álgebra del cociente. Si esta función se invoca con maxno igual a :math:`0`, se dará una base completa. Si la dimensión de este álgebra cociente es infinita y maxno se establece en :math:`0`, entonces el algoritmo detrás de esta función no terminará.

.. code-block:: gap
    :caption: Ejemplo-BaseQA
    :name: Ejemplo_BaseQA
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-BaseQA
    gap> # Considere la siguiente base de Gröbner.
    gap> p1 := [[[1,1,2],[]],[1,-1]];;
    gap> p2 := [[[1,2,2],[]],[1,-1]];;
    gap> G := Grobner([p1,p2]);;
    gap> PrintNPList(G);
     b - a
     a^3 - 1
    gap> # La función BaseQA calcula una base para el álgebra cociente del álgebra libre sobre
    gap> # los racionales con generadores a y b por el ideal bilateral generado por G
    gap> PrintNPList(G);
     b - a
     a^3 - 1
    gap> BaseQA(G,2,0);
    [ [ [ [  ] ], [ 1 ] ], [ [ [ 1 ] ], [ 1 ] ], [ [ [ 1, 1 ] ], [ 1 ] ] ]
    gap> PrintNPList(BaseQA(G,2,0));
     1
     a
     a^2
    gap> # Es necesario para un resultado correcto que el primer argumento sea una base Gröbner,
    gap> # como se verá claramente en la siguiente invocación de BaseQA.
    gap> PrintNPList(BaseQA([p1,p2],2,10));
     1
     a
     b
     a^2
     ab
     ba
     b^2
     a^3
     aba
     ba^2
     bab
     b^2a
     b^3
    gap>

DimQA
~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``DimQA( G, t )`` devuelve la dimensión del álgebra del cociente.

Cuando se llama con una **base de Gröbner** ``G`` y un número de variables ``t``, la función ``DimQA`` devolverá la dimensión del álgebra cociente del álgebra libre generada por ``t`` variables por el ideal generado por ``G`` si es finito. No terminará si la dimensión es infinita.

Si ``t = 0``, la función calculará el valor mínimo de ``t`` tal que los polinomios en ``G`` pertenezcan al álgebra libre en ``t`` generadores.

Para comprobar si la dimensión del álgebra del cociente es finita y determinar el tipo de crecimiento si es infinito, consulte también las funciones ``FinCheckQA (3.6.2)`` y ``DetermineGrowthQA (3.6.1)`` en la ``Sección 3.6``.


.. code-block:: gap
    :caption: Ejemplo-DimQA
    :name: Ejemplo_DimQA
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-DimQA
    gap> # Considere la siguiente base de Gröbner.
    gap> p1 := [[[1,1,2],[]],[1,-2]];;
    gap> p2 := [[[1,2,2],[]],[1,-2]];;
    gap> G := Grobner([p1,p2]);;
    gap> PrintNPList(G);
     b - a
     a^3 - 2
    gap> # La función DimQA calcula la dimensión del álgebra cociente del álgebra libre sobre
    gap> # los racionales con generadores a y b por el ideal bilateral generado por G.
    gap> DimQA(G,2);
    3
    gap>


MatrixQA
~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``MatrixQA( i, B, GB )`` devuelve la representación matricial para el :math:`i`-ésimo generador del álgebra para la multiplicación por la derecha en el álgebra del cociente

Dada una base ``B`` del álgebra del cociente, una **base de Gröbner** (registro) ``GB`` y un número natural :math:`i`, esta función crea una representación matricial para el :math:`i`-ésimo generador del álgebra para la multiplicación recta.

.. code-block:: gap
    :caption: Ejemplo-MatrixQA
    :name: Ejemplo_MatrixQA
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-MatrixQA
    gap> # Considere los siguientes dos polinomios en formato NP.
    gap> p1 := [[[1,1,1,2],[]],[1,-1]];;
    gap> p2 := [[[2,2,2,1],[]],[1,-1]];;
    gap> # La matriz de multiplicación correcta por el primer indeterminado a en el álgebra del cociente
    gap> # con respecto al ideal generado por p1 y p2 se obtiene aplicando MatrixQA a la base de
    gap> # Gröbner de estos generadores y una base del álgebra del cociente como se encuentra en BaseQA
    gap> GB := Grobner([p1,p2]);;
    gap> B := BaseQA(GB,2,0);;
    gap> PrintNPList(B);
     1
     a
     b
     a^2
     ab
     a^3
     a^2b
     a^4
    gap> Display(MatrixQA(1, B,GB));
    [ [  0,  1,  0,  0,  0,  0,  0,  0 ],
      [  0,  0,  0,  1,  0,  0,  0,  0 ],
      [  0,  0,  0,  0,  1,  0,  0,  0 ],
      [  0,  0,  0,  0,  0,  1,  0,  0 ],
      [  0,  0,  0,  0,  0,  0,  1,  0 ],
      [  0,  0,  0,  0,  0,  0,  0,  1 ],
      [  1,  0,  0,  0,  0,  0,  0,  0 ],
      [  0,  0,  1,  0,  0,  0,  0,  0 ] ]
    gap> # La función también es aplicable a los registros base de Gröbner para módulos.
    gap> # Considere los siguientes dos vectores.
    gap> v1 := [[[-1,1,2],[-1]],[1,-1]];;
    gap> v2 := [[[-2,2,2],[-2]],[1,-2]];;
    gap> # SGrobnerModule encuentra el registro de la base de Gröbner para estos datos y
    gap> #  BaseQM una base de módulo de cociente:
    gap> GBR := SGrobnerModule([v1,v2],[p1,p2]);;
    gap> B := BaseQM(GBR,2,2,0);;
    gap> # La matriz de multiplicación correcta por a, el primer generador del álgebra libre, es
    gap> Display(MatrixQA(1,B,GBR));
    [ [  0,  1 ],
      [  1,  0 ] ]
    gap>


MatricesQA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``MatricesQA( t, B, GB )`` devuelve la representación matricial para los generadores ``t`` del álgebra para la multiplicación por la derecha en el álgebra del cociente.

Dada una base ``B`` del álgebra del cociente, una **base de Gröbner** (registro) ``GB`` y un número natural ``t``, esta función crea una lista de matrices ``t`` que representan las transformaciones lineales de los generadores del álgebra por multiplicación por la derecha en el álgebra del cociente.

.. code-block:: gap
    :caption: Ejemplo-MatricesQA
    :name: Ejemplo_MatricesQA
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-MatricesQA
    gap> # Considere los siguientes dos polinomios en formato NP.
    gap> p1 := [ [ [ 1, 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
    gap> p2 := [ [ [ 2, 2, 2, 1 ], [ ] ], [ 1, -1 ] ];;
    gap> # La función MatricesQA da la lista de matrices encontradas por MatrixQA cuando el primer
    gap> # argumento toma los valores enteros entre 1 y el número de todos los generadores de álgebra
    gap> GB := Grobner( [ p1, p2 ] );;
    gap> B := BaseQA( GB, 2, 0 );;
    gap> mats := MatricesQA( 2, B, GB );;
    gap> for mat in mats do Display( mat ); Print("\n"); od;
    [ [  0,  1,  0,  0,  0,  0,  0,  0 ],
      [  0,  0,  0,  1,  0,  0,  0,  0 ],
      [  0,  0,  0,  0,  1,  0,  0,  0 ],
      [  0,  0,  0,  0,  0,  1,  0,  0 ],
      [  0,  0,  0,  0,  0,  0,  1,  0 ],
      [  0,  0,  0,  0,  0,  0,  0,  1 ],
      [  1,  0,  0,  0,  0,  0,  0,  0 ],
      [  0,  0,  1,  0,  0,  0,  0,  0 ] ]
      
    [ [  0,  0,  1,  0,  0,  0,  0,  0 ],
      [  0,  0,  0,  0,  1,  0,  0,  0 ],
      [  0,  0,  0,  1,  0,  0,  0,  0 ],
      [  0,  0,  0,  0,  0,  0,  1,  0 ],
      [  0,  0,  0,  0,  0,  1,  0,  0 ],
      [  1,  0,  0,  0,  0,  0,  0,  0 ],
      [  0,  0,  0,  0,  0,  0,  0,  1 ],
      [  0,  1,  0,  0,  0,  0,  0,  0 ] ]
    
    gap> # El resultado también se puede obtener mediante el uso de la función Lista:
    gap> MatricesQA(2,B,GB) = List([1,2], q -> MatrixQA(q,B,GB));
    true
    gap>

MulQA
~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``MulQA( p1, p2, G )`` devuelve la forma normal fuerte del producto ``p1 ∗ p2`` con respecto a ``G``.

Cuando se llama con dos polinomios en forma ``NP``, ``p1`` y ``p2``, y una base de Gröbner ``G``, esta función devolverá el producto en el álgebra del cociente.


.. code-block:: gap
    :caption: Ejemplo-MulQA
    :name: Ejemplo_MulQA
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-MulQA
    gap> # Considere la siguiente base de Gröbner.
    gap> p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
    gap> p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -1 ] ];;
    gap> G := Grobner([p1,p2]);;
    gap> PrintNPList(G);
     b - a
     a^3 - 1
    gap> # Imprima el producto en el álgebra del cociente de los polinomios a-2 y b-3
    gap> # mediante el uso de MulQA:
    gap> s1 := [ [ [ 1 ], [ ] ], [ 1, -2 ] ];;
    gap> s2 := [ [ [ 2 ], [ ] ], [ 1, -3 ] ];;
    gap> PrintNP( MulQA( s1, s2, G ) );
     a^2 - 5a + 6
    gap> # El resultado debe ser igual a la forma normal fuerte del producto de a-2 y b-3
    gap> # con respecto a G:
    gap> MulQA( s1, s2, G ) = StrongNormalFormNP( MulNP( s1, s2 ), G );
    true
    gap>


StrongNormalFormNP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``StrongNormalFormNP( f, G )`` devuelve la forma normal fuerte de un polinomio con respecto a ``G``.

Cuando se invoca con un polinomio en formato NP (ver ``Sección 2.1``) y un conjunto finito ``G`` de polinomios en formato ``NP``, esta función devolverá una forma normal fuerte (es decir, un polinomio que es igual af módulo ``G``, cada monomio del cual es un múltiplo de ningún monomio principal de un elemento de ``G``).

Tenga en cuenta que ``StrongNormalForm`` con respecto a una **base de Gröbner** se determina de forma única, pero que para una entrada arbitraria ``G``, el resultado puede depender del orden en el que se implementan los pasos de reducción individuales.


.. code-block:: gap
    :caption: Ejemplo-StrongNormalFormNP
    :name: Ejemplo_StrongNormalFormNP
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-StrongNormalFormNP
    gap> # Considere los siguientes dos polinomios en formato NP.
    gap> p1 := [[[1,1,2],[]],[1,-1]];;
    gap> p2 := [[[1,2,2],[]],[1,-1]];;
    gap> # La forma normal fuerte del polinomio
    gap> p := [[[1,1,1,2],[2,1],[]],[1,-1,3]];;
    gap> # con respecto a la lista [p1, p2] se calcula mediante el uso de la función StrongNormalFormNP:
    gap> PrintNP(StrongNormalFormNP(p,[p1,p2]));
     - ba + a + 3
    gap>

Finitud y series de Hilbert
------------------------------------------------------


DetermineGrowthQA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``DetermineGrowthQA( Lm, t, exact )`` devuelve:

    - Si el álgebra del cociente es de dimensión finita, se devuelve el entero ``0``.
    - Si el crecimiento es polinomio y el algoritmo encontró un grado ``d`` preciso del polinomio de crecimiento, se devuelve ``d``.

Si el crecimiento es polinomio y no se encuentra una respuesta precisa, se devuelve un intervalo ``[d1, d2]`` en el que se encuentra la dimensión. Si el crecimiento es exponencial, se devuelve la cadena "crecimiento exponencial".

Dados los principales monomios Lm de alguna base de Gröbner (estos se pueden obtener con la función ``LMonsNP (3.3.10))``, el número t de generadores de un álgebra libre, digamos ``A``, en el que se encuentran los monomios, y un booleano exacto, esta función comprueba si el álgebra del cociente de ``A`` por el ideal generado por ``Lm`` es de dimensión finita. Al hacerlo, construye un gráfico de palabras normales que ayuda con los cálculos. También comprueba el crecimiento exponencial o polinomial en el caso infinito.

Si se necesita el grado exacto en el caso del polinomio, el argumento exact debe establecerse en ``true``.

La función ``DetermineGrowthQA`` permite el preprocesamiento, lo que puede acelerar los cálculos.

Esto se puede hacer con la función ``PreprocessAnalysisQA (3.6.4)``.


.. code-block:: gap
    :caption: Ejemplo-DetermineGrowthQA
    :name: Ejemplo_DetermineGrowthQA
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-DetermineGrowthQA
    gap> # Para la lista de monomios que consta de una sola variable en un álgebra libre
    gap> # generada por dos variables, el crecimiento es claramente polinomio de grado 1.
    gap> # Esto se verifica invocando DetermineGrowthQA con argumentos [[1]] (la lista del
    gap> # monomio único que consta de la primera variable), el número de generadores del
    gap> # álgebra libre a la que pertenecen los monomios (que es 2 aquí) y booleano true
    gap> # que indica que deseamos un grado preciso en caso de crecimiento polinomial.
    gap> DetermineGrowthQA([[1]],2,true);
    1
    gap> # Aquí hay un ejemplo de crecimiento polinomial de grado 2:
    gap> L := [[1,2,1],[2,2,1]];
    [ [ 1, 2, 1 ], [ 2, 2, 1 ] ]
    gap> DetermineGrowthQA(L,2,true);
    2
    gap> # Para mostrar cómo aplicar la función a polinomios arbitrarios, considere los
    gap> # siguientes dos polinomios en formato NP.
    gap> F := GF(256);
    GF(2^8)
    gap> z := GeneratorsOfField(F)[1];
    Z(2^8)
    gap> p1 := [[[1,1,1,2],[]],[z,1]];;
    gap> p2 := [[[2,2,2,1],[]],[1,z]];;
    gap> # Los polinomios p1 y p2 tienen coeficientes en el campo F de orden 256.
    gap> # Para estudiar el crecimiento del álgebra del cociente, primero calculamos la
    gap> # lista de los principales monomios de los elementos básicos de Gröbner y luego
    gap> # aplicamos DetermineGrowthQA.
    gap> GB := Grobner([p1,p2]);;
    gap> L := LMonsNP(GB);;
    gap> for lm  in L  do PrintNP( [ [ lm ], [ 1 ] ] ); od;
     a^3b
     b^2
     ba
     a^5
    gap> DetermineGrowthQA(L,2,true);
    0
    gap>


FinCheckQA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``FinCheckQA( Lm, t )`` devuelve: ``true``, si el álgebra del cociente es de dimensión finita y ``false`` en caso contrario.

Dada una lista ``Lm`` de monomios principales tal que ninguno de estos divide a otro, y el número ``t`` de generadores de un álgebra libre en el que están incrustados, esta función verifica si el cociente del álgebra del álgebra libre por el ideal generado por ``Lm`` es finito dimensional.

Cuando se le da una **base de Gröbner** ``G``, la dimensión del álgebra del cociente del álgebra libre por el ideal generado por ``G`` coincide con la dimensión del álgebra del cociente del álgebra libre por el ideal generado por los términos principales de los elementos de ``G``. Estos se puede obtener de ``G`` con la función ``LMonsNP (3.3.10)``.

La función ``FinCheckQA`` permite el preprocesamiento con la función ``PreprocessAnalysisQA (3.6.4)``. Esto puede acelerar el cálculo.

.. code-block:: gap
    :caption: Ejemplo-FinCheckQA
    :name: Ejemplo_FinCheckQA
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-FinCheckQA
    gap> # Considere la siguiente lista L de dos monomios.
    gap> L := [[1,2,1],[2,2,1]];;
    gap> # La finitud de la dimensión del álgebra cociente del álgebra libre por el ideal generado
    gap> # por estos dos monomios se puede decidir mediante FinCheckQA.
    gap> # Sus argumentos son L y el número de generadores del álgebra libre en los que residen
    gap> # los monomios.
    gap> FinCheckQA(L,2);
    false
    gap> # Este ejemplo resulta ser de dimensión infinita.
    gap> # Aquí hay un ejemplo de dimensión finita.
    gap> FinCheckQA([[1],[2,2]],2);
    true
    gap>

S

HilbertSeriesQA
~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``HilbertSeriesQA( Lm, t, d )`` devuelve una lista de coeficientes de la **serie de Hilbert** hasta el grado ``d``.

Dado un conjunto de monomios ``Lm``, ninguno de los cuales divide a otro, y el número ``n`` de generadores del álgebra libre en el que ocurren, esta función calcula la serie de Hilbert hasta un grado ``d`` dado.

Internamente, construye (parte de) el gráfico de palabras estándar. Esta función eliminará los ceros del final de la lista de coeficientes.


.. code-block:: gap
    :caption: Ejemplo-HilbertSeriesQA
    :name: Ejemplo_HilbertSeriesQA
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-HilbertSeriesQA
    gap> # Considere la siguiente lista L de dos monomios.
    gap> L := [[1,2,1],[2,2,1]];;
    gap> # La finitud de la dimensión del álgebra cociente del álgebra libre por el ideal generado
    gap> # por estos dos monomios se puede decidir mediante FinCheckQA.
    gap> # Sus argumentos son L y el número de generadores del álgebra libre en los que residen
    gap> # los monomios.
    gap> HilbertSeriesQA(L,2,10);
    [ 1, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20 ]
    gap> # Esto indica que el crecimiento puede ser polinomial.
    gap> # DetermineGrowthQA se puede utilizar para comprobar esto.
    gap> # restablecer la impresión; nota que no está dentro de una parte GAPDoc aquí


PreprocessAnalysisQA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``PreprocessAnalysisQA( Lm, t, iterations )`` devoluciones la lista de "obstrucciones" reducida a la izquierda, obtenida aplicando la reducción a la izquierda de forma recursiva.

Este preprocesamiento de la lista Lm de monomios se puede aplicar al conjunto de términos principales de una **base de Gröbner** antes de llamar a las funciones ``FinCheckQA (3.6.2)`` o ``DetermineGrowthQA (3.6.1)``, para acelerar los cálculos utilizando estas funciones. Como sugiere el nombre, ``t`` debe ser del tamaño del alfabeto. Las iteraciones del parámetro dan el número máximo de pasos de recursividad en el preprocesamiento (``0`` significa que no hay restricción). Para obtener más información sobre esta función, consulte ``[9]``.

.. code-block:: gap
    :caption: Ejemplo-PreprocessAnalysisQA
    :name: Ejemplo_PreprocessAnalysisQA
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-PreprocessAnalysisQA
    gap> # Considere los siguientes dos polinomios en formato NP de los cuales se calcula
    gap> # una base de Gröbner.
    gap> F := GF(256);
    GF(2^8)
    gap> z := GeneratorsOfField(F)[1];
    Z(2^8)
    gap> p1 := [[[1,1,1,1,2],[]],[1,-1]];;
    gap> p2 := [[[2,2,2,1,1,1],[]],[1,-1]];;
    gap> GB := Grobner([p1,p2]);;
    gap> PrintNPList(GB);
     a^4b - 1
     ba - ab
     b^2 - a
     a^5 - b
    gap> # La aplicación de PreprocessAnalysisQA se lleva a cabo en los términos principales de GB,
    gap> # con 2, 4, 8, recursiones, respectivamente.
    gap> L := LMonsNP(GB);
    [ [ 1, 1, 1, 1, 2 ], [ 2, 1 ], [ 2, 2 ], [ 1, 1, 1, 1, 1 ] ]
    gap> L1 := PreprocessAnalysisQA(L,2,2);
    [ [ 1, 1, 1 ], [ 2, 1 ], [ 1, 1, 2 ], [ 2, 2 ] ]
    gap> L2 := PreprocessAnalysisQA(L1,2,4);
    [ [ 1 ], [ 2 ] ]
    gap>


Funciones de la variante de seguimiento
------------------------------------------------------


EvalTrace
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``EvalTrace( p, Lnp )`` devuelve la traza evaluada a un polinomio en formato ``NP``.

Para un polinomio trazado ``p`` y una lista ``Lnp`` de polinomios en formato ``NP``, este programa evalúa la traza sustituyendo los polinomios de ``Lnp`` en la expresión ``p.trace`` y calculando el polinomio resultante. El resultado debe tener el mismo valor que ``p.pol``.

.. code-block:: gap
    :caption: Ejemplo-EvalTrace
    :name: Ejemplo_EvalTrace
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-EvalTrace
    gap> # Primero calculamos la base de Gröbner trazada de la lista de los siguientes dos polinomios
    gap> # en formato NP.
    gap> p1 := [[[1,1,2],[]],[1,-1]];;
    gap> p2 := [[[2,2,1],[]],[1,-1]];;
    gap> Lnp := [p1,p2];;
    gap> GBT := SGrobnerTrace(Lnp);;
    gap> # Para comprobar que los polinomios en GBT pertenecen al ideal generado por p1 y p2,
    gap> # evaluamos la traza.
    gap> # Para cada polinomio p trazado en GBT, el polinomio p.pol se equipara a la expresión evaluada
    gap> # p.trace, en la que cada aparición de G(i) se reemplaza por Lnp[i] mediante el uso de EvalTrace.
    gap> ForAll(GBT,q -> EvalTrace(q,Lnp) = q.pol);
    true
    gap>


PrintTraceList
~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``PrintTraceList( G )``

Cuando se invoca con una lista ``G`` de polinomios trazados, esta función imprime los trazos de esa lista.


.. code-block:: gap
    :caption: Ejemplo-PrintTraceList
    :name: Ejemplo_PrintTraceList
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-PrintTraceList
    gap> # Primero calculamos la base de Gröbner trazada de la lista de dos polinomios en formato NP y
    gap> # luego la imprimimos usando PrintTraceList.
    gap> p1 := [[[1,1,2],[]],[1,-1]];;
    gap> p2 := [[[2,2,1],[]],[1,-1]];;
    gap> GBT := SGrobnerTrace([p1,p2]);;
    gap> PrintTraceList(GBT);
     aG(1) - bG(1) - G(1)ba^2b + a^2G(2)ab
     
     G(1)ba^2 + bG(1)ba + G(2) - a^2G(2)a - ba^2G(2)
    gap>


PrintTracePol
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``PrintTracePol( p )`` 

Esta función imprime la traza de ``p`` un polinomio NP .


.. code-block:: gap
    :caption: Ejemplo-PrintTracePol
    :name: Ejemplo_PrintTracePol
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-PrintTracePol
    gap> # Primero calculamos la base de Gröbner trazada de la lista de dos polinomios en formato NP.
    gap> # A continuación, imprimimos el polinomio de trazas de los miembros de la lista mediante el
    gap> # uso de PrintTracePol.
    gap> p1 := [[[1,1,2],[]],[1,-1]];;
    gap> p2 := [[[2,2,1],[]],[1,-1]];;
    gap> GBT := SGrobnerTrace([p1,p2]);;
    gap> for np in GBT do PrintTracePol(np); Print("\n"); od;
     aG(1) - bG(1) - G(1)ba^2b + a^2G(2)ab
     
     G(1)ba^2 + bG(1)ba + G(2) - a^2G(2)a - ba^2G(2)
    
    gap>


PrintNPListTrace
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``PrintNPListTrace( G )``

Cuando se invoca con un conjunto de polinomios no conmutativos trazados ``G``, esta función imprime la lista de los polinomios trazados, sin la traza.


.. code-block:: gap
    :caption: Ejemplo-PrintNPListTrace
    :name: Ejemplo_PrintNPListTrace
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-PrintNPListTrace
    gap> # Primero calculamos la base de Gröbner trazada de la lista de dos polinomios en formato NP.
    gap> # A continuación, imprimimos los polinomios encontrados mediante el uso de PrintNPListTrace.
    gap> p1 := [[[1,1,2],[]],[1,-1]];;
    gap> p2 := [[[2,2,1],[]],[1,-1]];;
    gap> GBT := SGrobnerTrace([p1,p2]);;
    gap> PrintNPListTrace(GBT);
     b - a
     a^3 - 1
    gap>


SGrobnerTrace
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``SGrobnerTrace( Lnp )`` devuelve una base de Gröbner, trazable.

Para obtener una lista de polinomios no conmutativos ``Lnp``, esta función utilizará el **algoritmo de Buchberger** con forma normal fuerte para encontrar una base de Gröbner ``G`` (si es posible; el problema general no tiene solución).

Los resultados serán trazables. Las funciones que pueden imprimir la **base de Gröbner** son ``PrintTraceList (3.7.2)`` (con la traza) y ``PrintNPListTrace (3.7.4)`` (sin la traza).

.. code-block:: gap
    :caption: Ejemplo-SGrobnerTrace
    :name: Ejemplo_SGrobnerTrace
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-SGrobnerTrace
    gap> # Para la lista de los siguientes dos polinomios en formato NP, se calcula una base de Gröbner trazada.
    gap> p1 := [[[1,1,2],[]],[1,-1]];;
    gap> p2 := [[[2,2,1],[]],[1,-1]];;
    gap> GBT := SGrobnerTrace([p1,p2]);
    [ rec( pol := [ [ [ 2 ], [ 1 ] ], [ 1, -1 ] ], trace := [ [ [  ], 1, [ 2, 1, 1, 2 ], -1 ], [ [ 2 ], 1, [  ], -1 ],
              [ [ 1 ], 1, [  ], 1 ], [ [ 1, 1 ], 2, [ 1, 2 ], 1 ] ] ),
      rec( pol := [ [ [ 1, 1, 1 ], [  ] ], [ 1, -1 ] ],
          trace := [ [ [ 2 ], 1, [ 2, 1 ], 1 ], [ [  ], 1, [ 2, 1, 1 ], 1 ], [ [  ], 2, [  ], 1 ],
              [ [ 2, 1, 1 ], 2, [  ], -1 ], [ [ 1, 1 ], 2, [ 1 ], -1 ] ] ) ]


StrongNormalFormTraceDiff
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``StrongNormalFormTraceDiff( np, GBT )`` devuelve el polinomio trazado para la diferencia de ``f`` con la forma normal fuerte de ``np`` con respecto a ``GBT``.

Cuando se invoca con un polinomio ``np`` en formato ``NP`` como primer argumento, y un ``GBT`` basado en Gröbner con seguimiento generado por ``SGrobnerTrace (3.7.5)``, esta función devuelve la diferencia de ``np`` con la forma normal fuerte de ``np`` con respecto a ``GBT``. Esta diferencia d se devuelve como un polinomio trazado. La información de rastreo ``d.trace`` da una expresión de ``d.pol`` como una combinación de polinomios de la lista de polinomios a los que se refieren las partes de rastreo de ``GBT``. Normalmente, este es el conjunto de relaciones que se utilizan como entrada para el cálculo de ``GBT``.

Tenga en cuenta que la diferencia de los polinomios ``np`` y ``d.pol`` es la misma que la ``StrongNormalForm`` de ``np``.

.. code-block:: gap
    :caption: Ejemplo-StrongNormalFormTraceDiff
    :name: Ejemplo_StrongNormalFormTraceDiff
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-StrongNormalFormTraceDiff
    gap> # Primero calculamos la base de Gröbner trazada de la lista de los siguientes dos polinomios en formato NP.
    gap> p1 := [[[1,1,2],[]],[1,-1]];;
    gap> p2 := [[[2,2,1],[]],[1,-1]];;
    gap> GBT := SGrobnerTrace([p1,p2]);;
    gap> # Del polinomio a^6 calculamos su diferencia con la forma normal.
    gap> # El resultado se imprime mediante el uso de PrintNP y PrintTraceList.
    gap> f := [[[1,1,1,1,1,1]],[1]];;
    gap> sf := StrongNormalFormTraceDiff(f,GBT);;
    gap> PrintNP(sf.pol);
     a^6 - 1
    gap> PrintTraceList([sf]);
     G(1)ba^2 + bG(1)ba + G(1)ba^5 + bG(1)ba^4 + G(2) + G(2)a^3 - a^2G(2)a - ba^2G(2) - a^2G(2)a^4 - ba^2G(2)a^3
    gap>


Funciones de la variante truncada
------------------------------------------------------

Ejemplos
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Puede encontrar más información sobre estas funciones en ``A.4``.

SGrobnerTrunc
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``SGrobnerTrunc( Lnp, deg, wtv )`` devuelve una lista de polinomios ``NP`` homogéneos si el primer argumento de la entrada es una lista de polinomios ``NP`` homogéneos y el booleano ``false`` en caso contrario.

Estas funciones deben invocarse con una lista ``Lnp`` de polinomios en formato ``NP``, un número natural ``deg`` y un vector de peso ``wtv`` de longitud el número de generadores del álgebra libre ``A`` que contiene los elementos de ``Lnp``, y con enteros positivos para las entradas. Si los polinomios de ``Lnp`` son homogéneos con respecto a ``wtv``, la función devolverá una base de Gröbner de ``Lnp`` truncada por encima de ``deg``. Si la lista de polinomios ``Lnp`` no es homogénea con respecto a ``wtv``, devuelve ``false``. El control de homogeneidad puede ser realizado por ``CheckHomogeneousNPs (3.8.3)``.


.. code-block:: gap
    :caption: Ejemplo-SGrobnerTrunc
    :name: Ejemplo_SGrobnerTrunc
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-SGrobnerTrunc
    gap> # Considere los siguientes dos polinomios en formato NP.
    gap> p1 := [ [ [ 1, 2, 2, 1 ], [ 2, 1, 1, 2 ] ], [ 1, -1 ] ];;
    gap> p2 := [ [ [ 2, 2, 2 ], [ 1, 1 ] ], [ 1, -1 ] ];;
    gap> PrintNPList( [ p1, p2 ] );
     ab^2a - ba^2b
     b^3 - a^2
    gap> # Son homogéneos con respecto a los pesos [3,2]. Los grados son 10 y 6, respectivamente.
    gap> # La base de Gröbner truncada por encima del grado 12 de la lista [p1, p2] se calcula y
    gap> # posteriormente se imprime como sigue.
    gap> PrintNPList( SGrobnerTrunc( [ p1, p2 ], 12, [ 3, 2 ] ) );
     ba^2 - a^2b
     b^3 - a^2
     ab^2a - a^2b^2
    gap>

CheckHomogeneousNPs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``CheckHomogeneousNPs( Lnp, wtv )`` devuelve una lista de grados ponderados de los polinomios si son homogéneos con respecto a ``wtv`` y ``false`` en caso contrario.

Cuando se invoca con una lista ``Lnp`` de polinomios ``NP``  y un vector de peso ``wtv`` (cuyas entradas deben ser enteros positivos), esta función devuelve la lista de grados ponderados de los polinomios en ``Lnp`` si todos son homogéneos y distintos de cero, y ``false`` en caso contrario. Aquí, un polinomio es (ponderado) homogéneo con respecto a un vector de peso :math:`w` si hay una constante :math:`d` tal que, para cada monomio :math:`[t_{1}, \dots, t_{r}]` del polinomio, la suma de todos :math:`w[t_{i}]` para :math:`i` en :math:`[1\dots r]` es igual a :math:`d`. El número natural :math:`d` se llama entonces grado ponderado del polinomio.

.. code-block:: gap
    :caption: Ejemplo-CheckHomogeneousNPs
    :name: Ejemplo_CheckHomogeneousNPs
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-CheckHomogeneousNPs
    gap> # Considere los siguientes dos polinomios en formato NP.
    gap> p1 := [ [ [ 1, 2, 2, 1 ], [ 2, 1, 1, 2 ] ], [ 1, -1 ] ];;
    gap> p2 := [ [ [ 2, 2, 2 ], [ 1, 1 ] ], [ 1, -1 ] ];;
    gap> PrintNPList( [ p1, p2 ] );
     ab^2a - ba^2b
     b^3 - a^2
    gap> # Son homogéneos con respecto a los pesos [3,2]. Los grados son 10 y 6, respectivamente.
    gap> # Esto se verifica de la siguiente manera.
    gap> CheckHomogeneousNPs( [ p1, p2 ], [ 3, 2 ] );
    [ 10, 6 ]
    gap>


BaseQATrunc
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``BaseQATrunc( Lnp, deg, wtv )`` devuelve una lista de monomios si el primer argumento de la entrada es una lista de polinomios ``NP`` homogéneos o ``false``.

Cuando se invoca con una lista de polinomios ``Lnp``, un número natural ``deg`` y un vector de peso ``wtv`` de longitud el número de variables y con enteros positivos para las entradas, de modo que los polinomios de ``Lnp`` son homogéneos con respecto a ``wtv``, devuelve una lista cuya :math:`i`-ésima entrada es una base de monomios de la parte homogénea de grado :math:`i−1` el álgebra cociente del álgebra libre no conmutativa por el ideal homogéneo ponderado generado por ``Lnp`` truncado por encima de ``deg``. Si la lista de polinomios ``Lnp`` no es homogénea, devuelve ``false``.

.. code-block:: gap
    :caption: Ejemplo-BaseQATrunc
    :name: Ejemplo_BaseQATrunc
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-BaseQATrunc
    gap> # Considere la base de Gröbner truncada de los siguientes dos polinomios en formato NP.
    gap> p1 := [ [ [ 1, 2, 2, 1 ], [ 2, 1, 1, 2 ] ],[ 1, -1 ] ];;
    gap> p2 := [ [ [ 2, 2, 2 ], [ 1, 1 ] ], [ 1, -1 ] ];;
    gap> wtv := [ 3, 2 ];;
    gap> GB := SGrobnerTrunc( [ p1, p2 ], 12, wtv );;
    gap> GBNP.ConfigPrint( "x", "y" );
    gap> PrintNPList( GB );
     yx^2 - x^2y
     y^3 - x^2
     xy^2x - x^2y^2
    gap> # Se encuentra e imprime una base de monomios estándar de la siguiente manera.
    gap> BT := BaseQATrunc( GB, 12, wtv );;
    gap> for degpart in BT do
    >   for mon in degpart do PrintNP( [ [ mon ], [ 1 ] ] ); od;
    > od;
     1
     y
     x
     y^2
     yx
     xy
     x^2
     y^3
     y^2x
     yxy
     xy^2
     xyx
     x^2y
     y^4
     x^3
     y^3x
     y^2xy
     yxy^2
     xy^3
     yxyx
     xyxy
     x^2y^2
     y^5
     x^2yx
     y^4x
     x^3y
     y^3xy
     y^2xy^2
     yxy^3
     xy^4
     x^4
     y^2xyx
     xy^3x
     yxyxy
     xyxy^2
     x^2y^3
     y^6
    gap>

DimsQATrunc
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``DimsQATrunc( Lnp, deg, wtv )`` devuelve una lista de monomios si el primer argumento de la entrada es una lista de polinomios ``NP`` homogéneos o ``false``.

Cuando se invoca con una lista de polinomios Lnp, un número natural ``deg`` y un vector de peso ``wtv`` de longitud el número de variables y con enteros positivos para las entradas, de manera que los polinomios de ``Lnp`` son homogéneos con respecto a ``wtv``, devuelve una lista dimensiones de las partes homogéneas del álgebra cociente del álgebra libre no conmutativa por el ideal generado por ``Lnp`` truncado por encima de ``deg``. La :math:`i`-ésima entrada de la lista da la dimensión de la parte homogénea del grado La :math:`i-1` del álgebra del cociente. Si la lista de polinomios ``Lnp`` no es homogénea, devuelve ``false``.

.. code-block:: gap
    :caption: Ejemplo-DimsQATrunc
    :name: Ejemplo_DimsQATrunc
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-DimsQATrunc
    gap> # Considere la base de Gröbner truncada de los siguientes dos polinomios en formato NP.
    gap> p1 := [ [ [ 1, 2, 2, 1 ], [ 2, 1, 1, 2 ] ], [ 1, -1 ] ];;
    gap> p2 := [ [ [ 2, 2, 2 ], [ 1, 1 ] ], [ 1, -1 ] ];;
    gap> wtv := [ 3, 2 ];;
    gap> GB := SGrobnerTrunc( [ p1, p2 ], 12, wtv );;
    gap> # La información sobre las dimensiones de las partes homogéneas del álgebra del cociente
    gap> # se encuentra de la siguiente manera,
    gap> DimsQATrunc( GB, 12, wtv );
    [ 1, 0, 1, 1, 1, 2, 2, 3, 3, 5, 4, 7, 7 ]
    gap>


FreqsQATrunc
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``FreqsQATrunc( Lnp, deg, wtv )`` devuelve una lista de multiplicidades de frecuencias de monomios si el primer argumento de la entrada es una lista de polinomios homogéneos en formato ``NP`` y ``false`` en caso contrario.

La frecuencia de un monomio es la lista de números de ocurrencias de una variable en el monomio para cada variable; la multiplicidad de una frecuencia es el número de monomios en la base estándar para un álgebra cociente con esta frecuencia. Cuando se invoca con una lista ``Lnp`` de polinomios en formato ``NP`` que representan una **base de Gröbner** (truncada), un número natural ``deg`` y un vector de peso ``wtv`` de longitud el número de variables y con enteros positivos para las entradas, de modo que los polinomios de ``Lnp`` sean homogéneos con respecto a ``wtv``, devuelve una lista de frecuencias que ocurren con sus multiplicidades para el álgebra cociente del álgebra libre no conmutativa por el ideal generado por ``Lnp`` truncado por encima de ``deg``. La :math:`i`-ésima entrada de la lista da las frecuencias de los monomios base ponderados (:math:`i−1`) del álgebra del cociente. Si la lista de polinomios ``Lnp`` no es homogénea con respecto a ``wtv``, devuelve ``false``.


.. code-block:: gap
    :caption: Ejemplo-FreqsQATrunc
    :name: Ejemplo_FreqsQATrunc
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-FreqsQATrunc
    gap> # Considere la base de Gröbner truncada de los siguientes dos polinomios en formato NP.
    gap> p1 := [ [ [ 1, 2, 2, 1 ], [ 2, 1, 1, 2 ] ], [ 1, -1 ] ];;
    gap> p2 := [ [ [ 2, 2, 2 ], [ 1, 1 ] ], [ 1, -1 ] ];;
    gap> wtv := [ 3, 2 ];;
    gap> GB := SGrobnerTrunc( [ p1, p2 ], 12, wtv );;
    gap> PrintNPList( GB );
     ba^2 - a^2b
     b^3 - a^2
     ab^2a - a^2b^2
    gap> # Las multiplicidades de las frecuencias de monomios en una base estándar del álgebra
    gap> # del cociente con respecto al ideal generado por GB se encuentran de la siguiente manera,
    gap> # para pesos hasta 8 inclusive.
    gap> F := FreqsQATrunc( GB, 8, wtv );
    [ [ [ [  ], 1 ] ], [ [ [ 0, 1 ], 1 ] ], [ [ [ 1, 0 ], 1 ] ], [ [ [ 0, 2 ], 1 ] ], [ [ [ 1, 1 ], 2 ] ],
      [ [ [ 2, 0 ], 1 ], [ [ 0, 3 ], 1 ] ], [ [ [ 1, 2 ], 3 ] ], [ [ [ 2, 1 ], 2 ], [ [ 0, 4 ], 1 ] ] ]
    gap> # La interpretación de estos datos viene dada por las siguientes líneas de código.
    gap> for f in F do
    >   if f[1][1] <> [] then
    >     Print("A nivel ", wtv * (f[1][1]), " las multiplicidades son\n");
    >     for x in f do
    >       Print("  para ",x[1],": ",x[2],"\n");
    >     od;
    >   else
    >     Print("A nivel ", 0 , " la multiplicidad de [] es ",f[1][2],"\n");
    >   fi;
    >   Print("\n");
    > od;
    A nivel 0 la multiplicidad de [] es 1
    
    A nivel 2 las multiplicidades son
      para [ 0, 1 ]: 1
    
    A nivel 3 las multiplicidades son
      para [ 1, 0 ]: 1
    
    A nivel 4 las multiplicidades son
      para [ 0, 2 ]: 1
    
    A nivel 5 las multiplicidades son
      para [ 1, 1 ]: 2
    
    A nivel 6 las multiplicidades son
      para [ 2, 0 ]: 1
      para [ 0, 3 ]: 1
    
    A nivel 7 las multiplicidades son
      para [ 1, 2 ]: 3
    
    A nivel 8 las multiplicidades son
      para [ 2, 1 ]: 2
      para [ 0, 4 ]: 1
    
    gap>


Funciones de la variante del módulo
------------------------------------------------------


SGrobnerModule
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``SGrobnerModule( Lnpm, Lnp )`` devuelve un registro de GBR que contiene una **base de Gröbner** (si se encuentra... el problema general no tiene solución) para los módulos; ``GBR.p`` contendrá las reglas de prefijo y ``GBR.ts`` contendrá las reglas de dos caras, y ``GBR.pg`` será el rango más pequeño del módulo libre al que pertenecen todas las relaciones de prefijo.

Para obtener una lista ``Lnpm`` de vectores en formato NPM (ver ``Sección 2.1``), y una lista ``Lnp`` de polinomios en formato ``NP``, esta función usará el **algoritmo de Buchberger** con una forma normal fuerte aplicada a la unión de ``Lnpm``, ``Lnp``, el conjunto de polinomios :math:`x \ast e - x` y :math:`x \ast m [i]` para :math:`x` una indeterminado estándar, un generador de módulo :math:`m[j]` o la indeterminada ficticia :math:`e`, y el conjunto de todos :math:`e \ast x - x` para :math:`x` un indeterminado estándar, para encontrar un registro de **base de Gröbner** ``GBR`` (si es posible, el problema general no tiene solución). Este registro tendrá un ``GBR.ts`` de **base de Gröbner** para el ideal de dos lados generado por ``Lnp`` y una intersección con el módulo ``GBR.p`` que representa las relaciones del módulo necesarias para encontrar vectores representativos en el módulo de forma única por medio de un cálculo de forma normal fuerte modificando ``GBR.py`` y, para los escalares, ``GBR.ts``.


.. code-block:: gap
    :caption: Ejemplo-SGrobnerModule
    :name: Ejemplo_SGrobnerModule
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-SGrobnerModule
    gap> # Considere los siguientes dos polinomios en formato NP.
    gap> p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -2 ] ];;
    gap> p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -3 ] ];;
    gap> # Considere también los siguientes dos vectores en formato NPM.
    gap> v1 := [ [ [ -1, 1, 2 ], [ -1 ] ], [ 1, -1 ] ];;
    gap> v2 := [ [ [ -2, 2, 2 ], [ -2 ] ], [ 1, -2 ] ];;
    gap> # SGrobnerModule encuentra el registro base de Gröbner para estos datos
    gap> GBR := SGrobnerModule( [ v1, v2 ], [ p1, p2 ] );;
    gap> # El registro GBR tiene dos campos, p para relaciones de prefijo (vectores en el módulo)
    gap> # y ts para relaciones de dos lados (polinomios en el álgebra):
    gap> PrintNPList( GBR.p );
    [ 0, 1 ]
    [ 1 , 0]
    gap> PrintNPList( GBR.ts );
     b - 3/2a
     a^3 - 4/3
    gap>

BaseQM
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``BaseQM( GBR, t, mt, maxno )`` devuelve una base del módulo obtenido del módulo libre de rango ``mt`` sobre el álgebra libre en generadores ``t`` factorizando el submódulo generado por los elementos de ``GBR``.

Cuando se llama con un registro de **base de Gröbner** ``GBR`` (consulte la ``Sección 2.8``), el número de variables ``t``, el número de generadores de módulo ``mt`` y un número máximo de términos que se pueden encontrar, ``maxno``, la función ``BaseQM`` devolverá una base (parcial) de el módulo cociente de :math:`A^{mt}` sobre el álgebra libre en los generadores :math:`A` en ``t`` por el submódulo :math:`A` derecho generado por los elementos de ``GBR``. Tenga en cuenta que el registro ``GBR`` consta de dos campos: la lista ``GBR.p`` de vectores en formato ``NPM`` que representan elementos del módulo libre :math:`A^{mt}` y la lista ``GBR.ts`` de polinomios en formato ``NP`` que representan elementos de :math:`A`. El submódulo generado por ``GBR`` es se considera que es el submódulo derecho de :math:`A^{mt}` generado por ``GBR.py`` todos los elementos de la forma :math:`v \cdot np` con np en el ideal bilateral de :math:`A` generado por ``GBR.ts`` y :math:`v` en :math:`A^{mt}`.

    - Si esta función se invoca con ``maxno`` igual a ``0``, se dará una base completa.

    - Si ``t = 0``, entonces t se establecerá en el valor mínimo de modo que todos los polinomios de ``GBR.ts`` y todos los polinomios que aparecen en ``GBR.p`` tengan como máximo ``t`` variables.
    
    - Si ``mt = 0``, entonces mt se establecerá en el valor mínimo de modo que todos los vectores de ``GBR.p`` pertenezcan a :math:`A^{mt}`.
    
    - Si el módulo es cíclico (es decir, tiene un solo generador), es posible utilizar la **base de Gröbner** del ideal en el álgebra en lugar del registro de la **base de Gröbner**. Esto se puede hacer ingresando ``0`` para el número ``mt`` de generadores de módulos.

.. code-block:: gap
    :caption: Ejemplo-BaseQM
    :name: Ejemplo_BaseQM
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-BaseQM
    gap> # Considere los siguientes dos polinomios en formato NP.
    gap> p1 := [ [ [ 1, 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
    gap> p2 := [ [ [ 2, 2, 2, 1 ], [ ] ], [ 1, -1 ] ];;
    gap> # Considere también los siguientes dos vectores en formato NPM.
    gap> v1 := [[[-1,1,2],[-1]],[1,-1]];;
    gap> v2 := [[[-2,2,2],[-2]],[1,-2]];;
    gap> # SGrobnerModule encuentra el registro base de Gröbner para estos datos
    gap> GBR := SGrobnerModule([v1,v2],[p1,p2]);;
    gap> PrintNPList(GBR.ts);
     ba - ab
     b^2 - a^2
     a^3b - 1
     a^5 - b
    gap> PrintNPList(GBR.p);
    [ 0, 1 ]
    [ b - a , 0]
    [ a^2 - 1 , 0]
    [ ab - 1 , 0]
    gap> # La función BaseQM calcula una base.
    gap> B := BaseQM(GBR,2,2,0);;
    gap> PrintNPList(B);
    [ 1 , 0]
    [ a , 0]
    gap> # La función BaseQM con argumentos para que el número de dimensiones del
    gap> # módulo y el número de variables sean mínimos.
    gap> B := BaseQM(GBR,0,0,0);;
    gap> PrintNPList(B);
    [ 1 , 0]
    [ a , 0]
    gap> # La función BaseQM también se puede utilizar para calcular los tres primeros elementos
    gap> # de una base.
    gap> B := BaseQM(GBR,2,2,3);;
    gap> PrintNPList(B);
    [ 1 , 0]
    [ a , 0]
    gap>


DimQM
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``DimQM( GBR, t, mt )`` devuelve la dimensión del módulo de cociente.

Cuando se llama con un registro de base de Gröbner ``GBR ``(ver ``Sección 2.8``), un número de variables ``t`` al menos igual al número de generadores involucrados en los polinomios de ``GBR.p`` y ``GBR.ts``, y un número de generadores ``mt`` de un módulo libre que contiene las relaciones de prefijo en ``GBR.p``, la función ``DimQM`` devolverá la dimensión sobre el campo de coeficientes del módulo de cociente del módulo derecho libre :math:`A^{mt}` de rango ``mt`` sobre el álgebra libre :math:`A` en los generadores ``t`` por el submódulo :math:`A` derecho generado por los elementos de ``GBR``, si esta dimensión es finita. De lo contrario, el cálculo invocado por la función no terminará.

    - Si ``t = 0``, entonces ``t`` se establecerá en el valor mínimo de modo que todos los polinomios de ``GBR.ts`` y todos los polinomios que aparecen en ``GBR.p`` pertenezcan a :math:`A^{mt}`.

    - Si ``mt = 0``, entonces ``mt`` se establecerá en el valor mínimo de modo que todos los vectores de ``GBR.p`` pertenezcan a :math:`A^{mt}`.


.. code-block:: gap
    :caption: Ejemplo-DimQM
    :name: Ejemplo_DimQM
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-DimQM
    gap> # Considere los siguientes dos polinomios en formato NP.
    gap> p1 := [ [ [ 1, 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
    gap> p2 := [ [ [ 2, 2, 2, 1 ], [ ] ], [ 1, -1 ] ];;
    gap> # Considere también los siguientes dos vectores en formato NPM.
    gap> v1 := [ [ [ -1, 1, 2 ], [ -2 ] ], [ 1, -1 ] ];;
    gap> v2 := [ [ [ -2, 2, 2 ], [ -1 ] ], [ 1, -2 ] ];;
    gap> # SGrobnerModule encuentra el registro base de Gröbner para estos datos:
    gap> GBR := SGrobnerModule( [ v1, v2 ], [ p1, p2 ] );;
    gap> # La función DimQM calcula la dimensión sobre los racionales del cociente del módulo libre
    gap> # sobre el álgebra libre en dos generadores por el submódulo generado por los vectores
    gap> # v1, v2, [p, q], donde p y q corren sobre todos los elementos de el ideal de dos caras
    gap> # en el álgebra libre generado por p1 y p2.
    gap> SetInfoLevel( InfoGBNP, 2 );
    gap> DimQM( GBR, 2, 2 );
    0
    gap> # La respuesta debe ser igual al tamaño de BaseQM (GBR, t, mt, 0).
    gap> DimQM( GBR, 2, 2 ) = Length( BaseQM( GBR, 2, 2, 0 ) );
    true
    gap> SetInfoLevel( InfoGBNP, 0 );
    gap>


MulQM
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``MulQM( p1, p2, GBR )`` devuelve la forma normal fuerte del producto ``p1 ∗ p2`` con respecto a ``GBR``.

Cuando se llama con tres argumentos,

    1. el primero de los cuales, ``p1``, es un elemento de módulo en formato ``NPM``,
    2. el segundo de los cuales, ``p2``, es un polinomio en formato ``NP`` que representa un elemento del álgebra del cociente, y
    3. el tercero es un registro de una base de Gröbner ``GBR``, esta función devolverá el producto ``p1 * p2`` en el módulo.


.. code-block:: gap
    :caption: Ejemplo-MulQM
    :name: Ejemplo_MulQM
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-MulQM
    gap> # Considere los siguientes dos polinomios en formato NP.
    gap> p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
    gap> p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -1 ] ];;
    gap> PrintNPList( [ p1, p2 ] );
     a^2b - 1
     ab^2 - 1
    gap> # Considere también los siguientes dos vectores en formato NPM.
    gap> v1 := [ [ [ -1, 1, 2 ], [ -1 ] ], [ 1, -1 ] ];;
    gap> v2 := [ [ [ -2, 2, 2 ], [ -2 ] ], [ 1, -2 ] ];;
    gap> PrintNPList( [ v1, v2 ] );
    [ ab - 1 ]
    [ 0, b^2 - 2 ]
    gap> # SGrobnerModule encuentra el registro base de Gröbner para estos datos:
    gap> GBR := SGrobnerModule( [ v1, v2 ], [ p1, p2 ] );;
    gap> PrintNPList( GBR.ts );
     b - a
     a^3 - 1
    gap> PrintNPList( GBR.p );
    [ 0, 1 ]
    [ a - 1 , 0]
    gap> # La función MulQM calcula el producto del vector w con el polinomio q.
    gap> w := [ [ [ -1, 2 ], [ -2, 1 ] ], [ 1, -4 ] ];;
    gap> PrintNP( w );
    [ b , - 4a ]
    gap> q := [ [ [ 2, 2, 1 ], [ 1 ] ], [ 2, 3 ] ];;
    gap> PrintNP( q );
     2b^2a + 3a
    gap> wq := MulQM( w, q, GBR );;
    gap> PrintNP( wq );
    [ 5 , 0]
    gap>

StrongNormalFormNPM
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La función ``StrongNormalFormNPM( f, GBR )`` devuelve la forma normal fuerte de un polinomio en formato ``NP`` con respecto a ``GBR``.

Cuando se invoca con un polinomio en formato ``NP`` (ver ``Sección 2.1``) y un registro de **base de Gröbner** ``GBR`` (ver ``Sección 2.8``), esta función devolverá la forma normal fuerte (el polinomio reducido por el prefijo y las relaciones bilaterales de la combinación de bases de Gröbner ).

Esta función asume que ``GBR.p`` y ``GBR.ts`` están ordenados (con el orden ``LtNP (3.3.9)``), que los polinomios en ``GBR.ts`` son monos y limpios (consulte ``MkMonicNP (3.3.11)`` y ``CleanNP (3.3.7 )``), y que el polinomio ``f`` está limpio.

.. note::
    
    Tengamos en cuenta que un registro de **base de Gröbner** devuelto por una función como ``SGrobnerModule (3.9.1)`` tiene el formato requerido.



.. code-block:: gap
    :caption: Ejemplo-StrongNormalFormNPM
    :name: Ejemplo_StrongNormalFormNPM
    
    gap> LoadPackage("GBNP","0",false);
    true
    gap> # Ejemplo-StrongNormalFormNPM
    gap> # Considere los siguientes dos polinomios en formato NP.
    gap> p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
    gap> p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -1 ] ];;
    gap> PrintNPList( [ p1, p2 ] );
     a^2b - 1
     ab^2 - 1
    gap> # Considere también los siguientes dos vectores en formato NPM.
    gap> v1 := [ [ [ -1, 1, 2 ], [ -1 ] ], [ 1, -1 ] ];;
    gap> v2 := [ [ [ -2, 2, 2 ], [ -2 ] ], [ 1, -2 ] ];;
    gap> PrintNPList( [ v1, v2 ] );
    [ ab - 1 ]
    [ 0, b^2 - 2 ]
    gap> # SGrobnerModule encuentra el registro base de Gröbner para estos datos:
    gap> GBR := SGrobnerModule( [ v1, v2 ], [ p1, p2 ] );;
    gap> PrintNPList( GBR.ts );
     b - a
     a^3 - 1
    gap> PrintNPList( GBR.p );
    [ 0, 1 ]
    [ a - 1 , 0]
    gap> # El vector w adquiere una forma normal fuerte con respecto a GBR:
    gap> w := [ [ [ -1, 2 ], [ -2, 1 ] ], [ 1, -4 ] ];;
    gap> PrintNP( w );
    [ b , - 4a ]
    gap> v := StrongNormalFormNPM( w, GBR );;
    gap> PrintNP( v );
    [ 1 , 0]
    gap>

