# Ejemplo-SGrobnerModule
# Considere los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -2 ] ];;
p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -3 ] ];;
# Considere también los siguientes dos vectores en formato NPM.
v1 := [ [ [ -1, 1, 2 ], [ -1 ] ], [ 1, -1 ] ];;
v2 := [ [ [ -2, 2, 2 ], [ -2 ] ], [ 1, -2 ] ];;
# SGrobnerModule encuentra el registro base de Gröbner para estos datos
GBR := SGrobnerModule( [ v1, v2 ], [ p1, p2 ] );;
# El registro GBR tiene dos campos, p para relaciones de prefijo (vectores en el módulo)
# y ts para relaciones de dos lados (polinomios en el álgebra):
PrintNPList( GBR.p );
PrintNPList( GBR.ts );