import personaje.*
import wollok.game.*
import bombaas.*

class PowerUp {
	method position(){}
	method image()
	method caerPowerUp(powerUp) = game.addVisual(powerUp)
	
	method activarPowerUp()
	method chocaConBomberman() {
		self.activarPowerUp()
		game.removeVisual(self)
	}
	
	method chocarEnemigo(enemigo){}
}

object masBombas inherits PowerUp {
	override method image() = "powerup_masBomba.png"
	override method activarPowerUp() {
		bomberman.activarMasBombas()
	}
	
	
	
}

object controlRemoto inherits PowerUp {
	override method image() = "powerup_remoto.png"
	override method activarPowerUp() {
		bomberman.activarRemoto()
	}
}

object pasarATravezBomba inherits PowerUp {
	override method image() = "powerup_pasaBomba.png"
	override method activarPowerUp() {
		bomberman.activarPasarBomba()
	}
}