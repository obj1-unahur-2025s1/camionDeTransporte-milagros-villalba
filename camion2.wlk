object camion {
  const tara = 1000
  const cosas = []

  method cargar(unaCosa) {
    unaCosa.reaccionar()
    cosas.add(unaCosa)
  }

  method descargar(unaCosa) {
    cosas.remove(unaCosa)
  }

  method pesoTotal() = tara + cosas.sum({c => c.peso()})

  method pesosPares() = cosas.all({c=>c.peso().even()}) 

  method tieneCosaConPeso(unPeso) = 
  cosas.any({c => c.peso() == unPeso})

  method primeraCosaConPeligrosidad(nivel) = 
  cosas.find({c => c.peligrosidad() == nivel})
  
  method cosasMuyPeligrosas(nivel) =
  cosas.filter({c => c.peligrosidad() > nivel})

  method cosasMasPeligrosasQue(unaCosa) =
  cosas.filter({c => c.peligrosidad() > unaCosa.peligrosidad()})

  method estaExcedido() = self.pesoTotal() > 2500

  method puedeCircular(nivelMaximo) =
  not self.estaExcedido() and cosas.all({c => c.peligrosidad() <= nivelMaximo})

  method tieneAlgoQuePesaEntre(min,max) = cosas.any({e=>e.peso().between(min, max)})
  
  method cosaMasPesada() = cosas.max({c => c.peso()})
  
  method totalBultos() = cosas.sum({c => c.bultos()})
}

