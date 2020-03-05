# iOS SDK의 새로운 기능(iOS 13)

https://developer.apple.com/kr/ios/whats-new/



## iOS 13

iOS 13 SDK를 사용하는 앱은 다크 모드, Apple로 로그인, CloudKit 및 PencilKit 등과 동기화된 Core Data를 활용할 수 있습니다. SwiftUI로 동적 사용자 인터페이스를 신속히 구축하고 Combine으로 최신 이벤트 처리 코드를 작성하며 UIKit을 사용하여 iPad 앱의 Mac 버전을 생성할 수 있습니다.

### 다크 모드

iOS 13을 사용하는 경우, 사용자는 iOS를 어두운 색상 체계를 사용하는 다크 모드로 전환하여 컨트롤을 배경 뒤로 숨기고 작업에 집중할 수 있습니다. 앱에 다크 모드를 구현하는 방법에 대한 자세한 내용은 [모양 사용자화(영문)](https://developer.apple.com/documentation/uikit/appearance_customization/)를 참조하십시오. 디자인 지침은 [Human Interface Guidelines(영문)](https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/dark-mode/)를 참조하십시오.

### SwiftUI

SwiftUI는 iOS, macOS, watchOS 및 tvOS를 위한 사용자 인터페이스를 구축하는 최신 접근 방식입니다. 선언적인 구성 기반 프로그래밍을 사용하여 그 어느 때보다 빠르게 동적 인터페이스를 구축할 수 있습니다. 프레임워크는 앱의 사용자 인터페이스를 결정하는 보기, 컨트롤 및 레이아웃 구조를 제공합니다. 또한 탭, 제스처 및 앱에 전달되는 기타 입력 유형을 산출하는 이벤트 처리기와 앱 모델부터 사용자가 보고 사용하는 보기 및 컨트롤에 이르는 데이터 흐름을 관리하는 도구를 제공합니다.

시작하려면 [SwiftUI를 사용한 앱 제작 방법 알아보기(영문)](https://developer.apple.com/tutorials/SwiftUI/)를 확인하십시오.

### 다중 UI 인스턴스

iOS 13을 사용하면 앱 사용자 인터페이스의 여러 인스턴스를 동시에 생성 및 관리하고 앱 전환기를 사용하여 인스턴스 간에 전환할 수 있습니다. iPad에서는 앱의 여러 인스턴스를 나란히 표시할 수 있습니다. UI의 각 인스턴스는 다른 콘텐츠를 표시하거나 콘텐츠를 다른 방식으로 표시합니다. 예를 들어 캘린더 앱에서 특정일의 약속과 전체 달의 약속을 나란히 표시할 수 있습니다. 

자세한 내용은 [UIKit(영문)](https://developer.apple.com/documentation/uikit/) 개발자 문서의 [앱 및 장면(영문)](https://developer.apple.com/documentation/uikit/app_and_scenes/)을 참조하십시오.

### SF Symbols

기호 이미지는 앱에서 사용할 수 있는 일관된 일련의 아이콘을 제공하며 아이콘이 다양한 크기와 앱별 콘텐츠에 맞게 조정되도록 합니다. 기호 이미지는 SVG 형식을 사용하여 선명도를 유지하면서 확대되는 벡터 기반 모양을 구현합니다. 또한 굵기와 기준선 정렬과 같이 보통 텍스트와 관련된 여러 특성을 지원합니다.

앱에 포함할 수 있는 기호 이미지를 찾으려면 SF Symbols 앱을 사용하거나 자체적으로 기호 이미지를 만들어 사용할 수 있습니다. 자세한 내용은 [UI에서 기호 이미지 구성 및 표시하기(영문)](https://developer.apple.com/documentation/uikit/uiimage/configuring_and_displaying_symbol_images_in_your_ui/)를 참조하십시오.

### Mac에 iPad 앱 구현하기

Xcode 11을 사용하면 Mac에서 iPad 앱을 구현하는 작업을 간단히 시작할 수 있습니다. iPad 앱의 프로젝트 설정에서 "Mac” 체크상자를 선택하여 시작하면 됩니다. 자세한 내용은 [iPad 앱의 Mac 버전 생성하기(영문)](https://developer.apple.com/documentation/uikit/creating_a_mac_version_of_your_ipad_app/) 및 [Mac에 iPad 앱 구현하기](https://developer.apple.com/kr/ipad-apps-for-mac/)를 참조하십시오.

### ARKit 3

ARKit 3는 다음의 새로운 기능을 제공합니다.

- 모션 캡처. 이 기능을 사용하면 앱에서 인체 골격의 움직임을 추적할 수 있습니다.
- 인물 오클루전. 이 기능으로 사람이 카메라 피드에 있는 가상 콘텐츠 앞을 지나가게 할 수 있습니다.
- iTrack 다중 얼굴 추적. TrueDepth 카메라가 탑재된 기기의 전면 카메라에서 최대 3명의 얼굴을 추적합니다.
- 전후면 카메라 동시 지원. 전후면 카메라를 사용해 얼굴과 배경 데이터를 동시에 확보합니다.
- 협업 세션. 공동으로 환경을 매핑하고 더 빠르게 공유 AR 경험을 즐길 수 있습니다.
- 시각적 일관성. AR 콘텐츠를 더 실감 나게 만들어주는 카메라 모션 블러 및 카메라 노이즈와 같은 효과를 자동으로 추가합니다.
- AR 코칭 UI 사용자가 시작, 평면 감지 등을 수행하도록 지원하는 2D 오버레이 UI입니다.
- 이미지 크기 자동 감지 및 신속한 참조 이미지 로딩.
- 보다 강력한 3D 물체 인식 및 100개의 이미지 탐지 가능.
- HDR 수준의 환경 텍스처

이러한 기능에 대한 자세한 내용은 [ARKit(영문)](https://developer.apple.com/documentation/arkit/) 프레임워크 문서를 참조하십시오.

### RealityKit

RealityKit은 새로운 Swift 프레임워크로 애니메이션, 물리적 요소 및 공간 오디오를 AR 경험에 추가하는 기능을 포함해 증강 현실 앱에서 사용할 수 있도록 3D 콘텐츠를 시뮬레이션하고 렌더링합니다. RealityKit은 ARKIt에서 제공한 정보를 활용하여 가상 물체를 현실 세계에 매끄럽게 통합합니다. 자세한 내용은 [RealityKit(영문)](https://developer.apple.com/documentation/realitykit/) 프레임워크 문서를 참조하십시오.

### Apple로 로그인

Apple로 로그인 기능을 사용하면 빠르고 안전하며 개인 정보가 보호되는 방식으로 계정을 설정하고 앱과 웹사이트의 서비스를 이용할 수 있습니다. 자세한 내용은 [Apple로 로그인](https://developer.apple.com/kr/sign-in-with-apple/)을 참조하십시오.

### 백그라운드 작업

앱이 새로운 BackgroundTasks 프레임워크를 사용하여 백그라운드에 있는 동안 앱 콘텐츠를 최신 상태로 유지하고 장시간 실행되는 작업을 수행합니다. 자세한 내용은 [BackgroundTasks(영문)](https://developer.apple.com/documentation/backgroundtasks/) 프레임워크 문서를 참조하십시오.

### 카메라 캡처

[AVCaptureMultiCamSession(영문)](https://developer.apple.com/documentation/avfoundation/avcapturemulticamsession/)을 통해 전후면 카메라를 동시에 사용하여 비디오를 녹화할 수 있습니다. [AVSemanticSegmentationMatte(영문)](https://developer.apple.com/documentation/avfoundation/avsemanticsegmentationmatte/)를 사용하여 사진에서 피부톤, 머리카락, 치아의 개별 요소를 무광으로 캡처할 수 있습니다. 속도와 품질 중 우선순위를 정해 원하는 사진의 품질을 지정하도록 선택합니다. ARKit 지원 앱의 초광각 카메라에서 기하학적 왜곡 보정 기능을 비활성화합니다.

이러한 기능과 AVFoundation Capture 하위 시스템에 대한 자세한 내용은 [카메라 및 미디어 캡처(영문)](https://developer.apple.com/documentation/avfoundation/cameras_and_media_capture/)를 참조하십시오.

### Combine

Combine은 시간 경과에 따른 처리값에 대해 선언적인 Swift API를 제공하는 새로운 프레임워크입니다. 이러한 값은 사용자 인터페이스 이벤트, 네트워크 응답, 예약된 이벤트 및 기타 많은 종류의 비동기식 데이터를 나타낼 수 있습니다. Combine을 사용하여 변경 가능한 값을 노출하는 게시자와 그러한 게시자로부터 해당 값을 수신하는 구독자를 결정합니다. Combine은 이벤트 처리 코드를 중앙 집중화하고 중첩된 종결 항목과 규칙 기반 회신 항목과 같은 번거로운 기술을 제거하여, 코드를 보다 쉽게 읽고 유지 관리할 수 있게 해줍니다.

자세한 내용은 [Combine(영문)](https://developer.apple.com/documentation/combine/) 프레임워크 문서를 참조하십시오.

### Core Haptics

새로운 Core Haptics 프레임워크를 통해 시스템에서 제공하는 기본 패턴을 확장함으로써 햅틱 패턴을 작성 및 재생하여 앱의 햅틱 피드백을 사용자화할 수 있습니다. 자세한 내용은 [Core Haptics(영문)](https://developer.apple.com/documentation/corehaptics/) 프레임워크 문서를 참조하십시오.

### Apple CryptoKit

새로운 Apple CryptoKit 프레임워크를 사용하여 안전하고 효율적으로 다음과 같은 일반적인 암호화 작업을 수행합니다.

- 암호화된 보안 다이제스트 컴퓨팅 및 비교.
- 공개 키 암호화를 사용하여 디지털 서명 생성 및 평가.
- 대칭 키를 생성하고 메시지 인증 및 암호화와 같은 다른 작업에서 사용.

자세한 내용은 [Apple CryptoKit(영문)](https://developer.apple.com/documentation/cryptokit/) 프레임워크 문서를 참조하십시오.

### MetricKit

MetricKit은 시스템에서 캡처한 앱에 관한 성과 지표 및 기기 자체의 기능을 제공하는 새로운 프레임워크로, 앱의 성능을 개선하는 데 활용할 수 있습니다. 자세한 내용은 [MetricKit(영문)](https://developer.apple.com/documentation/metrickit/) 프레임워크 문서를 참조하십시오. MetricKit을 사용하여 앱의 성능을 개선하는 방법에 대한 자세한 내용은 [앱의 성능 개선(영문)](https://developer.apple.com/documentation/metrickit/improving_your_app_s_performance/)을 참조하십시오.

### PencilKit

새로운 PencilKit 프레임워크를 통해 손으로 그린 콘텐츠를 앱에 빠르고 쉽게 통합할 수 있습니다. PencilKit은 Apple Pencil 또는 사용자의 손가락으로 입력 가능한 iOS 앱의 그리기 환경을 제공하며 그림을 고품질의 이미지로 변환하여 iOS 또는 macOS에 표시합니다. 이 환경에는 생성, 지우기 및 선 선택이 가능한 도구가 포함되어 있습니다.

자세한 내용은 [PencilKit(영문)](https://developer.apple.com/documentation/pencilkit/) 프레임워크 문서를 참조하십시오.

### Core ML 3

Core ML 3는 이제 기기 자체에 포함된 모델 맞춤화를 지원하므로 사용자별 데이터를 사용하여 비공개로 앱 내에서 모델을 다시 학습시키거나 미세 조정하여 해당 모델을 업데이트할 수 있습니다. Core ML은 또한 100가지가 넘는 레이어 유형으로 동적 신경망에 대한 지원을 대폭 확대했습니다.

새로운 [BackgroundTasks(영문)](https://developer.apple.com/documentation/backgroundtasks/) 프레임워크가 추가되어 이제 백그라운드에서 실행 시간이 긴 Core ML 모델 업데이트 및 예측을 예약할 수 있습니다.

자세한 내용은 [Core ML(영문)](https://developer.apple.com/documentation/coreml/) 프레임워크 문서를 참조하십시오.

### Vision

iOS 13부터는 Vision 프레임워크를 사용하여 다음을 수행할 수 있습니다.

- 이미지에 대한 현저성 분석 수행.
- 이미지에서 사람과 동물 감지.
- 카테고리 및 검색을 위해 이미지 분류.
- 특징 인쇄로 이미지의 유사성 분석.
- 문서에서 텍스트 인식 수행.

자세한 내용은 [Vision(영문)](https://developer.apple.com/documentation/vision/) 프레임워크 문서를 참조하십시오.

### VisionKit

새로운 VisionKit 프레임워크를 사용하면 사용자가 메모 앱에서 캡처하는 것과 같이 기기의 카메라를 사용하여 문서를 스캔할 수 있습니다. 이 기능을 Vision의 텍스트 인식 기능과 결합하여 스캔한 문서에서 텍스트를 추출할 수 있습니다. 문서 스캔에 대한 자세한 내용은 [VisionKit(영문)](https://developer.apple.com/documentation/visionkit/) 프레임워크 문서를 참조하십시오.

### Metal

Metal은 GPU에서 그래픽 및 컴퓨팅 파이프라인을 한층 더 강력하게 제어할 수 있게 하고, 고급 GPU 처리를 더 쉽게 수행할 수 있도록 기능을 추가하며, 다른 종류의 GPU를 지원하는 데 필요한 작업을 간소화합니다. 시뮬레이터의 Metal 지원을 포함한 새로운 도구를 사용하여 더 빠르게 시작하고 iOS 앱에서 Metal을 올바르게 사용 중인지 파악할 수 있습니다. 자세한 내용은 [Metal](https://developer.apple.com/kr/metal/)을 참조하십시오.

Metal Performance Shader는 광선 추적 가속화 구조의 동적 업데이트 및 GPU 생성을 포함하여 이미지 처리, 머신 러닝, 광선 추적을 수행할 수 있는 새로운 옵션을 제공합니다. 자세한 내용은 [Metal Performance Shaders(영문)](https://developer.apple.com/documentation/metalperformanceshaders/) 프레임워크 문서를 참조하십시오.

### Core Data

Core Data 저장소를 CloudKit과 동기화하면 앱 사용자가 본인의 모든 기기에서 데이터에 원활하게 접근할 수 있습니다. CloudKit과 동기화된 Core Data는 로컬 지속성과 클라우드 백업 및 배포의 장점을 모두 제공합니다. 자세한 내용은 [CloudKit을 통해 Core Data 저장소 미러링하기(영문)](https://developer.apple.com/documentation/coredata/mirroring_a_core_data_store_with_cloudkit/)를 참조하십시오.

### Core NFC

이제 Core NFC 프레임워크를 사용해 NDEF 형식의 태그에 쓰기를 포함하여 태그 쓰기를 지원할 수 있습니다. 이 프레임워크는 또한 ISO 7816, MIFARE, ISO 15693 및 FeliCa와 같은 기본 프로토콜을 사용하여 태그 읽기와 쓰기를 지원합니다. 자세한 내용은 [Core NFC(영문)](https://developer.apple.com/documentation/corenfc/) 프레임워크 문서를 참조하십시오.

### SiriKit

앱에서 Siri에게 특정 시간과 문맥이 담긴 예약 정보를 제공하므로 사용자가 상황에 맞는 행동을 취할 수 있습니다. 예를 들어 호텔 예약을 확인하고 비행기 탑승 수속 알림을 받거나 렌터카 반납에 도움을 받을 수 있습니다. 자세한 내용은 [Siri 이벤트 제안(영문)](https://developer.apple.com/documentation/sirikit/siri_event_suggestions/)을 참조하십시오.

사용자는 미디어 도메인을 통해 Siri를 사용하여 앱에서 오디오를 감상하고 제어할 수 있습니다. 자세한 내용은 [SiriKit(영문)](https://developer.apple.com/documentation/sirikit/) 문서의 [미디어(영문)](https://developer.apple.com/documentation/sirikit/media/)를 참조하십시오.