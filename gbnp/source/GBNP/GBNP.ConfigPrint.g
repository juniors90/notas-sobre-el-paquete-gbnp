# Ejemplo-ConfigPrint
# Considere los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 1, 2 ],[ ] ],[ 1,-1 ] ];;
p2 := [ [ [ 1, 2, 2 ],[ ] ],[ 1,-1 ] ];;
# Ellos pueden ser impresos por la función PrintNP.
PrintNP( p1 );
PrintNP( p2 );
# Podemos dejar que las variables se impriman como xey en lugar de a y b
# mediante GBNP.ConfigPrint
GBNP.ConfigPrint( "x" , "y" );
PrintNP( p1 );
PrintNP( p2 );
# También podemos dejar que las variables se impriman como x.1 y x.2 en
# lugar de a y b mediante GBNP.ConfigPrint.
GBNP.ConfigPrint( 2 , "x" );
PrintNP( p1 );
PrintNP( p2 );
# Incluso podemos asignar cadenas a las variables a imprimir como alice y bob
# en lugar de ayb mediante GBNP.ConfigPrint.
GBNP.ConfigPrint( "alice" , "bob" );
PrintNP( p1 );
PrintNP( p2 );
# Alternativamente, podemos introducir el álgebra libre A con dos generadores
# e imprimir los polinomios como miembros de A:
A:=FreeAssociativeAlgebraWithOne( Rationals, "a" , "b" );;
GBNP.ConfigPrint( A );
PrintNP( p1 );
PrintNP( p2 );