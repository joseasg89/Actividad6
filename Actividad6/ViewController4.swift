//
//  ViewController4.swift
//  Actividad6
//
//  Created by usuario on 1/10/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit
import CoreData

class ViewController4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Crear Contexto
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        //MARK: Insertar
//        let emp = Empleados(context: context)
//        emp.idEmpleado = 3
//        emp.nombre = "Eduardo Santana"
//        emp.cargo = "Jefe"
//        appDelegate.saveContext()
        
        //MARK: Consultar
//        let fetchReqs = NSFetchRequest<NSFetchRequestResult>(entityName: "Empleados")
//        do {
//            let fetch = try context.fetch(fetchReqs) as! [Empleados]
//
//            print(type(of:fetch))
//            for item in fetch{
//                print(item.nombre)
//            }
//        } catch {
//            fatalError("Failed to fetch users: \(error)")
//        }
        
        //MARK: Insertar
//        let deu = Deudores(context: context)
//        deu.nombre = "Juan Rios"
//        deu.deuda = 20000
//        deu.nota = "Adelanto un pago"
//        deu.latitude = 20.3900
//        deu.longitude = -97.1736
//        deu.idEmpleado?.idEmpleado = 3
//        appDelegate.saveContext()
        
        

        //MARK: Consultar
        let fetchReqs = NSFetchRequest<NSFetchRequestResult>(entityName: "Deudores")
        do {
            let fetch = try context.fetch(fetchReqs) as! [Deudores]

            print(type(of:fetch))
            for item in fetch{
                print(item.nombre!)
//                print(item.idEmpleado)
//
//                if item.nombre == "Mauricio Alarcon" {
//                    item.idEmpleado = 1
//                    try context.save()
//                }
//                if item.nombre == "Ricardo Sol" {
//                    item.idEmpleado = 1
//                    try context.save()
//                }
//                if item.nombre == "Alicia Sanchez" {
//                    item.idEmpleado = 1
//                    try context.save()
//                }
//                if item.nombre == "Selena Gomez" {
//                    item.idEmpleado = 2
//                    try context.save()
//                }
//                if item.nombre == "Juan Rios" {
//                    item.idEmpleado = 3
//                    try context.save()
//                }
                
//                if item.value(forKey: "name") as! String == "Luis"{
//                    item.setValue("Salvador", forKey: "name")
//                }
//                //actualizar y borrar
//                if item.nombre == "Luis" {
//                    item.nombre = "Salvador"
//                    try context.save()
//                    context.delete(item)
//                    try context.save()
//                }
            }
        } catch {
            fatalError("Failed to fetch users: \(error)")
        }
    }
}
