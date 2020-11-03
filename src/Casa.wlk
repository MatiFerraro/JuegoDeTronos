class Casa {
	
	var property patrimonio
	const ciudad
	var property miembros = []
	
	method sePuedeCasar(unMiembro)
	
	method permiteCasamiento(unPersonaje, otroPersonaje)
	
	method esRica() {
		return patrimonio > 1000
	}
	
	method patrimonioCorrespondiente() {
		return patrimonio / miembros.size()
	}
	
	method solteros() {
		return miembros.filter({unMiembro => unMiembro.noTieneConyuge()})
	}
	
	method disminuirPatrimonio(unPorcentaje) {
		patrimonio -= patrimonio * (unPorcentaje / 100)
	}
	
}

object casaLannister inherits Casa {
	
	override method sePuedeCasar(unMiembro) {
		return unMiembro.noTieneConyuge()
	}
	
	override method permiteCasamiento(unPersonaje, otroPersonaje) {
		return unPersonaje.puedeCasarse() && otroPersonaje.puedeCasarse()
	}
	
}

object casaStark inherits Casa {
	
	override method sePuedeCasar(unMiembro) {
		return true
	}
	
	override method permiteCasamiento(unPersonaje, otroPersonaje) {
		return unPersonaje.puedeCasarse() && otroPersonaje.puedeCasarse()
				&& unPersonaje.noSonDeLaMismaCasa(otroPersonaje)
	}
	
}

object casaGuardiaDeLaNoche inherits Casa {
	
	override method sePuedeCasar(unMiembro) {
		return false
	}
	
	override method permiteCasamiento(unPersonaje, otroPersonaje) {
		return false
	}
	
}