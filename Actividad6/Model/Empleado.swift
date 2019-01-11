//
//  Empleado.swift
//  Actividad6
//
//  Created by usuario on 1/9/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit

class Empleado {
    var Nombre: String
    var IdEmpleado: Int
    var latitude: Double
    var longitude: Double
    var latDelta: Double
    var lonDelta: Double
    var Cargo: String
    var Deudores: [Deudor] = []
    init(Nombre: String, IdEmpleado: Int, latitude: Double, longitude: Double, latDelta: Double, lonDelta: Double, Cargo: String, Deudores: [Deudor]){
        self.Nombre = Nombre
        self.IdEmpleado = IdEmpleado
        self.latitude = latitude
        self.longitude = longitude
        self.latDelta = latDelta
        self.lonDelta = lonDelta
        self.Cargo = Cargo
        self.Deudores = Deudores
    }
}
