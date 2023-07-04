[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/qO1I4X2W)
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
- Si perdió todas las vidas, se pierde todo progreso hecho en el nivel (puntaje, power-up, etc). 

#### Bombas
- Al inicio, Bomberman sólo puede colocar una bomba por vez y hasta que esta explote, no podrá poner otra.
- Esto puede ser modificado (junto con otras características de la bomba), por los "power-up".

### Bloques
En el mapa, Bomberman se encontrará con distintos tipos de paredes. Todas comparten la característica de que Bomberman no puede estar en la misma posición que ellas en un principio. Varios enemigos comparten la misma característica.

#### Bloques Fuertes
- No les afectan las explosiones
- Siempre están en la misma posición
- Se encuentran tanto dentro del mapa como en los bordes del mismo.

#### Bloques Débiles
- Desaparecen si les da una explosión.
- Son las contenedoras de los "power-ups" de cada nivel 
- Aparecen de manera aleatoria en las posiciones libres del mapa al inciar el nivel.
- También contienen la "puerta de nivel" y finalizar el nivel.

### Bomba
Tal como lo indica el nombre del juego, este es el arma principal de nuestro personaje.

#### Colocación
- Se colocan en la posición actual del bomberman mediante la tecla X
- Es el único momento donde Bomberman está en la misma celda que la bomba

#### Detonación
- En un principio, las bombas tardan 3 segundos en explotar y lo hacen de manera automática.
- Mediante el "power-up" llamado Control Remoto, bomberman las puede activar cuando desee por medio de la tecla E
- Si también se cuenta con el "power-up" que permite poner más de una bomba a la vez, van explotar al presionar la tecla.

#### Atravesar
- No pueden ser atravesadas por Bomberman ni por la mayoría de enemigos
- El único enemigo que las pueden atravesar es Dahl el Bloque. 
- Bomberman sólo las puede atravesar si tiene el "power-up" llamado Pase Bomba

#### Alcance
- Tienen alcance de 1 bloque.

### Power-ups

#### Características
- Están activos cuando el Bomberman los recoje, por lo que desaparece del tablero.
- No se repiten por nivel.

| Imagen | Nombre | Efectos sobre Bomberman |
|-----------|-----------|-----------|
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/9ee8b94b-4908-418b-ae5d-c521dbf4483a)   | Pase Bomba | Pueda pasar por encima de sus bombas  |
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/4535da56-7b79-462b-a854-4f79bbadbc71) | Control Remoto | Las bombas pueden ser detonadas de manera remota |
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/9ee8b94b-4908-418b-ae5d-c521dbf4483a)   | Pase Bomba | Pueda pasar por encima de sus bombas  |


### Enemigos

| Imagen | Nombre | Puntos | Velocidad | Movimiento | Inteligencia | Cómo eliminarlo | Características extra |
|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/c8da1438-5808-4efb-9cc5-1532f108a104)   | Valcom el Globo  | 100 | 2 (Lento) | Es de N-S o E-O | 1 (no persigue) | Basta una exploción de bomba | Cuando rebota cambia aleatoriamente el sentido de movimiento. |
| ![image](https://github.com/obj1-unahur-2023s1/tpgame-objetos-de-noche/assets/111536876/9f9e3d8e-41ad-4c5b-9f97-9424b7c410ea)   | Dahl el Bloque  | 200  | 3 (Normal) | Es de N-S o E-O | 1 (no persigue) |  Basta una exploción de bomba | Puede atravesar bloques débiles y bombas.  |


### Puerta de nivel
- Hay solo una por nivel.
- Al aparecer, si hay enemigos no permite finalizar el nivel.
- Al no haber enemigos permite finalizar el nivel.

## Otros

- Objetos 1 - Comisión 2 - Universidad Nacional de Hurlingham
- Versión de wollok
- Una vez terminado, no tenemos problemas en que el repositorio sea público
