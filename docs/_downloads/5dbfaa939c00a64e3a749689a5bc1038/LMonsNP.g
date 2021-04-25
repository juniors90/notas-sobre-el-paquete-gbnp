# Ejemplo-LMonsNP
# Ponemos dos polinomios en formato NP en la lista Lnp.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -1 ] ];;
Lnp := [ p1, p2 ];;
# LMonsNP calcula la lista de los principales monomios:
LMonsNP( Lnp );
# Para una mejor impresión, los monomios se pueden convertir en polinomios en formato NP y
# luego enviarlos a PrintNPList:
PrintNPList( List( LMonsNP( Lnp ), q -> [ [ q ], [ 1 ] ] ) );
