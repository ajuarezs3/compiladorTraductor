FUNCTION factorial DEFINE resultado = 1; WHILE n > 1 DO
resultado = resultado * n;
n = n - 1;
END
RETURN resultado;
END

DEFINE num = 5;
DEFINE fact = factorial(num);
PRINT "El factorial de ", num, " es ", fact;