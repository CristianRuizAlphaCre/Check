//
//  ViewController.swift
//  check
//
//  Created by Cristian David Ruiz Rodriguez on 10/31/19.
//  Copyright © 2019 Alphacredit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var TxtUsuario: UITextField!
    @IBOutlet weak var TxtPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.TxtUsuario.delegate = self
    }

    // Funcion para esconder teclado cunado se toca la pantalla
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    // Funcion para esconder el teclado cunado presionamos return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return(true)
    }
    
    //Variables para cajas de texto
    var Usuario = ""
    var Pass = ""
    //Realizar Login
    @IBAction func BtnIngresar(_ sender: Any) {
        
        if (TxtUsuario.text != ""){
            Usuario = TxtUsuario.text!
        }else{
            showAlert(text: "Debe ingresar un usuario.")
        }
        if (TxtPass.text != ""){
            Pass = TxtPass.text!
        }else{
            showAlert(text: "Debe ingresar la contraseña.")
        }
        if (TxtPass.text != "Desarrollo" && TxtPass.text != "12345"){
            showAlert(text: "Datos incorrectos por favor verifique.")
        }
        if (TxtUsuario.text != "" && TxtPass.text != ""){
            performSegue(withIdentifier: "ingreso", sender: self)
        }
    }
    
    //Mensaje de alerta
    func showAlert(text: String){
        
        let alert = UIAlertController(title: "Login", message: text, preferredStyle: .alert)
        let btnOk = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
            
        }
        alert.addAction(btnOk)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

