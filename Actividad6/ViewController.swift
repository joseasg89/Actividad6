//
//  ViewController.swift
//  Actividad6
//
//  Created by usuario on 1/9/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblEmpleado: UITableView!
    var empledo = DataResgister()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblEmpleado.dataSource = self
        self.tblEmpleado.delegate = self
    }


}

extension ViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return empledo.dtCobranza.CoEmpleado.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let row = indexPath.row
        let nombre = empledo.dtCobranza.CoEmpleado[row].Nombre
        let cargo = empledo.dtCobranza.CoEmpleado[row].Cargo
        
        cell.textLabel?.text = nombre
        cell.detailTextLabel?.text = cargo
        
        if cargo == "Jefe"{
            cell.backgroundColor = UIColor.yellow
        } else {
            cell.backgroundColor = UIColor.white
        }
        return cell
    }
    
}
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        
        EmpDeudor = empledo.dtCobranza.CoEmpleado[row]
        
        DispatchQueue.main.async {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "VC2")
            self.present(controller, animated: true, completion: nil)
        }
    }
}
