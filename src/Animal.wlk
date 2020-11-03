class Animal {
	
	method esPeligroso()
	
}

class Dragon inherits Animal {
	
	override method esPeligroso() {
		return true
	}
	
}

class Lobo inherits Animal {
	
	override method esPeligroso() {
		return false
	}
	
}

class LoboHungaro inherits Lobo {
	
	override method esPeligroso() {
		return true
	}
	
}
