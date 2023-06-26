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
}

object masBombas inherits PowerUp {
	override method image() = "masBombas.png"
	override method activarPowerUp() {
		bomberman.activarMasBombas()
	}
}

object controlRemoto inherits PowerUp {
	override method image() = "controlRemoto.png"
	override method activarPowerUp() {
		bomberman.activarRemoto()
	}
}

object pasarATravezBomba inherits PowerUp {
	override method image() = "controlRemoto.png"
	override method activarPowerUp() {
		bomberman.activarPasarBomba()
	}
}