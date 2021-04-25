# Ejemplo-CheckHomogeneousNPs
# Considere los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 2, 2, 1 ], [ 2, 1, 1, 2 ] ], [ 1, -1 ] ];;
p2 := [ [ [ 2, 2, 2 ], [ 1, 1 ] ], [ 1, -1 ] ];;
PrintNPList( [ p1, p2 ] );
# Son homogéneos con respecto a los pesos [3,2]. Los grados son 10 y 6, respectivamente.
# Esto se verifica de la siguiente manera.
CheckHomogeneousNPs( [ p1, p2 ], [ 3, 2 ] );