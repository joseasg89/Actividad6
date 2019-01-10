//
//  ViewController3.swift
//  Actividad6
//
//  Created by usuario on 1/10/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit
import MapKit
var empleadoRuta: Empleado?
var deudorRuta: Deudor?

class ViewController3: UIViewController {
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var txvRuta: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        map.delegate = self
        //MARK: dibuja mapa
        let latitude: CLLocationDegrees = (empleadoRuta?.latitude)!
        let longitude: CLLocationDegrees = (empleadoRuta?.longitude)!
        let latDelta: CLLocationDegrees = (empleadoRuta?.latDelta)!
        let lonDelta: CLLocationDegrees = (empleadoRuta?.lonDelta)!
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: coordinates, span: span)
        map.setRegion(region, animated: true)
        
        //MARK: anotaciones
        let annotation = MKPointAnnotation()
        annotation.title = (empleadoRuta?.Nombre)!
        annotation.subtitle = "Tu estas aqui."
        annotation.coordinate = coordinates
        map.addAnnotation(annotation)
        map.selectAnnotation(annotation, animated: true)
        // 19.3948,-99.1736
        let coordinates2 = CLLocationCoordinate2D(latitude:(deudorRuta?.latitude)!, longitude:(deudorRuta?.longitude)!)
        
        //MARK: ruta
        let sourcePlacemark = MKPlacemark.init(coordinate: coordinates)
        let sourceMapItem = MKMapItem.init(placemark: sourcePlacemark)
        
        let destinationPlacemark = MKPlacemark.init(coordinate: coordinates2)
        let destinationMapItem = MKMapItem.init(placemark: destinationPlacemark)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate {
            (response, error) -> Void in
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }
            let route = response.routes[0]
            self.map.addOverlay(route.polyline, level: .aboveRoads)
            let rect = route.polyline.boundingMapRect
            self.map.setRegion(MKCoordinateRegion(rect), animated: true)
        }
        
        let name = (deudorRuta?.Nombre)!
        let adeudoo = (deudorRuta?.Adeudo)!
        let note = (deudorRuta?.Notas)!
        
        let infoRuta = CLGeocoder()
        
        infoRuta.reverseGeocodeLocation(CLLocation(latitude: coordinates2.latitude, longitude: coordinates2.longitude)){
            (placemark, error) in
            if (error != nil)
            {
                print("error")
            }
            if let placemark = placemark{
                
                let direccion = "\(placemark[0].country ?? ""), \(placemark[0].administrativeArea ?? ""), \(placemark[0].locality ?? ""), \(placemark[0].name ?? "")"
                let codPost = placemark[0].postalCode ?? ""
                
                self.txvRuta.text = "Deudor: \(name)\nAdeudo: \(adeudoo)\nNotas: \(note)\nDireccion: \(direccion)\nCodigo Postal: \(codPost)"
            }
        }
        //MARK: Datos deudor
        
    }
}
extension ViewController3: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.orange
        renderer.lineDashPattern = [8,12];
        renderer.lineWidth = 4.0
        renderer.alpha = 1
        return renderer
    }
}
