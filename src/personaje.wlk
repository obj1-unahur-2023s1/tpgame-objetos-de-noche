import wollok.game.*
import bombaas.*
import enemigos.*
import escenario.*

object bomberman {
	const property recorrido=[game.at(1,1),game.at(2,1)] // game.at 2,1 esta pasado para hacer pruebas
	
	var bomba7
	
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
	
	 
	var property bombasDisponibles = 1
	var property pasarBomba = false
	method iniciar(){
		
		game.width(31)
		game.height(13)
		game.cellSize(32)
		keyboard.up().onPressDo{self.arriba()}
		keyboard.down().onPressDo{self.abajo()}
		keyboard.right().onPressDo{self.derecha() }
		keyboard.left().onPressDo{self.izquierda() }
		keyboard.p().onPressDo{self.ponerBomba()}
		
		game.addVisual(self)
		
		}
		
	method vidas()= vidas
		
	method position() = position
	
	method position(posicion){
		
		position = posicion
		recorrido.add(position)
	}
	
	method arriba(){ if (position.y()< game.height()-2  && direccion)
		self.position(position.up(1))
		const imagen = ["player_arrib_0.png" ,"player_arrib_1.png" , "player_arrib_2.png" ]
		
		self.image(imagen.get(haciaArriba%3))
		 haciaArriba++
	}
	
	method abajo(){ if (position.y()>1 && direccion)
		self.position(position.down(1))
		const imagen = ["player_abajo_0.png" ,"player_abajo_1.png" , "player_abajo_2.png" ]
		self.image(imagen.get(haciaAbajo%3))
		haciaAbajo++
	}
	
	method izquierda(){ if (position.x()>1  && direccion)
		self.position(position.left(1))
		const imagen = ["player_izqui_0.png" ,"player_izqui_1.png" , "player_izqui_2.png" ]
		self.image(imagen.get(haciaIzquierda%3))
		haciaIzquierda++
	}
	
	method derecha(){ if (position.x()< game.width()-2  && direccion)
		self.position(position.right(1))
		const imagen = ["player_derec_0.png" ,"player_derec_1.png" , "player_derec_2.png" ]
		self.image(imagen.get(haciaDerecha%3))
		haciaDerecha++
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
   if (vidas >0 ){
   game.schedule(1200,{self.position( self.recorrido().first()); game.removeTickEvent("bombermanMuere");image ="player_derec_0.png" ; direccion=true })
   
   } else {
   	
   	escenario.final()
	final.inicio()
   }
   
   }
	
	method ponerBomba(){
		 bomba7= new Bomba()
				
		
		//if (!remotoActivo){
		//	game.onTick(4000, "explota bomba", { self.explotaBombas() })
		//}
		if (recorrido.size() > 1 && bombasDisponibles > 0){
		game.addVisual(bomba7)
		bombasPlantadas.add(bomba7.position())
		bombasDisponibles --
		//game.schedule(2000,{bomba7.explotar()})} No hace falta schedule
		bomba7.explotar()}
		bombasDisponibles ++
	}
 	method desaparece (){
 		const imagen = ["player_muere_0.png" ,"player_muere_1.png" , "player_muere_2.png","player_muere_3.png","player_muere_4.png","player_muere_5.png","player_muere_6.png","player_muere_7.png" ]
 		var i = 0
		//game.onTick(500,"cambioColor", {}})
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

