
import wollok.game.*
import posiciones.*
import personaje.*
import escenario.*
import bloques.*
import enemigos.*

class Bomba { // Al llamar a la clase con bomberman la bomba hace animacion de explotar y llama al fuego
	var property image = "bomba_0.png"
	var property position = bomberman.recorrido().last()
	var property sound = "boom.wav"
	//var property alcance = 1
	
	const imagenes = ["bomba_0.png","bomba_1.png","bomba_2.png"]

	method animacion(){ // Animacion itera sobre la lista de imagenes y cambia el visual cada X tiempo, y borra el tick
		var i = 0
		game.onTick(300,"explosion",{self.image(imagenes.get(i%3))i++})
	}

	method eliminar(tiempo,tick){
		game.schedule(tiempo,{
			game.removeTickEvent(tick);
			game.removeVisual(self)
		})
	
	}
	method chocaConBomberman(){
		bomberman.position(bomberman.recorrido().get(bomberman.recorrido().size()-2))
		
	}	
	
	
	method explotar(){	
		self.animacion() // inicia la bomba
		self.eliminar(3000,"explosion") //  elimina la bomba
		self.agregarFuego()// agrega fuego 
		//game.sound(sound)
	}


	method agregarFuego(){
		const expCentral = new ExpCentral(image="exp_0_centr.png")
		const expDerecha = new ExpDerecha(image="exp_0_derec_1.png")
		const expIzq = new ExpIzq(image="exp_0_izqui_1.png")
		const expArriba = new ExpArriba(image="exp_0_arrib_1.png")
		const expAbajo = new ExpAbajo(image="exp_0_abajo_1.png")
		
		game.schedule(3000,{
			//blando.explotar() necesita crear un objecto de su clase
			game.addVisual(expCentral);//funciona muestra fuego central y desaparece
			expCentral.expandirFuego()
			game.addVisual(expDerecha)
			expDerecha.expandirFuego() // aparece la animacion
 			game.addVisual(expIzq)		// Fuego Izq Obj
 			expIzq.expandirFuego()
 			game.addVisual(expArriba) // Fuego arriba Obj
 			expArriba.expandirFuego()
 			game.addVisual(expAbajo) // Fuego Abajo Obj
 			expAbajo.expandirFuego()
		})

	}
	
	method chocarEnemigo(enemigo){
		if(!enemigo.pasaBombas()){
			enemigo.chocar()
		}
	}
		
}

class Fuego  {
	var property image
	var property position =  bomberman.bombasPlantadas().last() // CUANDO DICE dEBE SER ENTERO POSITIVO ES PORQUE ESTA FUNCION NO DEJA NADA EN LA LISTA
	
	method eliminar(tiempo,tick){
		game.schedule(tiempo,{
		game.removeTickEvent(tick);
		game.removeVisual(self)
		})
	}
	
	method eliminarSiNoHayDuro(posicion,tiempo,tick){
		if(!escenario.hayBloquesDurosEn(posicion)){
		self.eliminar(tiempo,tick)
		}
	}
	method expandirFuego() 	
	
	method eliminarBloqueEnPosicionSiHay(posicion){
		if(escenario.hayBloquesBlandosEn(posicion)){ 
			game.removeVisual(self)
			escenario.devolverMuroBlando(posicion).explotar()
		}else if(escenario.hayBloquesDurosEn(posicion)){
			game.removeVisual(self)
		}
	}
	
	method eliminarEnemigoEnPosicionSiHay(posicion){
		 if(escenario.hayEnemigosEnPosicion(posicion)){
			game.removeVisual(self)
			escenario.devolverEnemigo(posicion).morir()
		}//Deberia funcionar
	}
	
	method mover(direccion){
		return self.position(direccion.mover(position))
	}
}

class ExpCentral inherits Fuego{//(image="exp_0_centr.png"){
	
		const imagen = ["exp_0_centr.png","exp_1_centr.png","exp_2_centr.png","exp_3_centr.png"]
		var i = 0
		override method expandirFuego(){ // funciona no aparece y no se va mas de su lugar , no se mueve con la ultima bomba
			self.image("exp_0_centr.png")
			game.onTick(300,"a",{
				self.image(imagen.get(i%4))i++;	
			})
			self.eliminar(1200,"a")}
			
}


class ExpDerecha inherits Fuego{
		const imagen = ["exp_0_derec_1.png","exp_1_derec_1.png","exp_2_derec_1.png","exp_3_derec_1.png","exp_0_derec_2.png","exp_1_derec_2.png","exp_2_derec_2.png","exp_3_derec_2.png"]
		var i = 0
		var a = 1

		override method expandirFuego(){ //lo primero que debe hacer es moverse
		if(a > 0 ){
		self.position(self.position().right(1))
		a-- }// mueve a la derecha no mas de una vez
		
		self.eliminarBloqueEnPosicionSiHay(self.position())//deberia haberse movido el cabezalanteriormente //mueve cuando encuentra objecto tira error de posicion , mientras funciona normal
		self.eliminarEnemigoEnPosicionSiHay(self.position())
		//blando.devolverMuroBlando(self.position()).explotar()// prueba a la fuerza lo que deberia hacer el escenario
		//blando.devolverEnemigo(self.position()).morir()
		game.onTick(150,"derec",{ //empieza la animacion
			self.image(imagen.get(i%8))i++
		})
		self.eliminarSiNoHayDuro(self.position(),1200,"derec")//a++// corta animacion
	}	
}	


class ExpIzq inherits Fuego {
		const imagen = ["exp_0_izqui_1.png","exp_1_izqui_1.png","exp_2_izqui_1.png","exp_3_izqui_1.png","exp_0_izqui_2.png","exp_1_izqui_2.png","exp_2_izqui_2.png","exp_3_izqui_2.png"]
		var i = 0
		var a = 1
		
		override method expandirFuego(){	
		if(a > 0 ){
		self.position(self.position().left(1))
		a-- }; // mueve a la derecha
		
		self.eliminarBloqueEnPosicionSiHay(self.position())//deberia haberse movido el cabezalanteriormente //mueve cuando encuentra objecto tira error de posicion , mientras funciona normal
		self.eliminarEnemigoEnPosicionSiHay(self.position())
		
		game.onTick(150,"izqui",{ //empieza la animacion
			self.image(imagen.get(i%8))i++
		})
		self.eliminarSiNoHayDuro(self.position(),1200,"izqui") // corta animacion
	}	
}

class ExpArriba inherits Fuego {
		const imagen = ["exp_0_arrib_1.png","exp_1_arrib_1.png","exp_2_arrib_1.png","exp_3_arrib_1.png","exp_0_arrib_2.png","exp_1_arrib_2.png","exp_2_arrib_2.png","exp_3_arrib_2.png"]
		var i = 0
		var a = 1

		override method expandirFuego(){

		if(a > 0 ){
		self.position(self.position().up(1))
		a-- }; // mueve a la derecha
		
		self.eliminarBloqueEnPosicionSiHay(self.position())//deberia haberse movido el cabezalanteriormente //mueve cuando encuentra objecto tira error de posicion , mientras funciona normal
		self.eliminarEnemigoEnPosicionSiHay(self.position())
		
		game.onTick(150,"arrib",{ //empieza la animacion
			self.image(imagen.get(i%8))i++
		})
		self.eliminarSiNoHayDuro(self.position(),1200,"arrib") // corta animacion
	}
	
	
}

class ExpAbajo inherits Fuego {
		const imagen = ["exp_0_abajo_1.png","exp_1_abajo_1.png","exp_2_abajo_1.png","exp_3_abajo_1.png","exp_0_abajo_2.png","exp_1_abajo_2.png","exp_2_abajo_2.png","exp_3_abajo_2.png"]
		var i = 0
		var a = 1
		
		override method expandirFuego(){

		if(a > 0 ){
		self.position(self.position().down(1))
		a-- }; // mueve a la derecha
		
		self.eliminarBloqueEnPosicionSiHay(self.position())//deberia haberse movido el cabezalanteriormente //mueve cuando encuentra objecto tira error de posicion , mientras funciona normal
		self.eliminarEnemigoEnPosicionSiHay(self.position())
		
		game.onTick(150,"abajo",{ //empieza la animacion
			self.image(imagen.get(i%8))i++
		})
		self.eliminarSiNoHayDuro(self.position(),1200,"abajo") // corta animacion
	}	
}

