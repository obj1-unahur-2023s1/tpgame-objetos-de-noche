import bloques.*
import wollok.game.*
import escenario.*

object aleatorio{
	const property posiciones = []
	method position(){
    	const posicion = self.generarNumero()
    	posiciones.add( posicion )
    	return( posicion )//tengo que si o si retornarla para que var position tome valor
    }
    
    method generarNumero() {
        const numero = self.posicionAleatoria()
        if ( posiciones.contains(numero) || escenario.ubicacionesProhibidas().contains(numero) || escenario.ubicacionesBloquesDuros().contains(numero)) {
            return self.generarNumero()
        } else {
            return numero
        }
    }

	method posicionAleatoria(){
		return (
			game.at((1..escenario.width()-2).anyOne(),(1..escenario.height()-2).anyOne())
		)
	}
}

object interno{
	//var x = 4
	//var y = 4
	var x = 1
	var y = 1
	//var h=13
	//var w=31
	//const cx =[]
	//const cy = []
	const posiciones = []
	

	method duros(){
		7.times({ i=> self.hacerPos() })
		return posiciones
	}
	
	method hacerPos(){
		posiciones.add( game.at(self.hacerX(),self.hacerY()) )
		if (y == 1) {y = 2} else (y = 1)
		posiciones.add( game.at(self.hacerX(),self.hacerY()) )
		x++
	}

	
	method hacerX(){return 4*x}
	
	method hacerY(){return 4*y}
}

//para poner los Duros borde
object borde{
	var x
	var y
	const posiciones =[]
	//var h=13
	//var w=31
	
	method bordes(){
		x=0
		y=0
		31.times({ i=> self.hacerBordeX() })
		y=12
		x=0
		31.times({ i=> self.hacerBordeX() })
		x=0
		y=1
		11.times({ i=> self.hacerBordeY() })
		x=30
		y=1
		11.times({ i=> self.hacerBordeY() })
		return posiciones
	}
	method hacerBordeX(){
		posiciones.add( game.at(self.hacerX(),self.hacerY()) )
		x++
	}
	
	method hacerBordeY(){
		posiciones.add( game.at(self.hacerX(),self.hacerY()) )
		y++
	}
	method hacerX(){return 0+x}
	method hacerY(){return 0+y}
	
}