# Ejemplo-AddNP
# Considere los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -3 ] ];;
p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -4 ] ];;
# El segundo se puede restar del primero mediante la función AddNP.
PrintNP( AddNP( p1, p2, 1, -1 ) );