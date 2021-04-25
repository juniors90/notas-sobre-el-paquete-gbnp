# Ejemplo-PrintNPListTrace
# Primero calculamos la base de Gröbner trazada de la lista de dos polinomios en formato NP.
# A continuación, imprimimos los polinomios encontrados mediante el uso de PrintNPListTrace.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 2, 2, 1 ], [ ] ], [ 1, -1 ] ];;
GBT := SGrobnerTrace( [ p1, p2 ] );;
PrintNPListTrace( GBT );