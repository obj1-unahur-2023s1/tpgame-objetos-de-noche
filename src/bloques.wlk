import wollok.game.*
import aleatorio.*
import powerUps.*
import personaje.*
import animaciones.*
import enemigos.*
import bombaas.*
import fuegos.*

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
	const id
	var property position = aleatorio.position()
	var property image = "muro_blando.png"
	const property powerUp = false
	
	method collision() = true
	
	method explotar(){
		const animacionNombre = "bloque_explosion_" + id
		animacion.animacion(animacionNombre, 200, "explosion_muro_suave_", 1200,self)
		self.dejarPower()
		self.eliminar(1200,animacionNombre)
	}
	
	method chocaConBomberman(){
		bomberman.position(bomberman.recorrido().get(bomberman.recorrido().size()-2))
	}
	
	method dejarPower(){
		if (powerUp) {game.addVisualIn(#{masBombas,controlRemoto,pasarATravezBomba}.anyOne(),position)}
	}
	method eliminar(tiempo,tick){ 
		game.schedule(tiempo,{
			game.removeVisual(self)
		})
	}
	
	method chocarEnemigo(enemigo){
		if(!enemigo.pasaParedesBlandas()){
			enemigo.chocar()
		}
	}
}