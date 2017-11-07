#ASSEMBLER

Fundamentos de Microprocesadores OTOÑO 2017 Profesor Mario Alberto Peredo Durán
~Programadores:~
Luisa Cecilia Flores
Julián López
Mariana Sierra

##Programas de práctica en ensamblador

19 diferentes programas para la práctica de ensamblador.
Los siguientes códigos están pensandos para el microcontrolador 89S52.

###Problemas
 
1)	Hacer un programa para cargar los registros con los siguientes valores: A 0FH, R0 12H, R1 34H, R2 56H, R3 78H, R4 09H, R5 ACC.
2)	Hacer un programa para que el acumulador cuente del 25H al 31H, de uno en uno, se decremente de la misma forma hasta llegar al valor inicial.
3)	Hacer un programa para que el acumulador pase de 0 a 10 se uno en uno y luego se repita el proceso
4)	Hacer un programa para sumar el contenido de R4 con el contenido de R6 y colocar el resultado en R2
5)	Hacer un programa que sume 10 datos que están en la RAM interna a partir de la dirección 30H y guarde el resultado en la dirección 40H.
6)	Hacer un programa para que en el acumulador aparezca la siguiente secuencia: 10H-11H-22H-33H-44H-55H-66H-33H-11H-10H y luego se repita el proceso. Se puede utilizar cualquier instrucción, pero NINGUNA repetida.
7)	Hacer un programa para separar el contenido del R0 en dos grupos de 4 bits. Guardar el grupo de los 4 bits más significativos en los 4 bits menos significativos del registro R1 y los 4 bits menos significativos en los 4 bits menos significativos del registro R2. Los 4 bits más significativos de R1 y R2, deben quedar en cero.
8)	Hacer un programa para combinar los 4 bits menos significativos del registro R2 y los 4 bits menos significativos del registro R1 en una sola localidad de 8 bits y guardarla en el registro R0. Los 4 bits menos significativos de R2 deberán ocupar los 4 bits menos significativos de R0.
9)	Hacer un programa para determinar la cantidad de ceros, de números positivos (aquellos cuyo bit más significativo es cero) y de números negativos (aquellos cuyo bit más significativo es uno) que hay en un bloque de memoria externa. La dirección inicial del bloque está en las localidades 1940H y 1941H, la longitud del bloque está en la localidad 1942H. El número de elementos negativos debe colocarse en la localidad 1943H, el número de ceros en la 1944H y el número de elementos positivos en la localidad 1945H.
10)	Hacer un programa que calcule la suma de los N primeros números pares. El rango de N es de 1 a 15. El número N se encuentra en el registro R0. El resultado debe guardarse en R1.
11)	Hacer un programa para mover el bloque de memoria que comienza en la dirección 1A00H y termina en la dirección 1BFFH, a la sección de memoria que comienza en la 1C00H. El programa debe terminar cuando se haya transferido todo el bloque o cuando se encuentre un dato con valor FFH.
12)	 Hacer un programa que multiplique el contenido binario del registro R0 (<20h) por 7 y guarde el resultado en el registro R1. Hacer en dos versiones, con y sin utilizar la instrucción de multiplicación.
13)	Hacer un programa para que encuentre el elemento más pequeño de una lista de números de 16 bits sin signo que están en localidades consecutivas de memoria. La dirección del primer elemento de la lista se encuentra en las localidades 1900H y 1901H, el número de elementos del arreglo está en la localidad 1902H. El elemento más pequeño encontrado debe guardarse en la localidad 1903H.
14)	Hacer un programa para que ordene una lista de números binarios de 8 bits con signo en orden ascendente (menor a mayor). La longitud de la lista está en la localidad de memoria 1B00H y la lista misma comienza en la localidad de memoria 1B01H. Los números están en complemento a dos.
15)	Hacer un programa para contar el número de bits con valor 1 que hay en un bloque de memoria cuya dirección inicial se encuentra almacenada en las localidades 1A00H y 1A01H y cuya dirección final esta almacenada en las localidades 1A02H y 1A03H. El número total de unos debe guardarse en las localidades 1A04H y 1A05H. Se sugiere  utilizar un lazo para contar los unos dentro de cada localidad del bloque, anidado en otro lazo que se encargue de acumular los unos resultantes de todas las localidades.
16)	Hacer un programa que justifique una fracción binaria de 16 bits que se encuentra en las localidades 1C00H y 1C01H desplazando el número hacia la izquierda hasta que el bit más significativo sea 1. Guardar el resultado en las direcciones 1C02H y 1C03H y el número de desplazamientos en la dirección 1C04H. Si el contendido de las direcciones 1C00H y 1C01H es cero, entonces escribir ceros en las direcciones 1C02H, 1C03H y 1C04H. Este proceso se utiliza para convertir un número a notación científica.
17)	A partir de la localidad 500H de RAM se encuentra una lista de palabras de 16 bits. En el registro R4 se encuentra el número de elementos de la lista. Se requiere implementar un programa que genere el promedio de los elementos de la lista y que guarde dicho promedio en los registros R6 y R7.
18)	Hacer un programa para unir dos listas ordenadas ascendentemente en una sola lista ordenada de la misma forma. El registro DPTR contiene la dirección de la localidad de memoria donde está almacenado el número de elementos de la lista 1, y la lista 1 comienza en la siguiente localidad. Para la lista 2 sucede algo similar, pero con los registros R6 y R7. Los registros R4y R5 contienen la dirección en donde debe comenzar la lista resultante.
19)	Realiza las siguientes rutinas para el manejo de cadenas:
	Insertar una subcadena (SUB) en una cadena (CAD) a partir de cierta posición (POS).
	Encontrar una subcadena (SUB) en una cadena (CAD), indicando la posición donde inicia (POS).
	Borrar una cierta cantidad de caracteres (N) de una cadena (CAD) a partir de una posición (POS).
	Copiar de una cadena (CAD) una cierta cantidad de caracteres (N) a una subcadena (SUB).
* Las cadenas terminan con el ASCII 0.
* La cadena CAD inicia en la localidad 400H de RAM.
* La cadena SUB inicia en la localidad 450H de RAM
* El número POS está en el registro R2.
* El número N está en el registro R3.

