# Ejemplo-StrongNormalFormNPM
# Considere los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -1 ] ];;
PrintNPList( [ p1, p2 ] );
# Considere también los siguientes dos vectores en formato NPM.
v1 := [ [ [ -1, 1, 2 ], [ -1 ] ], [ 1, -1 ] ];;
v2 := [ [ [ -2, 2, 2 ], [ -2 ] ], [ 1, -2 ] ];;
PrintNPList( [ v1, v2 ] );
# SGrobnerModule encuentra el registro base de Gröbner para estos datos:
GBR := SGrobnerModule( [ v1, v2 ], [ p1, p2 ] );;
PrintNPList( GBR.ts );
PrintNPList( GBR.p );
# El vector w adquiere una forma normal fuerte con respecto a GBR:
w := [ [ [ -1, 2 ], [ -2, 1 ] ], [ 1, -4 ] ];;
PrintNP( w );
v := StrongNormalFormNPM( w, GBR );;
PrintNP( v );