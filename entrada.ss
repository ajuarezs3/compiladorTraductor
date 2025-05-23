FUNCTION sumar(a, b)
    RETURN a + b;
END

FUNCTION factorial(n)
    DEFINE resultado = 1;

    WHILE n > 1 DO
        resultado = resultado * n;
        n = n - 1;
    END

    RETURN resultado;
END

FUNCTION sumar(a, b)
    RETURN a + b;
END

DEFINE x = 5;
DEFINE y = 10;
DEFINE suma = sumar(x, y);

PRINT "La suma de", x, "y", y, "es", suma;

DEFINE num = 4;
DEFINE fact = factorial(num);

PRINT "El factorial de", num, "es", fact;

IF suma > 20 THEN
    PRINT "La suma es mayor que 20";
ELSEIF suma == 15 THEN
    PRINT "La suma es exactamente 15";
ELSE
    PRINT "La suma es menor que 15";
END

DEFINE a = true;
DEFINE b = false;

IF a AND NOT b THEN
    PRINT "Condición lógica verdadera";
ELSE
    PRINT "Condición lógica falsa";
END


DEFINE x = 15;

IF x > 20 THEN
PRINT "Mayor que 20";
ELSEIF x > 10 THEN
PRINT "Mayor que 10 pero menor o igual a 20";
ELSE
PRINT "10 o menor";
END


LOOP (i = 0; i < 3; i = i + 1) DO
    PRINT "Iteración número:", i;
END


