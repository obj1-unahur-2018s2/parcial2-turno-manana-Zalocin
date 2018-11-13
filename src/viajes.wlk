class Viaje {
	var property idiomasUsados = #{}
	
	method diasDeActividad()
	
	method implicaEsfuerzo()
	
	method sirveParaBroncearse()
	
	method agregarIdioma(idioma) {
		idiomasUsados.add(idioma)
	}
	
	method agregarIdiomas(idiomas) {
		idiomasUsados.addAll(idiomas)
	}
	
	method listarIdiomas() {
		return idiomasUsados.asSet()
	}
	
	method viajeInteresante() {
		return (idiomasUsados.size() > 1)
	}
	
	method esrecomendada(socio) {
		return ( self.viajeInteresante()
			and socio.atraeActividad()
				and	socio.listarActividades().contains(self)
			)
	}
	
}


class ViajeDePlaya inherits Viaje {
	var property largoDeLaPlaya = 0
	
	override method diasDeActividad() {
		return largoDeLaPlaya / 500
	}
	
	override method implicaEsfuerzo() {
		return largoDeLaPlaya > 1200
	}
	
	override method sirveParaBroncearse() {
		return true
	}
	
	
}


class ExcursionACiudad inherits Viaje {
	var property cantidadDeAtracciones = 0
	
	override method diasDeActividad() {
		return (cantidadDeAtracciones / 2)
	}
	
	override method implicaEsfuerzo() {
		return  (cantidadDeAtracciones.between(5,8))
	}
	override method sirveParaBroncearse() {
		return  false
	}
	override method viajeInteresante() {
		return ( super() or cantidadDeAtracciones == 5 )
	}
	
}

class ExcursionACiudadTropical inherits ExcursionACiudad{	
	override method diasDeActividad() {
		return super () + 1 
	}
	
	override method sirveParaBroncearse() {
		return  true
	}
	
}


class SalidaDeTrekking inherits Viaje {
	var property kmDeSenderos = 0
	var property diasDeSolPorAnio = 0
	
	override method diasDeActividad() {
		return (kmDeSenderos / 50) 
	}
	
	override method implicaEsfuerzo() {
		return  (kmDeSenderos > 80)
	}
	
	override method sirveParaBroncearse() {
		return  (diasDeSolPorAnio > 200)
			or ( (diasDeSolPorAnio.between(100,200) and kmDeSenderos > 120)
			)
	}
	override method viajeInteresante() {
		return ( super() and diasDeSolPorAnio > 140 )
	}
	
}
