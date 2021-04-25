# Ejemplo-PrintTraceList
# Primero calculamos la base de Gröbner trazada de la lista de dos polinomios en
# formato NP y luego la imprimimos usando PrintTraceList.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 2, 2, 1 ], [ ] ], [ 1, -1 ] ];;
GBT := SGrobnerTrace( [ p1, p2 ] );;
PrintTraceList( GBT );