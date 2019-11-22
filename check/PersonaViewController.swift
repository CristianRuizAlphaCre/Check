//
//  PersonaViewController.swift
//  check
//
//  Created by Cristian David Ruiz Rodriguez on 11/21/19.
//  Copyright © 2019 Alphacredit. All rights reserved.
//

import UIKit

class PersonaViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var TxtPrimerNombre: UITextField!
    @IBOutlet weak var TxtSegundoNombre: UITextField!
    @IBOutlet weak var TxtPrimerApellido: UITextField!
    @IBOutlet weak var TxtSegundoApellido: UITextField!
    @IBOutlet weak var TxtNumeroIdentificacion: UITextField!
    @IBOutlet weak var TxtFechaNacimiento: UITextField!
    @IBOutlet weak var TxtGenero: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.TxtPrimerNombre.delegate = self
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.addTarget(self, action: #selector(PersonaViewController.datePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
        
        TxtFechaNacimiento.inputView = datePicker
        
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
    
    //Codigo para ver el campo fecha como un calendario
    @objc func datePickerValueChanged(sender: UIDatePicker){
        let formatter = DateFormatter()
        
        formatter.dateStyle = DateFormatter.Style.medium
        formatter.timeStyle = DateFormatter.Style.none
        
        TxtFechaNacimiento.text = formatter.string(from: sender.date)
    }
    
    //Variables para cajas de texto
    var Primernombre = ""
    var SegundoNombre = ""
    var PrimerApellido = ""
    var SegundoApellido = ""
    var NumeroIdentificacion = ""
    var FechaNacimiento = ""
    var Genero = ""
    
    //Realizar registro
    @IBAction func BtnGuardar(_ sender: Any) {
        if (TxtPrimerNombre.text != ""){
            Primernombre = TxtPrimerNombre.text!
        }else{
            showAlert(text: "Debe ingresar el primer nombre")
        }
        if (TxtSegundoNombre.text != ""){
            SegundoNombre = TxtSegundoNombre.text!
        }
        if (TxtPrimerApellido.text != ""){
            PrimerApellido = TxtPrimerApellido.text!
        }else{
            showAlert(text: "Debe ingresar el primer apellido.")
        }
        if (TxtSegundoApellido.text != ""){
            SegundoApellido = TxtSegundoApellido.text!
        }
        if (TxtNumeroIdentificacion.text != ""){
            NumeroIdentificacion = TxtNumeroIdentificacion.text!
        }else{
            showAlert(text: "Debe ingresar el numero de identificacion.")
        }
        if (TxtFechaNacimiento.text != ""){
            FechaNacimiento = TxtFechaNacimiento.text!
        }else{
            showAlert(text: "Debe ingresar la fecha de nacimiento.")
        }
        if (TxtGenero.text != ""){
            Genero = TxtGenero.text!
        }else{
            showAlert(text: "Debe seleccionar un genero.")
        }
        
        performSegue(withIdentifier: "registro", sender: self)
    }
    
    //Mensaje de alerta
    func showAlert(text: String){
        
        let alert = UIAlertController(title: "Informacion del cliente", message: text, preferredStyle: .alert)
        let btnOk = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
            
        }
        alert.addAction(btnOk)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}