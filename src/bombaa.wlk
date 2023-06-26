
import wollok.game.*
import posiciones.*
import personaje.*
import fuegos.*

class Bomba { // Al llamar a la clase con bomberman la bomba hace animacion de explotar y llama al fuego
	var property image = "bomba_0.png"
	var property position = bomberman.recorrido().last()
	//var property alcance = 1
	

	//const property posicionesADesaparecer = []
	const imagenes = ["bomba_0.png","bomba_1.png","bomba_2.png"]
	//const property posicionesConFuego =[]
	
	method animacion(){ // Animacion itera sobre la lista de imagenes y cambia el visual cada X tiempo, y borra el tick
		var i = 0
		game.onTick(300,"explosion",{self.image(imagenes.get(i%3))i++})
	}

	method eliminar(tiempo,tick){
		game.schedule(tiempo,{
			game.removeTickEvent(tick);
			game.removeVisual(self)
		})
	
	}
	method chocaConBomberman(){
		bomberman.position(bomberman.recorrido().get(bomberman.recorrido().size()-2))
		
	}	
	
	
	method explotar(){
		
		self.animacion() // inicia la bomba
		self.eliminar(3000,"explosion") //  elimina la bomba
		self.agregarFuego() // agrega fuego 
	}


	method agregarFuego(){
		
		const fuego = new Fuego(position=bomberman.bombasPlantadas().last())
		
		game.schedule(3000,{
			game.addVisual(fuego);
			fuego.expCentral() //funciona muestra fuego central y desaparece
			game.addVisual(expDerecha)
			expDerecha.expandirFuego() // aparece la animacion
 			game.addVisual(expIzq)		// Fuego Izq Obj
 			expIzq.expandirFuego()
 			game.addVisual(expArriba) // Fuego arriba Obj
 			expArriba.expandirFuego()
 			game.addVisual(expAbajo) // Fuego Abajo Obj
 			expAbajo.expandirFuego()
		})

	}
		
	method mover(direccion){
		self.position(direccion.mover(position))
	}
}

class Fuego inherits Bomba {
	//var property image = "exp_0_centr.png"
	//
	
	override method position() = bomberman.bombasPlantadas().last()

	method expCentral(){
		const imagen = ["exp_0_centr.png","exp_1_centr.png","exp_2_centr.png","exp_3_centr.png"]
		var i = 0
		self.image("exp_0_centr.png")
		game.onTick(300,"a",{
			self.image(imagen.get(i%4))i++;	
		})
		self.eliminar(1200,"a")
	}
	
}



