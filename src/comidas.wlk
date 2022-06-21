class Plato{
	method peso()
	method esVegetariano()
	method valoracion()
	method esAbundante(){
		return self.peso() > 250
	}
}
class Provoleta inherits Plato{
	var tieneEspecias
	const property peso
	override method esVegetariano(){
		return !tieneEspecias
	}
	override method valoracion(){
		if (self.esEspecial()){
			return 120
		}else{
			return 80
		}
	}
	method esEspecial(){
		return self.esAbundante() || tieneEspecias
	}
}

class HamburguesaCarne inherits Plato{
	var property pan
	override method peso(){
		return 250
	}
	override method esVegetariano(){
		return false
	}
	override method valoracion(){
		return 60 + pan.puntos()
	}
}

class HamburguesaVegana inherits HamburguesaCarne{
	var legumbre 
	override method esVegetariano(){
		return true
	}
	override method valoracion(){
		return super()+ 17.min(legumbre.size()*2)
	}
}

class Parrillada inherits Plato{
	const cortes = []
	
	method agregarCorte(unCorte){
		cortes.add(unCorte)
	}
	override method peso(){
		return cortes.sum({c=>c.peso()})
	}
	override method esVegetariano(){
		return false
	}
	override method valoracion(){
		return (15 * self.corteDeCarneConMayorValoracion()) - self.cantidadDeCortes()
	}
	
	method corteDeCarneConMayorValoracion(){
		return cortes.max({c=>c.calidad()}).calidad()
	}
	method cantidadDeCortes(){
		return cortes.size()
	}
}

class Pan{
	method puntos()
}

class Industrial inherits Pan{
	override method puntos(){
		return 0
	}
}
class Casero inherits Pan{
	override method puntos(){
		return 20
	}
}
class MasaMadre inherits Pan{
	override method puntos(){
		return 45
	}
}

class Corte {
	var property nombre
	var property peso
	var property calidad
}	
	