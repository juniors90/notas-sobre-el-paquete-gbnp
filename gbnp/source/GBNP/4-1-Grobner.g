# Ejemplo-Grobner
# Considere los siguientes dos polinomios en formato NP.
p1 := [[[1,1,2],[]],[1,-1]];;
p2 := [[[1,2,2],[]],[1,-1]];;
PrintNPList([p1,p2]);
# Su base de Gröbner se puede calcular mediante la función Grobner.
G := Grobner([p1,p2]);;
PrintNPList(G);
# Se invoca una iteración de los cálculos de Gröbner mediante el uso del parámetro max:
R := Grobner([p1,p2],1);;
PrintNPList(R.G);
PrintNPList(R.todo);
R.iterations;
R.completed;
# La lista anterior R.todo se puede utilizar para reanudar el cálculo del cálculo de la
# base de Gröbner con el par de Gröbner R.G, R.todo:
PrintNPList(Grobner(R.G,R.todo));
# Para realizar el cálculo de la base de Gröbner con polinomios en un álgebra libre sobre
# el campo GF (2), es necesario definir los coeficientes de los polinomios sobre ese campo.
PrintNPList(Grobner([[p1[1],One(GF(2))*p1[2]],[p2[1],One(GF(2))*p1[2]]]));