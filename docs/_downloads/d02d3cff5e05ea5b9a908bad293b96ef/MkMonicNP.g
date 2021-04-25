# Ejemplo-MkMonicNP 
# Considere el siguiente polinomio en formato NP.
p := [ [ [ 1, 1, 2 ], [ ] ], [ 2, -1 ] ];;
PrintNP(p);
# El coeficiente del término principal es 2. La función MkMonicNP encuentra este coeficiente y
# divide todos los términos por él:
PrintNP( MkMonicNP( p ) );