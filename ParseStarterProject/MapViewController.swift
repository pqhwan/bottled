//
//  MapViewController.swift
//  bottled
//
//  Created by Pete Kim on 3/2/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import Foundation

class MapViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    let locationManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let n = self.navigationController as UINavigationController? {
            n.navigationBar.hidden = true
        }
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        if CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse {
            self.locationManager.requestWhenInUseAuthorization()
        }
        
        self.mapView.delegate = self
        self.mapView.myLocationEnabled = true
        //self.mapView.mapType = kGMSTypeNormal; default
        self.mapView.settings.compassButton = true;
        self.mapView.settings.myLocationButton = true;
        self.mapView.delegate = self;
      
        /*
        var camera = GMSCameraPosition.cameraWithLatitude(-33.86,
            longitude: 151.20, zoom: 6)
        
        self.mapView?.camera
        
        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.myLocationEnabled = true
        self.view = mapView
        
        var marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(-33.86, 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        */
        
    }
    
    /* MAPVIEW DELEGATE PROTOCOL FUNCTIONS */
    
    func mapView(mapView: GMSMapView!, didLongPressAtCoordinate coordinate: CLLocationCoordinate2D) {
        // set given coordinate to center
        mapView.animateToLocation(coordinate)

        // put a marker
        let marker = GMSMarker(position: coordinate)
        marker.title = "hello world!"
        marker.snippet = "my marker!"
        marker.map = mapView
        
        // TODO show view for choosing media
    }
    
   
    /* LOCATION MANAGER DELEGATE PROTOCOL FUNCTIONS */
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status != CLAuthorizationStatus.AuthorizedWhenInUse {
            self.locationManager.requestWhenInUseAuthorization()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

