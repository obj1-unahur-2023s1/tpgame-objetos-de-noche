import wollok.game.*

const posiciones = [norte, sur, este, oeste]

object norte {
	method mover(unaPosition) { return
		if(unaPosition.y() != game.height()-1) unaPosition.up(1)
		else new Position(x=unaPosition.x(),y=0)
	}
	method id() = 1
}

object sur {
	method mover(unaPosition) { return
		if(unaPosition.y() != 0) unaPosition.down(1)
		else new Position(x=unaPosition.x(),y=game.height()-1)
	}	
	method id() = 2
}

object este {
	method mover(unaPosition) { return
		if(unaPosition.x() != game.width()-1) unaPosition.right(1)
		else new Position(x=0,y=unaPosition.y())
	}
	method id() = 3
}

object oeste {
	method mover(unaPosition) { return
		if(unaPosition.x() != 0) unaPosition.left(1)
		else new Position(x=game.width()-1,y=unaPosition.y())
	}	
	method id() = 4
}