//
//  CCAppHelper.swift
//  HelloWeather
//
//

@_exported import AVKit
@_exported import SnapKit
@_exported import Alamofire
@_exported import HandyJSON
@_exported import Kingfisher
@_exported import Foundation

/// 全局的UIApplication代理对象
func kAppDelegate() -> UIApplicationDelegate { UIApplication.shared.delegate! }

// MARK: - Font
/// 平方字体-常规体
func RegularFont(_ size: CGFloat) -> UIFont { UIFont(name:"PingFangSC-Regular", size: size)! }
/// 平方字体-中等体
func MediumFont(_ size: CGFloat) -> UIFont { UIFont(name:"PingFangSC-Medium", size: size)! }
/// 平方字体-中粗体
func SemiblodFont(_ size: CGFloat) -> UIFont { UIFont(name:"PingFangSC-Semibold", size: size)! }
/// 手写字体-中粗体
func BradleyHandFont(_ size: CGFloat) -> UIFont { UIFont(name:"BradleyHandITCTT-Bold", size: size)! }

// MARK: - Screen
/// 屏幕宽
func kScreenWidth() -> Int { UIScreen.main.bounds.size.width.i }

/// 屏幕高
func kScreenHeight() -> Int { UIScreen.main.bounds.size.height.i }

/// 顶部安全间距
func kSafeMarginTop(_ top: Int) -> Int { top + (UIApplication.shared.delegate?.window??.safeAreaInsets.top.i)! }

/// 底部安全间距
func kSafeMarginBottom(_ bottom: Int) -> Int { bottom + (UIApplication.shared.delegate?.window??.safeAreaInsets.bottom.i)! }

/// 等比例设计尺寸宽(以375为基准)
func kAdaptedWidth(_ width: Int) -> Int { (width * UIScreen.main.bounds.size.width.i / 375) }

/// 等比例设计尺寸高(以667为基准)
func kAdaptedHeight(_ height: Int) -> Int { (height * UIScreen.main.bounds.size.height.i / 667) }

/// 等比例设计尺寸Size(以375,667为基准)
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
    /// 返回一个布尔值,用于实时监测网络状态
    func isReachable() -> Bool {
        var res: Bool = false
        let netManager = NetworkReachabilityManager()
        if netManager?.status == .reachable(.ethernetOrWiFi) || netManager?.status == .reachable(.cellular) { res = true }
        return res
    }
}
