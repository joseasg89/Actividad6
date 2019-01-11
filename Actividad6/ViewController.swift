//
//  ViewController.swift
//  Actividad6
//
//  Created by usuario on 1/9/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tblEmpleado: UITableView!
    var objCobranza = Cobranza(CoEmpleado: [])
    var objDeudor: [Deudor] = []
    var newobjDeudor: [Deudor] = []
    var contNumEmp: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        var contEmp: Int = 0
        var contDeu: Int = 0
        var contFetch: Int = 0
        
        
        //MARK: Crear Contexto
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        //MARK: Consultar
        //Carga empleado
        let fetchReqs = NSFetchRequest<NSFetchRequestResult>(entityName: "Empleados")
        do {
            let fetch = try context.fetch(fetchReqs) as! [Empleados]
            
            for item in fetch{
                //Carga Deudores
                let fetchReqs2 = NSFetchRequest<NSFetchRequestResult>(entityName: "Deudores")
                do {
                    let fetch2 = try context.fetch(fetchReqs2) as! [Deudores]
                    
                    for item2 in fetch2{
                        contFetch = contFetch+1
                        if item2.value(forKey: "idEmpleado") as! Int == item.value(forKey: "idEmpleado") as! Int{
                            objDeudor.insert(Deudor(Nombre: item2.nombre!, latitude: item2.latitude, longitude: item2.longitude, Adeudo: Int(item2.deuda), Notas: item2.nota!), at: contDeu)
                            contDeu = contDeu + 1
                        }
                        if contFetch == fetch2.count{
                            objCobranza.CoEmpleado.insert(Empleado(Nombre: item.nombre!, IdEmpleado: Int(item.idEmpleado), latitude: 19.4336523, longitude: -99.1454316, latDelta: 0.5, lonDelta: 0.5, Cargo: item.cargo!, Deudores: objDeudor), at: contEmp)
                            objDeudor = newobjDeudor
                            contFetch = 0
                            contDeu = 0
                        }
                    }
                } catch {
                    fatalError("Failed to fetch users: \(error)")
                }
                
                
                contEmp = contEmp + 1
            }
            
        } catch {
            fatalError("Failed to fetch users: \(error)")
        }
        
        self.tblEmpleado.dataSource = self
        self.tblEmpleado.delegate = self
    }


}

extension ViewController : UITableViewDataSource {
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        print(section)
//        return "Section \(section + 1)"
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objCobranza.CoEmpleado.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let row = indexPath.row
        let nombre = "\(objCobranza.CoEmpleado[row].IdEmpleado) - \(objCobranza.CoEmpleado[row].Nombre)"
        let cargo = objCobranza.CoEmpleado[row].Cargo
        
        
        cell.textLabel?.text = nombre
        cell.detailTextLabel?.text = cargo
        
        if cargo == "Jefe"{
            cell.backgroundColor = UIColor.yellow
        } else {
            cell.backgroundColor = UIColor.white
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vcd = segue.destination as? ViewController4 {
            vcd.nextNumEmpl = contNumEmp
        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        contNumEmp = 0
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchReqs = NSFetchRequest<NSFetchRequestResult>(entityName: "Empleados")
        do{
            let fetch = try context.fetch(fetchReqs) as! [Empleados]
            contNumEmp = fetch.count + 1
        }catch {
            fatalError("Failed to fetch users: \(error)")
        }
        if contNumEmp == 0 {
            print("error")
            return false
        }else{
            return true
        }
    }
    
}
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        EmpDeudor = objCobranza.CoEmpleado[row]
        
        DispatchQueue.main.async {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "VC2")
            self.present(controller, animated: true, completion: nil)
        }
    }
}
