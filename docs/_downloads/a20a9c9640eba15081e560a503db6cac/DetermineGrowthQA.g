# Ejemplo-DetermineGrowthQA
# Para la lista de monomios que consta de una sola variable en un álgebra libre
# generada por dos variables, el crecimiento es claramente polinomio de grado 1.

# Esto se verifica invocando DetermineGrowthQA con argumentos [[1]] (la lista del
# monomio único que consta de la primera variable), el número de generadores del
# álgebra libre a la que pertenecen los monomios (que es 2 aquí) y booleano true
# que indica que deseamos un grado preciso en caso de crecimiento polinomial.
DetermineGrowthQA( [ [ 1 ] ], 2, true);
# Aquí hay un ejemplo de crecimiento polinomial de grado 2:
L := [ [ 1, 2, 1 ], [ 2, 2, 1 ] ];
DetermineGrowthQA(L,2,true);
# Para mostrar cómo aplicar la función a polinomios arbitrarios, considere los
# siguientes dos polinomios en formato NP.
F := GF(256);
z := GeneratorsOfField( F )[1];
p1 := [ [ [ 1, 1, 1, 2 ], [ ] ], [ z, 1 ] ];;
p2 := [ [ [ 2, 2, 2, 1 ], [ ] ], [ 1, z ] ];;
# Los polinomios p1 y p2 tienen coeficientes en el campo F de orden 256.
# Para estudiar el crecimiento del álgebra del cociente, primero calculamos la
# lista de los principales monomios de los elementos básicos de Gröbner y luego
# aplicamos DetermineGrowthQA.
GB := Grobner( [ p1, p2 ] );;
L := LMonsNP( GB );;
for lm  in L  do PrintNP( [ [ lm ], [ 1 ] ] ); od;
DetermineGrowthQA( L, 2, true );