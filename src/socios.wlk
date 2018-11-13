import viajes.*
import gimnasia.*

class Socio {
	var property cantidadDeActividadesMaxima = 0
	const property actividadesRealizadas = #{}
	var property edad = 0
	const property idiomasHablados = #{}
	
	method agregarActividad(actividad) {
		if (self.cantidadDeactividades() < cantidadDeActividadesMaxima)
			{actividadesRealizadas.add(actividad)
		}else{ self.error("No puede registrar actividad")			
		}
	}
	
	method listarActividades() {
		return actividadesRealizadas.asSet()
	}
	
	method cantidadDeactividades() {
		return actividadesRealizadas.size()
	}
	
	method esAdoradorDelSol() {
		return actividadesRealizadas.all( {a => a.sirveParaBroncearse()} )
	}
	
	method actividadesEsforzadas() {
		return actividadesRealizadas.filter( { a => a.implicaEsfuerzo()} )
	}
	
	method cantidadDeIdiomashablados() {
		return idiomasHablados.size()
	}
	
	
	method agregarIdioma(idioma) {
		idiomasHablados.add(idioma)
	}
	
	method agregarIdiomas(idiomas) {
		idiomasHablados.addAll(idiomas)
	}
	
	method atraeActividad(actividad)

	
}

class SocioTranquilo inherits Socio {
	override method atraeActividad(actividad) {
		return (actividad.diasDeActividad() >= 4)
	}
	
}

class SocioCoherente inherits Socio {
	override method atraeActividad(actividad) {
		return ( ( self.esAdoradorDelSol() and actividad.sirveParaBroncearse() )
			or actividad.implicaEsfuerzo()
		)
	}
	
}

class SocioRelajado inherits Socio {
	override method atraeActividad(actividad) {
		return (self.idiomasHablados().intersection(actividad.idiomasUsados()).size() > 0 ) 		
	}
	
}
