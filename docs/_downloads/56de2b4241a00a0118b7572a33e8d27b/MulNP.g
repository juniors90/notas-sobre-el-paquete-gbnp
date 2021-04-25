# Ejemplo-MulNP
# Considere los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -1 ] ];;
# La función MulNP multiplica los dos polinomios.
PrintNP( MulNP( p1, p2 ) );
# El hecho de que esta multiplicación no es conmutativa se ilustra con la siguiente comparación,
# usando MulNP dos veces y AddNP una vez.
PrintNP( AddNP( MulNP( p1, p2 ), MulNP( p2, p1 ), 1, -1 ) );