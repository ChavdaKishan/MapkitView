//
//  ViewController.swift
//  Map_Kit
//
//  Created by iFlame on 11/7/17.
//  Copyright © 2017 iflame. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate
{
    
    @IBOutlet weak var Mapkit: MKMapView!
    
    let clLocation = CLLocation()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Mapkit.delegate = self
    }
    
    @IBAction func MapTypeBtnPress(_ sender: UIButton)
    {
        if Mapkit.mapType == MKMapType.standard
        {
            Mapkit.mapType = MKMapType.satellite
        }
        else
        {
            Mapkit.mapType = MKMapType.standard
        }
    }
    
    @IBAction func FindRouteBtnPress(_ sender: UIButton)
    {
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
