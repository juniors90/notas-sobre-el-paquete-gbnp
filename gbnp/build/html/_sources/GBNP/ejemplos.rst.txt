Ejemplos
==================

Un simple cálculo conmutativo de la base de Gröbner
------------------------------------------------------

En este ejemplo conmutativo, las relaciones son

    - :math:`x^{2}y-1`, 
    - :math:`xy^{2}-1` y
    - agregamos :math:`xy-yx` para hacer cumplir que :math:`x` e :math:`y` se conmutan.

La respuesta debería ser :math:`\{x ^ 3-1, x-y, xy-yx\}`, ya que el orden de reducción es el grado total primero y luego lexicográfico con :math:`x` menor que :math:`y`.

    1. Primero, cargamos el paquete con el comando ``LoadPackage("GBNP","0",false);``
    2. establecemos el nivel de información estándar ``InfoGBNP`` en :math:`2`
    3. establecemos el nivel de información de tiempo ``InfoGBNPTime`` en :math:`1` (para obtener más información sobre el nivel de información, consulte el capítulo :doc:`4-nivel-de-informacion`).

.. code-block:: gap
    :caption: Un simple cálculo conmutativo de la base de Gröbner
    :name: un_simple_calculo_conmutativo_de_la_base_de_grobner

    gap> LoadPackage("GBNP","0",false);
    true
    gap> SetInfoLevel(InfoGBNP,2);
    gap> SetInfoLevel(InfoGBNPTime,1);
    gap> # Luego ingresamos las relaciones en formato NP (vea la Sección NP).
    gap> # Estas se incluirán en la lista Lnp, que inicialmente posee la relacion xy - yx.
    gap> Lnp := [ [ [ [ 1, 2 ], [ 2, 1 ] ],[ 1, -1 ] ] ];
    [ [ [ [ 1, 2 ], [ 2, 1 ] ], [ 1, -1 ] ] ]
    gap> x2y := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];
    [ [ [ 1, 1, 2 ], [  ] ], [ 1, -1 ] ]
    gap> AddSet( Lnp, x2y );
    gap> xy2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -1 ] ];
    [ [ [ 1, 2, 2 ], [  ] ], [ 1, -1 ] ]
    gap> AddSet( Lnp, xy2 );
    gap> # Las relaciones se pueden exhibir con PrintNPList:
    gap> PrintNPList(Lnp);
     a^2b - 1
     ab - ba
     ab^2 - 1
    gap> # Sean las indeterminadas x e y (en lugar de a y b),
    gap> # las cuales las definimos mediante GBNP.ConfigPrint
    gap> GBNP.ConfigPrint( "x", "y" );
    gap> # La base de Gröbner ahora se puede calcular con SGrobner:
    gap> GB := SGrobner( Lnp );
    #I  number of entered polynomials is 3
    #I  number of polynomials after reduction is 3
    #I  End of phase I
    #I  End of phase II
    #I  length of G =1
    #I  length of todo is 1
    #I  length of G =2
    #I  length of todo is 0
    #I  List of todo lengths is [ 1, 1, 0 ]
    #I  End of phase III
    #I  G: Cleaning finished, 0 polynomials reduced
    #I  End of phase IV
    #I  The computation took 0 msecs.
    [ [ [ [ 2 ], [ 1 ] ], [ 1, -1 ] ], [ [ [ 1, 1, 1 ], [  ] ], [ 1, -1 ] ] ]
    gap> # Cuando se imprime, se ve así:
    gap> PrintNPList( GB );
     y - x
     x^3 - 1
    gap> # La dimensión del álgebra del cociente se puede calcular con DimQA.
    gap> # Los argumentos son la base de Gröbner GB y el número de indeterminadas es 2:
    gap> DimQA( GB, 2);
    3
    gap> # Una base de este álgebra cociente se puede calcular con BaseQA.
    gap> # Los argumentos son una base de Gröbner GB, el número de indeterminadas t (= 2) y una
    gap> # variable maxno para devolver álgebras de cociente parcial (0 significa base completa).
    gap> # También se imprimirá la base calculada.
    gap> B := BaseQA( GB, 2, 0 );;
    gap> PrintNPList( B );
     1
     x
     x^2
    gap> # La forma normal fuerte del elemento xyxyxyx se puede encontrar mediante
    gap> # el uso de StrongNormalFormNP.
    gap> # Los argumentos son este elemento y la base de Gröbner GB.
    gap> f:=[ [ [ 1, 2, 1, 2, 1, 2, 1 ] ], [ 1 ] ];;
    gap> PrintNP( f );
     xyxyxyx
    gap> p := StrongNormalFormNP( f, GB );;
    gap> PrintNP( p );
     x
    gap>


