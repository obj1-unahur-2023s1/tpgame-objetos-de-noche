# Bomberman

## Equipo de desarrollo

- Cornejo Pereira Valentin
- Gerace Cesar Emiliano
- Hermida Adrian
- Noguera Joaquin
- Pisoni Denise Ailen

## Capturas

(agregar)

## Reglas de Juego / Instrucciones

### Intro

¡Amantes de los juegos retro, prepárense para una explosión de diversión! Les presento Bomberman Retro, un clásico atemporal que los transportará a la era dorada de los videojuegos.

En este juego de un único jugador tendremos como personaje a Bomberman. La misión de Bomberman es simple pero desafiante: como valiente bombardero, debe colocar bombas estratégicamente en laberintos llenos de obstáculos y enemigos. Su objetivo es abrir caminos, derrotar a los villanos y descubrir tesoros ocultos. Sin embargo, debe tener cuidado de no ser atrapado por tus propias explosiones. ¡La estrategia y la habilidad son clave para completar con éxito la misión de Bomberman!

### Características de Bomberman

#### Vidas
- Cuenta con 3 vidas. 
- Cuando choca con algún enemigo o contra sus propias explosiones, pierde una vida. 
- Al perder una vida, el nivel se reinicia, pierde el puntaje realizado en ese nivel y los "power-up" y vuelve a la posición inicial. 
- Si perdió todas las vidas, se pierde todo progreso hecho desde el principio (puntaje, niveles avanzados, etc). 

#### Bombas
- Al inicio, Bomberman sólo puede colocar una bomba por vez y hasta que esta explote, no podrá poner otra.
- Esto puede ser modificado (junto con otras características de la bomba), por los "power-up".

### Bloques
En el mapa, Bomberman se encontrará con distintos tipos de paredes. Todas comparten la característica de que Bomberman no puede estar en la misma posición que ellas en un principio. Varios enemigos comparten la misma característica. Esta característica puede quedar sin efecto para Bomberman gracias a un "power-up".

#### Bloques Fuertes
- No les afectan las explosiones
- Siempre están en la misma posición
- Se encuentran tanto dentro del mapa como en los bordes del mismo.

#### Bloques Débiles
- Desaparecen si les da una explosión.
- Son las contenedoras de los "power-ups" de cada nivel 
- Aparecen de manera aleatoria en las posiciones libres del mapa al inciar el nivel.
- También contienen la llave para abrir la "puerta de nivel" y avanzar al siguiente.

### Bomba
Tal como lo indica el nombre del juego, este es el arma principal de nuestro personaje.

#### Colocación
- Se colocan en la posición actual del bomberman mediante la tecla X
- Es el único momento donde Bomberman está en la misma celda que la bomba

#### Detonación
- En un principio, las bombas tardan 3 segundos en explotar y lo hacen de manera automática.
- Mediante el "power-up" llamado Control Remoto, bomberman las puede activar cuando desee por medio de la tecla Y
- Si también se cuenta con el "power-up" que permite poner más de una bomba a la vez, van explotan de a una bomba en el orden plantado.

#### Atravesar
- No pueden ser atravesadas por Bomberman ni por la mayoría de enemigos
- El único enemigo que las pueden atravesar es el Oso 
- Bomberman sólo las puede atravesar si tiene el "power-up" llamado Pase Bomba

#### Alcance
- Tienen alcance de 1 bloque al principio.
- Se puede ir aumentando 1 de alcance en cada dirección por el power-up "Fuego"

### Power-ups

#### Características
- Están activos cuando el Bomberman los recoje, por lo que desaparece del tablero.
- No se repiten por nivel.

| Imagen | Nombre | Efectos sobre Bomberman |
|-----------|-----------|-----------|
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/1c7fc7c3-628c-4b95-8eda-77aa91e974f4)   | Skate  | Aumenta la velocidad de Bomberman en 1  |
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/9ee8b94b-4908-418b-ae5d-c521dbf4483a)   | Pase Bomba | Pueda pasar por encima de sus bombas  |
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/1949d0db-95d0-4fd8-993b-ab729e724264)   | Fuego | Incrementa el rango de las bombas en 1 |
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/f00e9a73-6c28-42da-a6f5-e6e393abb46e)  | Bombardear | Incrementa la cantidad de bombas que se pueden poner a la vez en 1 |
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/e79cc568-1393-4598-904e-44ef72c8967e)  | Pase Paredes débiles | Pueda pasar por encima de las paredes débiles |
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/be1327e2-cc46-4211-845c-2854c0626d3e)  | Armadura | Lo hace invencible |
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/4535da56-7b79-462b-a854-4f79bbadbc71) | Control Remoto | Las bombas pueden ser detonadas de manera remota |
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/18ada76b-af3b-4158-a66c-c802cf3cfd02)  | Pase fuego | Lo hace inmune a sus bombas |

### Enemigos


| Imagen | Nombre | Puntos | Velocidad | Movimiento | Inteligencia | Cómo eliminarlo | Características extra |
|-----------|-----------|-----------|-----------|-----------|-----------|-----------|
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/c8da1438-5808-4efb-9cc5-1532f108a104)   | Valcom el Globo  | 100 | 2 (Lento) | Es de N-S o E-O | 1 (no persigue) | Basta una exploción de bomba | Cuando rebota cambia aleatoriamente el sentido de movimiento. |
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/20c2b2ee-7e52-47f7-96ff-400342c3ec93)  | Onils la Cebolla  | 200  | 3 (Normal) | Es de N-S o E-O | 2 (persigue si está cerca)  | Basta una exploción de bomba |  Cuando rebota cambia aleatoriamente el sentido de movimiento. Aparece cuando aparece el item "Fuego" |
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/9f9e3d8e-41ad-4c5b-9f97-9424b7c410ea)   | Dahl el Bloque  | 400  | 3 (Normal) | Es de N-S o E-O | 1 (no persigue) |  Basta una exploción de bomba | Cuando rebota cambia aleatoriamente el sentido de movimiento. Aparece cuando aparece el item "Skate" |
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/ee62271b-756a-46e7-ae0e-0d44d43513a2)  | Minvo el Círculo  | 800  | 4 (Rápido) | Es de N-S o E-O | 2 (persigue si está cerca) | Basta una exploción de bomba |  Cuando rebota cambia aleatoriamente el sentido de movimiento. Aparece cuando aparece el item "Pase Paredes Débiles" |
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/3bbb6088-50ca-44c0-aa71-e89c5a324d6d)   | Ovape la ameba  | 1000  | 1 (El más lento) | Es de N-S o E-O | 3 (persigue en cuanto te ve) | Basta una exploción de bomba | Cuando rebota cambia aleatoriamente el sentido de movimiento. Atraviesan paredes débiles y bombas. Aparece cuando aparece el item "control remoto" |
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/c8da1438-5808-4efb-9cc5-1532f108a104)   | Doria el fantasma  | 2000  | 2 (Lento) | Es de N-S o E-O | 2 (persigue si está cerca) | Basta una exploción de bomba | Cuando rebota cambia aleatoriamente el sentido de movimiento. Atraviesan paredes débiles. Aparece cuando aparece el item "Pase bomba" |
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/c0115e83-5a90-48b3-8276-3deb22e47986)   | Pass el oso  | 4000  | 4 (Rápido) | Es de N-S o E-O | 3 (persigue en cuanto te ve) | Basta una exploción de bomba | Cuando rebota cambia aleatoriamente el sentido de movimiento. Atraviesan paredes débiles y bombas. Aparece cuando aparece el item "fuego" |
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/c8da1438-5808-4efb-9cc5-1532f108a104)   | Pontan la moneda  | 8000  | 4 (Rápido) | Es de N-S o E-O | 3 (persigue desde más lejos) | Basta una exploción de bomba | Cuando rebota cambia aleatoriamente el sentido de movimiento.Atraviesan paredes blandas. Atacan en grupo. Aparece cuando aparece el item "invencible" |

### Puerta de nivel
- Hay solo una por nivel.
- Al aparecer, si hay enemigos aparece cerrada.
- Al no haber enemigos se abre y permite pasar de nivel.

## Otros

- Objetos 1 - Comisión 2 - Universidad Nacional de Hurlingham
- Versión de wollok
- Una vez terminado, no tenemos problemas en que el repositorio sea público
