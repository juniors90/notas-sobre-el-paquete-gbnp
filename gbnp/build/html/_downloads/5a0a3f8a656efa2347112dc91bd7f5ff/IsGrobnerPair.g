# Ejemplo-IsGrobnerPair
# Considere los siguientes cuatro polinomios en formato NP.
p1 := [ [ [ 1, 1, 2 ],[ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 1, 2, 2 ], [ ] ], [1, -1 ] ];;
q1 := [ [ [ 2 ], [ 1 ] ], [ 1, -1 ] ];;
q2 := [ [ [ 1, 1, 1 ], [ ] ], [ 1, -1 ] ];;
# La función IsGrobnerPair se utiliza para comprobar si algunas combinaciones de estos polinomios
# en dos listas proporcionan pares de Gröbner.
IsGrobnerPair( [ p1, p2, q1 ], [ q2 ] );
IsGrobnerPair( [ q1, q2 ], [ p1, p2 ] );
# La función IsGrobnerPair aplicada con una lista vacía como segundo argumento es una verificación
# de si el primer argumento es una base de Gröbner.
IsGrobnerPair( [ p1, p2 ], [ ] ) = IsGrobnerBasis( [ p1, p2 ] );