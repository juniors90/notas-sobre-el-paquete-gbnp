# Ejemplo-PrintTracePol
# Primero calculamos la base de Gröbner trazada de la lista de dos polinomios en formato NP.
# A continuación, imprimimos el polinomio de trazas de los miembros de la lista mediante el
# uso de PrintTracePol.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 2, 2, 1 ], [ ] ], [ 1, -1 ] ];;
GBT := SGrobnerTrace( [ p1, p2 ] );;
for np in GBT do PrintTracePol( np ); Print("\n"); od;