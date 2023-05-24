A convenção RISC-V usa a passagem de argumentos por registo.
Os registos a0-a7 irão, portanto, conter os argumentos para a função.
No entanto, desses 8 registos, apenas a0 e o a1 conterão os valores retornados.
Os valores usados na função deverão ser guardados no stack e recuperados antes da função retornar.

Se a função utilizar mais do que esses 8 registos, ou se aquilo que retorna for um struct, a passagem de argumentos terá de ser feita pelo stack.

A passagem de argumentos pelo stack será ligeiramente diferente.
Os valores utilizados durante a função deverão ser guardados na pilha no inicio da mesma, em conjunto com os argumentos.
Antes da função retornar, os valores deverão ser repostos da pilha para os registos correspondentes.
O valor retornado deverá, também, ser guardado na pilha e recuperado.

Incluímos ambas as implementações no .zip

