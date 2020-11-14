//
//  ViewControllerGAMEOVER.swift
//  ey1
//
//  Created by pc1 on 10/11/2020.
//  Copyright © 2020 pc1. All rights reserved.
//

import UIKit

class ViewControllerGAMEOVER: UIViewController {
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var r: String
        
        r = defaults.string(forKey: "razongameover")!
        
  
          
        popup_name(titulo: "GAMEOVER, " + r , solomensaje: true)
        // Do any additional setup after loading the view.
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
            
        }
        
    }
    //**** END POPUPNAME

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
