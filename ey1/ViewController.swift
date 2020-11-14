//
//  ViewController.swift
//  ey1
//
//  Created by pc1 on 22/10/2020.
//  Copyright © 2020 pc1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    
    @IBOutlet weak var informaciontxt: UILabel!
    
    
    
    //viaje del camion
    @IBOutlet weak var txtorigen: UILabel!
    @IBOutlet weak var txtdestino: UILabel!
    @IBOutlet weak var empresatxt: UITextField?
    @IBOutlet weak var tipcarga: UITextField?
    @IBOutlet weak var viajekg: UITextField?
    @IBOutlet weak var viajepago: UITextField?
    @IBOutlet weak var ciudadcarga: UISegmentedControl!
    @IBOutlet weak var ciudaddestino: UISegmentedControl!

    @IBOutlet weak var viajecontratado: UISwitch!
    //**
    

    // PRINCIPAL
    
    
    
    @IBOutlet weak var barra: UISlider?
    @IBOutlet weak var nombretxt: UITextField?
    @IBOutlet weak var dinerotxt: UITextField?
  //*

    // CAMION
    @IBOutlet weak var posicionmapatxt: UILabel! // ???
    @IBOutlet weak var ciudadcamion: UISegmentedControl!
    
    
    @IBOutlet weak var nombrecamiontxt: UITextField?
    @IBOutlet weak var kgcapacidad: UITextField?
    @IBOutlet weak var camionkgcargado: UITextField?
    @IBOutlet weak var barragas: UISlider?
    @IBOutlet weak var barraestado: UISlider?
    @IBOutlet weak var camioncargado: UISwitch!
    @IBOutlet weak var barracarga: UIProgressView?
    
    //*
    
  //  @IBOutlet weak var kgtxt: UITextField?
    
    
    @IBOutlet weak var buttonInfo: UIButton!
    @IBOutlet weak var buttonAyuda: UIButton!
    
    

    @IBOutlet weak var botonRepostar: UIButton!
    
    @IBOutlet weak var buttonViajar: UIButton!
    
    @IBOutlet weak var buttonContratarViaje: UIButton!
    
    @IBOutlet weak var cartelmensaje: UISegmentedControl!
    
    func Muestrainformacion(titulo: String)
    {
        var c: String = "-"
        var t: String = "-"
        t = titulo
        
        c = c+"O= \(Camion[0].idciudadorigen)"+","
        c = c+"D = \(Camion[0].idciudaddestino)"+","
        c = c+"P= \(posicionactual)"+","
        c = c+"CA \(ciudadactuals)"+","
        
        if titulo=="todo" { t=c }
        informaciontxt.text = t //c
    }
    
    @IBAction func botonInfo(_ sender: Any) {
     
        GameOver(razon: 0)
        //Muestrainformacion(titulo: "todo")
    }
    
    
    @IBAction func botonCARGA(_ sender: UIButton) {
        if Camion[0].viajecontratado == false {popup_name(titulo: "No has contratado ningún viaje", solomensaje: true) }
        else {
           
            CargarViaje(num: 0)
             }
    
    }
    
    
    @IBAction func botonDescarga(_ sender: Any) {
        DescargarViaje(num: 0)
    }
    
    @IBAction func buttonRepostar(_ sender: Any) {
        
        var d: Int = 500
       if Camion[0].gasolina>=5 { d = 300 }
        
        else {
       Camion[0].gasolina = 10
       Jugador[0].dinero -= d
            popup_name(titulo: "Introduces tu camión en GAS SUPER , lleno, te cuesta \(d) euros", solomensaje: true)
        RellenaPantalla()
        }
    }
    
    
    
    
    @IBAction func boton1(_ sender: UIButton) {
        Viajar()
        
        
    }
    
    
    @IBAction func botonContratarViaje(_ sender: Any) {
        ContratarViaje()
        
    }
    
    
    
    // STRUCT
    struct MyVariables {
        static var nombrej = "someString"
        static var cadena1 = "-"
    }
    
    struct JuegoSTR {
        var mapapos, origen, destino, pasos_a : Int
    }
    
    //    eti_nombre.text = Jugador[0].nombrejugador
    struct JugadorSTR {
        var turno, idcamionJ, dinero, deuda, dia, mes: Int
        var nombrejugador: String
        var estajugando: Bool
    }
    
    
    struct ViajeSTR: Decodable {
       var idViaje: Int

        var empresa, tipocarga: String
        var pago, pesocarga, idcityorigen, idcitydestino: Int
        var disponible: Bool
    }
    
    struct ViajeSTR2: Decodable {
        var idViaje: Int
        
        var empresa, tipocarga: String
        var pago, pesocarga, idcityorigen, idcitydestino: Int
        var disponible: Bool
    }
    
    
    struct CamionSTR {
        var autopista: Bool
        var idciudadorigen: Int // de donde sale
        var idciudaddestino: Int // adonde se dirije
        var ciudad: Int
        var idjugadorC,idViaje, kgCapacidad: Int
        var kgCarga: Int  = 0
        var posicionmapa: Int // 2= autopista
        var nombrecamion: String
         var viajecontratado, cargado: Bool
        var gasolina, estado: Float

    }
    
    struct CitySTR {
        var nombrecity: String
        var posicion: Int
    }
    
    var Juego = [JuegoSTR]()
    
    var Jugador = [JugadorSTR]()
    
    var Viaje =  [ViajeSTR]()
    var Viaje0a1 =  [ViajeSTR]() // viajes de mdr-cue
    var Viaje1a0 =  [ViajeSTR]() // viajes de cue-mdr
    
    var Camion =  [CamionSTR]()
    
    var city1: String = ""
    var city2: String = ""
    
    var variable0: Int = -1 // var de madrid
    var variable1: Int = -1 // var de cuenca
    
    var City =    [CitySTR]()
    
    // ****END STRUCT
    
    
    // *********************************
    // *********************************
    // ********************************* VARIABLES GLOBALES
    var nombrej = MyVariables.nombrej
    var cadena1 = MyVariables.cadena1
    
    let defaults = UserDefaults.standard
    
    var vnombrejugador: String = "-"
    var vcamionenautopista: Bool = false
    
    var ciudadactual: Int = 0
    var ciudadactuals: String = "españa"

    
    
     // *************************************
    // *************************************
     // *************************************
     // *************************************
    // *************************************
    // *************************************
    // *********** INICIO ***********
    // **********VIEWDIDLOAD=ONSHOW*********
    // ................................
    // onshow = se trata como "nuevo juego"
    
    
    // VARIABLES GLOBALES
    //   var cityp: String = ""
    var posicionactual: Int = 0
    
    override func viewDidLoad() {

        
        
        super.viewDidLoad()
        
        NuevoJuego()
        

        

   
    }
// ***************************
// END VIEWDIDLOAD=ONSHOW
    
    
    
    // Funcion DimeAleatorio
    // devuelve un num aleatorio entre inf y sup
    //****
    func DimeAleatorio(inf: Int, sup: Int ) -> Int
    {
       let aleatorio = Int.random(in: inf..<sup)
       
       return aleatorio
    }
    // end aleatorio
    
    
    
    // FUNCION ResetDatos , resetea los datos del juego
    func ResetDatos()
    {
        vcamionenautopista==false
        posicionactual=0
        ciudadactual  = 0
        ciudadactuals = "-"
        
    }
    // END resetdatos
        
        
        
        
    // FUNCION Nuevo Juego
    func NuevoJuego()
    {
                vnombrejugador = defaults.string(forKey: "nombrejugador") ?? "-"
                popup_name(titulo: "Bienvenido, tu nombre de jugador es "+vnombrejugador+"   En este juego tienes varios botones, que son: CONTRATAR VIAJE-CARGAR-DESCARGAR-VIAJAR; tendrás una cantidad variable de 'viajes' los cuales puedes contratar para transportar de una ciudad a otra. *** Para ello, SIGUE ESTOS PASOS: 1- Contratar viaje 2-Cargar 3-Viajar (hasta llegar a destion) 4- Descargar, y vuelta a empezar!!!; no olvides repostar tu camión y arreglarlo, saludos! WWW.OL1SOFTWARE.COM", solomensaje: true)
        
        ResetDatos()
        RellenaBD()
        

        
        HabilitaBotones()
        
        
        RellenaPantalla()
    }
    // END Nuevojuego
        
        
        

        // GENERA LOS VIAJES DE Viaje0a1 y Viaje1a0
    func GenerarViajes()
    {
        let aleatorio = Int.random(in: 1..<500)
        let aleatorio2 = Int.random(in: 1..<500)
        let aleatorio3 = Int.random(in: 1..<500)
        let aleatorio4 = Int.random(in: 1..<500)
        let aleatorio5 = Int.random(in: 1..<500)
        let aleatorio6 = Int.random(in: 1..<500)
        let aleatorio7 = Int.random(in: 1..<500)
        let aleatorio8 = Int.random(in: 1..<500)
        
        let baleatorio = Int.random(in: 1..<500)
        let baleatorio2 = Int.random(in: 1..<500)
        let baleatorio3 = Int.random(in: 1..<500)
        let baleatorio4 = Int.random(in: 1..<500)
        let baleatorio5 = Int.random(in: 1..<500)
        let baleatorio6 = Int.random(in: 1..<500)
        let baleatorio7 = Int.random(in: 1..<500)
        let baleatorio8 = Int.random(in: 1..<500)
        // Rellena la base de Viajes auxiliar 0 a 1
        Viaje0a1.append(ViajeSTR(idViaje: 1, empresa: "Merca Dos nº"+"\(aleatorio)", tipocarga: "leche", pago: 3000, pesocarga: 2500, idcityorigen: 0, idcitydestino: 1,  disponible: true))
        
        Viaje0a1.append(ViajeSTR(idViaje: 1, empresa: "Eroki nº"+"\(aleatorio2)", tipocarga: "manzanas", pago: 1000, pesocarga: 500, idcityorigen: 0, idcitydestino: 1,  disponible: true))
        
        Viaje0a1.append(ViajeSTR(idViaje: 1, empresa: "Alcasuper nº"+"\(aleatorio3)", tipocarga: "queso", pago: 3800, pesocarga: 4500, idcityorigen: 0, idcitydestino: 1,  disponible: true))
        
        Viaje0a1.append(ViajeSTR(idViaje: 1, empresa: "Carro nº"+"\(aleatorio4)", tipocarga: "agua", pago: 3800, pesocarga: 4500, idcityorigen: 0, idcitydestino: 1,  disponible: true))
        
        Viaje0a1.append(ViajeSTR(idViaje: 1, empresa: "Superso nº"+"\(aleatorio5)", tipocarga: "leche", pago: 3000, pesocarga: 2500, idcityorigen: 0, idcitydestino: 1,  disponible: true))
        
        Viaje0a1.append(ViajeSTR(idViaje: 1, empresa: "Super paco nº "+"\(aleatorio6)", tipocarga: "garbanzos", pago: 1000, pesocarga: 500, idcityorigen: 0, idcitydestino: 1,  disponible: true))
        
        Viaje0a1.append(ViajeSTR(idViaje: 1, empresa: "Mercado nº "+"\(aleatorio7)", tipocarga: "jamones", pago: 3800, pesocarga: 4500, idcityorigen: 0, idcitydestino: 1,  disponible: true))
        
        Viaje0a1.append(ViajeSTR(idViaje: 1, empresa: "Super Madrid nº"+"\(aleatorio8)", tipocarga: "neveras", pago: 3800, pesocarga: 4500, idcityorigen: 0, idcitydestino: 1,  disponible: true))
        //
        
        // Rellena la base de Viajes auxiliar 1 a 0
        Viaje1a0.append(ViajeSTR(idViaje: 1, empresa: "Mercacue nº "+"\(baleatorio)", tipocarga: "leche", pago: 3000, pesocarga: 2500, idcityorigen: 1, idcitydestino: 0,  disponible: true))
        
        Viaje1a0.append(ViajeSTR(idViaje: 1, empresa: "Ero nº "+"\(baleatorio2)", tipocarga: "manzanas", pago: 1000, pesocarga: 500, idcityorigen: 1, idcitydestino: 0,  disponible: true))
        
        Viaje1a0.append(ViajeSTR(idViaje: 1, empresa: "Alca nº "+"\(baleatorio3)", tipocarga: "queso", pago: 3800, pesocarga: 4500, idcityorigen: 1, idcitydestino: 0,  disponible: true))
        
        Viaje1a0.append(ViajeSTR(idViaje: 1, empresa: "Carr nº "+"\(baleatorio4)", tipocarga: "agua", pago: 3800, pesocarga: 4500, idcityorigen: 1, idcitydestino: 0,  disponible: true))
        
        Viaje1a0.append(ViajeSTR(idViaje: 1, empresa: "Super nº "+"\(baleatorio5)", tipocarga: "leche", pago: 3000, pesocarga: 2500, idcityorigen: 1, idcitydestino: 0,  disponible: true))
        
        Viaje1a0.append(ViajeSTR(idViaje: 1, empresa: "Super nº "+"\(baleatorio6)", tipocarga: "garbanzos", pago: 1000, pesocarga: 500, idcityorigen: 1, idcitydestino: 0,  disponible: true))
        
        Viaje1a0.append(ViajeSTR(idViaje: 1, empresa: "Merca nº "+"\(baleatorio7)", tipocarga: "jamones", pago: 3800, pesocarga: 4500, idcityorigen: 1, idcitydestino: 0,  disponible: true))
        
        Viaje1a0.append(ViajeSTR(idViaje: 1, empresa: "Super CUENCA nº "+"\(baleatorio8)", tipocarga: "neveras", pago: 3800, pesocarga: 4500, idcityorigen: 1, idcitydestino: 0,  disponible: true))
        //
    }
    // END GenerarViajes
    
    
    
    
    // **** FUNCION Rellena las Bases
    func RellenaBD() {
        
        City.removeAll()
        Jugador.removeAll()
        Camion.removeAll()
        
        // INICIALIZAR ESTRUCTURAS B.D.
        var c: String = "-"

        
        City.append(CitySTR(nombrecity: "Madrid", posicion: 0))
        City.append(CitySTR(nombrecity: "Cuenca", posicion: 1))
        
        // RELLENA VARIABLES GLOBALES
        posicionactual = 0
        ciudadactual = 0
        ciudadactuals = City[0].nombrecity
        

        
       GenerarViajes()
       
        var i : Int = DimeAleatorio(inf: 2500, sup: 8000) // kgcapacidad del camion
        var j : Int = DimeAleatorio(inf: 100, sup: 200) // modelo
        var k : Int = DimeAleatorio(inf: 400, sup: 3000) // dinero

        
        Jugador.append(JugadorSTR(turno: 1, idcamionJ: 1, dinero: k, deuda: 0, dia: 1, mes: 1, nombrejugador: vnombrejugador, estajugando: true))
        
        
        Camion.append(CamionSTR(autopista: false, idciudadorigen: 0, idciudaddestino: 1,   ciudad: 0, idjugadorC: 1, idViaje: 0, kgCapacidad: i, kgCarga: 0, posicionmapa: 0, nombrecamion: "BARREIROS FH"+"\(j)", viajecontratado: false, cargado: false, gasolina: 10.0, estado: 10.0 ))
        


        RellenaViaje()
        
        
    }
    //****END RellenaBD
    
    
    
    
    
    // **** FUNCION Rellena un viaje nuevo
    func RellenaViaje() {
                cartelmensaje.isHidden = false
         GenerarViajes()
        
        // INICIALIZAR ESTRUCTURAS B.D.
        //1
        var iddestino, idorigen, x: Int
        let aleatorio = Int.random(in: 1..<9)
        
        idorigen = Camion[0].ciudad
        
       
        
      //  if idorigen==0 { x = variable0 } else { x = variable1 }
        
        Viaje.removeAll()
        
        if idorigen==0 { // según la ciudad donde estemos, cargamos un viaje solo de esa ciudad
        Viaje.append(Viaje0a1[aleatorio])
        } else { Viaje.append(Viaje1a0[aleatorio]) }
        
        idorigen = Viaje[0].idcityorigen
        iddestino = Viaje[0].idcitydestino
        
        if iddestino==0 {idorigen=1} else {idorigen=0}
        
        self.city1 = City[idorigen].nombrecity
        self.city2 = City[iddestino].nombrecity
        
       // popup_name(titulo: "Viaje disponible de: "+Viaje[0].empresa, solomensaje: true)
        RellenaPantalla()
        
    }
    

    
    
    //**** FUNCION PARA HABILITA/DES SEGUN LOS DATOS DISPONIBLES
    // ****
    func HabilitaBotones()
    {


        buttonViajar.isEnabled = true
        buttonContratarViaje.isEnabled = true
 
    }
    
    
    
    //**** FUNCION PARA RELLENAR LA PANTALLA CON LOS DATOS DISPONIBLES
    // se guarda en cadena1
    func RellenaPantalla()
    {
        var i: Int = 0
        
     //   posicionmapatxt.text = cityp
        if vcamionenautopista==true { i = 2 } else
            { i=Camion[0].ciudad }
        
      //  popup_name(titulo: "CIUDAD="+"\(i)", solomensaje: true)
        
        
        barra?.value = Float(posicionactual)
        nombretxt?.text = vnombrejugador
        dinerotxt?.text = "\(Jugador[0].dinero)"
        nombrecamiontxt?.text = Camion[0].nombrecamion
        kgcapacidad?.text = "\(Camion[0].kgCapacidad)"
        camionkgcargado?.text = "\(Camion[0].kgCarga)"
        barragas?.value = Camion[0].gasolina
        barraestado?.value = Camion[0].estado
        camioncargado.isOn=Camion[0].cargado
        
        txtorigen.text = City[Camion[0].idciudadorigen].nombrecity
        txtdestino.text = City[Camion[0].idciudaddestino].nombrecity
        empresatxt?.text = Viaje[0].empresa
        tipcarga?.text = Viaje[0].tipocarga
        viajekg?.text = "\(Viaje[0].pesocarga)"
        viajepago?.text = "\(Viaje[0].pago)"
        //viajecontratado?.isEnabled = Viaje[0].disponible
        
        ciudadcamion.selectedSegmentIndex=i
        ciudadcarga.selectedSegmentIndex = Viaje[0].idcityorigen
        ciudaddestino.selectedSegmentIndex = Viaje[0].idcitydestino
        
        
        if Camion[0].viajecontratado == true {
            
            buttonContratarViaje.isEnabled = false
            viajecontratado?.isOn = true
        }
    }
    //**** END rellenaPantalla
    
    
    //**** HA LLEGADO A SU DESTINO
    func LlegadoaDestino()
    {
        var ori: Int = Camion[0].idciudadorigen
        var des: Int = Camion[0].idciudaddestino
        ciudadactual = des
        ciudadactuals = City[ciudadactual].nombrecity
        
Muestrainformacion(titulo: "has llegado a " + City[des].nombrecity)
      
        ciudadcamion.selectedSegmentIndex=des

        posicionactual = 0
        vcamionenautopista=false
        
        Camion[0].ciudad = des
        Camion[0].autopista=false
        
        
        
        // cambio a destino
        
        
        
        if des==0 { ori=0 ; des=1 }
            else
                  { ori=1 ; des=0 }
        
        Camion[0].idciudadorigen = ori
        Camion[0].idciudaddestino = des
        
        
        RellenaPantalla()
        
        if Camion[0].viajecontratado==false { RellenaViaje() }
        else
        {
            DescargarViaje(num: Viaje[0].idViaje)
        }
        
        // DESCARGAR
        
        
    }
    
    //**** VIAJA HACIA DESTINO
    func Viajar()
    {
        // Control
        if Camion[0].gasolina<2 { GameOver(razon: 1) }
        
        if Camion[0].gasolina<=5
        {
            Muestrainformacion(titulo: "Tienes poca gasolina. Deberías repostar")
            //return
        }
        if Camion[0].cargado==true && Camion[0].ciudad==Viaje[0].idcitydestino
        { Muestrainformacion(titulo: "Tienes carga todavía. Descarga antes de viajar")
            return
        }
        if posicionactual == 5
        {
            LlegadoaDestino()
            return
        }
        // Control pasado, ok al viaje
        
        
        posicionactual += 1
        
        
        if posicionactual==1 {
        popup_name(titulo: "Saliendo hacia: "+"\(Camion[0].idciudaddestino)"+", posicionactual: "+"\(posicionactual)", solomensaje: true)
            
        }
        

        
            Camion[0].autopista=true
            vcamionenautopista=true
            
            Camion[0].gasolina=Camion[0].gasolina-1
            Camion[0].posicionmapa = 2
        
            // popup_name(titulo: "\(posicionactual)" , solomensaje: true)


//popup_name(titulo: "Viajando desde "+city1+" a "+city2+", km"+"\(posicionactual)", solomensaje: true)
        
       // popup_name(titulo: "origen "+"\(Camion[0].idciudadorigen)", solomensaje: true)


     RellenaPantalla()
        Muestrainformacion(titulo: "todo")
    }
    // END VIAJAR
    
    
    
    
    //**** FUNCION PARA CARGAR EL VIAJE INDICADO EN NUM (VIAJE[NUM])
    // se guarda en cadena1
    func CargarViaje(num: Int)
    {
        var capacidad, peso, llenado : Float
        
       //  buttonCarga.isEnabled = false
        
        //   cálculo del tanto por ciento llenado 0.0-1.0
        capacidad = Float(Camion[0].kgCapacidad)
        peso = Float(Viaje[num].pesocarga)
        llenado = (peso / capacidad)
        
        Camion[0].kgCarga=Int(peso)
        camionkgcargado?.text = "\(Float(peso))"
        // camionkgcargado.text = "\(Float(llenado))"
        barracarga?.progress = llenado
        
        Camion[0].cargado = true
//        buttonCarga.isEnabled = false
        buttonViajar.isEnabled = true
        
        
        RellenaPantalla()
    }
    
    
    

    //**** FUNCION PARA DESCARGAR EL VIAJE INDICADO EN NUM (VIAJE[NUM])
    // se guarda en cadena1
    func DescargarViaje(num: Int)
    {
        
        if Camion[0].cargado==false {
    popup_name(titulo: "No tienes nada que descargar; debes contratar un viaje y llevarlo al destino", solomensaje: true);
            return }
        
        if Camion[0].autopista==true
        {
            popup_name(titulo: "Descargas en la autopista, causando un gran atasco.", solomensaje: true);
        GameOver(razon: 0)
            return }
        
        if Camion[0].ciudad != Viaje[0].idcitydestino  {
            popup_name(titulo: "Debes descargar la carga en el destino ("+city2+")", solomensaje: true);
            return }
        
        Camion[0].kgCarga=0
        camionkgcargado?.text = "\(Float(0))"
        // camionkgcargado.text = "\(Float(llenado))"
        
        barracarga?.progress = 0
        
        Camion[0].cargado = false
        Camion[0].viajecontratado = false
        

        camioncargado.isOn = false
        viajecontratado.isOn = false
        
        Jugador[0].dinero += Viaje[0].pago
        
        popup_name(titulo: "Viaje Descargado!, Has cobrado "+"\(Viaje[0].pago)", solomensaje: true)
        
        // RellenaNuevoViaje(origen: int) // 0= madrid 1= cuenca
        RellenaViaje()
        HabilitaBotones()
       
    }
    
    
    
    func ContratarViaje() {
        var c: String = "Viaje contratado, trayecto "+city1+"-"+city2
        
        Camion[0].viajecontratado = true
        
        RellenaPantalla()
        
        CargarViaje(num: 0)
        
        popup_name(titulo: c, solomensaje: true)
    }
    
    
    
    
    //**** FUNCION PARA CREAR POPUP CON ENTRADA DE TEXTO
    // se guarda en Jugador[0].nombrejugador y nnombretxt
    // Si solomensaje=true solo muestra titulo
    func popup_name(titulo: String, solomensaje: Bool)
    {


        // create the actual alert controller view that will be the pop-up
        let alertController = UIAlertController(title: "iTradeC", message: titulo, preferredStyle: .alert)

        if solomensaje == false
        {
        alertController.addTextField { (textField) in
            // configure the properties of the text field
            textField.placeholder = "Nombre"

                                    }
       
            
        }

        
        // add the buttons/actions to the view controller
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let saveAction = UIAlertAction(title: "Ok", style: .default) { _ in
            
            // this code runs when the user hits the "save" button
            
            

            
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        

/*
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            topController.present(alertController, animated: true, completion: nil)
        }
      */
        
        DispatchQueue.main.async{
            self.present(alertController, animated: true, completion: nil)
        }
        
        if solomensaje == false
        {
            var c = alertController.textFields![0].text!
            defaults.set(c, forKey: "nombrejugador")
            RellenaBD()
            RellenaPantalla()
        }
        
    }
    //**** END POPUPNAME
    
    // FUNCION Muestrapantalla = muestra/show una pantalla (viewcontroller)
    //**
    func MuestraPantalla(pantalla: String)
    {
        let secondView = self.storyboard?.instantiateViewController(withIdentifier: pantalla) as! UIViewController
        self.present(secondView, animated: true, completion: nil)
    }
    // END
    
    
    
    //**** FUNCION PARA CREAR POPUP CON ENTRADA DE TEXTO
    // se guarda en Jugador[0].nombrejugador y nnombretxt
    // Si solomensaje=true solo muestra titulo
    func GameOver(razon: Int)
    {
        var r: String = "bye"

        
        defaults.set(true, forKey: "gameover")
        
        if razon == 1 { r = "Te quedaste sin gasolina!!" }
            else  { r = "Te quedaste sin dinero!!" }
        
        defaults.set(r, forKey: "razongameover")
       
        popup_name(titulo: "GAMEOVER, se acabó, "+r, solomensaje: false)
        
        MuestraPantalla(pantalla: "gameoverid")

        

        


    }
    
    
    //**** FUNCION PARA VIAJAR A LA SIGUIENTE CIUDAD ("1 > 2" ó "2 > 1")
    /*
 Viaje.append(ViajeSTR(idViaje: 1, empresa: "Mercadona", tipocarga: "leche", pago: 3000, pesocarga: 2500, idcityorigen: 1, idcitydestino: 2,  disponible: true))
 
 
 Camion.append(CamionSTR(idjugadorC: 1, idViaje: 0, kgCapacidad: 5000, kgCarga: 0, posicionmapa: 1, nombrecamion: "MAN FH500", disponible: false, cargado: false, gasolina: 10.0, estado: 10.0 ))
 */

    

}

