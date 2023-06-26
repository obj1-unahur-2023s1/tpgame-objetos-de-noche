import wollok.game.*
import escenario.*

const direcciones = [arriba, abajo, derecha, izquierda]

object arriba {
	method nuevaUbicacion(unaPosition) { return
		if(unaPosition.y() != game.height()-1) unaPosition.up(1)
		else new Position(x=unaPosition.x(),y=0)
	}
	method id() = 1
	
	method sePuedeMover(unPersonaje){
		const unaPosicion = unPersonaje.position()
		const nuevaPosicion = unaPosicion.up(1)
		return (unaPosicion.y() != game.height()-1
			&& !escenario.hayBloquesDurosEn(nuevaPosicion)
			&& (!escenario.hayBloquesBlandosEn(nuevaPosicion)
				|| (escenario.hayBloquesBlandosEn(nuevaPosicion) && unPersonaje.pasaParedesBlandas()
			//&&  (!escenario.hayBombasEn(nuevaPosicion))
			)))
	}
}

object abajo {
	method nuevaUbicacion(unaPosition) { return
		if(unaPosition.y() != 0) unaPosition.down(1)
		else new Position(x=unaPosition.x(),y=game.height()-1)
	}	
	method id() = 2
	
	method sePuedeMover(unPersonaje){
		const unaPosicion = unPersonaje.position()
		const nuevaPosicion = unaPosicion.down(1)
		return (unaPosicion.y() != 0
			&& !escenario.hayBloquesDurosEn(nuevaPosicion)
			&& (!escenario.hayBloquesBlandosEn(nuevaPosicion)
				|| (escenario.hayBloquesBlandosEn(nuevaPosicion) && unPersonaje.pasaParedesBlandas()
			//&&  (!escenario.hayBombasEn(nuevaPosicion))
			)))
	}
}

object derecha {
	method nuevaUbicacion(unaPosition) { return
		if(unaPosition.x() != game.width()-1) {
			unaPosition.right(1)
		}
		else new Position(x=0,y=unaPosition.y())
	}
	method id() = 3
	
	method sePuedeMover(unPersonaje){
		const unaPosicion = unPersonaje.position()
		const nuevaPosicion = unaPosicion.right(1)
		return (unaPosicion.x() != game.width()-1 
			&& !escenario.hayBloquesDurosEn(nuevaPosicion)
			&& (!escenario.hayBloquesBlandosEn(nuevaPosicion)
				|| (escenario.hayBloquesBlandosEn(nuevaPosicion) && unPersonaje.pasaParedesBlandas()
			//&&  (!escenario.hayBombasEn(nuevaPosicion))
			)))
	}
}

object izquierda {
	method nuevaUbicacion(unaPosition) { return
		if(unaPosition.x() != 0) {
			unaPosition.left(1)
		}
		else new Position(x=game.width()-1,y=unaPosition.y())
	}	
	method id() = 4
	
	method sePuedeMover(unPersonaje){
		const unaPosicion = unPersonaje.position()
		const nuevaPosicion = unaPosicion.left(1)
		return (unaPosicion.x() != 0
			&& !escenario.hayBloquesDurosEn(nuevaPosicion)
			&& (!escenario.hayBloquesBlandosEn(nuevaPosicion)
				|| (escenario.hayBloquesBlandosEn(nuevaPosicion) && unPersonaje.pasaParedesBlandas()
			//&&  (!escenario.hayBombasEn(nuevaPosicion))
			)))
	}
}