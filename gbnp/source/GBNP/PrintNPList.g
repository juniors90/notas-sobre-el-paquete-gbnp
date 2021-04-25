# Ejemplo-PrintNPList
# Ponemos dos polinomios en formato NP en la lista Lnp.
p1 := [ [ [ 1, 1, 2 ] , [ ] ] , [ 1, -1 ] ];;
p2 := [ [ [ 1, 2, 2 ] , [ ] ] , [ 1, -1 ] ];;
Lnp := [p1,p2];;
# Podemos imprimir la lista con PrintNPList.
PrintNPList(Lnp);
# Alternativamente, usando la función GBNP.ConfigPrint, podemos introducir el álgebra
# libre A con dos generadores e imprimir los polinomios de la lista como miembros de A:
A:=FreeAssociativeAlgebraWithOne(Rationals,"a","b");;
GBNP.ConfigPrint(A);
PrintNPList(Lnp);