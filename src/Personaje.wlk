class Personaje {
	
	var property casa
	var conyuges = []
	
	var estaVivo = true
	var acompaniantes = []
	
	var personalidad
	
	// --- PARTE A ---
	
	method puedeCasarse() {		
		return casa.sePuedeCasar(self)
	}
	
	method sePuedenCasar(unPersonaje) {
		return casa.permiteCasamiento(self, unPersonaje)
	}
	
	method noTieneConyuge() {
		return conyuges.size() == 0
	}
	
	method noSonDeLaMismaCasa(unPersonaje) {
		return casa != unPersonaje.casa()
	}
	
	method addConyuge(unPersonaje) {
		conyuges.add(unPersonaje)
	}
	
	method casarse(unPersonaje) {
		if(self.sePuedenCasar(unPersonaje)) {
			self.addConyuge(unPersonaje)
			unPersonaje.addConyuge(self)
		}
		else throw new Exception(message = "No se pueden casar")
	}
	
	method patrimonioPropio() {
		return casa.patrimonioCorrespondiente()
	}
	
	// --- PARTE B ---
	
	method estaSolo() {
		return acompaniantes.size() == 0
	}
	
	method aliados() {
		return (acompaniantes + conyuges + casa.miembros()).asSet()
	}
	
	method esPeligroso() {
		return estaVivo &&
				(self.oroEntreAliados() > 10000 ||
				self.todosSusConyugesSonDeCasaRica() ||
				self.tieneAlianzaPeligrosa())
	}
	
	method oroEntreAliados() {
		return self.aliados().sum({unAliado => unAliado.patrimonioPropio()})
	}
	
	method todosSusConyugesSonDeCasaRica() {
		return conyuges.all({unConyuge => unConyuge.suCasaEsRica()})
	}
	
	method suCasaEsRica() {
		return casa.esRica()
	}
	
	method tieneAlianzaPeligrosa() {
		return self.aliados().any({unAliado => unAliado.esPeligroso()})
	}
	
	// --- PARTE C ---
	
	method cuantosComplotadosSonTraidores(unosComplotados) {
		return self.sonTraidores(unosComplotados).size()
	}
	
	method sonTraidores(unosComplotados) {
		return unosComplotados.filter({unComplotado => self.esAliado(unComplotado)})
	}
	
	method esAliado(unPersonaje) {
		return self.aliados().contains(unPersonaje)
	}
	
	method realizarConspiracion(unObjetivo) {
		personalidad.realizarConspiracion(unObjetivo)
	}
	
	method morirse() {
		estaVivo = false
	}
	
	method derrocharFortuna(unPorcentaje) {
		casa.disminuirPatrimonio(unPorcentaje)
	}
	
	
}
