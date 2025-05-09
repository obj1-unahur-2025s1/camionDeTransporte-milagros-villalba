object knightRider {
  method peso() = 500
  method peligrosidad() = 10
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
  method transformarse() {
    estado = estado.nuevoEstado()
  }

  method reaccionar() {
    self.transformarse()
  }
}

object ladrillos {
    var cantidad = 0
    method peligrosidad() = 2
    method peso() = 2 * cantidad
    method establecerCantidad(unValor) {cantidad = unValor}//setter
    method cantidad() = cantidad //getter 
}
object arenaGranel {
  var pesoActual = 0
  method peso() = pesoActual
  method peso(nuevoPeso) {pesoActual = nuevoPeso}
  method peligrosidad() = 1
}

object bateriaAntiaerea {
  var tieneMisiles = false
  method peso() =
    if (tieneMisiles) 300 else 200
  method peligrosidad() =
    if (tieneMisiles) 100 else 0
  method ponerMisiles() {
    tieneMisiles = true
  }
  method sacarMisiles() {
    tieneMisiles = false
  }
}

object contenedor {
    const cosas = []
    method agregarCosa(unaCosa) {
    cosas.add(unaCosa)}
    method peso() = 100 + cosas.sum({c => c.peso()})
    method peligrosidad() =
    if (cosas.isEmpty()) 0
    else cosas.max({c => c.peligrosidad()}).peligrosidad() //Primero buscamos la cosa con más peligrosidad. Luego accedemos a su valor con .peligrosidad() al final
    method limpiar() {
    cosas.clear()
}

}

object residuosRadioactivos {
  var pesoActual = 0
  method peso() = pesoActual
  method peso(nuevoPeso) { pesoActual = nuevoPeso }
  method peligrosidad() = 200
}

object embalaje {
  var cosaEnvuelta = null
  method envolver(cosa) {
    cosaEnvuelta = cosa
  }
  method peso() = cosaEnvuelta.peso()
  method peligrosidad() = cosaEnvuelta.peligrosidad() / 2
}



