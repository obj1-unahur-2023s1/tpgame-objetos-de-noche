import posiciones.*
import wollok.game.*
import escenario.*
import aleatorio.*
import bloques.*
import personaje.*
import animaciones.*


class Enemigo {
	var property image = self.nombre() + "_derec_0.png"
	var property position = aleatorio.position()
	const recorrido = []
	const id
	var direccion
	method nombre()
	method puntaje()
	method velocidad()
	method pasaParedesBlandas() = false
	method pasaBombas() = false
	
	method id() = id
	
	method direccion() = direccion
	
	method recorrido() = recorrido
	
	method cambiarSentidoAleatoriamente(){
		const aux = direccion
		const newDir =  posiciones.anyOne()
		if(aux != newDir)
			direccion = posiciones.anyOne()
		else
			self.cambiarSentidoAleatoriamente()
	}
	
	method chocarEnemigo(cosa){}
	
	method chocaConBomberman(){
		bomberman.morir()
	}
	
	method moverAutomaticamente(){
		recorrido.add(position)
		game.onTick(self.velocidad(),"movimientoEnemigo_" + id , {
				self.moverseHacia(direccion)
		})
	}
	
	method moverseHacia(unaDireccion) {
		position = unaDireccion.mover(position)
		recorrido.add(position)
		if(unaDireccion.id() == este.id())
			self.seMueveHaciaDer()
		else
			self.seMueveHaciaIzq()
	}
	
	method chocarCosa(cosa){
		cosa.chocarEnemigo(self)
	}
	
	method seMueveHaciaIzq(){
		const nombreTick ="se_mueve_izq_enemigo_" + self.nombre() + "_" + id
		const nombreEnemigo = self.nombre()
		const nombreArchivo = nombreEnemigo + "_izqui_"
		const velocidadFinal = self.velocidad()
		const velocidadEvento = velocidadFinal.div(3)
		animacion.animacion(nombreTick, velocidadEvento, nombreArchivo, velocidadFinal, self)
	}
	
	method seMueveHaciaDer(){
		const nombreTick ="se_mueve_der_enemigo_" + self.nombre() + "_" + id
		const nombreEnemigo = self.nombre()
		const nombreArchivo = nombreEnemigo + "_derec_"
		const velocidadFinal = self.velocidad()
		const velocidadEvento = velocidadFinal.div(3)
		animacion.animacion(nombreTick, velocidadEvento, nombreArchivo, velocidadFinal, self)
	}
	
	method morir(){
		const nombreTick ="muere_enemigo_" + self.nombre() + "_" + id
		const nombreEnemigo = self.nombre()
		const nombreArchivo = nombreEnemigo + "_muere_"
		const velocidadFinal = 300 * 5
		animacion.animacion(nombreTick, 300, nombreArchivo, velocidadFinal, self)
		game.schedule(velocidadFinal, {image = '100pt.png'})
		game.schedule(velocidadFinal + 300,{ game.removeVisual(self); game.removeTickEvent("movimientoEnemigo_" + id)})
	}
}

class Globo inherits Enemigo{
	override method nombre() = "globo"
	
	override method puntaje() = 100

	override method velocidad() = 500
	
}