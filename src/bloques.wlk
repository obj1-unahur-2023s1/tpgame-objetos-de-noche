import wollok.game.*
import aleatorio.*
import powerUps.*
import personaje.*
import animaciones.*
import enemigos.*


class Duro {
	var property position
	var property image = "muro_duro.png"
	
	method collision() = true
	
	method chocaConBomberman(){
		bomberman.position(bomberman.recorrido().get(bomberman.recorrido().size()-2))
	}
	
	method chocarEnemigo(enemigo){
		enemigo.chocar()
	}
}


class Blando{
	var property position = aleatorio.position()
	var property image = "muro_blando.png"
	const property powerUp = false

	method collision() = true
	
	method explotar(){
		animacion.animacion("bloque",150,"explosion_muro_suave_",900,self)
		self.dejarPower()
		self.eliminar(900,"cambio")
	}
	
	method chocaConBomberman(){
		bomberman.position(bomberman.recorrido().get(bomberman.recorrido().size()-2))
	}
	
	method dejarPower(){
		if (powerUp) {game.addVisualIn(#{masBombas,controlRemoto,pasarATravezBomba}.anyOne(),position)}
	}
	method eliminar(tiempo,tick){ 
		game.schedule(tiempo,{
			game.removeTickEvent(tick);
			game.removeVisual(self)
		})
	}
	
	method chocarEnemigo(enemigo){
		if(!enemigo.pasaParedesBlandas()){
			enemigo.chocar()
		}
	}
}