import wollok.game.*

object animacion {
	
	method animacion(nombreTick, velocidadEvento, nombreArchivo, velocidadFinal, objeto){
		var i = 0
		game.onTick(velocidadEvento, nombreTick, 
			{objeto.image(nombreArchivo + i +".png"); i++; }
		) 
		game.schedule(velocidadFinal,{game.removeTickEvent(nombreTick)})
	}
}
