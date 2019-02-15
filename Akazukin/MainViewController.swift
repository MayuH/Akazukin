//
//  ViewController.swift
//  Wikitude
//
//  Created by 細土真優 on 2018/07/18.
//  Copyright © 2018年 細土真優. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

//35.723427, 139.467633(梅子),35.720353,139.465588(家)

class MainViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate{
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var count:Int = 0
    var num:Int = 0
    var f1:Int = 0
    var f2:Int = 0
    var f3:Int = 0
    var f4:Int = 0
    var f5:Int = 0
    
    
    @IBOutlet weak var mapView: MKMapView!
    //z@IBOutlet weak var Label3: UILabel!
    
    
    
    let locationManager = CLLocationManager()
    let annotation1 = TestMKPointAnnotation()
    let annotation2 = TestMKPointAnnotation()
    let annotation3 = TestMKPointAnnotation()
    let annotation4 = TestMKPointAnnotation()
    let annotation5 = TestMKPointAnnotation()
    
    //var lastLocation:CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        mapView.delegate = self
        count=self.delegate.count!
        
        
        //アノテーションを作る(ばあさんの家)
        let annotation = TestMKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2DMake(35.723427, 139.467633)//梅子の墓
        //annotation.coordinate = CLLocationCoordinate2DMake(35.721427, 139.463633)
        annotation.title = "おばあさんの家"
        annotation.pinImage = "house"
        mapView.addAnnotation(annotation)
        f1 = self.delegate.f1!
        f2 = self.delegate.f2!
        f3 = self.delegate.f3!
        f4 = self.delegate.f4!
        f5 = self.delegate.f5!
        //count = self.delegate.count!
        //花１
        if(f1 != 1){
            annotation1.coordinate = CLLocationCoordinate2DMake(35.723280, 139.465532)
            //annotation1.coordinate = CLLocationCoordinate2DMake(35.721827, 139.461633)
            annotation1.pinImage = "flower"
            mapView.addAnnotation(annotation1)
            
        }
        //花2
        if(f2 != 1){
            annotation2.coordinate = CLLocationCoordinate2DMake(35.722680, 139.466732)
            //annotation2.coordinate = CLLocationCoordinate2DMake(35.723827, 139.461633)
            annotation2.pinImage = "flower"
            mapView.addAnnotation(annotation2)
        }
        //花3
        if(f3 != 1){
            annotation3.coordinate = CLLocationCoordinate2DMake(35.720924, 139.467432)
            //annotation3.coordinate = CLLocationCoordinate2DMake(35.722924, 139.463432)
            annotation3.pinImage = "flower"
            mapView.addAnnotation(annotation3)
        }
        //花4
        if(f4 != 1){
            annotation4.coordinate = CLLocationCoordinate2DMake(35.720948, 139.466432)
            //annotation4.coordinate = CLLocationCoordinate2DMake(35.720948, 139.464432)
            annotation4.pinImage = "flower"
            mapView.addAnnotation(annotation4)
        }
        //花5
        if(f5 != 1){
            annotation5.coordinate = CLLocationCoordinate2DMake(35.721780, 139.465532)
            //annotation5.coordinate = CLLocationCoordinate2DMake(35.721780, 139.462532)
            annotation5.pinImage = "flower"
            mapView.addAnnotation(annotation5)
        }
        //狼１
        let annotation6 = TestMKPointAnnotation()
        annotation6.coordinate = CLLocationCoordinate2DMake(35.721242, 139.465532)
        //annotation6.coordinate = CLLocationCoordinate2DMake(35.725842, 139.462532)
        annotation6.pinImage = "wolf"
        mapView.addAnnotation(annotation6)
        //狼2
        let annotation7 = TestMKPointAnnotation()
        annotation7.coordinate = CLLocationCoordinate2DMake(35.721802, 139.466432)
        //annotation7.coordinate = CLLocationCoordinate2DMake(35.723802, 139.462432)
        annotation7.pinImage = "wolf"
        mapView.addAnnotation(annotation7)
        //狼3
        let annotation8 = TestMKPointAnnotation()
        annotation8.coordinate = CLLocationCoordinate2DMake(35.723280, 139.466732)
        annotation8.pinImage = "wolf"
        mapView.addAnnotation(annotation8)
        
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let circleRenderer : MKCircleRenderer = MKCircleRenderer(overlay: overlay);
        circleRenderer.strokeColor = UIColor.red
        circleRenderer.fillColor = UIColor(red: 0.0, green: 0.0, blue: 0.7, alpha: 0.5)
        circleRenderer.lineWidth = 1.0
        return circleRenderer
    }
    //アノテーションビューを返すメソッド
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let test = annotation as? TestMKPointAnnotation {
            if(test.pinImage != nil) {
                
                //画像が設定されている場合
                let testPinView = MKAnnotationView()
                testPinView.annotation = annotation
                testPinView.image = UIImage(named:test.pinImage)
                testPinView.canShowCallout = true
                
                return testPinView
            }
        }
        
        return nil
    }
    //ロケーション機能の設定
    func setupLocationService(){
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //m
        locationManager.distanceFilter = 1
    }
    func goFlower(){
        self.delegate.num = num
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "flowerPage") as! FlowerViewController
        self.present(nextView, animated: true, completion: nil)
    }
    func goGoal(){
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "finalPage") as! FinalViewController
        self.present(nextView, animated: true, completion: nil)
    }
    func gameover(){
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "endPage") as! EndViewController
        self.present(nextView, animated: true, completion: nil)
        
    }
    
    //位置情報利用許可のステータス変化した
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse://使用許可
            //更新
            locationManager.startUpdatingLocation()
        case .notDetermined://使用不許可
            //更新を停止
            locationManager.stopUpdatingLocation()
        default:
            //更新を停止
            locationManager.stopUpdatingLocation()
        }
    }
    //位置を移動した
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locationData = locations.last
        //緯度と経度
        /*let coordinate = CLLocationCoordinate2DMake((locationData?.coordinate.latitude)!, (locationData?.coordinate.longitude)!)*/
        let wolf1i: Double = 35.721242
        let wolf1k: Double = 139.465532
        let wolf2i: Double = 35.721802
        let wolf2k: Double = 139.466432
        let wolf3i: Double = 35.723280
        let wolf3k: Double = 139.466732
        /*let wolf1i: Double = 35.725842
        let wolf1k: Double = 139.462532
        let wolf2i: Double = 35.723802
        let wolf2k: Double = 139.462432
        let wolf3i: Double = 35.723280
        let wolf3k: Double = 139.466732*/
        let now: CLLocation = CLLocation(latitude: (locationData?.coordinate.latitude)!, longitude: (locationData?.coordinate.longitude)!)
        let goto1: CLLocation = CLLocation(latitude: wolf1i, longitude: wolf1k)
        let goto2: CLLocation = CLLocation(latitude: wolf2i, longitude: wolf2k)
        let goto3: CLLocation = CLLocation(latitude: wolf3i, longitude: wolf3k)
        let dis1 = goto1.distance(from: now)
        let dis2 = goto2.distance(from: now)
        let dis3 = goto3.distance(from: now)
        if(dis1<40 || dis2<40 || dis3<40){ gameover()}//狼に40m以上近づくとゲームオーバー
        let f1i: Double = 35.723280
        let f1k: Double = 139.465532
        let f2i: Double = 35.722680
        let f2k: Double = 139.466732
        let f3i: Double = 35.720924
        let f3k: Double = 139.467432
        let f4i: Double = 35.720948
        let f4k: Double = 139.466432
        let f5i: Double = 35.721780
        let f5k: Double = 139.465532
        /*let f1i: Double = 35.721827
        let f1k: Double = 139.461633
        let f2i: Double = 35.723827
        let f2k: Double = 139.461633
        let f3i: Double = 35.722924
        let f3k: Double = 139.463432
        let f4i: Double = 35.720948
        let f4k: Double = 139.464432
        let f5i: Double = 35.721780
        let f5k: Double = 139.462532*/
        let go1: CLLocation = CLLocation(latitude: f1i, longitude: f1k)
        let go2: CLLocation = CLLocation(latitude: f2i, longitude: f2k)
        let go3: CLLocation = CLLocation(latitude: f3i, longitude: f3k)
        let go4: CLLocation = CLLocation(latitude: f4i, longitude: f4k)
        let go5: CLLocation = CLLocation(latitude: f5i, longitude: f5k)
        let fdis1 = go1.distance(from: now)
        let fdis2 = go2.distance(from: now)
        let fdis3 = go3.distance(from: now)
        let fdis4 = go4.distance(from: now)
        let fdis5 = go5.distance(from: now)
        let goali: Double = 35.723427
        let goalk: Double = 139.467633
        /*let goali: Double = 35.720353
        let goalk: Double = 139.465588*/
        let go: CLLocation = CLLocation(latitude: goali, longitude: goalk)
        let dis = go.distance(from: now)
        //count=self.delegate.count!
        if(f1 != 1){
        if(fdis1<40){
            self.delegate.f1 = 1
            count=count+1
            self.delegate.count = count
            //num = 1
            goFlower()
            }
        }
        if(f2 != 1){
        if(fdis2<40){
            self.delegate.f2 = 1
            count=count+1
            self.delegate.count = count
            num=2
            goFlower()
        }
        }
        if(f3 != 1){
        if(fdis3<40){
            self.delegate.f3 = 1
            count=count+1
            self.delegate.count = count
            num=3
            goFlower()
        }
        }
        if(f4 != 1){
        if(fdis4<40){
            self.delegate.f4 = 1
            count=count+1
            self.delegate.count = count
            num = 4
            goFlower()
        }
        }
        if(f5 != 1){
        if(fdis5<40){
            self.delegate.f5 = 1
            count=count+1
            self.delegate.count = count
            num=5
            goFlower()
        }
        }
        if(count==5){//ゴール
            if(dis<40){
               goGoal()
            }
        }
        
        //表示する範囲
        /*let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegionMake(coordinate, span)
        mapView.setRegion(region, animated:true)*/
        mapView.userTrackingMode = MKUserTrackingMode.follow
        mapView.showsScale = true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

