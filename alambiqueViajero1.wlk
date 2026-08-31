
object luke{

 var vehiculoActual = alambiqueVeloz 
 var cantidadDeLugaresVisitados = 0
 var recuerdoActual = ""

 method cantidadLugaresVisitados() = cantidadDeLugaresVisitados
 method recuerdoActual() = recuerdoActual

 method cambiarDeVehiculo(vehiculoNuevo) {
   vehiculoActual = vehiculoNuevo
 }

 method cambiarRecuerdo(cuidad){
    recuerdoActual = cuidad.recuerdo()
 } 
 

method puedeViajar(ciudad) = not ciudad.tieneRestricciones(vehiculoActual)


method viajar(ciudad) {
    if (self.puedeViajar(ciudad)) {
        vehiculoActual.viajar()
        cantidadDeLugaresVisitados += 1
        self.cambiarRecuerdo(ciudad)
    }
}
 

 
}

object buenosAires{

  method recuerdo(){
    if(self.puebloEligePresidenteBueno()){
      return "mate con yerba"
    }else{
      return "mate sin yerba"
    }
     
  }

  method puebloEligePresidenteBueno() = true 

  method puebloEligePresidenteMalo() = true

  method tieneRestricciones(vehiculo) = not vehiculo.esRapido()

}

object bagdad{
  var recuerdoActual = "jardines colgantes"
  
  method recuerdo() = recuerdoActual 

  method cambiarRecuerdo(nuevoRecuerdo) {
    recuerdoActual = nuevoRecuerdo
  }

  method tieneRestricciones(vehiculo) = false



}

object paris {
  const recuerdoParis = "llavero torre eiffel"

  method recuerdo() =  recuerdoParis

  method tieneRestricciones(vehiculo) = vehiculo.combustible() < 10
  
}

object lasVegas {

  var cuidadActual = paris

  method cambiarCiudadHomenajeada(cuidadHomenajeado) {
    cuidadActual = cuidadHomenajeado
  }

  method recuerdo() = cuidadActual.recuerdo()

  method restriccionDeCuidadHomenajeada(vehiculo) = cuidadActual.tieneRestricciones(vehiculo)

    method tieneRestricciones(vehiculo) = self.restriccionDeCuidadHomenajeada(vehiculo)
}

/********************VEHICULOS****************************************/
object alambiqueVeloz {
  var combustible = 50
 

  method esRapido() = true

   method viajar(){
    if (combustible < 10) {
        self.error("No hay suficiente combustible en el Alambique Veloz para realizar este viaje.")
    }
    combustible = combustible - 10
  }

  method recargarTanque(cantidadDeCarga){
      combustible = combustible + cantidadDeCarga
  }

  method combustible() = combustible


 
}

object superChatarraEspecial{
    
    var canionPuesto = false
    method esRapido() = false

    method canionPuesto() = canionPuesto 

   method combustible() {
    if (canionPuesto) { // Leemos directamente tu variable booleana canionPuesto
        return 50
      } else {
        return 80
      }
    }
    
    method viajar(){
   
      canionPuesto = !canionPuesto
      self.combustible()
    }



  
}

object antiguallaBlindada {
  var cantidadDeGanster = 5
  const cantidadCombustible = 50

  method cambiarCantidadDeGangsters(nuevaCantidad){
     if(nuevaCantidad>=1){
      cantidadDeGanster = nuevaCantidad
     }
  }

  method esRapido() = cantidadDeGanster < 7 

  method combustible() = cantidadCombustible


   
}

object fititoEcologico {
    var pesoCarga = 0

    method esRapido() = pesoCarga < 20 
    method combustible() = 100         

    method viajar() {
        pesoCarga = pesoCarga + 5      
    }

    //vaciar para que este liviano
    method vaciarBaul() {
        pesoCarga = 0
    }
}

object deloreanAVapor {
    var carbon = 50
    var agua = 50

    method combustible() = carbon + agua 
    method esRapido() = carbon > 30

    method viajar() {
        carbon = (carbon - 5).max(0)
        agua = (agua - 5).max(0)
    }
}