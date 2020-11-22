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
    
    
    

    

    override func viewDidLoad() {

        super.viewDidLoad()

        defaults.set(false, forKey: "gameover")
        defaults.set("-", forKey: "razongameover")
        
        
  
        gameover = defaults.bool(forKey: "gameover")
        r = defaults.string(forKey: "razongameover")
        


        // Do any additional setup after loading the view.
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
