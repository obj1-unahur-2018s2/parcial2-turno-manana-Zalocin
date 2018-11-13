class ClaseDeGimnasia {
	
	const property idiomasUsados = #{"Español"}
		
	method diasDeActividad() {
		return 1
	}
	
	method implicaEsfuerzo() {
		return true
	}
	
	method sirveParaBroncearse() {
		return false
	}
	method esrecomendada(socio) {
		socio.edad().between(20,30)
	}
	
}
