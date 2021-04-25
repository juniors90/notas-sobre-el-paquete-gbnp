# Ejemplo-FreqsQATrunc
# Considere la base de Gröbner truncada de los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 2, 2, 1 ], [ 2, 1, 1, 2 ] ], [ 1, -1 ] ];;
p2 := [ [ [ 2, 2, 2 ], [ 1, 1 ] ], [ 1, -1 ] ];;
wtv := [ 3, 2 ];;
GB := SGrobnerTrunc( [ p1, p2 ], 12, wtv );;
PrintNPList( GB );
# Las multiplicidades de las frecuencias de monomios en una base estándar del álgebra
# del cociente con respecto al ideal generado por GB se encuentran de la siguiente manera,
# para pesos hasta 8 inclusive.
F := FreqsQATrunc( GB, 8, wtv );
# La interpretación de estos datos viene dada por las siguientes líneas de código.
for f in F do
  if f[1][1] <> [] then
    Print("A nivel ", wtv * (f[1][1]), " las multiplicidades son\n");
    for x in f do
      Print("  para ",x[1],": ",x[2],"\n");
    od;
  else
    Print("A nivel ", 0 , " la multiplicidad de [] is ",f[1][2],"\n");
  fi;
  Print("\n");
od;