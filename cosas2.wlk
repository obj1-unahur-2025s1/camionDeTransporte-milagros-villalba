object knightRider {
  method peso() = 500
  method peligrosidad() = 10
  method bultos() = 1
  method reaccionar() { } // no hace nada
}
object auto {
  method peligrosidad() = 15
  method nuevoEstado() = robot
}

object robot {
  method peligrosidad() = 30
  method nuevoEstado() = auto
}

object bumblebee {
  var estado = auto
  method peso() = 800
  method peligrosidad() = estado.peligrosidad()
  method bultos() = 2
  method transformarse() {
    estado = estado.nuevoEstado()
  }
  method reaccionar() {
    self.transformarse()
  }
}
object ladrillos {
  var cantidad = 0

  method peso() = cantidad * 2
  method peligrosidad() = 2

  method cantidad() = cantidad
  method cantidad(nuevaCantidad) { cantidad = nuevaCantidad }

  method bultos() =
    if (cantidad <= 100) 1
    else if (cantidad <= 300) 2
    else 3

  method reaccionar() {
    cantidad += 12
  }
}

object arenaGranel {
  var pesoActual = 0

  method peso() = pesoActual
  method peso(nuevoPeso) { pesoActual = nuevoPeso }

  method peligrosidad() = 1
  method bultos() = 1

  method reaccionar() {
    pesoActual -= 10
  }
}


object bateriaAntiaerea {
  var tieneMisiles = false

  method peso() = if (tieneMisiles) 300 else 200
  method peligrosidad() = if (tieneMisiles) 100 else 0

  method ponerMisiles() { tieneMisiles = true }
  method sacarMisiles() { tieneMisiles = false }

  method bultos() = if (tieneMisiles) 2 else 1

  method reaccionar() {
    self.ponerMisiles()
  }
}


object contenedor {
  const cosas = []

  method agregarCosa(cosa) {
    cosas.add(cosa)
  }

  method limpiar() {
    cosas.clear()
  }

  method peso() = 100 + cosas.sum({c => c.peso()})

  method peligrosidad() =
    if (cosas.isEmpty()) 0
    else cosas.max({c => c.peligrosidad()}).peligrosidad()

  method bultos() = 1 + cosas.sum({c => c.bultos()})

  method reaccionar() {
    cosas.forEach({c => c.reaccionar()})
  }
}


object residuosRadioactivos {
  var pesoActual = 0

  method peso() = pesoActual
  method peso(nuevoPeso) { pesoActual = nuevoPeso }

  method peligrosidad() = 200
  method bultos() = 1

  method reaccionar() {
    pesoActual += 15
  }
}

object embalaje {
  var cosaEnvuelta = null

  method envolver(cosa) {
    cosaEnvuelta = cosa
  }

  method peso() = cosaEnvuelta.peso()
  method peligrosidad() = cosaEnvuelta.peligrosidad() / 2
  method bultos() = 2

  method reaccionar() { }
}

