//
//  ViewController2.swift
//  Actividad6
//
//  Created by usuario on 1/9/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit
var EmpDeudor: Empleado?

class ViewController2: UIViewController {
    @IBOutlet weak var tblDeudor: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblDeudor.dataSource = self
        self.tblDeudor.delegate = self
    }

}
extension ViewController2 : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EmpDeudor?.Deudores.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let row = indexPath.row
        let nombre = EmpDeudor!.Deudores[row].Nombre
        let adeudo = String(EmpDeudor!.Deudores[row].Adeudo)
        
        cell.textLabel?.text = nombre
        cell.detailTextLabel?.text = adeudo
        return cell
    }
}
extension ViewController2 : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        empleadoRuta = EmpDeudor!
        deudorRuta = EmpDeudor!.Deudores[indexPath.row]
        
        DispatchQueue.main.async {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "VC3")
            self.present(controller, animated: true, completion: nil)
        }
    }
}
