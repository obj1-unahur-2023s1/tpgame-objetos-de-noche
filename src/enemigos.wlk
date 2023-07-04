import posiciones.*
import wollok.game.*
import escenario.*
import aleatorio.*
import bloques.*
import personaje.*
import animaciones.*
import bombaas.*
import fuegos.*

class Enemigo {
	var property image = self.nombre() + "_derec_0.png"
	var property position = aleatorio.position()
	const recorrido = [position]
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
	
	method agregarPosicion(unaPosicion) {
		position.add(unaPosicion)
	}
	
	method cambiarSentidoAleatoriamente(){
		const aux = direccion
		const newDir =  posiciones.anyOne()
		if(aux != newDir)
			direccion = posiciones.anyOne()
		else
			self.cambiarSentidoAleatoriamente()
	}
	
	method cambiarSentidoAlEspacioLibre(){
		const posiblesPosiciones =  escenario.posicionesLibresAlrededorDe(position)
		if(posiblesPosiciones.size() > 0)
			direccion = posiblesPosiciones.anyOne()
	}
	
	method chocar(){
		self.pararMovimientoAutomatico()
		if(recorrido.size() >= 2){
			const newPos = recorrido.get(recorrido.size()-2)
			self.position(newPos)
		}
		self.cambiarSentidoAlEspacioLibre()
		self.moverAutomaticamente()
	}
	
	method chocaConBomberman(){
		if(bomberman.estaVivo())
			bomberman.morir()
	}
	
	method moverAutomaticamente(){
		game.onTick(self.velocidad(),"movimientoEnemigo_"  + self.nombre() + "_" + id , {
				self.moverseHacia(direccion)
		})
	}
	
	method pararMovimientoAutomatico(){
		game.removeTickEvent("movimientoEnemigo_"  + self.nombre() + "_" + id)
	}
	
	method moverseHacia(unaDireccion) {
		position = unaDireccion.mover(position)
		recorrido.add(position)
		if(unaDireccion == este)
			self.seMueveHaciaDer()
		else
			self.seMueveHaciaIzq()
	}
	
	method chocarCosa(cosa){
		cosa.chocarEnemigo(self)
	}
	
	method chocarEnemigo(enemigo){}
	
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
		self.pararMovimientoAutomatico()
		const nombreTick ="muere_enemigo_" + self.nombre() + "_" + id
		const nombreEnemigo = self.nombre()
		const nombreArchivo = nombreEnemigo + "_muere_"
		const velocidadFinal = 300 * 5
		animacion.animacion(nombreTick, 300, nombreArchivo, velocidadFinal, self)
		game.schedule(velocidadFinal, {image = self.puntaje().toString() + 'pt.png'})
		game.schedule(velocidadFinal + 300,{ game.removeVisual(self); self.sacarDeLaLista(); bomberman.agregarPuntos(self.puntaje())})
	}
	
	method sacarDeLaLista(){
	}
}

class Globo inherits Enemigo{
	override method nombre() = "globo"
	
	override method puntaje() = 100

	override method velocidad() = 750
	
	override method sacarDeLaLista(){
		if (escenario.enemigosGlobos().contains(self)){
			escenario.enemigosGlobos().remove(self)
		}
	}
}

class BloqueRojo inherits Enemigo{
	override method nombre() = "bloque"
	
	override method puntaje() = 200

	override method velocidad() = 1250
	
	override method pasaParedesBlandas() = true
	
	override method pasaBombas() = true
	
	override method sacarDeLaLista(){
		if (escenario.enemigosBloques().contains(self)){
			escenario.enemigosBloques().remove(self)
		}
	}
}