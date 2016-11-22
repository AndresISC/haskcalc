# HaskCalc

## Módulo `Bitwise`

Este módulo define 2 tipos de datos:

+ Register
+ TwoSome

### Register

Simula un registro de memoria de tamaño _n_ y con dos atributos:

+ value
+ carryFlag

**valuer** contiene, como su nombre lo dice, el valor de memoria almacenado.

**carryFlag** se utiliza en operaciones aritméticas, en las cuales se va almacenando un bit de carry como si fuera la bandera de `carry` en el registro de banderas del CPU.
Si este bit está puesto al final de una operación, indica que hubo un overflow de valor.

### TwoSome

Este tipo de dato simula la suma de 2 bits, con dos atributos:

+ carryBit
+ sumBit

**carryBit** indica si hubo un `carry` durante la suma de ambos bits.

**outBit** indica la salida de la suma de ambos bits.

Por ejemplo:

| a | b | carryBit | sumBit |
|:--|:--|:---------:|:-------:|
| 0 | 0 | 0 | 0 |
| 1 | 1 | 1 | 0 |
| 1 | 0 | 0 | 1 |
| 0 | 1 | 0 | 1 |

### Funciones Accesibles

+ `rippleAdder` - Sumador basado en Ripple-Carry
+ `twoComplement` - Complemento a 2

## Módulo `Strings`

Este módulo define funciones de conversión de cadenas binarias del estilo `"1001010"`.

### Funciones Accesibles

+ `charToBool` - Convierte un caractér a un valor booleano
+ `boolToChar` - Convierte un booleano a un caracter (0 y 1)
+ `stringToBools` - Convierte una cadena binaria a una lista de booleanos
+ `boolsToString` - Convierte una lista de booleanos a una cadena binaria

## Módulo `Conversion`

Este módulo define funciones para conversión de `Integer <-> [Bool]`

### Funciones Accesibles

+ `binToInt` - Convierte una lista de booleanos a un número entero sin signar
+ `binToSignedInt` - Convierte una lista de booleanos a un número entero signado

## Módulo `Arithmetic`

Este módulo se encargará de realizar operaciones básicas de aritmética.

### Funciones Accesibles

+ `addition` - Suma dos números (cadenas binarias sin signo)
+ `substraction` - Resta dos números (cadenas binarias sin signo)
