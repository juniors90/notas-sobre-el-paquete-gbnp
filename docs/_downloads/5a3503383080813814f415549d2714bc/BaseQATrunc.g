# Ejemplo-BaseQATrunc
# Considere la base de Gröbner truncada de los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 2, 2, 1 ], [ 2, 1, 1, 2 ] ],[ 1, -1 ] ];;
p2 := [ [ [ 2, 2, 2 ], [ 1, 1 ] ], [ 1, -1 ] ];;
wtv := [ 3, 2 ];;
GB := SGrobnerTrunc( [ p1, p2 ], 12, wtv );;
GBNP.ConfigPrint( "a", "b" );
PrintNPList( GB );
# Se encuentra e imprime una base de monomios estándar de la siguiente manera.
BT := BaseQATrunc( GB, 12, wtv );;
for degpart in BT do 
  for mon in degpart do PrintNP( [ [ mon ], [ 1 ] ] ); od;
od;