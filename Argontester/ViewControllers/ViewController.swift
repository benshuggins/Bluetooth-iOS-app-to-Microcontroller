//
//  ViewController.swift
//  Argontester
//
//  Created by Ben Huggins on 9/3/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBPeripheralDelegate, CBCentralManagerDelegate {
    
    static let instance = ViewController()
    
    var letter = ""

    // Characteristics
    private var redChar: CBCharacteristic?
    private var greenChar: CBCharacteristic?
    private var blueChar: CBCharacteristic?
    private var battChar: CBCharacteristic?
    private var battChar2: CBCharacteristic?
   // private var tempChar: CBCharacteristic?
    
    //Slider Outlets
    @IBOutlet weak var batteryPercentLabel: UILabel!
    @IBOutlet weak var RedSliderTapped: UISlider!
    @IBOutlet weak var GreenSliderTapped: UISlider!
    @IBOutlet weak var BlueSliderTapped: UISlider!
    
    // Properties
    private var centralManager: CBCentralManager!
    private var peripheral: CBPeripheral!
    
    // If we're powered on, start scanning
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("Central state update")
        if central.state != .poweredOn {
            print("Central is not powered on")
        } else {
            print("Central scanning for", ParticlePeripheral.particleLEDServiceUUID);
            centralManager.scanForPeripherals(
            withServices: [ParticlePeripheral.particleLEDServiceUUID],
            options: [CBCentralManagerScanOptionAllowDuplicatesKey : true])
        }
    }
    
    // Handles the result of the scan
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {

        // We've found it so stop scan
        self.centralManager.stopScan()

        // Copy the peripheral instance
        self.peripheral = peripheral
        self.peripheral.delegate = self

        // Connect!
        self.centralManager.connect(self.peripheral, options: nil)

    }
    
    // The handler if we do connect succesfully
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        if peripheral == self.peripheral {
            print("Connected to your Particle Board")
            peripheral.discoverServices([ParticlePeripheral.particleLEDServiceUUID, ParticlePeripheral.batteryServiceUUID])
        }
    }
    
    // Handles discovery event
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if let services = peripheral.services {
            for service in services {
                if service.uuid == ParticlePeripheral.particleLEDServiceUUID {
                    print("LED service found")
                    //Now kick off discovery of characteristics
                    peripheral.discoverCharacteristics(
                        [ParticlePeripheral.redLEDCharacteristicUUID,
                         ParticlePeripheral.greenLEDCharacteristicUUID,
                         ParticlePeripheral.blueLEDCharacteristicUUID],
                         for: service)
                }
                    if( service.uuid == ParticlePeripheral.batteryServiceUUID ) {
                            print("Battery service found")
                            peripheral.discoverCharacteristics([ParticlePeripheral.batteryCharacteristicUUID], for: service)
                   
                    }
        }
    }
    }
    func peripheral(_ peripheral: CBPeripheral,
                         didUpdateValueFor characteristic: CBCharacteristic,
                         error: Error?) {
        
        if( characteristic == battChar ) {
            print("Battery:", characteristic.value![0] )
           
            print("🌭🌭🌭🌭🌭🌭🌭🌭🌭🌭")
           // batteryPercentLabel.text = letter
            batteryPercentLabel.text = "\(characteristic.value![0])%"
        }
    }
    
 // Handling discovery of characteristics
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        if let characteristics = service.characteristics {
            for characteristic in characteristics {
                if characteristic.uuid == ParticlePeripheral.redLEDCharacteristicUUID {
                    print("Red LED characteristic found")

                    redChar = characteristic
                    print(redChar as Any)
                    RedSliderTapped.isEnabled = true
                } else if characteristic.uuid == ParticlePeripheral.greenLEDCharacteristicUUID {
                    print("Green LED characteristic found")

                    greenChar = characteristic
                    GreenSliderTapped.isEnabled = true
                } else if characteristic.uuid == ParticlePeripheral.blueLEDCharacteristicUUID {
                    print("Blue LED characteristic found");

                    blueChar = characteristic
                    BlueSliderTapped.isEnabled = true
                } else if characteristic.uuid == ParticlePeripheral.batteryCharacteristicUUID {
                    print("Battery characteristic found");

                    // Set the char
                    battChar = characteristic
            
                    peripheral.setNotifyValue(true, for: characteristic)
                }
            }
        }
    }
    private func writeLEDValueToChar( withCharacteristic characteristic: CBCharacteristic, withValue value: Data) {

        // Check if it has the write property
        if characteristic.properties.contains(.writeWithoutResponse) && peripheral != nil {

            peripheral.writeValue(value, for: characteristic, type: .withoutResponse)

        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
      // centralManager = CBCentralManager(delegate: self, queue: DispatchQueue.global())
    }
    
    @IBAction func RedSliderChanged(_ sender: Any) {
        print("red:",RedSliderTapped.value);
           let slider:UInt8 = UInt8(RedSliderTapped.value)
           writeLEDValueToChar( withCharacteristic: redChar!, withValue: Data([slider]))
    }
    @IBAction func GreenSliderChanged(_ sender: Any) {
        print("green:",GreenSliderTapped.value);
           let slider:UInt8 = UInt8(GreenSliderTapped.value)
           writeLEDValueToChar( withCharacteristic: greenChar!, withValue: Data([slider]))
    }
    
    @IBAction func BlueSliderChanged(_ sender: Any) {
        print("blue:",BlueSliderTapped.value);
           let slider:UInt8 = UInt8(BlueSliderTapped.value)
           writeLEDValueToChar( withCharacteristic: blueChar!, withValue: Data([slider]))
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        
        if peripheral == self.peripheral {
        print("Disconnected")

        RedSliderTapped.isEnabled = false
        GreenSliderTapped.isEnabled = false
        BlueSliderTapped.isEnabled = false

        RedSliderTapped.value = 0
        GreenSliderTapped.value = 0
        BlueSliderTapped.value = 0
            
            self.peripheral = nil
            
        // Start scanning again
        print("Central scanning for", ParticlePeripheral.particleLEDServiceUUID);
        centralManager.scanForPeripherals(withServices: [ParticlePeripheral.particleLEDServiceUUID],
            options: [CBCentralManagerScanOptionAllowDuplicatesKey : true])
        }
    }
}

