# Ejemplo-MatrixQA
# Considere los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 2, 2, 2, 1 ], [ ] ], [ 1, -1 ] ];;
# La matriz de multiplicación correcta por el primer indeterminado a en el álgebra
# del cociente con respecto al ideal generado por p1 y p2 se obtiene aplicando MatrixQA
# a la base de Gröbner de estos generadores y una base del álgebra del cociente como se
# encuentra en BaseQA
GB := Grobner( [ p1, p2 ] );;
B := BaseQA( GB, 2, 0 );;
PrintNPList( B );
Display( MatrixQA( 1, B, GB ) );
# La función también es aplicable a los registros base de Gröbner para módulos.
# Considere los siguientes dos vectores.
v1 := [ [ [ -1, 1, 2 ], [ -1 ] ], [ 1, -1 ] ];;
v2 := [ [ [ -2, 2, 2 ], [ -2 ] ], [1, -2 ] ];;
# SGrobnerModule encuentra el registro de la base de Gröbner para estos datos y BaseQM
# una base de módulo de cociente:
GBR := SGrobnerModule( [ v1, v2 ], [ p1, p2 ] );;
B := BaseQM( GBR, 2, 2, 0 );;
# La matriz de multiplicación correcta por a, el primer generador del álgebra libre, es
Display( MatrixQA( 1, B, GBR ) );