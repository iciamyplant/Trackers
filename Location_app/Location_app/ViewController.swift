//
//  ViewController.swift
//  Location_app
//
//  Created by Amy Plant on 15/09/2022.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var label: UILabel!
    var manager: CLLocationManager?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        label.text = "ready!"
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        manager = CLLocationManager()
        manager?.delegate = self
        manager?.desiredAccuracy = kCLLocationAccuracyBest
        manager?.requestWhenInUseAuthorization()
        manager?.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations)
    {
        guard let first = locations.first else
        {
            return
        }
        <#code#>
        label.text = "\(first.coordinate.longitude) | \(first.coordinate.latitude)"
    }


}

