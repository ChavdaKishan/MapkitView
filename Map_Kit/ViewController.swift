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
    
    let locationmanager = CLLocationManager()
    let clLocation = CLLocation()
    var myNewyourToJersey = MKRoute()
    
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
        let pinobj1 = MKPointAnnotation()
        pinobj1.coordinate = CLLocationCoordinate2DMake(42.360082, -71.058880)
        pinobj1.title = "New york"
        self.Mapkit.addAnnotation(pinobj1)
        
        let pinobj2 = MKPointAnnotation()
        pinobj2.coordinate = CLLocationCoordinate2DMake(42.373616, -71.109734)
        pinobj2.title = "Jersey"
        self.Mapkit.addAnnotation(pinobj2)
        
        self.Mapkit.centerCoordinate = pinobj2.coordinate
        
        let dirRequest = MKDirectionsRequest()
        dirRequest.transportType = MKDirectionsTransportType.automobile
        
        dirRequest.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2DMake(pinobj1.coordinate.latitude, pinobj1.coordinate.longitude)))
        dirRequest.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2DMake(pinobj2.coordinate.latitude, pinobj2.coordinate.longitude)))
        
        let direction = MKDirections(request: dirRequest)
        direction.calculate(completionHandler: {
            response, error in
            print(response)
            
            if error == nil
            {
                self.myNewyourToJersey = (response?.routes[0])!
                self.Mapkit.add(self.myNewyourToJersey.polyline)
            }
            else
            {
                print(error.debugDescription)
            }
        })
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer
    {
        let renderobj = MKPolylineRenderer(polyline: self.myNewyourToJersey.polyline)
        renderobj.strokeColor = UIColor.red
        renderobj.lineWidth = 5
        return renderobj
    }
}
