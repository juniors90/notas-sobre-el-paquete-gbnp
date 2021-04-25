# Ejemplo-SGrobnerTrunc
# Considere los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 2, 2, 1 ], [ 2, 1, 1, 2 ] ], [ 1, -1 ] ];;
p2 := [ [ [ 2, 2, 2 ], [ 1, 1 ] ], [ 1, -1 ] ];;
PrintNPList( [ p1, p2 ] );
# Son homogéneos con respecto a los pesos [3,2]. Los grados son 10 y 6, respectivamente.
# La base de Gröbner truncada por encima del grado 12 de la lista [p1, p2] se calcula y
# posteriormente se imprime como sigue.
PrintNPList( SGrobnerTrunc( [ p1, p2 ], 12, [ 3, 2 ] ) );