import wollok.game.*
//import escenario.* NO LO NECESITO MAS
import aleatorio.*
import powerUps.*
import personaje.*
import animaciones.*


class Duro {
	var property position
	var property image = "muro_duro.png"
	
	method collision() = true
	
	method chocaConBomberman(){
		bomberman.position(bomberman.recorrido().get(bomberman.recorrido().size()-2))
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
		aleatorio.position().remove(position)
		game.removeVisual(self)
		//game.schedule(900, { game.removeVisual(self) })
		
	}
	method chocaConBomberman(){
		bomberman.position(bomberman.recorrido().get(bomberman.recorrido().size()-2))
	}
	
	method dejarPower(){
		if (powerUp) {game.addVisualIn(#{masBombas,controlRemoto,pasarATravezBomba}.anyOne(),position)}
	}
	
/*
//aca empieza la animacion de sacar bloque. VER MUSICA.wpgm
	method animacion(){
		const imagenes = ["explosion_muro_suave_0.png","explosion_muro_suave_1.png","explosion_muro_suave_2.png","explosion_muro_suave_3.png","explosion_muro_suave_4.png","explosion_muro_suave_5.png"]
		var i = 0
		game.onTick(150,"cambio",{
			self.image(imagenes.get(i%6))
			i++
		} )
		//game.removeTickEvent("cambio")
	}

	method dejarPower(){
		const posicion = position
		if (powerUp) {game.addVisualIn(powerAleatorio(),posicion)}
			//game.addVisual( powerUp.position(self.position()) )
	}*/

}	


		/*
		game.onTick(1000,"cambio", {
			3.times({i=>self.cambiar()})
			game.removeTickEvent("cambio") } )
	}
	
	method cambiar(){
		if (image == "explosion_muro_suave_0.png") 
		{image = "explosion_muro_suave_2.png"}
		else {image = "explosion_muro_suave_5.png"}
 	} 	method explotar(){
		game.onTick(500,"explotar", {
		3.times(
			game.schedule(500, {i=>image=("explosion_muro_suave_"+i+".png")}))
		}
			game.removeTickEvent("explotar")
	} */