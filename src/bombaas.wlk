
import wollok.game.*
import posiciones.*
import personaje.*
import escenario.*
import bloques.*
import enemigos.*
import animaciones.*

class Bomba { // Al llamar a la clase con bomberman la bomba hace animacion de explotar y llama al fuego
	var property image = "bomba_0.png"
	const property position = bomberman.recorrido().last()
	var property sound = "boom.wav"
	//var property alcance = 1
	
	const imagenes = ["bomba_0.png","bomba_1.png","bomba_2.png"]

	method animacionBomba(){ // Animacion itera sobre la lista de imagenes y cambia el visual cada X tiempo, y borra el tick
		var i = 0
		game.onTick(300,"explosion",{self.image(imagenes.get(i%3))i++})
	}

	method eliminar(tiempo,tick){
		game.schedule(tiempo,{
			game.removeTickEvent(tick);
			if(game.hasVisual(self))
				game.removeVisual(self)
		})
	
	}
	
	method chocaConBomberman(){
		bomberman.position(bomberman.recorrido().get(bomberman.recorrido().size()-2))
		
	}	
	
	
	method explotar(){	
		self.animacionBomba() // inicia la bomba
		self.eliminar(3000,"explosion") //  elimina la bomba
		self.agregarFuego()// agrega fuego 
	}


	method agregarFuego(){
		const expCentral = new ExpCentral(image="exp_0_centr.png")
		const expDerecha = new ExpDerecha(image="exp_0_derec_2.png")
		const expIzq = new ExpIzq(image="exp_0_izqui_2.png")
		const expArriba = new ExpArriba(image="exp_0_arrib_2.png")
		const expAbajo = new ExpAbajo(image="exp_0_abajo_2.png")
		
		game.schedule(3000,{
			game.addVisual(expCentral);//funciona muestra fuego central y desaparece
			expCentral.expandirFuego("centr", expCentral.imagenesExplosion(), 0)
			game.addVisual(expDerecha)
			expDerecha.expandirFuego("derec", expDerecha.imagenesExplosion(), self.position().right(1)) // aparece la animacion
 			game.addVisual(expIzq)		// Fuego Izq Obj
 			expIzq.expandirFuego("izqui", expIzq.imagenesExplosion(), self.position().left(1))
 			game.addVisual(expArriba) // Fuego arriba Obj
 			expArriba.expandirFuego("arrib", expArriba.imagenesExplosion(), self.position().up(1))
 			game.addVisual(expAbajo) // Fuego Abajo Obj
 			expAbajo.expandirFuego("abajo", expAbajo.imagenesExplosion(), self.position().down(1))
		})
		game.schedule(4200, {bomberman.agregarBombaDisponible(); bomberman.sacarBombaPlantada(position)})
	}
	
	method chocarEnemigo(enemigo){
		if(!enemigo.pasaBombas()){
			enemigo.chocar()
		}
	}
		
}

class Fuego  {
	var property image
	var property position =  bomberman.bombasPlantadas().last()
	
	method eliminar(tiempo,tick){
		game.schedule(tiempo,{
			game.removeTickEvent(tick);
			if(game.hasVisual(self))
				game.removeVisual(self)
		})
	}
	
	method eliminarSiNoHayDuro(posicion,tiempo,tick){
		if(!escenario.hayBloquesDurosEn(posicion)){
		self.eliminar(tiempo,tick)
		}
	}
	method expandirFuego(direccion, imagenes, posicionSiguiente) {
		var i = 0
		var a = 1
		
		if(!escenario.hayAlgoEnPosicion(posicionSiguiente)){
			if(a > 0 ){
				self.position(posicionSiguiente)
				a-- 
			}
			game.onTick(300,direccion,{
				self.image(imagenes.get(i%4))i++
			})
			self.eliminarSiNoHayDuro(posicionSiguiente,1200, direccion)
		}
		else {
			game.removeVisual(self)
			self.eliminarBloqueEnPosicionSiHay(posicionSiguiente)
			self.eliminarEnemigoEnPosicionSiHay(posicionSiguiente)
			self.eliminarBombermanEnPosicionSiHay(posicionSiguiente)
		}
	}
	
	method chocaConBomberman(){
		bomberman.morir()
	}
	
	method imagenesExplosion()
	
	method eliminarBloqueEnPosicionSiHay(posicion){
		if(escenario.hayBloquesBlandosEn(posicion)){ 
			escenario.devolverMuroBlando(posicion).explotar()
		}
	}
	
	method eliminarBombermanEnPosicionSiHay(posicion){
		if(bomberman.position() == posicion){ 
			bomberman.morir()
		}
	}
	
	method eliminarEnemigoEnPosicionSiHay(posicion){
		 if(escenario.hayEnemigosEnPosicion(posicion)){
			escenario.devolverEnemigo(posicion).forEach({e => e.morir()})
		}
	}
	
	method mover(direccion){
		return self.position(direccion.mover(position))
	}
}

class ExpCentral inherits Fuego{
	const imagenes = ["exp_0_centr.png", "exp_1_centr.png", "exp_2_centr.png","exp_3_centr.png"]
	
	override method imagenesExplosion() = imagenes
	
	override method expandirFuego(direccion, unasImagenes, posicionSiguiente) {
		var i = 0
		game.onTick(300,direccion,{
			self.image(imagenes.get(i%4))i++
		})
		self.eliminarSiNoHayDuro(self.position(),1200, direccion)
	}
	
	method chocarEnemigo(enemigo){
		enemigo.morir()
	}
}


class ExpDerecha inherits Fuego{
	const imagenes = ["exp_0_derec_2.png", "exp_1_derec_2.png", "exp_2_derec_2.png","exp_3_derec_2.png"]

	override method imagenesExplosion() = imagenes

	method chocarEnemigo(enemigo){
		enemigo.morir()
	}
}	


class ExpIzq inherits Fuego {
	const imagenes = ["exp_0_izqui_2.png", "exp_1_izqui_2.png", "exp_2_izqui_2.png","exp_3_izqui_2.png"]
	
	override method imagenesExplosion() = imagenes
	
	method chocarEnemigo(enemigo){
		enemigo.morir()
	}
}

class ExpArriba inherits Fuego {
	const imagenes = ["exp_0_arrib_2.png", "exp_1_arrib_2.png", "exp_2_arrib_2.png","exp_3_arrib_2.png"]
	
	override method imagenesExplosion() = imagenes
	
	method chocarEnemigo(enemigo){
		enemigo.morir()
	}
	
}

class ExpAbajo inherits Fuego {
	const imagenes = ["exp_0_abajo_2.png", "exp_1_abajo_2.png", "exp_2_abajo_2.png","exp_3_abajo_2.png"]
	
	override method imagenesExplosion() = imagenes
	
	method chocarEnemigo(enemigo){
		enemigo.morir()
	}
}

