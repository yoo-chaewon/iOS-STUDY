//
//  ViewController.swift
//  LocationTest
//
//  Created by yoo chae won on 2020/05/13.
//  Copyright © 2020 yoo chae won. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    lazy var locationManager: CLLocationManager = {
        let m = CLLocationManager()
        m.delegate = self
        return m
    }()

    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if CLLocationManager.locationServicesEnabled(){
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined: //앱 처음 실행 or 아직 사용자가 허가여부 결정하지 않았다면,
                //위치 정보 사용하겠다고 요청
                locationManager.requestWhenInUseAuthorization() //info.plist 문자열 사용
//                locationManager.requestAlwaysAuthorization()
                //-> 사용자로부터 허가/거부 응답은 delegate를 통해
            case .authorizedAlways, .authorizedWhenInUse://위치 사용 허가
                updateCurrentLocation()
            case .denied, .restricted: //허가되지 않은 상태
                show(message: "위치 서비스 사용 불가")
            default:
                fatalError()
            }
        }else{
            show(message: "위치 서비스 사용 불가")
        }
    }

    @IBAction func UpdateLocationSwitch(_ sender: UISwitch!) {
        if sender.isOn {
            self.locationManager.startUpdatingLocation()
        }else{
            self.locationManager.stopUpdatingLocation()
        }
        
    }
    
}

extension ViewController: CLLocationManagerDelegate{
    func updateCurrentLocation(){
        //locationManager에게 현재 위치 알려달라고 요청
        locationManager.startUpdatingLocation()//사용자 위치가 업데이트 시점마다 delegate로 알려줌
    }
    
    //위치 정보가 업데이트될때마다 반복적으로 호출
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let loc = locations.first{
            print(loc.coordinate)
            self.latitudeLabel.text = "\(loc.coordinate.latitude)"
            self.longitudeLabel.text = "\(loc.coordinate.longitude)"
            
            //좌표를 추출해서 주소로 바꿔줌.
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(loc) { [weak self](placemarks, error) in
                if let place = placemarks?.first{
                    //한국의 주소체계로 바꿔줌.
                    if let gu = place.locality, let dong = place.subLocality{
                        self?.locationLabel.text = "\(gu) \(dong)"
                    }else{
                        self?.latitudeLabel.text = place.name
                    }
                }
            }
        }
        
        
        //날씨정보를 실시간으로 계속 요청하는 것이 아니라면 좌료를 한번만 얻으면 됨.
        //gps를 짧은 시간동안만 사용 -> 배터리 성능항상 주의(필요한 시간에만 사용할 수 있도록)
        manager.stopUpdatingLocation()
    }
    
    //오류가 발생한 경우 -> 경고창 메세지
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        show(message: error.localizedDescription)
        manager.stopUpdatingLocation()
    }
    
    //위치정보 허가상태가 변경되는 시점에 호출
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse: //사용자가 허가
            updateCurrentLocation()
        default:
            break
        }
    }
    
}
