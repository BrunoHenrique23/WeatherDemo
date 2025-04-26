//
//  LocationManager.swift
//  WeatherDemo
//
//  Created by Bruno Henrique Ferraz da Silva on 17/03/25.
//

import Foundation
import CoreLocation


class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject{
    
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    
    @Published var isLoading: Bool = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Erro ao buscar a localização", error)
        isLoading = false
    }
}
