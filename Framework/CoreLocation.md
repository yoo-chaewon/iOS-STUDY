## CoreLocation 사용하기

> iOS에서 위치정보를 가져오기 위해서는 CoreLocation 프레임워크를 사용한다.
>
> info.plist에서 Location 접근 요청
>
> 👉 CoreLocation이 실행되면 승인 요청 Alert메세지가 뜨고 승인한 경우 수행됨.

- **경고창 만들어주기**

  UIViewController+Alert

  ```swift
  import UIKit
  
  extension UIViewController{
      func show(message: String) {
          let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
          
          let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
          alert.addAction(ok)
          
          present(alert, animated: true, completion: nil)
      }
  }
  ```

- **사용할 곳에 프레임워크 import**

  ```swift
  import CoreLocation
  ```

- **CoreLocation에서 가장 중요한 객체는 `CLLocationManager`**

  ```swift
  lazy var locationManager: CLLocationManager = {
    let m = CLLocationManager()
    m.delegate = self
    return m
  }()
  ```

- **사용하려는 클래스에 CLLocationManagerDelegate를 선언해주어 CLLocationaManager인스턴스인 locationManager의 이벤트를 파악한다.**

  ```swift
  extension ViewController: CLLocationManagerDelegate{
  }
  ```

- 사용자의 위치는 민감한 정보임

  👉 사용자의 허가를 받아야함.

  👉 **info.plist**

  > **Privacy - Location When In Use Usage Description**
  >
  > 👉 사용자의 현재 위치를 파악합니다. (문구내용 사용자 지정)
  >
  > 앱이 사용자의 위치를 요청하면 위 문구가 경고창에 뜬다 -> 앱이 위치 정보를 어떻게 사용하는지 가능한 상세히 입력!

- 사용자가 환경 설정에서 위치 서비스를 끌 수 있기 때문에,

  **코드에서 항상 위치 정보 서비스를 사용할 수 있다고 가정하면 안됨 !!!**

  > 위치 정보가 활성화 되어있는지 확인하고, 활성화 되어있지 않으면 경고창 표시.

  ```swift
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    if CLLocationManager.locationServicesEnabled(){
      switch CLLocationManager.authorizationStatus() {
        
        //앱 처음 실행 or 아직 사용자가 허가여부 결정하지 않았다면,
        case .notDetermined: 
        //위치 정보 사용하겠다고 요청
        
        //#1. 어플리케이션 사용하는 동안
        locationManager.requestWhenInUseAuthorization()
        
        //#2. 백그라운드에서 항상
  			//locationManager.requestAlwaysAuthorization()
        
        //👉 사용자로부터 허가/거부 응답은 delegate를 통해 전달된다.
      }
    }else{
      show(message: "위치 서비스 사용 불가")
    }
  }
  ```

  > requestWhenInUseAuthorization() 을 사용하면,
  >
  > infol.plist 에 작성해논 문자열이 알림창으로 뜬다!

- **사용자의 위치 사용허가 여부는 CLLocationManagerDelegate 로 간다.**

  ```swift
  extension ViewController: CLLocationManagerDelegate{
    func updateCurrentLocation(){
      //locationManager에게 현재 위치 알려달라고 요청
    }
      
    //#. 위치정보 허가상태가 변경되는 시점에 호출
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
      switch status {
        case .authorizedAlways, .authorizedWhenInUse: //사용자가 허가
        updateCurrentLocation()
        default:
        break
      }
    }
  }
  ```

- **추가 코드**

  ```swift
  extension ViewController: CLLocationManagerDelegate{
      func updateCurrentLocation(){
          //locationManager에게 현재 위치 알려달라고 요청
          locationManager.startUpdatingLocation()//사용자 위치가 업데이트 시점마다 delegate로 알려줌
      }
      
      //위치 정보가 업데이트될때마다 반복적으로 호출
      func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
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
  ```

  ```swift
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    if CLLocationManager.locationServicesEnabled(){
      switch CLLocationManager.authorizationStatus() {
        case .notDetermined: //앱 처음 실행 or 아직 사용자가 허가여부 결정하지 않았다면,
        	//위치 정보 사용하겠다고 요청
        	locationManager.requestWhenInUseAuthorization() //info.plist 문자열 사용
  				//locationManager.requestAlwaysAuthorization()
        
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
  ```

<img src = "https://github.com/yoo-chaewon/iOS-STUDY/blob/master/_resource/images/locationTest1.png" width=50% height=50%/>





## TEST에 사용할 위치정보 추가

<img src = "https://github.com/yoo-chaewon/iOS-STUDY/blob/master/_resource/images/locationTest2.png" width=50% height=50%/>

이렇게 시뮬레이션에서 사용할 위치가 표시되는데 우리나라에 해당하는 것은 없음

👉 테스트에 사용할 위치정보 추가

- GPX file 생성

  ```xml
  <?xml version="1.0"?>
  <gpx version="1.1" creator="Xcode">
      
      <!--
       Provide one or more waypoints containing a latitude/longitude pair. If you provide one
       waypoint, Xcode will simulate that specific location. If you provide multiple waypoints,
       Xcode will simulate a route visiting each waypoint.
       -->
      <wpt lat="37.498206" lon="127.02761">
          <name>강남역</name>
          
          <!--
           Optionally provide a time element for each waypoint. Xcode will interpolate movement
           at a rate of speed based on the time elapsed between each waypoint. If you do not provide
           a time element, then Xcode will use a fixed rate of speed.
           
           Waypoints must be sorted by time in ascending order.
           -->
          <time>2014-09-24T14:55:37Z</time>
      </wpt>
      
  </gpx>
  
  ```

- scheme에서 Edit scheme선택

  - Run > options > Default Location

- 이후, 출력해보기

  ```swift
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if let loc = locations.first{
      print(loc.coordinate)
      self.latitudeLabel.text = "\(loc.coordinate.latitude)"
      self.longitudeLabel.text = "\(loc.coordinate.longitude)"
    }
    
    manager.stopUpdatingLocation()
  }
  ```



## Geocoding

> 특정 장소에 대한 공유한 명칭을 사용해서 좌표를 얻는 작업
>
> <-> Reverse Geocoding

```swift
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
```





## Result

<img src = "https://github.com/yoo-chaewon/iOS-STUDY/blob/master/_resource/images/locationTest3.png" width=50% height=50%/>