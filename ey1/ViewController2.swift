//
//  ViewController2.swift
//  ey1
//
//  Created by pc1 on 04/11/2020.
//  Copyright © 2020 pc1. All rights reserved.
//

import UIKit

import Foundation

class ViewController2: UIViewController {
    

    
    
    @IBOutlet weak var botonNuevo: UIButton!
    
    @IBOutlet weak var nombrejugadortxt: UITextField!
    @IBOutlet weak var BOTONcargarjuego: UIButton!
    
    @IBOutlet weak var cartelMSG: UITextView!
    
    @IBOutlet weak var texto: UITextView!
    
    
    
    let defaults = UserDefaults.standard
    
    let ControladorPrincipal = ViewController()
    
    var gameover: Bool? = false
    var r: String? = "-"
    var nombrejugador: String = "Jhon"
    
    @IBAction func b(_ sender: Any) {
        var r: String
        r = defaults.string(forKey: "nombrejugador")!
        texto.text = r
    }

    
    // NUEVO JUEGO
    // **********************
    @IBAction func buttonNUEVO(_ sender: Any) {

        defaults.set(false, forKey: "cargandoJuego")
        defaults.synchronize()
        // popup = pregunta el nick y empieza el juego (func EmpezarJuego)
        popup_y_EmpezarJuego()

    }

    // Empieza el juego = muestra Viewcontroller
    func EmpezarJuego()
    {
        
        let secondView = self.storyboard?.instantiateViewController(withIdentifier: "principal") as! UIViewController
        self.present(secondView, animated: true, completion: nil)
        
    }
    
    // END NUEVOJUEGO
    // ***********************

    
    
    

    @IBAction func buttonCargarJuego(_ sender: Any) {
        
        defaults.set(true, forKey: "cargandoJuego")
        defaults.synchronize()
        self.EmpezarJuego()
        
        //defaults.set(nombrejugadortxt.text, forKey: "nombrejugador")
    }
    
    
    

    // INICIO DEL FORMULARIO
    // ********************
    // ********************
    // -
    // -
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        
        

        //ViewPrincipal = new; ViewController()
        

        defaults.set(false, forKey: "gameover")
        defaults.set("-", forKey: "razongameover")
        
        
  
        gameover = defaults.bool(forKey: "gameover")
        r = defaults.string(forKey: "razongameover")
        
        popup1(titulo: "Bienvenido a iOTCamion! ** UN JUEGO SIMULADOR DE TRANSPORTE ** EN ESTE JUEGO DEBERÁS CONTRATAR UN VIAJE PARA TRANSPORTAR MERCANCIAS CON TU CAMIÓN, ENTRE DOS CIUDADES. **** JUEGO GRATUITO PARA iOS **** un juego original de www.ol1software.com")

        // Do any additional setup after loading the view.
    }
    
    //**** FUNCION PARA CREAR POPUP CON TEXTO
    // ***
    func popup1(titulo: String)
    {
        
        
        // create the actual alert controller view that will be the pop-up
        let alertController = UIAlertController(title: "ioTCamion", message: titulo, preferredStyle: .alert)
    
        
        
        // add the buttons/actions to the view controller
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let saveAction = UIAlertAction(title: "Ok", style: .default) { _ in
            
            // this code runs when the user hits the "save" button
            return true
            
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
        
        DispatchQueue.main.async{
            
            if self.presentedViewController==nil{
                self.present(alertController, animated: true, completion: nil)
            }else{
                self.presentedViewController!.present(alertController, animated: true, completion: nil)
            }
            
        }
        
        
    }
    //**** END

    @IBAction func botonAyuda(_ sender: UIButton) {
        var c: String = "INSTRUCCIONES DE JUEGO: primero, has de contratar un viaje para transportar mercancía (ESTO LO TIENES EN EL CUADRADO SUPERIOR DONDE PONE '1--CONTRATO'), observa el tipo de empresa, tipo y peso del transporte, y lo que pagan. --- Una vez estés listo, pulsa en el botón verde 'CONTRATAR VIAJE', y tu camión se llenará automáticamente (Observa lo lleno que está el camión en la foto inferior)----Una vez hecho esto, has de viajar hacia tu ciudad de destino (por ejemplo de madrid a cuenca) -- OBSERVA que tienes un cartel de color cyan justo en el cuadrado llamado '3-MAPA', donde te informa si estás preparado para llevar tu cargamento, o si estás en el parking.----Ahora , debes llevar tu camión a tu destino, pulsando en el botón 'VIAJAR' hasta que llegues al destino. -- UNA VEZ llegas al destino, tu camión se descarga de manera AUTOMÁTICA y te ingresan el dinero. -- RECUERDA REPOSTAR TU CAMIÓN PULSANDO EL ICONO DE GASOLINERA, EN LA PARTE INFERIOR."
        
        popup1(titulo: c)
        
    }
    
    @IBAction func botonSobre(_ sender: UIButton) {
        var c: String = "iOTCamion: un juego-simulador de transporte de mercancías por carretera ## Juego gratuito, se permite su distribución por cualquier medio ##.... Desarrollado por OL1 Software, un pequeño estudio de desarrollo de software para Android, iOS, Windows y MAC.... VISÍTAME en www.ol1software.com y en el twitter @ol1software "
        
        popup1(titulo: c)
    }
    
    
    //**** FUNCION PARA CREAR POPUP CON ENTRADA DE TEXTO y EMPEZAR EL JUEGo (llama a EmpezarJuego)
    // ******************************************
    func popup_y_EmpezarJuego()
    {
        
        
        // create the actual alert controller view that will be the pop-up
        let alertController = UIAlertController(title: "iTradeC", message: "·BIENVENIDO: escribe tu nombre y empieza a jugar!", preferredStyle: .alert)

            alertController.addTextField { (textField) in
                // configure the properties of the text field
                textField.placeholder = "Tu Nombre"
                                         }
        
        
        // add the buttons/actions to the view controller
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        
        
        
        // CUANDO PULSA OK EMPIEZA
        // ***********************
        let saveAction = UIAlertAction(title: "Ok", style: .default) { _ in
            
            // this code runs when the user hits the "save" button
    
            self.defaults.set(alertController.textFields![0].text!, forKey: "nombrejugador")
            self.EmpezarJuego()
            
                                                                     }
        // ************************
        
        
        
        
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
 
   
        
        DispatchQueue.main.async{
            self.present(alertController, animated: true, completion: nil)
        }
        



        
    }
    //**** END popup_y_EmpezarJuego
    // ****************************
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
