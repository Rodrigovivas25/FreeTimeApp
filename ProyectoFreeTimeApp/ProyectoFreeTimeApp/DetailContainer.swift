//
//  DetailContainer.swift
//  ProyectoFreeTimeApp
//
//  Created by Rodrigo Vivas y Noemí Rodríguez on 8/10/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import Foundation

class DetailContainer {
    
    //Arreglo vacío
    private var arrayContainer = [EventsModel]()
    //Se crea un objeto para acceder a el a través de shared
    static let shared = DetailContainer()
    
   
    
    func showEvent() -> [EventsModel] {
        return arrayContainer
    }
    
    func addItem(item:EventsModel) {
        arrayContainer.append(item)
    }
    
    func removeEvent(position: Int){
        arrayContainer.remove(at: position)
    }

}

