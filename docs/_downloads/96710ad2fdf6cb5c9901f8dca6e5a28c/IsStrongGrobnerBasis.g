# Ejemplo-IsStrongGrobnerBasis
# Considere la siguiente lista de dos polinomios en formato NP.
Lnp := [ [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ], [ [ [ 1, 2, 2 ], [ ] ], [ 1, -1 ] ] ];;
PrintNPList( Lnp );
# La función IsStrongGrobner comprueba si la lista tiene una base sólida de Gröbner.
IsStrongGrobnerBasis( Lnp );
# Pero la respuesta debería ser cierta para el resultado de un cálculo sólido de Gröbner:
IsStrongGrobnerBasis( SGrobner( Lnp ) );
# Una base de Gröbner que no es una base de Gröbner fuerte:
B := SGrobner( Lnp );;
Add( B, AddNP( Lnp[1], B[1], 1, -1 ) );;
PrintNPList( B );
IsGrobnerBasis( B );
IsStrongGrobnerBasis( B );