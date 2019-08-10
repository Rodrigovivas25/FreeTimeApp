//
//  DetailContainer.swift
//  ProyectoFreeTimeApp
//
//  Created by Ricardo Hernández González on 8/10/19.
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

}

