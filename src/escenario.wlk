import bloques.*
import aleatorio.*
import wollok.game.*
import enemigos.*
import personaje.*
import direcciones.*
import powerUps.*
//import basuraYejemplos.*

object inicial{
	var property image = "Title.png"
	var property position = game.at(0,0)
	var property musica = game.sound("Inicio.wav")
	
	method musicaON(){game.schedule(500, {musica.play()} )}
	//method musicaON(){musica.play()}
	method musicaOFF(){musica.pause()}
	
	method inicio(){
		game.addVisual(self)
		self.musicaON()
	}
	
	method final(){
		self.musicaOFF()
		position.clear()
		//game.clear()
		//escenario.inicio()
	}
	
}


object escenario{
	var property musica= game.sound("Nivel.wav")
	const property bloquesCantidad = 33
	const property enemigosGlobosCantidad = 4
	//const property ubicacionesProhibidas = [game.at(1,1),game.at(1,2),game.at(1,3),game.at(2,1),game.at(2,2),game.at(2,3),game.at(3,1),game.at(3,2),game.at(3,3)]
	const ubicacionesBloquesDuros = []
	const property width = 31
	const property height = 13
	//403 posiciones. 64 con bloques blandos. 14 con bloques duros internos. 84 con bloques duros en el borde. 9 resevadas para bomberman (perro aparece en 1). 171 libres
	const enemigosGlobos = []
	method enemigosGlobos() = enemigosGlobos
	//method ubicacionesBloquesDuros() = ubicacionesBloquesDuros
	
	method musicaON(){
		musica.shouldLoop(true)
		musica.play()
	}
	method musicaOFF(){
		//musica.shouldLoop(false)
		musica.pause()
	}
	
	method inicio(){
		//game.clear()
		//game.removeVisual(game.getObjectsIn(game.at(0,0)))
		self.ponerDuros()

		self.ponerBlandos()
		self.ponerEnemigosGlobos()
		self.musicaON()
		//return (game.boardGround("Playfield.png"))
		bomberman.iniciar()
		game.addVisual(vida)
	}
	
	method ponerDuros(){
		//(0..aleatorio.duros().size()-1).forEach( { p=>game.addVisual(new Duro(position=aleatorio.duros().get(p))) } )
		interno.duros().forEach( { p=>game.addVisual(new Duro(position=p)); ubicacionesBloquesDuros.add(p) })
		//borde.bordes().forEach( { p=>game.addVisual(new Duro(position=p)); ubicacionesBloquesDuros.add(p) })
	}

	method ponerBlandos(){
		bloquesCantidad.times({i=>game.addVisual(new Blando())})
		game.addVisual(new Blando(powerUp= true))
	}
	
	method ponerEnemigosGlobos(){
		enemigosGlobosCantidad.times({i => enemigosGlobos.add(new Globo(id = i, direccion = direcciones.anyOne()))})
		enemigosGlobos.forEach({e => game.addVisual(e); e.moverAutomaticamente();
		})
		
	}

	method removerDuros(){
		ubicacionesBloquesDuros.forEach({ p=>p.clear() })
	}
	
	method removerBlandos(){
		aleatorio.posiciones().forEach({p=>p.clear()})
	}
	
	method removerEmemigos(){
		aleatorio.posiciones().forEach({p=>p.clear()})
	}
	
	method final(){
		self.musicaOFF()
		self.removerBlandos()
		self.removerDuros()
		self.removerEmemigos()
		//game.clear()
		//game.addVisual(final) //ponemos la imagen gameover
		game.removeVisual(bomberman)
	}
	//MODIFICADO EG 24/6
	method hayBloquesDurosEn(posicion) = aleatorio.duros().any({u => u == posicion})
	//MODIFICADO EG 24/6
	
	method hayBloquesBlandosEn(posicion) = aleatorio.posiciones().any({u => u == posicion})
}


object final{
	var property image = "GameOver.png"
	var property position = game.at(0,0)
	var property musica= game.sound("GameOver.wav")
	
	method inicio(){
		//game.clear()
		game.addVisual(self)
		self.musicaON()
		//self.musicaON()
	}
	
	method final(){
		self.musicaOFF()
		position.clear()
		//game.clear()
	}
	
	method musicaON(){
		musica.shouldLoop(true)
		musica.play()
	}
	
	method musicaOFF(){
		//musica.shouldLoop(false)
		musica.pause()
	}
}

object vida{
	//var property image = "3_vida.png"
	const property position = game.at(0,12)
	
	method image(){
		if (bomberman.vidas() == 3)	{return "3_vida.png"}
			else if (bomberman.vidas() == 2) {return "2_vida.png"}
			else {return "1_vida.png"}
	}
}