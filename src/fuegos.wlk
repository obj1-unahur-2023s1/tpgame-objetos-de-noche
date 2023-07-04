import wollok.game.*
import personaje.*
import enemigos.*
import bloques.*
/* 
object expDerecha {
		const imagen = ["exp_0_derec_1.png","exp_1_derec_1.png","exp_2_derec_1.png","exp_3_derec_1.png","exp_0_derec_2.png","exp_1_derec_2.png","exp_2_derec_2.png","exp_3_derec_2.png"]
		var i = 0
		var property image = "exp_0_derec_1.png"
		var property position = bomberman.bombasPlantadas().last()//bomberman.recorrido().last()
		method expandirFuego(){
		//iria un If Preguntando en cada posicion si puede expandir , que muestre la animacion y elimine el objeto
		self.position(self.position().right(1)); // mueve a la derecha
		game.onTick(150,"derec",{ //empieza la animacion
			self.image(imagen.get(i%8))i++
		})
		self.eliminar(1200,"derec") // corta animacion
	}
	
	method eliminar(tiempo,tick){
		game.schedule(tiempo,{
			game.removeTickEvent(tick);
			game.removeVisual(self)
		})
		
	}	
	
	
	
	method chocarEnemigo(enemigo){
		enemigo.morir()
	}
	
}

object expIzq {
		const imagen = ["exp_0_izqui_1.png","exp_1_izqui_1.png","exp_2_izqui_1.png","exp_3_izqui_1.png","exp_0_izqui_2.png","exp_1_izqui_2.png","exp_2_izqui_2.png","exp_3_izqui_2.png"]
		var i = 0
		var property image = "exp_0_izqui_1.png"
		var property position = bomberman.bombasPlantadas().last()//bomberman.recorrido().last()
		method expandirFuego(){

		self.position(self.position().left(1)); // mueve a la derecha
		game.onTick(150,"izqui",{ //empieza la animacion
			self.image(imagen.get(i%8))i++
		})
		self.eliminar(1200,"izqui") // corta animacion
	}
	
	method chocarEnemigo(enemigo){
		enemigo.morir()
	}
	
	method eliminar(tiempo,tick){
		game.schedule(tiempo,{
			game.removeTickEvent(tick);
			game.removeVisual(self)
		})
		
	}	
}

object expArriba {
		const imagen = ["exp_0_arrib_1.png","exp_1_arrib_1.png","exp_2_arrib_1.png","exp_3_arrib_1.png","exp_0_arrib_2.png","exp_1_arrib_2.png","exp_2_arrib_2.png","exp_3_arrib_2.png"]
		var i = 0
		var property image = "exp_0_arrib_1.png"
		var property position = bomberman.bombasPlantadas().last()//bomberman.recorrido().last()
		method expandirFuego(){

		self.position(self.position().up(1)); // mueve a la derecha
		game.onTick(150,"arrib",{ //empieza la animacion
			self.image(imagen.get(i%8))i++
		})
		self.eliminar(1200,"arrib") // corta animacion
	}
	
	method eliminar(tiempo,tick){
		game.schedule(tiempo,{
			game.removeTickEvent(tick);
			game.removeVisual(self)
		})
		
	}	
	
	
	
	method chocarEnemigo(enemigo){
		enemigo.morir()
	}
	
}

object expAbajo {
		const imagen = ["exp_0_abajo_1.png","exp_1_abajo_1.png","exp_2_abajo_1.png","exp_3_abajo_1.png","exp_0_abajo_2.png","exp_1_abajo_2.png","exp_2_abajo_2.png","exp_3_abajo_2.png"]
		var i = 0
		var property image = "exp_0_abajo_1.png"
		var property position = bomberman.bombasPlantadas().last()//bomberman.recorrido().last()
		method expandirFuego(){

		self.position(self.position().down(1)); // mueve a la derecha
		game.onTick(150,"abajo",{ //empieza la animacion
			self.image(imagen.get(i%8))i++
		})
		self.eliminar(1200,"abajo") // corta animacion
	}
	
	method eliminar(tiempo,tick){
		game.schedule(tiempo,{
			game.removeTickEvent(tick);
			game.removeVisual(self)
		})
	}	
	
	
	
	method chocarEnemigo(enemigo){
		enemigo.morir()
	}
	
}
* /
*/
