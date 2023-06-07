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


| Imagen | Nombre | Puntos | Velocidad | Movimiento | Características extra
|-----------|-----------|-----------|-----------|-----------|-----------|
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/1c7fc7c3-628c-4b95-8eda-77aa91e974f4)   | Skate  | Aumenta la velocidad de Bomberman en 1  |
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/9ee8b94b-4908-418b-ae5d-c521dbf4483a)   | Pase Bomba | Pueda pasar por encima de sus bombas  |
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/1949d0db-95d0-4fd8-993b-ab729e724264)   | Fuego | Incrementa el rango de las bombas en 1 |
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/f00e9a73-6c28-42da-a6f5-e6e393abb46e)  | Bombardear | Incrementa la cantidad de bombas que se pueden poner a la vez en 1 |
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/e79cc568-1393-4598-904e-44ef72c8967e)  | Pase Paredes débiles | Pueda pasar por encima de las paredes débiles |
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/be1327e2-cc46-4211-845c-2854c0626d3e)  | Armadura | Lo hace invencible |
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/4535da56-7b79-462b-a854-4f79bbadbc71) | Control Remoto | Las bombas pueden ser detonadas de manera remota |
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/18ada76b-af3b-4158-a66c-c802cf3cfd02)  | Pase fuego | Lo hace inmune a sus bombas |

## Otros

- Objetos 1 - Comisión 2 - Universidad Nacional de Hurlingham
- Versión de wollok
- Una vez terminado, no tenemos problemas en que el repositorio sea público
