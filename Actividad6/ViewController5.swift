//
//  ViewController5.swift
//  Actividad6
//
//  Created by usuario on 1/10/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit

class ViewController5: UIViewController {
    var NumEmp : Int?
    var validador : Bool = false
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var lblNombre: UILabel!
    @IBAction func txtNombreChang(_ sender: Any) {
        if txtNombre.text?.isEmpty == true{
            lblNombre.text = "El campo es Obligatorio"
            validador = false
        }else{
            lblNombre.text = ""
        }
    }
    @IBOutlet weak var txtDeuda: UITextField!
    @IBOutlet weak var lblDeuda: UILabel!
    @IBAction func txtDeudaChang(_ sender: Any) {
        let isFloatNum: Bool = isFloat(string: txtDeuda.text!)
        if txtDeuda.text?.isEmpty == true{
            lblDeuda.text = "El campo es Obligatorio"
            validador = false
        }else if !isFloatNum{
            if txtDeuda.text! != ""{
                lblDeuda.text = "El formato del 10.00"
                validador = false
            }
        }else{
            lblDeuda.text = ""
        }
    }
    @IBOutlet weak var txtNotas: UITextField!
    @IBOutlet weak var lblNotas: UILabel!
    @IBAction func txtNotasChang(_ sender: Any) {
        if txtNotas.text?.isEmpty == true{
            lblNotas.text = "El campo es Obligatorio"
            validador = false
        }else{
            lblNotas.text = ""
        }
    }
    @IBOutlet weak var txtLatitud: UITextField!
    @IBOutlet weak var lblLatitud: UILabel!
    @IBAction func txtLatitudChang(_ sender: Any) {
        let isLatitud: Bool = isLatOrLongitud(string: txtLatitud.text!)
        if txtLatitud.text?.isEmpty == true{
            lblLatitud.text = "El campo es Obligatorio"
            validador = false
        }else if !isLatitud{
            if txtLatitud.text! != ""{
                lblLatitud.text = "El formato es incorrecto"
                validador = false
            }
        }else{
            lblLatitud.text = ""
        }
    }
    @IBOutlet weak var txtLongitud: UITextField!
    @IBOutlet weak var lblLongitud: UILabel!
    @IBAction func txtLongitudChang(_ sender: Any) {
        let isLongitud: Bool = isLatOrLongitud(string: txtLongitud.text!)
        if txtLongitud.text?.isEmpty == true{
            lblLongitud.text = "El campo es incorrecto"
            validador = false
        }else if !isLongitud{
            if txtLongitud.text! != ""{
                lblLongitud.text = "El formato es incorrecto"
                validador = false
            }
        }else{
            lblLongitud.text = ""
        }
    }
    @IBOutlet weak var lblError: UILabel!
    @IBAction func btnSave(_ sender: Any) {
        validador = true
        txtNombreChang(txtNombre)
        txtDeudaChang(txtDeuda)
        txtNotasChang(txtNotas)
        txtLatitudChang(txtLatitud)
        txtLongitudChang(txtLongitud)
        
        if validador == true{
            lblError.text = ""
            DispatchQueue.main.async {
                //MARK: Crear Contexto
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                
                let deuda:  Float? = Float(self.txtDeuda.text!)
                let latitud:  Double? = Double(self.txtLatitud.text!)
                let longitud:  Double? = Double(self.txtLongitud.text!)
                
                //MARK: Insertar
                let deu = Deudores(context: context)
                deu.nombre = self.txtNombre.text
                deu.deuda = deuda!
                deu.nota = self.txtNombre.text
                deu.latitude = latitud!
                deu.longitude = longitud!
                deu.idEmpleado = Int32(self.NumEmp!)
                appDelegate.saveContext()
                
                let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "VC")
                self.present(controller, animated: true, completion: nil)
            }
        }else{
            lblError.text = "falta informacion"
        }
    }
    @IBAction func btnSalir(_ sender: Any) {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "VC2")
            self.present(controller, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func isFloat(string: String) -> Bool {
        let telReg = "^\\d{0,10}\\.?\\d{1,2}"
        let telTest = NSPredicate(format:"SELF MATCHES %@", telReg)
        let result = telTest.evaluate(with: string)
        return result
    }
    func isLatOrLongitud(string: String) -> Bool {
        let telReg = "^\\-?\\d{0,8}\\.?\\d{0,8}"
        let telTest = NSPredicate(format:"SELF MATCHES %@", telReg)
        let result = telTest.evaluate(with: string)
        return result
    }
    
}
