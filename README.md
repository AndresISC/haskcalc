# HaskCalc

## Clase `BinUtils`

Esta clase define 2 tipos de datos:

+ Register
+ TwoSome

#### Register

Simula un registro de memoria de tamaño _n_ y con dos atributos:

+ Valor
+ Bit Carry

**Valor** contiene, como su nombre lo dice, el valor de memoria almacenado.

**Carry** se utiliza en operaciones aritméticas, en las cuales se va almacenando un bit de carry como si fuera la bandera de `carry` en el registro de banderas del CPU.
Si este bit está puesto al final de una operación, indica que hubo un overflow de valor.

#### TwoSome

Este tipo de dato simula la suma de 2 bits, con dos atributos:

+ carryBit
+ outBit

**carryBit** indica si hubo un `carry` durante la suma de ambos bits.

**outBit** indica la salida de la suma de ambos bits.

Por ejemplo:

| a | b | carryBit | outBit |
|:--|:--|:---------:|:-------:|
| 0 | 0 | 0 | 0 |
| 1 | 1 | 1 | 0 |
| 1 | 0 | 0 | 1 |
| 0 | 1 | 0 | 1 |
