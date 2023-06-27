import bloques.*
import aleatorio.*
import wollok.game.*
import enemigos.*
import personaje.*
import posiciones.*
object inicial{
	var property image = "Title.png"
	var property position = game.at(0,0)
	var property musica = game.sound("Inicio.wav")
	
	method musicaON(){game.schedule(500, {musica.play()} )}
	//method musicaON(){musica.play()}
	method musicaOFF(){ if(!musica.paused()) musica.pause() }
	
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
	const property bloquesCantidad = 64
	const property enemigosGlobosCantidad = 4
	const ubicacionesProhibidas = #{game.at(1,1),game.at(1,2),game.at(1,3),game.at(2,1),game.at(2,2),game.at(2,3),game.at(3,1),game.at(3,2),game.at(3,3)}
	const ubicacionesBloquesDuros = #{game.at(4,4),game.at(4,8),game.at(8,4),game.at(8,8),game.at(12,4),game.at(12,8),game.at(16,4),game.at(16,8),game.at(20,4),game.at(20,8),game.at(24,4),game.at(24,8),game.at(28,4),game.at(28,8),game.at(0,12),game.at(1,12),game.at(2,12),game.at(3,12),game.at(4,12),game.at(5,12),game.at(6,12),game.at(7,12),game.at(8,12),game.at(9,12),game.at(10,12),game.at(11,12),game.at(12,12),game.at(13,12),game.at(14,12),game.at(15,12),game.at(16,12),game.at(17,12),game.at(18,12),game.at(19,12),game.at(20,12),game.at(21,12),game.at(22,12),game.at(23,12),game.at(24,12),game.at(25,12),game.at(26,12),game.at(27,12),game.at(28,12),game.at(29,12),game.at(30,12),game.at(0,0),game.at(1,0),game.at(2,0),game.at(3,0),game.at(4,0),game.at(5,0),game.at(6,0),game.at(7,0),game.at(8,0),game.at(9,0),game.at(10,0),game.at(11,0),game.at(12,0),game.at(13,0),game.at(14,0),game.at(15,0),game.at(16,0),game.at(17,0),game.at(18,0),game.at(19,0),game.at(20,0),game.at(21,0),game.at(22,0),game.at(23,0),game.at(24,0),game.at(25,0),game.at(26,0),game.at(27,0),game.at(28,0),game.at(29,0),game.at(30,0),game.at(0,1),game.at(0,2),game.at(0,3),game.at(0,4),game.at(0,5),game.at(0,6),game.at(0,7),game.at(0,8),game.at(0,9),game.at(0,10),game.at(0,11),game.at(30,1),game.at(30,2),game.at(30,3),game.at(30,4),game.at(30,5),game.at(30,6),game.at(30,7),game.at(30,8),game.at(30,9),game.at(30,10),game.at(30,11)}
	const ubicacionesBlandos = {}
	const property width = 31
	const property height = 13
	//403 posiciones. 64 con bloques blandos. 14 con bloques duros internos. 84 con bloques duros en el borde. 9 resevadas para bomberman (perro aparece en 1). 171 libres
	const enemigosGlobos = []
	method enemigosGlobos() = enemigosGlobos
	method ubicacionesBloquesDuros() = ubicacionesBloquesDuros
	method ubicacionesProhibidas() = ubicacionesProhibidas
	method ubicacionesBlandos() = ubicacionesBlandos
	
	method musicaON(){
		musica.shouldLoop(true)
		musica.play()
	}
	method musicaOFF(){
		if(!musica.paused())
			musica.pause()
	}
	
	method inicio(){
		self.ponerDuros()
		self.ponerBlandos()
		self.ponerEnemigosGlobos()
		self.ponerVidas()
		self.musicaON()
		game.addVisual(bomberman)
	}
	
	method ponerVidas(){
		game.addVisual(vida)
	}
	
	method ponerDuros(){
		borde.bordes().forEach( { p=>game.addVisual(new Duro(position=p)); })
		interno.duros().forEach( { p=>game.addVisual(new Duro(position=p)); })
	}
	
	method ponerBlandos(){
		/* 
		 * CON ESTO CREO EL BLOQUE CON POWERUP ALEATORIO CON POSICION ALEATORIA
		game.addVisual(new Blando(powerUp= true)) <<< VER!!!
		bloques-1.times({i=>game.addVisual(new Blando())})
		*/
		bloquesCantidad.times({i=> game.addVisual(new Blando(id = i))})
	}
	
	method ponerEnemigosGlobos(){
		enemigosGlobosCantidad.times({i => enemigosGlobos.add(new Globo(id = i, direccion = posiciones.anyOne()))})
		enemigosGlobos.forEach({e => game.addVisual(e); e.moverAutomaticamente();
			game.onCollideDo(e,{cosa => e.chocarCosa(cosa)})
		})
		
	}
	
	method removerDuros(){
		ubicacionesBloquesDuros.forEach({ p=>p.clear() })
	}
	
	method removerBlandos(){
		aleatorio.posiciones().forEach({p=>p.clear()})
	}
	
	method removerEmemigos(){
		enemigosGlobos.forEach({p=>p.position().clear()})
	}
	
	method removerBombas(){
		bomberman.bombasPlantadas().forEach({b => b.clear()})
	}
	
	method final(){
		self.musicaOFF()
		self.removerBlandos()
		self.removerDuros()
		self.removerEmemigos()
		self.removerBombas()
		if(game.hasVisual(bomberman))
			game.removeVisual(bomberman)
	}
	
	method hayBloquesDurosEn(posicion) = ubicacionesBloquesDuros.any({u => u == posicion})
	
	method hayAlgoEnPosicion(posicion) = game.getObjectsIn(posicion).size() > 0
	
	method hayBloquesBlandosEn(posicion) = aleatorio.posiciones().any({u => u == posicion}) && !self.hayEnemigosEnPosicion(posicion)
	
	method devolverMuroBlando(posicion) = game.getObjectsIn(posicion).first() //.find({e => e.position() == posicion }) trate de hacerlo con find pero creo que es hasta una lista de 20 elementos max
	
	method hayEnemigosEnPosicion(posicion) = enemigosGlobos.any({e => e.position() == posicion}) // Nuevo pregunta si hay enemigo
	
	method devolverEnemigo(posicion) = game.getObjectsIn(posicion) //.find({e => e.position() == posicion})//busca el objecto en la lista primero pregunte asi no falla          //getObjectIn(posicion) // nuevo devuelve enemigo
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
	method position() = game.at(0,12)
	
	method image() = bomberman.vidas().toString() + "_vida.png"
}