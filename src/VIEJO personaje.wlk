import wollok.game.*
import bombas.*
import enemigos.*


object bomberman {
	const property recorrido=[game.at(1,1)]
	
	var bomba7
	
	var property e =1
	
	var  position = game.at(1, 1)
	var property image ="player_derec_0.png"
	const property bombasPlantadas =[]
	const remotoActivo=false
	
	var vidas= 3
	method vidas() = vidas
	
	method iniciar(){
		
		game.width(31)
		game.height(13)
		game.cellSize(32)
		keyboard.up().onPressDo{self.arriba(); self.seMueveHaciaArriba()}
		keyboard.down().onPressDo{self.abajo()}
		keyboard.right().onPressDo{self.derecha() ; self.seMueveHaciaDer()}
		keyboard.left().onPressDo{self.izquierda() ; self.seMueveHaciaIzq()}
		keyboard.p().onPressDo{self.ponerBomba()}
		game.addVisual(self)
		
		}
		
	method position() = position
	
	method position(posicion){
		
		position = posicion
		recorrido.add(position)
	}
	
	method arriba(){ if (position.y()< game.height()-1)
		self.position(position.up(1))
	}
	
	method abajo(){ if (position.y()>0)
		self.position(position.down(1))
		const imagen = ["player_abajo_0.png" ,"player_abajo_1.png" , "player_abajo_2.png" ]
		var i = 0
		
		self.image(imagen.get(i%3))
		i++
	}
	
	method izquierda(){ if (position.x()>0)
		self.position(position.left(1))
	}
	
	method derecha(){ if (position.x()< game.width()-1)
		self.position(position.right(1))
	}
	
	method seMueveHaciaIzq(){
		const imagen = ["player_izqui_0.png" ,"player_izqui_1.png" , "player_izqui_2.png" ]
		var i = 0
		
		self.image(imagen.get(i%3))
		i++
	}
	
		method seMueveHaciaDer(){
		const imagen = ["player_derec_0.png" ,"player_derec_1.png" , "player_derec_2.png" ]
		var i = 0
		
		self.image(imagen.get(i%3))
		i++
	}
	
		method seMueveHaciaArriba(){
		const imagen = ["player_arrib_0.png" ,"player_arrib_1.png" , "player_arrib_2.png" ]
		var i = 0
		
		self.image(imagen.get(i%3))
		i++
	}
		method seMueveHaciaAbajo(){
		const imagen = ["player_abajo_0.png" ,"player_abajo_1.png" , "player_abajo_2.png" ]
		var i = 0
		
		self.image(imagen.get(i%3))
		i++
	}
	
	method chocarEnemigo(cosa){
		cosa.chocaConBomberman()
		if(vidas>0){
		game.removeVisual(self)
		game.addVisual(self)
		}
	}
   method morir(){
   	vidas -= 1
    self.desaparece()
   
   game.schedule(1200,{self.position( self.recorrido().first()); game.removeTickEvent("bombermanMuere");image ="player_derec_0.png"})
   
   
   }
	
	method ponerBomba(){
		 bomba7= new Bomba()
				
		
		if (!remotoActivo){
			game.onTick(4000, "explota bomba", { self.explotaBombas() })
		}
		game.addVisual(bomba7)
		bombasPlantadas.add(bomba7)
	}
 	method desaparece (){
 		const imagen = ["player_muere_0.png" ,"player_muere_1.png" , "player_muere_2.png","player_muere_3.png","player_muere_4.png","player_muere_5.png","player_muere_6.png","player_muere_7.png" ]
 		var i = 0
		//game.onTick(500,"cambioColor", {}})
		
		game.onTick(150,"bombermanMuere",{self.image(imagen.get(i%8)) ; i++})
		
 	}

	method explotaBombas(){
		game.removeTickEvent ("explota bomba")
		game.removeVisual(bombasPlantadas.first())
		bombasPlantadas.remove(bombasPlantadas.first())
	}
	
}

