# Ejemplo-CleanNP
# Considere el siguiente polinomio en formato NP.
p := [[[1,1,2],[],[1,1,2],[]],[1,-3,-2,3]];;
PrintNP(p);
# Los monomios [1,1,2] y [] aparecen dos veces cada uno.
# Para muchas funciones esta representación de un polinomio en formato NP no está permitida.
# Necesita ser limpiado, como por CleanNP:
PrintNP(CleanNP(p));
# Para definir un polinomio sobre GF (2), los coeficientes deben definirse sobre este campo.
# Esta lista de coeficientes se puede obtener en GAP a partir de una lista de números enteros
# multiplicando por el elemento de identidad del campo.
# El polinomio resultante no necesita estar limpio, por lo que debe limpiarse nuevamente con CleanNP.
p := [[[1,1,2],[]],One(GF(2))*[1,-2]];;
CleanNP(p);