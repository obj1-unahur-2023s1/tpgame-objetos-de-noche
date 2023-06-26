import bloques.*
import wollok.game.*
import escenario.*

object aleatorio{
	const property posiciones = []
	const property prohibidas = #{game.at(1,1),game.at(1,2),game.at(1,3),game.at(2,1),game.at(2,2),game.at(2,3),game.at(3,1),game.at(3,2),game.at(3,3)}
	const property duros = #{game.at(4,4),game.at(4,8),game.at(8,4),game.at(8,8),game.at(12,4),game.at(12,8),game.at(16,4),game.at(16,8),game.at(20,4),game.at(20,8),game.at(24,4),game.at(24,8),game.at(28,4),game.at(28,8),game.at(0,12),game.at(1,12),game.at(2,12),game.at(3,12),game.at(4,12),game.at(5,12),game.at(6,12),game.at(7,12),game.at(8,12),game.at(9,12),game.at(10,12),game.at(11,12),game.at(12,12),game.at(13,12),game.at(14,12),game.at(15,12),game.at(16,12),game.at(17,12),game.at(18,12),game.at(19,12),game.at(20,12),game.at(21,12),game.at(22,12),game.at(23,12),game.at(24,12),game.at(25,12),game.at(26,12),game.at(27,12),game.at(28,12),game.at(29,12),game.at(30,12),game.at(0,0),game.at(1,0),game.at(2,0),game.at(3,0),game.at(4,0),game.at(5,0),game.at(6,0),game.at(7,0),game.at(8,0),game.at(9,0),game.at(10,0),game.at(11,0),game.at(12,0),game.at(13,0),game.at(14,0),game.at(15,0),game.at(16,0),game.at(17,0),game.at(18,0),game.at(19,0),game.at(20,0),game.at(21,0),game.at(22,0),game.at(23,0),game.at(24,0),game.at(25,0),game.at(26,0),game.at(27,0),game.at(28,0),game.at(29,0),game.at(30,0),game.at(0,1),game.at(0,2),game.at(0,3),game.at(0,4),game.at(0,5),game.at(0,6),game.at(0,7),game.at(0,8),game.at(0,9),game.at(0,10),game.at(0,11),game.at(30,1),game.at(30,2),game.at(30,3),game.at(30,4),game.at(30,5),game.at(30,6),game.at(30,7),game.at(30,8),game.at(30,9),game.at(30,10),game.at(30,11)}

	//const property prohibidas = escenario.ubicacionesProhibidas()
	//const property duros = interno.duros()
	method position(){
    	const posicion = self.generarNumero()
    	posiciones.add( posicion )
    	return( posicion )//tengo que si o si retornarla para que var position tome valor
    }
    
    method generarNumero() {
        const numero = self.posicionAleatoria()
        if ( posiciones.contains(numero) || prohibidas.contains(numero) || duros.contains(numero)) {
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
/*24/6 QUEDA SIN EFECTO, SE CUELGA CON MUCHOS OBJETOS.
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
	
//aleatorio POWERIP
	method powerup(){
		return [1, 2, 3].anyOne()
	}
}
* 24/6 QUEDA SIN EFECTO, SE CUELGA CON MUCHOS OBJETOS.
*/