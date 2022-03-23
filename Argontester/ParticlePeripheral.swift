//
//  ParticlePeripheral.swift
//  Argontester
//
//  Created by Ben Huggins on 9/3/20.
//  Copyright © 2020 User. All rights reserved.
//


import UIKit
import CoreBluetooth

class ParticlePeripheral: NSObject {

    /// Particle LED services and charcteristics Identifiers

    public static let particleLEDServiceUUID     = CBUUID.init(string: "b4250400-fb4b-4746-b2b0-93f0e61122c6")
    public static let redLEDCharacteristicUUID   = CBUUID.init(string: "b4250401-fb4b-4746-b2b0-93f0e61122c6")
    public static let greenLEDCharacteristicUUID = CBUUID.init(string: "b4250402-fb4b-4746-b2b0-93f0e61122c6")
    public static let blueLEDCharacteristicUUID  = CBUUID.init(string: "b4250403-fb4b-4746-b2b0-93f0e61122c6")
    public static let batteryServiceUUID         = CBUUID.init(string: "180f")
    
    public static let batteryCharacteristicUUID  = CBUUID.init(string: "2a19")
   // public static let batteryServiceUUID2         = CBUUID.init(string: "0x181D")
    
  //  public static let batteryCharacteristicUUID2  = CBUUID.init(string: "0x2A98")
    
    // temp sensor looks like we need a characteristic and a service
    
//    public static let tempServiceUUID         = CBUUID.init(string: "1809")
//       
//    public static let tempCharacteristicUUID  = CBUUID.init(string: "2a6e")
//    
    
    
    

}
