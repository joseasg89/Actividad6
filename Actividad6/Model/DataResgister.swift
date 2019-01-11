//
//  DataResgister.swift
//  Actividad6
//
//  Created by usuario on 1/9/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit

class DataResgister: NSObject {
    let dtCobranza = Cobranza(
        CoEmpleado: [Empleado(Nombre: "Isidro Renteria",
                              IdEmpleado: 1,
                              latitude: 19.4336523,
                              longitude: -99.1454316,
                              latDelta: 0.5,
                              lonDelta: 0.5,
                              Cargo: "Jefe",
                              Deudores: [Deudor(Nombre: "Mauricio Alarcon",
                                               latitude: 20.3948,
                                               longitude: -99.1736,
                                               Adeudo: 3000,
                                               Notas: "Tiene un adeudo de dos meses"),
                                         Deudor(Nombre: "Ricardo Sol",
                                                latitude: 21.3948,
                                                longitude: -99.1736,
                                                Adeudo: 1500,
                                                Notas: "No realizo el primer pago"),
                                         Deudor(Nombre: "Alicia Sanchez",
                                                latitude: 22.3948,
                                                longitude: -99.1736,
                                                Adeudo: 1000,
                                                Notas: "Solo falta un pago")]),
                     Empleado(Nombre: "Jesus Iturbe",
                              IdEmpleado: 2,
                              latitude: 19.4336523,
                              longitude: -99.1454316,
                              latDelta: 0.5,
                              lonDelta: 0.5,
                              Cargo: "Empleado",
                              Deudores: [Deudor(Nombre: "Selena Gomez",
                                                latitude: 20.3948,
                                                longitude: -97.1736,
                                                Adeudo: 150000,
                                                Notas: "No responde las llamadas")]),
                     Empleado(Nombre: "Eduardo Santana",
                              IdEmpleado: 3,
                              latitude: 19.4336523,
                              longitude: -99.1454316,
                              latDelta: 0.5,
                              lonDelta: 0.5,
                              Cargo: "Jefe",
                              Deudores: [Deudor(Nombre: "Juan Rios",
                                                latitude: 20.3900,
                                                longitude: -97.1736,
                                                Adeudo: 20000,
                                                Notas: "Adelanto un pago")]),
        ]
    )
}
