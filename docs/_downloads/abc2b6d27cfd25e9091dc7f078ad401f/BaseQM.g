# Ejemplo-BaseQM
# Considere los siguientes dos polinomios en formato NP.
p1 := [ [ [ 1, 1, 1, 2 ], [ ] ], [ 1, -1 ] ];;
p2 := [ [ [ 2, 2, 2, 1 ], [ ] ], [ 1, -1 ] ];;
# Considere también los siguientes dos vectores en formato NPM.
v1 := [[[-1,1,2],[-1]],[1,-1]];;
v2 := [[[-2,2,2],[-2]],[1,-2]];;
# SGrobnerModule encuentra el registro base de Gröbner para estos datos
GBR := SGrobnerModule([v1,v2],[p1,p2]);;
PrintNPList(GBR.ts);
PrintNPList(GBR.p);
# La función BaseQM calcula una base.
B := BaseQM(GBR,2,2,0);;
PrintNPList(B);
# La función BaseQM con argumentos para que el número de dimensiones del
# módulo y el número de variables sean mínimos.
B := BaseQM(GBR,0,0,0);;
PrintNPList(B);
# La función BaseQM también se puede utilizar para calcular los tres primeros elementos de una base.
B := BaseQM(GBR,2,2,3);;
PrintNPList(B);