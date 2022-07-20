//
//  CCAppHelper.swift
//  HelloWeather

@_exported import AVKit
@_exported import SnapKit
@_exported import Alamofire
@_exported import HandyJSON
@_exported import Kingfisher
@_exported import Foundation

/// UIApplicationDelegate
func kAppDelegate() -> UIApplicationDelegate { UIApplication.shared.delegate! }

// MARK: - Font
/// PingFangSC-Regular
func RegularFont(_ size: CGFloat) -> UIFont { UIFont(name:"PingFangSC-Regular", size: size)! }
/// PingFangSC-Medium
func MediumFont(_ size: CGFloat) -> UIFont { UIFont(name:"PingFangSC-Medium", size: size)! }
/// PingFangSC-Semibold
func SemiblodFont(_ size: CGFloat) -> UIFont { UIFont(name:"PingFangSC-Semibold", size: size)! }
/// BradleyHandITCTT
func BradleyHandFont(_ size: CGFloat) -> UIFont { UIFont(name:"BradleyHandITCTT-Bold", size: size)! }

// MARK: - Screen
/// Screen width
func kScreenWidth() -> Int { UIScreen.main.bounds.size.width.i }

/// Screen height
func kScreenHeight() -> Int { UIScreen.main.bounds.size.height.i }

/// Top safety clearance
func kSafeMarginTop(_ top: Int) -> Int { top + (UIApplication.shared.delegate?.window??.safeAreaInsets.top.i)! }

/// Bottom safety clearance
func kSafeMarginBottom(_ bottom: Int) -> Int { bottom + (UIApplication.shared.delegate?.window??.safeAreaInsets.bottom.i)! }


func kAdaptedWidth(_ width: Int) -> Int { (width * UIScreen.main.bounds.size.width.i / 375) }


func kAdaptedHeight(_ height: Int) -> Int { (height * UIScreen.main.bounds.size.height.i / 667) }


func kScaleSize(_ width: Int, _ height: Int) -> CGSize {
    let sizeWidth = (width * UIScreen.main.bounds.size.width.i / 375)
    let sizeHeight = (height * UIScreen.main.bounds.size.height.i / 667)
    return CGSize(width: sizeWidth, height: sizeHeight)
}


/// NetworkStatusProtocol
protocol NetworkStatusProtocol {
    func isReachable() -> Bool
}

extension NetworkStatusProtocol {
    /// Real time monitoring of network status
    func isReachable() -> Bool {
        var res: Bool = false
        let netManager = NetworkReachabilityManager()
        if netManager?.status == .reachable(.ethernetOrWiFi) || netManager?.status == .reachable(.cellular) { res = true }
        return res
    }
}
