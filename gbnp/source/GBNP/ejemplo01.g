LoadPackage("GBNP","0",false);
SetInfoLevel(InfoGBNP,2);
SetInfoLevel(InfoGBNPTime,1);
# Luego ingrese las relaciones en formato NP (vea la Sección NP).
# Se incluirán en la lista Lnp.
Lnp := [ [ [ [ 1, 2 ], [ 2, 1 ] ],[ 1, -1 ] ] ];
x2y := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];
AddSet( Lnp, x2y );   
xy2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -1 ] ];
AddSet( Lnp, xy2 );
# Las relaciones se pueden exhibir con PrintNPList:
PrintNPList( Lnp );
# Sean las indeterminadas x e y (en lugar de a y b),
# las cuales las definimos mediante GBNP.ConfigPrint
GBNP.ConfigPrint( "x", "y" );
# La base de Gröbner ahora se puede calcular con SGrobner:
GB := SGrobner( Lnp );
# Cuando se imprime, se ve así:
PrintNPList( GB );
# La dimensión del álgebra del cociente se puede calcular con DimQA.
# Los argumentos son la base de Gröbner GB y el número de indeterminadas es 2:
DimQA( GB, 2);
# Una base de este álgebra cociente se puede calcular con BaseQA.
# Los argumentos son una base de Gröbner GB, el número de indeterminadas t (= 2) y
# una variable maxno para devolver álgebras de cociente parcial (0 significa base completa).
# También se imprimirá la base calculada.
B := BaseQA( GB, 2, 0 );;
PrintNPList( B );
# La forma normal fuerte del elemento xyxyxyx se puede encontrar mediante el uso de StrongNormalFormNP.
# Los argumentos son este elemento y la base de Gröbner GB.
f:=[ [ [ 1, 2, 1, 2, 1, 2, 1 ] ], [ 1 ] ];;
PrintNP( f );
p := StrongNormalFormNP( f, GB );;
PrintNP( p );
