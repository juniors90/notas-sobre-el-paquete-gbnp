# Ejemplo-PreprocessAnalysisQA
# Considere los siguientes dos polinomios en formato NP de los cuales se calcula una base de Gröbner.
F := GF( 256 );
z := GeneratorsOfField(F)[1];
p1 := [ [ [ 1, 1, 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 2, 2, 2, 1, 1, 1 ], [ ] ], [ 1, -1 ] ];;
GB := Grobner( [ p1, p2 ] );;
PrintNPList( GB );
# La aplicación de PreprocessAnalysisQA se lleva a cabo en los términos principales de GB,
# con 2, 4, 8, recursiones, respectivamente.
L := LMonsNP( GB );
L1 := PreprocessAnalysisQA( L, 2, 2 );
L2 := PreprocessAnalysisQA( L1, 2, 4 );