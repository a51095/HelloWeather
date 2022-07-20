//
//  ExAppDelegate.swift
//  HelloWeather
//
//

extension AppDelegate: NetworkStatusProtocol {
    /// Start APP
    func didFinishLaunchingWithOptions(_ application: UIApplication, _ launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
       
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = WeatherViewController()
        window?.makeKeyAndVisible()
    }
}
