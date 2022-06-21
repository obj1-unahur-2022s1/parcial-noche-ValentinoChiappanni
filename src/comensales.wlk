import comidas.*

class Conmensal {
	var property peso
	const platosQueComio =[]
	
	method leAgrada(plato)
	
	method comer(plato){
		platosQueComio.add(plato)
	}
	
	method estaSatisfecho() {
		return self.pesoComidas() >= peso*0.01
	} 
	method pesoComidas (){
		return platosQueComio.sum{ c=>c.peso() }
	} 
	method platosQueComio(){
		return platosQueComio
	}
	
	method eligeComida(platos){
		return platos.anyOne()
	}
}

class Vegetariano inherits Conmensal{
	override method leAgrada(plato){
		return plato.esVegetariano() && plato.valoracion() > 85
	}
	override method estaSatisfecho(){
		return super() && platosQueComio.all({p=>!p.esAbundante()})
	}
}
class HambrePopular inherits Conmensal{
	override method leAgrada(plato){
		return plato.esAbundante()
	}
}

class PaladarFino inherits Conmensal{
	override method leAgrada(plato){
		return plato.peso().between(150,300) && plato.valoracion() >100
	}
	
	override method estaSatisfecho(){
		return super() && platosQueComio.size().even()
	}
	
}