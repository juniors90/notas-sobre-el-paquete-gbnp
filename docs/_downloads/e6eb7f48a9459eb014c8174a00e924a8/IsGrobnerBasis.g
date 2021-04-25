# Ejemplo-IsGrobnerBasis
# Considere la siguiente lista de dos polinomios en formato NP.
Lnp := [ [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ], [ [ [ 1, 2, 2 ], [ ] ], [ 1, -1 ] ] ];;
PrintNPList( Lnp );
# La función IsGrobner comprueba si la lista es una base Gröbner.
IsGrobnerBasis( Lnp );
# Entonces, la respuesta debería ser cierta para el resultado de un cálculo de Gröbner:
IsGrobnerBasis( Grobner( Lnp ) );