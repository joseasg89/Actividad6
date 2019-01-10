//
//  Deudor.swift
//  Actividad6
//
//  Created by usuario on 1/9/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit

class Deudor{
    var Nombre: String
    var latitude: Double
    var longitude: Double
    var Adeudo: Int
    var Notas: String
    init(Nombre: String, latitude: Double, longitude: Double, Adeudo: Int, Notas: String){
        self.Nombre = Nombre
        self.latitude = latitude
        self.longitude = longitude
        self.Adeudo = Adeudo
        self.Notas = Notas
    }
}
