//
//  EmployeeHomeVC.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 15/08/21.
//

import GoogleMaps
import UIKit
import GoogleMapsUtils

/// Point of Interest Item which implements the GMUClusterItem protocol.
class POIItem: NSObject, GMUClusterItem {
  var position: CLLocationCoordinate2D
  var name: String!

  init(position: CLLocationCoordinate2D, name: String) {
    self.position = position
    self.name = name
  }
}

let kClusterItemCount = 10000
let kCameraLatitude = -33.8
let kCameraLongitude = 151.2



class EmployeeHomeVC: UIViewController,GMSMapViewDelegate {

    @IBOutlet weak var mapVw: GMSMapView!
    
    private var clusterManager: GMUClusterManager!
    

     override func viewDidLoad() {
       super.viewDidLoad()

       // Set up the cluster manager with default icon generator and renderer.
        let iconGenerator = GMUDefaultClusterIconGenerator()
            let algorithm = GMUNonHierarchicalDistanceBasedAlgorithm()
            let renderer = GMUDefaultClusterRenderer(mapView: mapVw,
                                        clusterIconGenerator: iconGenerator)
            clusterManager = GMUClusterManager(map: mapVw, algorithm: algorithm,
                                                              renderer: renderer)

        clusterManager.setMapDelegate(self)
        
        
        
     }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        /*
        let position1 = CLLocationCoordinate2D(latitude: 47.60, longitude: -122.33)
        let marker1 = GMSMarker(position: position1)

        let position2 = CLLocationCoordinate2D(latitude: 47.60, longitude: -122.46)
        let marker2 = GMSMarker(position: position2)

        let position3 = CLLocationCoordinate2D(latitude: 47.30, longitude: -122.46)
        let marker3 = GMSMarker(position: position3)

        let position4 = CLLocationCoordinate2D(latitude: 47.20, longitude: -122.23)
        let marker4 = GMSMarker(position: position4)

        let markerArray = [marker1, marker2, marker3, marker4]
        clusterManager.add(markerArray)
        
        clusterManager.cluster()
        */
        generateClusterItems()

            // Call cluster() after items have been added to perform the clustering and rendering on map.
            clusterManager.cluster()

            // Register self to listen to both GMUClusterManagerDelegate and GMSMapViewDelegate events.
          //  clusterManager.setDelegate(self, mapDelegate: self)
        
        
    }
    @IBAction func btnAccountAction(_ sender: Any) {
        UtilityManager.shared.push(identifier: "AccountVC", Vw: self, storyBoard: .account)
    }
    
    @IBAction func btnActivateAction(_ sender: Any) {
    }
    
    func clusterManager(clusterManager: GMUClusterManager, didTapCluster cluster: GMUCluster) {
        let newCamera = GMSCameraPosition.camera(withTarget: cluster.position,
         zoom: mapVw.camera.zoom + 1)
       let update = GMSCameraUpdate.setCamera(newCamera)
       mapVw.moveCamera(update)
     }

    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        if let poiItem = marker.userData as? POIItem {
          NSLog("Did tap marker for cluster item \(poiItem.name)")
        } else {
          NSLog("Did tap a normal marker")
            
            UtilityManager.shared.push(identifier: "CompanyDetailVC", Vw: self, storyBoard: .employeeHome)
            
        }
        return false
      }
    
    // MARK: - Private
      /// Randomly generates cluster items within some extent of the camera and adds them to the
      /// cluster manager.
      private func generateClusterItems() {
        let extent = 0.2
        for index in 1...kClusterItemCount {
          let lat = kCameraLatitude + extent * randomScale()
          let lng = kCameraLongitude + extent * randomScale()
          let name = "Item \(index)"
          let item = POIItem(position: CLLocationCoordinate2DMake(lat, lng), name: name)
            clusterManager.add(item)
        }
      }

      /// Returns a random value between -1.0 and 1.0.
      private func randomScale() -> Double {
        return Double(arc4random()) / Double(UINT32_MAX) * 2.0 - 1.0
    
      }
}
