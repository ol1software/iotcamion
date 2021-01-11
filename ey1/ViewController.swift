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
    
    @IBOutlet weak var cartelViajando: UILabel!
    
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
    
    

    @IBOutlet weak var botViajar: UIButton!
    
    @IBOutlet weak var buttonViajar: UIButton!
    
    @IBOutlet weak var buttonContratarViaje: UIButton!
    
    @IBOutlet weak var botonInfo: UIButton!
    

    
    @IBOutlet weak var cartelinfo: UITextView!
    
    @IBOutlet weak var diatexto: UITextField!
    

    
    @IBAction func bay(_ sender: UIButton) {
        MuestraPantalla(pantalla: "viewayuda")
    }
    
    // ********************* BOTONES
    // *********************
    // *********************
    // *********************
    // *********************
    // *********************
    // *********************
    // *********************

    @IBAction func botonInfoF(_ sender: Any) {
        popup_name(titulo: "\(barra?.value)", solomensaje: true)
    }
    
    
    @IBAction func botonAyuda(_ sender: Any) {
        
        
    }
    
    @IBOutlet weak var cartelViajeDisponible: UIButton!
    
    
    @IBAction func botonGuardar(_ sender: Any) {
        GuardarPartida()
    }
    
    @IBAction func botonCargar(_ sender: Any) {
        CargarPartida()
    }
    
    @IBAction func guarda(_ sender: Any) {

    }
    
    

    
    @IBAction func save1(_ sender: Any)
    {
 

    }
    

    
    func Muestrainformacion(titulo: String)
    {
        var c: String = "-"
        var t: String = "-"
        t = titulo
   /*
        c = c+"O= \(Camion[0].idciudadorigen)"+","
        c = c+"D = \(Camion[0].idciudaddestino)"+","
        c = c+"P= \(vposicionactual)"+","
        c = c+"CA \(vciudadactuals)"+","
        */
        if titulo=="todo" { t=c }
        
        popup_name(titulo: titulo, solomensaje: true)
    //     = t //c
    }
    
    @IBAction func botonInfo(_ sender: Any) {
     
        GameOver(razon: 0)
        //Muestrainformacion(titulo: "todo")
    }
    
    
    @IBAction func botonCARGA(_ sender: UIButton) {
        if ViewController.Camion[0].viajecontratado == false {popup_name(titulo: "No has contratado ningún viaje", solomensaje: true) }
        else {
           
            CargarViaje(num: 0)
             }
    
    }
    
    
    @IBAction func botonDescarga(_ sender: Any) {
        DescargarViaje(num: 0)
    }
    
    @IBAction func buttonRepostar(_ sender: Any) {
        
        Repostar()

        
    }
    
    
    
    
    @IBAction func boton1(_ sender: UIButton) {
        Viajar()
        
        
    }
    
    
    @IBAction func botonContratarViaje(_ sender: Any) {
        ContratarViaje()
        
    }
    
    
    
    // STRUCT
    // *********************
    // *********************
    // *********************
    // *********************
    
    struct MyVariables {
        static var nombrej = "someString"
        static var cadena1 = "-"
    }
    /*
    struct JuegoSTR {
        var mapapos, origen, destino, pasos_a : Int
    }*/
    
    //    eti_nombre.text = Jugador[0].nombrejugador
    struct JugadorSTR {
        var partidaguardada : Bool = false
        var idcamionJ, dinero,dia, mes, numeroviajes: Int
        var nombrejugador: String
     //   var estajugando: Bool
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
    // VARIABLES STRUCT
//    var Juego = [JuegoSTR]()
    
    static var Jugador = [JugadorSTR]()
    
   static  var Viaje =  [ViajeSTR]()
   static  var Viaje0a1 =  [ViajeSTR]() // viajes de mdr-cue
    static var Viaje1a0 =  [ViajeSTR]() // viajes de cue-mdr
    
    static var Camion =  [CamionSTR]()
    

    
    var variable0: Int = -1 // var de madrid
    var variable1: Int = -1 // var de cuenca
    
    static var City =    [CitySTR]()
    
    // ****END STRUCT
    
    let defaults = UserDefaults.standard
    
    // *********************************
    // *********************************
    // ********************************* VARIABLES GLOBALES
  //  var nombrej = MyVariables.nombrej
  //  var cadena1 = MyVariables.cadena1

    
    //*
    //
    // VARIABLES GENERALES (stativ var)
    static var jugando: Bool = false // indica si está jugando ya
    
    // ""variables JUGADOR
    //
    
    var vpartidaguardada: Bool = false
    var vdinero: Int = 0
    var vdia : Int = 1
   // var vmes : Int = 1
    var vnumeroviajes: Int = 0
    var vnombrejugador: String = "-"
    var vposicionactual: Int = 0
    var vciudadactual: Int = 0
    var vciudadactuals: String = "montal"
    
    //"" variables camion
    var vautopista: Bool = false
    var vidciudadorigen: Int = 0 // de donde sale
    var vidciudaddestino: Int = 1 // adonde se dirije
    var vciudad: Int = 0
    var vidViaje: Int = 0, vkgCapacidad: Int = 0
    var vkgCarga: Int  = 0
    var vposicionmapa: Int = 0 // 2= autopista
    var vnombrecamion: String = "."
    var vviajecontratado: Bool = false
    var vcargado: Bool = false
    var vgasolina: Float = 0.0
    var vestado: Float = 0.0
    
    //"" variables city
    var vnombrecity1: String = "."
    var vposicion1: Int = 0
    var vnombrecity2: String = "."
    var vposicion2: Int = 0



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

    
    override func viewDidLoad()
        {
            // HAY DOS MODOS DE ENTRAR:
            // 1- NUEVO JUEGO  2- CARGARPARTIDA
            
            // HAY UN MODO DE SALIR y VOLVER A ENTRAR
            // 1- AYUDA

        var b: Bool = false
        
        b = defaults.bool(forKey: "cargandoJuego")
        
        super.viewDidLoad()
        self.definesPresentationContext = true
        if ViewController.jugando==false    // Si no estamos jugando= nuevo o cargar
                    {
                    if b==false { NuevoJuego() } else { CargarPartida2() }
                    }
                else {  // si estamos jugando = RellenaPantalla
                        RellenaPantalla()
                        popup_name(titulo: "Regresando al juego", solomensaje: true)
                     }
        }

// ***************************
// END VIEWDIDLOAD=ONSHOW
    
    
    
    // FUNCIONES
    // ******************************
    // ******************************
    // ******************************
    // ******************************
    // ******************************
    // ******************************
    // ******************************
    // ******************************

    // FUNCION ResetDatos , resetea los datos del juego
    func ResetDatos()
    {
        vautopista = false
        
        vciudadactual  = 0
        vciudadactuals = ViewController.City[0].nombrecity
        
        ViewController.City[0].nombrecity = "Madrid"
        ViewController.City[1].nombrecity = "Cuenca"

        
        vpartidaguardada = false
        ViewController.Jugador[0].dia = 1
        
        ViewController.Camion[0].posicionmapa = 0
        vnumeroviajes  = 0
        
        
        //"" variables camion
        
        vviajecontratado = false
        vcargado = false
        vgasolina = 10.0
        vestado = 10.0
        
    }
    // END resetdatos
    
    
    
    
    
    
    
    
    
    // FUNCION Nuevo Juego
    func NuevoJuego()
    {
        ViewController.jugando = true // guardamos para esta sesión indicando que estamos jugando
        
        vnombrejugador = defaults.string(forKey: "nombrejugador") ?? "-"
        popup_name(titulo: "Bienvenido al Juego iTradeCamion! WWW.OL1SOFTWARE.COM", solomensaje: true)
        
        
        RellenaBD()
        
        
        HabilitaBotones()
        
        
        RellenaPantalla()
    }
    // END Nuevojuego
    
    
    
    // Funcion popupviewcontroller
    func popup_viewcontroller(vc: UIViewController)
    {
        //let vc = ViewControllerAyuda()
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
    // end popupviewcontroller
    
    

    // FUNCION REPOSTAR
    // guarda los datos de la actual partida
    func Repostar()
    {
    var d: Int = 500
    
    d = Int(ViewController.Camion[0].gasolina * 100)
        
        
     if ViewController.Camion[0].gasolina==10
        {
            d = DimeAleatorio(inf: 5, sup: 50)
            popup_name(titulo: "Introduces tu camión en GAS SUPER , pero lo tienes lleno, compras cosas para el camión, te cuestan \(d) euros", solomensaje: true)
            
     } else {
        popup_name(titulo: "Introduces tu camión en GAS SUPER , lleno, te cuesta \(d) euros", solomensaje: true)
            }

    
    // LLENADO
    ViewController.Camion[0].gasolina = 10
        ViewController.Jugador[0].dinero -= d
    RellenaPantalla()
    }
    // END REPOSTAR
    
    // FUNCION GUARDARPARTIDA2 segunda parte (después de advertir con GuardarPartida)
    // guarda los datos de la actual partida
    func GuardarPartida2()
    {
      
            // this code runs when the user hits the "save" button
            
            
            //"" variables jugador
            defaults.setValue(vpartidaguardada,forKey:  "j.partidaguardada")
        defaults.setValue(ViewController.Jugador[0].idcamionJ, forKey: "j.idcamionj")
            defaults.setValue(ViewController.Jugador[0].dinero, forKey: "j.dinero")
            defaults.setValue(ViewController.Jugador[0].dia, forKey: "j.dia")
            //  defaults.setValue(vmes, forKey: "j.mes")
            defaults.setValue(ViewController.Jugador[0].nombrejugador, forKey: "j.nombrejugador")
            
            defaults.setValue(ViewController.Camion[0].posicionmapa, forKey: "j.posicionactual")
            defaults.setValue(vciudadactual, forKey: "j.ciudadactual")
            defaults.setValue(vciudadactuals, forKey: "j.vciudadactuals")
        
        //"" variables camion
        defaults.setValue(vautopista,forKey:  "c.autopista")
        defaults.setValue(vidciudadorigen,forKey:  "c.idciudadorigen")
        defaults.setValue(vidciudaddestino,forKey:  "c.idciudaddestino")
        defaults.setValue(vciudad,forKey:  "c.ciudad")
        //  defaults.setValue(ViewController.Camion[0].idjugadorC,forKey:  "c.idjugadorc")
        defaults.setValue(vidViaje,forKey:  "c.idviaje")
        
        defaults.setValue(ViewController.Camion[0].kgCapacidad,forKey:  "c.kgCapacidad")
        defaults.setValue(ViewController.Viaje[0].pesocarga,forKey:  "c.kgCarga")
        
        defaults.setValue(ViewController.Camion[0].posicionmapa,forKey:  "c.vposicionactual")
        defaults.setValue(ViewController.Camion[0].nombrecamion,forKey:  "c.nombrecamion")
        defaults.setValue(vviajecontratado,forKey:  "c.viajecontratado")
        defaults.setValue(vcargado,forKey:  "c.cargado")
        defaults.setValue(ViewController.Camion[0].gasolina,forKey:  "c.gasolina")
            

            
            //"" variables city
            defaults.setValue(vnombrecity1,forKey:  "city.nombrecity1")
            defaults.setValue(vposicion1,forKey:  "city1.posicion")
            defaults.setValue(vnombrecity2,forKey:  "city.nombrecity2")
            defaults.setValue(vposicion2,forKey:  "city2.posicion")
        
        
        //"" variables viaje
        defaults.setValue(ViewController.Viaje[0].idViaje,forKey:  "v.idViaje")
        defaults.setValue(ViewController.Viaje[0].empresa,forKey:  "v.empresa")
        defaults.setValue(ViewController.Viaje[0].tipocarga,forKey:  "v.tipocarga")
        defaults.setValue(ViewController.Viaje[0].pago,forKey:  "v.pago")
        defaults.setValue(ViewController.Viaje[0].pesocarga,forKey:  "v.pesocarga")
        defaults.setValue(ViewController.Viaje[0].idcityorigen,forKey:  "v.idcityorigen")
        defaults.setValue(ViewController.Viaje[0].idcitydestino,forKey:  "v.idcitydestino")
        defaults.setValue(ViewController.Viaje[0].disponible,forKey:  "v.disponible")
            
            /*"" constantes, cambian automáticamebte cada viaje
            defaults.setValue(Viaje0a1[0].idViaje,forKey:  "v01.idViaje")
            defaults.setValue(Viaje0a1[0].empresa,forKey:  "v01.empresa")
            defaults.setValue(Viaje0a1[0].tipocarga,forKey:  "v01.tipocarga")
            defaults.setValue(Viaje0a1[0].pago,forKey:  "v01.pago")
            defaults.setValue(Viaje0a1[0].pesocarga,forKey:  "v01.pesocarga")
            defaults.setValue(Viaje0a1[0].idcityorigen,forKey:  "v01.idcityorigen")
            defaults.setValue(Viaje0a1[0].idcitydestino,forKey:  "v01.idcitydestino")
            defaults.setValue(Viaje0a1[0].disponible,forKey:  "v01.disponible")
            
            defaults.setValue(Viaje1a0[0].idViaje,forKey:  "v10.idViaje")
            defaults.setValue(Viaje1a0[0].empresa,forKey:  "v10.empresa")
            defaults.setValue(Viaje1a0[0].tipocarga,forKey:  "v10.tipocarga")
            defaults.setValue(Viaje1a0[0].pago,forKey:  "v10.pago")
            defaults.setValue(Viaje1a0[0].pesocarga,forKey:  "v10.pesocarga")
            defaults.setValue(Viaje1a0[0].idcityorigen,forKey:  "v10.idcityorigen")
            defaults.setValue(Viaje1a0[0].idcitydestino,forKey:  "v10.idcitydestino")
            defaults.setValue(Viaje1a0[0].disponible,forKey:  "v10.disponible")
            */
        
            
            defaults.synchronize()
    popup_name(titulo: "Partida guardada!", solomensaje: true)
    }
    
    
    // FUNCION GUARDARPARTIDA
    // guarda los datos de la actual partida
    func GuardarPartida()
    {
     //
        let alertController = UIAlertController(title: "iTradeC", message: "¿Deseas guardar la partida?, esto sobreescribe la anterior !", preferredStyle: .alert)
        
        
        // add the buttons/actions to the view controller
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let saveAction = UIAlertAction(title: "Ok", style: .default) { _ in
            
            // this code runs when the user hits the "save" button
            
           self.GuardarPartida2()
            // ********************************
            
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
        
        DispatchQueue.main.async{
            self.present(alertController, animated: true, completion: nil)
        }

       
    }
    // END GUARDARPARTIDA
    // ******************
    
    
    
    
    // FUNCION CARGARPARTIDA
    // carga los datos de la actual partida
    func CargarPartida2()
    {
        //"" variables jugador
      //  vpartidaguardada = (defaults.string(forKey: "j.partidaguardada") != nil)
        ViewController.jugando = true // guardamos para esta sesión indicando que estamos jugando

                    vdinero = (defaults.integer(forKey: "j.dinero"))
                    vdia = (defaults.integer(forKey:  "j.dia"))
                    //  vmes = (defaults.string(forKey: "j.mes")
                    vnombrejugador = defaults.string(forKey: "j.nombrejugador")!
        ViewController.Jugador.append(JugadorSTR(partidaguardada: false, idcamionJ: 1, dinero: vdinero, dia: vdia, mes: 1, numeroviajes: 0, nombrejugador: vnombrejugador))
        
    ViewController.Camion[0].posicionmapa = defaults.integer(forKey: "j.posicionactual")
        
       // vposicionactual = defaults.integer(forKey: "j.posicionactual")
        vciudadactual = defaults.integer(forKey: "j.ciudadactual")
        vciudadactuals = defaults.string(forKey: "j.vciudadactuals")!
        

        
        //"" variables camion
        vautopista = defaults.bool(forKey: "c.autopista")
        vidciudadorigen = defaults.integer(forKey:  "c.idciudadorigen")
        vidciudaddestino = defaults.integer(forKey:  "c.idciudaddestino")
        vciudad = defaults.integer(forKey:  "c.ciudad")
        //  ViewController.Camion[0].idjugadorC,forKey:  "c.idjugadorc")
        vidViaje = defaults.integer(forKey:  "c.idviaje")
        vkgCapacidad = defaults.integer(forKey:  "c.kgCapacidad")
        vkgCarga = defaults.integer(forKey:  "c.kgCarga")
        vposicionmapa = defaults.integer(forKey:  "c.posicionmapa")
        vnombrecamion = defaults.string(forKey:  "c.nombrecamion")!
        vviajecontratado = defaults.bool(forKey:  "c.viajecontratado")
        vcargado = defaults.bool(forKey:  "c.cargado")
        vgasolina = defaults.float(forKey:  "c.gasolina")
        vestado = defaults.float(forKey:  "c.estado")
        
        ViewController.Camion.append(CamionSTR(autopista: vautopista, idciudadorigen: vidciudadorigen, idciudaddestino: vidciudaddestino,   ciudad: vciudad, idjugadorC: 1, idViaje: 0, kgCapacidad: vkgCapacidad, kgCarga: vkgCarga, posicionmapa: vposicionmapa, nombrecamion: vnombrecamion, viajecontratado: vviajecontratado, cargado: vcargado, gasolina: vgasolina, estado: vestado ))
        
        //"" variables city
        vnombrecity1 = defaults.string(forKey:   "city.nombrecity1")!
        vposicion1 = defaults.integer(forKey:   "city1.posicion")
        vnombrecity2 = defaults.string(forKey:  "city.nombrecity2")!
        vposicion2 = defaults.integer(forKey:   "city2.posicion")
        
        ViewController.City.append(CitySTR(nombrecity: vnombrecity1, posicion: vposicion1))
        ViewController.City.append(CitySTR(nombrecity: vnombrecity2, posicion: vposicion2))
        
        
        ViewController.Viaje.append(ViajeSTR(idViaje: 1, empresa: defaults.string(forKey: "v.empresa")!, tipocarga: defaults.string(forKey: "v.tipocarga")!, pago: defaults.integer(forKey: "v.pago"), pesocarga: defaults.integer(forKey: "v.pesocarga"), idcityorigen: defaults.integer(forKey: "v.idcityorigen"), idcitydestino: defaults.integer(forKey: "v.idcitydestino"),  disponible: defaults.bool(forKey: "v.disponible")))
        

   
        
        GenerarViajes()



        defaults.synchronize()
        
        CargarViaje(num: 0)
        
        RellenaPantalla()
    }
    // END CARGARPARTIDA
    // ******************
    
    
    
    
    
    // FUNCION GUARDARPARTIDA
    // guarda los datos de la actual partida
    func CargarPartida()
    {

            
            self.CargarPartida2()

        
        
    }
    // END GUARDARPARTIDA
    // ******************
    
  
    
    // FUNCION MenuPrincipal
    
    
    @IBOutlet var botonMenuPrincipal: UIView!
    
    @IBAction func MenuPrincipal0(_ sender: Any) {
        MenuPrincipal()
    }
    
    
    // regresa al menú / sale del juego
    func MenuPrincipal()
    {
        ViewController.jugando = false
        //
        let alertController = UIAlertController(title: "iTradeC", message: "¿Deseas salir al menú inicial?, esto termina la partida actual !", preferredStyle: .alert)
        
        
        // add the buttons/actions to the view controller
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let saveAction = UIAlertAction(title: "Ok", style: .default) { _ in
            
            // this code runs when the user hits the "save" button
            
            self.MuestraPantalla(pantalla: "portadaid")
            // ********************************
            
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
        
        DispatchQueue.main.async{
            self.present(alertController, animated: true, completion: nil)
        }
        
        
    }
    // END GUARDARPARTIDA
    // ******************
    
    
    // Funcion DimeAleatorio
    // devuelve un num aleatorio entre inf y sup
    //****
    func DimeAleatorio(inf: Int, sup: Int ) -> Int
    {
       let aleatorio = Int.random(in: inf..<sup)
       
       return aleatorio
    }
    // end aleatorio
    
    
    

        
        
        

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
        ViewController.Viaje0a1.append(ViajeSTR(idViaje: 1, empresa: "Merca Dos nº"+"\(aleatorio)", tipocarga: "leche", pago: 3000, pesocarga: 2500, idcityorigen: 0, idcitydestino: 1,  disponible: true))
        
        ViewController.Viaje0a1.append(ViajeSTR(idViaje: 1, empresa: "Eroki nº"+"\(aleatorio2)", tipocarga: "manzanas", pago: 1000, pesocarga: 500, idcityorigen: 0, idcitydestino: 1,  disponible: true))
        
        ViewController.Viaje0a1.append(ViajeSTR(idViaje: 1, empresa: "Alcasuper nº"+"\(aleatorio3)", tipocarga: "queso", pago: 3800, pesocarga: 4500, idcityorigen: 0, idcitydestino: 1,  disponible: true))
        
        ViewController.Viaje0a1.append(ViajeSTR(idViaje: 1, empresa: "Carro nº"+"\(aleatorio4)", tipocarga: "agua", pago: 3800, pesocarga: 4500, idcityorigen: 0, idcitydestino: 1,  disponible: true))
        
        ViewController.Viaje0a1.append(ViajeSTR(idViaje: 1, empresa: "Superso nº"+"\(aleatorio5)", tipocarga: "leche", pago: 3000, pesocarga: 2500, idcityorigen: 0, idcitydestino: 1,  disponible: true))
        
        ViewController.Viaje0a1.append(ViajeSTR(idViaje: 1, empresa: "Super paco nº "+"\(aleatorio6)", tipocarga: "garbanzos", pago: 1000, pesocarga: 500, idcityorigen: 0, idcitydestino: 1,  disponible: true))
        
        ViewController.Viaje0a1.append(ViajeSTR(idViaje: 1, empresa: "Mercado nº "+"\(aleatorio7)", tipocarga: "jamones", pago: 3800, pesocarga: 4500, idcityorigen: 0, idcitydestino: 1,  disponible: true))
        
        ViewController.Viaje0a1.append(ViajeSTR(idViaje: 1, empresa: "Super Madrid nº"+"\(aleatorio8)", tipocarga: "neveras", pago: 3800, pesocarga: 4500, idcityorigen: 0, idcitydestino: 1,  disponible: true))
        //
        
        // Rellena la base de Viajes auxiliar 1 a 0
        ViewController.Viaje1a0.append(ViajeSTR(idViaje: 1, empresa: "Mercacue nº "+"\(baleatorio)", tipocarga: "leche", pago: 3000, pesocarga: 2500, idcityorigen: 1, idcitydestino: 0,  disponible: true))
        
        ViewController.Viaje1a0.append(ViajeSTR(idViaje: 1, empresa: "Ero nº "+"\(baleatorio2)", tipocarga: "manzanas", pago: 1000, pesocarga: 500, idcityorigen: 1, idcitydestino: 0,  disponible: true))
        
        ViewController.Viaje1a0.append(ViajeSTR(idViaje: 1, empresa: "Alca nº "+"\(baleatorio3)", tipocarga: "queso", pago: 3800, pesocarga: 4500, idcityorigen: 1, idcitydestino: 0,  disponible: true))
        
        ViewController.Viaje1a0.append(ViajeSTR(idViaje: 1, empresa: "Carr nº "+"\(baleatorio4)", tipocarga: "agua", pago: 3800, pesocarga: 4500, idcityorigen: 1, idcitydestino: 0,  disponible: true))
        
        ViewController.Viaje1a0.append(ViajeSTR(idViaje: 1, empresa: "Super nº "+"\(baleatorio5)", tipocarga: "leche", pago: 3000, pesocarga: 2500, idcityorigen: 1, idcitydestino: 0,  disponible: true))
        
        ViewController.Viaje1a0.append(ViajeSTR(idViaje: 1, empresa: "Super nº "+"\(baleatorio6)", tipocarga: "garbanzos", pago: 1000, pesocarga: 500, idcityorigen: 1, idcitydestino: 0,  disponible: true))
        
        ViewController.Viaje1a0.append(ViajeSTR(idViaje: 1, empresa: "Merca nº "+"\(baleatorio7)", tipocarga: "jamones", pago: 3800, pesocarga: 4500, idcityorigen: 1, idcitydestino: 0,  disponible: true))
        
        ViewController.Viaje1a0.append(ViajeSTR(idViaje: 1, empresa: "Super CUENCA nº "+"\(baleatorio8)", tipocarga: "neveras", pago: 3800, pesocarga: 4500, idcityorigen: 1, idcitydestino: 0,  disponible: true))
        //
    }
    // END GenerarViajes
    
    
    
    
    // **** FUNCION Rellena las Bases
    func RellenaBD() {
        // INICIALIZAR ESTRUCTURAS B.D.
        var c: String = "-"
        var i : Int = DimeAleatorio(inf: 2500, sup: 8000) // kgcapacidad del camion
        var j : Int = DimeAleatorio(inf: 100, sup: 200) // modelo
        var k : Int = DimeAleatorio(inf: 400, sup: 3000) // dinero

        
      
        // RELLENA VARIABLES GLOBALES
        ViewController.City.removeAll()
        ViewController.Jugador.removeAll()
        ViewController.Camion.removeAll()
        
        ViewController.City.append(CitySTR(nombrecity: "Madrid", posicion: 0))
        ViewController.City.append(CitySTR(nombrecity: "Cuenca", posicion: 1))
        
        ViewController.Jugador.append(JugadorSTR(partidaguardada: false, idcamionJ: 1, dinero: k, dia: 1, mes: 1, numeroviajes: 0, nombrejugador: vnombrejugador))
        
        
        ViewController.Camion.append(CamionSTR(autopista: false, idciudadorigen: 0, idciudaddestino: 1,   ciudad: 0, idjugadorC: 1, idViaje: 0, kgCapacidad: i, kgCarga: 0, posicionmapa: 0, nombrecamion: "Bareiros FH"+"\(j)", viajecontratado: false, cargado: false, gasolina: 10.0, estado: 10.0 ))
        
        
        ResetDatos()
        GenerarViajes()
        RellenaViaje()
 
    }
    //****END RellenaBD
    
    
    
    
    
    // **** FUNCION Rellena un viaje nuevo
    func RellenaViaje() {
        

        
        cartelViajeDisponible.setTitle("Contratar", for: .normal)
        cartelViajeDisponible.tintColor = UIColor.red;
         GenerarViajes()
        
        // INICIALIZAR ESTRUCTURAS B.D.
        //1
        var iddestino, idorigen, x: Int
        let aleatorio = Int.random(in: 1..<9)
        
        idorigen = ViewController.Camion[0].ciudad
        
       
        
      //  if idorigen==0 { x = variable0 } else { x = variable1 }
        
        ViewController.Viaje.removeAll()
        
        if idorigen==0 { // según la ciudad donde estemos, cargamos un ViewController.Viaje solo de esa ciudad
        ViewController.Viaje.append(ViewController.Viaje0a1[aleatorio])
        } else { ViewController.Viaje.append(ViewController.Viaje1a0[aleatorio]) }
        
        idorigen = ViewController.Viaje[0].idcityorigen
        iddestino = ViewController.Viaje[0].idcitydestino
        
        if iddestino==0 {idorigen=1} else {idorigen=0}
        
        self.vnombrecity1 = ViewController.City[idorigen].nombrecity
        self.vnombrecity2 = ViewController.City[iddestino].nombrecity
        
       // popup_name(titulo: "Viaje disponible de: "+ViewController.Viaje[0].empresa, solomensaje: true)
        RellenaPantalla()
        
    }
    

    
    
    //**** FUNCION PARA HABILITA/DES SEGUN LOS DATOS DISPONIBLES
    // ****
    func HabilitaBotones()
    {


    //    buttonViajar.isEnabled = true
//        buttonContratarViaje.isEnabled = true
 
    }
    
    
    
    //**** FUNCION PARA RELLENAR LA PANTALLA CON LOS DATOS DISPONIBLES
    // se guarda en cadena1
    func RellenaPantalla()
    {
        var i: Int = 0
          
     //   posicionmapatxt.text = cityp
        if vautopista==true {
            i = 2
         
                cartelViajando.text = "viajando... (autopista)"
           

        } else
            {
                i=ViewController.Camion[0].ciudad
                
                cartelViajando.text = "Parking "+ViewController.City[i].nombrecity
                
        }
        
        if ViewController.Viaje[0].disponible==false {
            cartelViajeDisponible.setTitle("Viaje Contratado", for: .normal)
            
            cartelViajeDisponible.backgroundColor = UIColor.red;
            botViajar.backgroundColor = UIColor.green;
            botViajar.tintColor = UIColor.green;
            
        }
        else
        {
            cartelViajeDisponible.setTitle("**Contratar Viaje", for: .normal)
            cartelViajeDisponible.backgroundColor = UIColor.green;
            botViajar.backgroundColor = UIColor.red;
            botViajar.tintColor = UIColor.red;
            
        }
        
        barra?.value = Float(ViewController.Camion[0].posicionmapa)
        nombretxt?.text = ViewController.Jugador[0].nombrejugador
        dinerotxt?.text = "\(ViewController.Jugador[0].dinero)"
        nombrecamiontxt?.text = ViewController.Camion[0].nombrecamion
        kgcapacidad?.text = "\(ViewController.Camion[0].kgCapacidad)"
        camionkgcargado?.text = "\(ViewController.Camion[0].kgCarga)"
        barragas?.value = ViewController.Camion[0].gasolina
        barraestado?.value = ViewController.Camion[0].estado
        camioncargado.isOn=ViewController.Camion[0].cargado
        
        txtorigen.text = ViewController.City[ViewController.Camion[0].idciudadorigen].nombrecity
        txtdestino.text = ViewController.City[ViewController.Camion[0].idciudaddestino].nombrecity
        empresatxt?.text = ViewController.Viaje[0].empresa
        tipcarga?.text = ViewController.Viaje[0].tipocarga
        viajekg?.text = "\(ViewController.Viaje[0].pesocarga)"
        viajepago?.text = "\(ViewController.Viaje[0].pago)"
        //viajecontratado?.isEnabled = ViewController.Viaje[0].disponible
        
        ciudadcamion.selectedSegmentIndex=i
    //    ciudadcarga.selectedSegmentIndex = ViewController.Viaje[0].idcityorigen
    //    ciudaddestino.selectedSegmentIndex = ViewController.Viaje[0].idcitydestino
        RellenaDia()
        
        if ViewController.Camion[0].viajecontratado == true {
            
          //  buttonContratarViaje.isEnabled = false
            viajecontratado?.isOn = true
        }
    }
    //**** END rellenaPantalla
    
    
    
    
    
    //**** HA LLEGADO A SU DESTINO
    func LlegadoaDestino()
    {
        var ori: Int = ViewController.Camion[0].idciudadorigen
        var des: Int = ViewController.Camion[0].idciudaddestino
        var cad1,cad2: String
        
cad1 = "has llegado a " + ViewController.City[des].nombrecity+", Descargas tu camión de "
cad2 = ViewController.Viaje[0].tipocarga+" y cobras... \(ViewController.Viaje[0].pago) €, Ahora puedes contratar otro viaje aquí"

        
        popup_name(titulo: cad1+cad2, solomensaje: true)
Muestrainformacion(titulo: "has llegado a " + ViewController.City[des].nombrecity)
      
        ciudadcamion.selectedSegmentIndex=des

        ViewController.Camion[0].posicionmapa = 0
        vautopista=false
        
        ViewController.Camion[0].ciudad = des
        ViewController.Camion[0].autopista=false
        
        
        
        // cambio a destino
        
        
        
        if des==0 { ori=0 ; des=1 }
            else
                  { ori=1 ; des=0 }
        
        ViewController.Camion[0].idciudadorigen = ori
        ViewController.Camion[0].idciudaddestino = des
        
        
        RellenaPantalla()
        
        if ViewController.Camion[0].viajecontratado==false { RellenaViaje() }
        else
        {
            DescargarViaje(num: ViewController.Viaje[0].idViaje)
        }
        
        // DESCARGAR
        
    }
    
    
    
    
    
    
    func RellenaDia()
    {
        
        diatexto.text = "\(ViewController.Jugador[0].dia)"
    }
    
    @IBAction func Viajar0(_ sender: Any) {
        Viajar()
    }
    
    
    //**** VIAJA HACIA DESTINO
    func Viajar()
    {

        
        // Control
        if ViewController.Camion[0].gasolina<2 { GameOver(razon: 1) }
        
        if ViewController.Camion[0].cargado==false
        { Muestrainformacion(titulo: "Tienes el camión vacío. Contrata un viaje antes de ir a la autopista (PULSA EN EL BOTÓN VERDE 'CONTRATAR VIAJE'")
            return
        }
        
        if ViewController.Jugador[0].dinero<=100
        {
            GameOver(razon: 2)
            return
        }
        if ViewController.Camion[0].cargado==true && ViewController.Camion[0].ciudad==ViewController.Viaje[0].idcitydestino
        { Muestrainformacion(titulo: "Tienes carga todavía. Descarga antes de viajar")
            return
        }
        
        if ViewController.Camion[0].posicionmapa>0 &&  ViewController.Camion[0].posicionmapa<5 {
            cartelViajando.text = "viajando... (autopista)"
        }
        
        if ViewController.Camion[0].posicionmapa == 5
        {
            cartelViajando.text = "Parking "+String(ViewController.Camion[0].ciudad)
            LlegadoaDestino()
            return
        }
        // Control pasado, ok al viaje
        
        
        ViewController.Jugador[0].dia += 1
        RellenaDia()
        ViewController.Camion[0].posicionmapa += 1
        
        
        if ViewController.Camion[0].posicionmapa==1 {
            cartelViajando.text = "viajando... (autopista)"
            popup_name(titulo: "Camión preparado... 3,2,1 : Saliendo hacia: "+vnombrecity2, solomensaje: true)
            
        }
        

        
            ViewController.Camion[0].autopista=true
            vautopista=true
            
            ViewController.Camion[0].gasolina=ViewController.Camion[0].gasolina-1
        
            // popup_name(titulo: "\(posicionactual)" , solomensaje: true)


//popup_name(titulo: "Viajando desde "+vnombrecity1+" a "+city2+", km"+"\(posicionactual)", solomensaje: true)
        
       // popup_name(titulo: "origen "+"\(ViewController.Camion[0].idciudadorigen)", solomensaje: true)


     RellenaPantalla()
      //  Muestrainformacion(titulo: "todo")
    }
    // END VIAJAR
    
    
    
    
    //**** FUNCION PARA CARGAR EL VIAJE INDICADO EN NUM (VIAJE[NUM])
    // se guarda en cadena1
    func CargarViaje(num: Int)
    {
        var capacidad, peso, llenado : Float
        
       //  buttonCarga.isEnabled = false
        
        //   cálculo del tanto por ciento llenado 0.0-1.0
        capacidad = Float(ViewController.Camion[0].kgCapacidad)
        peso = Float(ViewController.Viaje[num].pesocarga)
        llenado = (peso / capacidad)
        
        ViewController.Camion[0].kgCarga=Int(peso)
        camionkgcargado?.text = "\(Float(peso))"
        // camionkgcargado.text = "\(Float(llenado))"
        barracarga?.progress = llenado
        
        ViewController.Camion[0].cargado = true
//        buttonCarga.isEnabled = false
//        buttonViajar.isEnabled = true
        
        
        RellenaPantalla()
    }
    
    
    

    //**** FUNCION PARA DESCARGAR EL VIAJE INDICADO EN NUM (VIAJE[NUM])
    // se guarda en cadena1
    func DescargarViaje(num: Int)
    {
        cartelViajeDisponible.setTitle("Viaje Disponible", for: .normal)
        
        if ViewController.Camion[0].cargado==false {
    popup_name(titulo: "No tienes nada que descargar; debes contratar un viaje y llevarlo al destino", solomensaje: true);
            return }
        
        if ViewController.Camion[0].autopista==true
        {
            popup_name(titulo: "Descargas en la autopista, causando un gran atasco.", solomensaje: true);
        GameOver(razon: 0)
            return }
        
        if ViewController.Camion[0].ciudad != ViewController.Viaje[0].idcitydestino  {
            popup_name(titulo: "Debes descargar la carga en el destino ("+vnombrecity2+")", solomensaje: true);
            return }
        
        ViewController.Camion[0].kgCarga=0
        camionkgcargado?.text = "\(Float(0))"
        // camionkgcargado.text = "\(Float(llenado))"
        
        barracarga?.progress = 0
        
        ViewController.Camion[0].cargado = false
        ViewController.Camion[0].viajecontratado = false
        ViewController.Viaje[0].disponible = true
        

        camioncargado.isOn = false
        
       cartelViajeDisponible.setTitle("Viaje Disponible", for: .normal)
        
        ViewController.Jugador[0].dinero += ViewController.Viaje[0].pago
        
        popup_name(titulo: "Viaje Descargado!, Has cobrado "+"\(ViewController.Viaje[0].pago)", solomensaje: true)
        
        // RellenaNuevoViaje(origen: int) // 0= madrid 1= cuenca
        RellenaViaje()
        HabilitaBotones()
       
    }
    
    
    @IBAction func ContratarViaje0(_ sender: Any) {
        ContratarViaje()
    }
    
    func ContratarViaje() {
        
        var c: String = "Viaje contratado, trayecto "+vnombrecity1+"-"+vnombrecity2
        
        cartelViajeDisponible.setTitleColor(UIColor.white, for: UIControl.State.selected);
        
        if ViewController.Viaje[0].disponible == false { c="Ya tienes contratado este viaje. Conduce tu camión hasta "+vnombrecity2 }
        
        ViewController.Camion[0].viajecontratado = true
        ViewController.Viaje[0].disponible = false
        
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
        let alertController = UIAlertController(title: "ioTCamion", message: titulo, preferredStyle: .alert)

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
        
        
        DispatchQueue.main.async{
            self.present(alertController, animated: true, completion: nil)
        }
        
        if solomensaje == false // ESTA PIDIENDO EL NOMBRE DE JUGADOR
        {
            var c = alertController.textFields![0].text!
            defaults.set(c, forKey: "j.nombrejugador")
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

