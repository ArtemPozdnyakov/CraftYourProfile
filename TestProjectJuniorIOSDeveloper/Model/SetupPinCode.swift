//
//  SetupPinCode.swift
//  TestProjectJuniorIOSDeveloper
//
//  Created by Artem Pozdnyakov on 7/24/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import Foundation

//protocol SetupPinProtocol: class {
//    var randomPIN: String { get set }
//}

class SetupPinCode {
    
    func randomPIN() -> String {
        var pin = ""
        
        for i in 0...5 {
            pin += String((0...9).randomElement()!)
        }
        return pin
    }
}
