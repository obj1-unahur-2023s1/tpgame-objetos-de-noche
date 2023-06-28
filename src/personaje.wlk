import wollok.game.*
import bombaas.*
import enemigos.*
import escenario.*

object bomberman {
	const property recorrido=[game.at(1,1),game.at(2,1)] // game.at 2,1 esta pasado para hacer pruebas
	
	var unaBomba
	
	var property e =1
	var haciaDerecha =0
	var haciaIzquierda =0
	var haciaArriba =0
	var haciaAbajo =0
	
	var  position = game.at(1, 1)
	var property image ="player_derec_0.png"
	const property bombasPlantadas =[]
	var remotoActivo=false
	var direccion = true
	var vidas= 3
	
	var puntos = 0
	
	var property estaVivo = true
	
	 
	var bombasDisponibles = 1
	var property pasarBomba = false
	method vidas()= vidas
		
	method agregarBombaDisponible(){
		bombasDisponibles ++
	}
	
	method sacarBombaPlantada(posicion){
		if(bombasPlantadas.contains(posicion)){
			bombasPlantadas.remove(posicion)
		}
	}
	
	method position() = position
	
	method position(posicion){
		position = posicion
		recorrido.add(position)
	}
	
	method arriba(){ if (position.y()< game.height()-2  && direccion)
		if(estaVivo){
			self.position(position.up(1))
			const imagen = ["player_arrib_0.png" ,"player_arrib_1.png" , "player_arrib_2.png" ]
			
			self.image(imagen.get(haciaArriba%3))
			 haciaArriba++
		}
	}
	
	method abajo(){ if (position.y()>1 && direccion)
		if(estaVivo){
			self.position(position.down(1))
			const imagen = ["player_abajo_0.png" ,"player_abajo_1.png" , "player_abajo_2.png" ]
			self.image(imagen.get(haciaAbajo%3))
			haciaAbajo++
		}
	}
	
	method izquierda(){ if (position.x()>1  && direccion)
		if(estaVivo){
			self.position(position.left(1))
			const imagen = ["player_izqui_0.png" ,"player_izqui_1.png" , "player_izqui_2.png" ]
			self.image(imagen.get(haciaIzquierda%3))
			haciaIzquierda++
		}
	}
	
	method derecha(){ if (position.x()< game.width()-2  && direccion)
		if(estaVivo){
			self.position(position.right(1))
			const imagen = ["player_derec_0.png" ,"player_derec_1.png" , "player_derec_2.png" ]
			self.image(imagen.get(haciaDerecha%3))
			haciaDerecha++
		}
	}
	
	method chocarEnemigo(cosa){
		cosa.chocaConBomberman()
	}
	
	
   method morir(){
   		estaVivo = false
	 	self.sacarBombas()
	    self.desaparece()
	   	if (vidas > 1 ){
	   		game.schedule(1200,{self.position( self.recorrido().first()); game.removeTickEvent("bombermanMuere");image ="player_derec_0.png" ; direccion=true; 
	   		vidas -= 1; estaVivo = true;})
	   } 
	   else {
	   	game.schedule(1200, {
		   	escenario.final()
			final.inicio()
	   	})
	   }
   
   }
   
   method agregarPuntos(puntosAAgregar){
   	puntos += puntosAAgregar
   }
   
   method sacarBombas(){
   		bombasPlantadas.forEach({b => b.sacarBomba()})
   }
	
	method ponerBomba(){
		if (recorrido.size() > 1 && bombasDisponibles > 0){
			const posActu = position
			position = recorrido.get(recorrido.size() - 2)
		 	unaBomba = new Bomba(position = posActu)
			game.addVisual(unaBomba)
			bombasPlantadas.add(unaBomba)
			bombasDisponibles --
			unaBomba.explotar()
		}
	}
 	method desaparece (){
 		const imagen = ["player_muere_0.png" ,"player_muere_1.png" , "player_muere_2.png","player_muere_3.png","player_muere_4.png","player_muere_5.png","player_muere_6.png","player_muere_7.png" ]
 		var i = 0
		direccion = false
		game.onTick(150,"bombermanMuere",{self.image(imagen.get(i%8)) ; i++})
		
 	}

	method explotaBombas(){
		game.removeTickEvent ("explota bomba")
		game.removeVisual(bombasPlantadas.first())
		bombasPlantadas.remove(bombasPlantadas.first())
		bombasDisponibles ++
	}
	method activarMasBombas() {
		bombasDisponibles ++
	}
	method activarRemoto() {
		remotoActivo = true
	}
	method activarPasarBomba() {
		pasarBomba = false
	}
}

