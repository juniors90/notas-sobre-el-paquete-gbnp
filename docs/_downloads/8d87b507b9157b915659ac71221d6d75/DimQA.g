# Ejemplo-DimQA
# Considere la siguiente base de Gröbner.
p1 := [ [ [ 1, 1, 2 ], [ ] ], [ 1, -2 ] ];;
p2 := [ [ [ 1, 2, 2 ], [ ] ], [ 1, -2 ] ];;
G := Grobner( [ p1, p2 ] );;
PrintNPList( G );
# La función DimQA calcula la dimensión del álgebra cociente del álgebra libre sobre
# los racionales con generadores a y b por el ideal bilateral generado por G.
DimQA( G, 2 );