# Ejemplo-BimulNP
# Considere los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -3 ] ];;
p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -4 ] ];;
# Multiplicar p1 de la derecha por by multiplicar p2 de
# la izquierda por a es posible con la función BimulNP:
PrintNP( BimulNP( [ ], p1, [2] ) );
PrintNP( BimulNP( [ 1 ], p2, [ ] ) );