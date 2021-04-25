# Ejemplo-HilbertSeriesQA
# Considere la siguiente lista L de dos monomios.
L := [ [ 1, 2, 1 ], [ 2, 2, 1 ] ];;
# La finitud de la dimensión del álgebra cociente del álgebra libre por el ideal generado
# por estos dos monomios se puede decidir mediante FinCheckQA.
# Sus argumentos son L y el número de generadores del álgebra libre en los que residen
# los monomios.
HilbertSeriesQA( L, 2, 10 );
# Esto indica que el crecimiento puede ser polinomial.
# DetermineGrowthQA se puede utilizar para comprobar esto.