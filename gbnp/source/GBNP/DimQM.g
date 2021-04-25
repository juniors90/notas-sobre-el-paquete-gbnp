# Ejemplo-DimQM
# Considere los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 2, 2, 2, 1 ], [ ] ], [ 1, -1 ] ];;
# Considere también los siguientes dos vectores en formato NPM.
v1 := [ [ [ -1, 1, 2 ], [ -2 ] ], [ 1, -1 ] ];;
v2 := [ [ [ -2, 2, 2 ], [ -1 ] ], [ 1, -2 ] ];;
# SGrobnerModule encuentra el registro base de Gröbner para estos datos:
GBR := SGrobnerModule( [ v1, v2 ], [ p1, p2 ] );;
# La función DimQM calcula la dimensión sobre los racionales del cociente del módulo libre
# sobre el álgebra libre en dos generadores por el submódulo generado por los vectores
# v1, v2, [p, q], donde p y q corren sobre todos los elementos de el ideal de dos caras
# en el álgebra libre generado por p1 y p2.
SetInfoLevel( InfoGBNP, 2 );
DimQM( GBR, 2, 2 );
# La respuesta debe ser igual al tamaño de BaseQM (GBR, t, mt, 0).
DimQM( GBR, 2, 2 ) = Length( BaseQM( GBR, 2, 2, 0 ) );
SetInfoLevel( InfoGBNP, 0 );