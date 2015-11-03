//
//  ViewController.swift
//  CBExample
//
//  Created by Benny Wong on 11/3/15.
//  Copyright © 2015 Benny Wong. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate {
    var centralManager: CBCentralManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.centralManager = CBCentralManager(delegate: self, queue: nil)
        self.centralManager?.scanForPeripheralsWithServices(nil, options: nil)
    }
    
    // mark: CBCentralManagerDelegate
    func centralManager(central: CBCentralManager, didConnectPeripheral peripheral: CBPeripheral) {
        NSLog("Connected peripheral \(peripheral.name)")
    }
    
    func centralManager(central: CBCentralManager, didDiscoverPeripheral peripheral: CBPeripheral, advertisementData: [String : AnyObject], RSSI: NSNumber) {
        NSLog("Found peripheral \(peripheral.name)")
    }
    
    func centralManager(central: CBCentralManager, didFailToConnectPeripheral peripheral: CBPeripheral, error: NSError?) {
        NSLog("Failed to connect to peripheral \(peripheral.name)")
    }
    
    func centralManagerDidUpdateState(central: CBCentralManager) {
        switch central.state {
        case .PoweredOff:
            NSLog("Central Manager: Powered off")
        case .PoweredOn:
            NSLog("Central Manager: Powered on")
        case .Resetting:
            NSLog("Central Manager: Resetting")
        case .Unauthorized:
            NSLog("Central Manager: Unauthorized")
        case .Unknown:
            NSLog("Central Manager: Unknown")
        case .Unsupported:
            NSLog("Central Manager: Unsupported")
        }
    }
    
    
    // mark: CBCentralPeripheralDelegate
    func peripheral(peripheral: CBPeripheral, didDiscoverServices error: NSError?) {
        NSLog("discover services")
    }
    
    func peripheral(peripheral: CBPeripheral, didDiscoverCharacteristicsForService service: CBService, error: NSError?) {
    }
    
    func peripheral(peripheral: CBPeripheral, didUpdateValueForCharacteristic characteristic: CBCharacteristic, error: NSError?) {
    }
}
