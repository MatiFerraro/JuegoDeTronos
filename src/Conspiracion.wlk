import Personaje.*
import Casa.*

class Conspiracion {
	
	var objetivo
	var complotados = []
	
	constructor(personajeObjetivo, unosComplotados) {
		if(personajeObjetivo.esPeligroso()) {
			objetivo = personajeObjetivo
			complotados = unosComplotados
		}
	}
	
	method traidores() {
		objetivo.cuantosComplotadosSonTraidores(complotados)
	}
	
	method ejecutarConspiracion() {
		complotados.map({unComplotado => unComplotado.ejecutarConspiracion(objetivo)})
	}
	
	method conspiracionEficaz() {
		self.ejecutarConspiracion()
		return not (objetivo.esPeligroso())
	}
	
}

class Personalidad {
	
	method realizarConspiracion(elObjetivo)
	
}

object sutil inherits Personalidad {
	
	override method realizarConspiracion(elObjetivo) {
		self.casarConElSolteroDeLaCasaMasPobre(elObjetivo)
	}
	
	method casarConElSolteroDeLaCasaMasPobre(unObjetivo) {
		const solteroDeLaCasaMasPobre = self.casaMasPobre().solteros().first(1)
		if(unObjetivo.sePuedenCasar(solteroDeLaCasaMasPobre)) {
			unObjetivo.casarse(solteroDeLaCasaMasPobre)
		}
		else throw new Exception(message = "Falló la acción")
	}
	
	method casaMasPobre() {
		const casas = [casaLannister, casaStark, casaGuardiaDeLaNoche]
		return casas.min({unaCasa => unaCasa.patrimonio()})
	}
	
}

object asesino inherits Personalidad {
	
	override method realizarConspiracion(elObjetivo) {
		elObjetivo.morirse()
	}
	
}

object asesinoPrecavido inherits Personalidad {
	
	override method realizarConspiracion(elObjetivo) {
		if(elObjetivo.estaSolo()) {
			elObjetivo.morirse()
		}
	}
	
}

object disipado inherits Personalidad {

	var porcentajeADerrochar
	
	override method realizarConspiracion(elObjetivo) {
		elObjetivo.derrocharFortuna(porcentajeADerrochar)
	}
	
}

object miedoso inherits Personalidad {
	
	override method realizarConspiracion(elObjetivo) {}
	
}


