import direcciones.*
import wollok.game.*
import escenario.*
import aleatorio.*
import bloques.*
import personaje.*
import animaciones.*


class Enemigo {
	var property image = self.nombre() + "_derec_0.png"
	var property position = aleatorio.position()
	const posiciones = []
	const id
	var direccion
	method nombre()
	method puntaje()
	method velocidad()
	method pasaParedesBlandas()
	
	method id() = id
	
	method direccion() = direccion
	
	method posiciones() = posiciones
	
	method cambiarSentidoAleatoriamente(){
		const aux = direccion
		const newDir =  direcciones.anyOne()
		if(aux != newDir)
			direccion = direcciones.anyOne()
		else
			self.cambiarSentidoAleatoriamente()
	}
	
	method chocarEnemigo(cosa){}
	
	method chocaConBomberman(){
		bomberman.morir()
	}
	
	method moverAutomaticamente(){
		posiciones.add(position)
		game.onTick(self.velocidad(),"movimientoEnemigo_" + id , {
				self.moverseHacia(direccion)
		})
	}
	
	method moverseHacia(unaDireccion) {
		if(unaDireccion.sePuedeMover(self)){
			position = unaDireccion.nuevaUbicacion(position)
			if(unaDireccion.id() == derecha.id())
				self.seMueveHaciaDer()
			else
				self.seMueveHaciaIzq()
			posiciones.add(position)
		}
		else{
			self.cambiarSentidoAleatoriamente()
			self.moverseHacia(direccion)
		}
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

	override method velocidad() = 1000
	
	override method pasaParedesBlandas() = false
	
}