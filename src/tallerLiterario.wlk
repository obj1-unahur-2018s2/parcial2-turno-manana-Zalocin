class TallerLiterario {
	const property librosTrabajados = #{}
	
	
	method agregarlibro(libro) {
		librosTrabajados.add(libro)
	}
	
	method agregarlibros(libros) {
		librosTrabajados.addAll(libros)
	}
	
	method cantidadDelibros() {
		return librosTrabajados.size()
	}
	
	
	method diasDeActividad() {
		return self.cantidadDelibros() + 1
	}
	
	method implicaEsfuerzo() {
		return ( librosTrabajados.any( {l => l.cantidadDePaginas() > 500 })
			or ( librosTrabajados.all( {l => l.autor() == self.devolverAutorPrimerlibro() }) and
				self.cantidadDelibros() > 1 ) )
	}
	
	method sirveParaBroncearse() {
		return false
	}
	
	method esrecomendada(socio) {
		return socio.cantidadDeIdiomashablados() > 1
	}
	
	method primerLibro() {
		return librosTrabajados.first()
	}
	
	method devolverAutorPrimerlibro() {
		return self.primerLibro().autor()
	}
	
}
	

class Libro {
	var property cantidadDePaginas = 0
	var property autor
}

	
	
