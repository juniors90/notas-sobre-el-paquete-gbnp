# Primero cargamos el paquete gap (antes del ejemplo)
LoadPackage("GBNP","0",false);
# Ejemplo-GP2NP
# Sea A el álgebra asociativa libre con uno sobre los
# racionales de los generadores a y b. Sea e el uno del álgebra.
A:=FreeAssociativeAlgebraWithOne(Rationals,"a","b");;
a:=A.a;;
b:=A.b;;
e:=One(A);;
z:=Zero(A);;
# Ahora sea gp el polinomio ba-ab-e.
gp:=b*a-a*b-e;
# El polinomio en formato NP, correspondiente a gp ahora se
# puede obtener con GP2NP:
GP2NP(gp);
# Sea D el álgebra asociativa libre sobre A de rango 2.
D := A^2;;
# Tomamos la siguiente lista R de dos elementos de D.
R := [ [b-e, z], [e+a*(e+a+b), -e-a*(e+a+b)] ];;
# Convertimos la lista R a una lista de vectores en formato NPM.
List(R,GP2NP);