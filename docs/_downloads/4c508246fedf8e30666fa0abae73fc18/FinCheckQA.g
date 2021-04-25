# Ejemplo-FinCheckQA
# Considere la siguiente lista L de dos monomios.
L := [ [ 1, 2, 1 ], [ 2, 2, 1 ] ];;
# La finitud de la dimensión del álgebra cociente del álgebra libre por el ideal generado
# por estos dos monomios se puede decidir mediante FinCheckQA.
# Sus argumentos son L y el número de generadores del álgebra libre en los que residen los monomios.
FinCheckQA( L, 2 );
# Este ejemplo resulta ser de dimensión infinita.
# Aquí hay un ejemplo de dimensión finita.
FinCheckQA( [ [ 1 ], [ 2, 2 ] ], 2 );