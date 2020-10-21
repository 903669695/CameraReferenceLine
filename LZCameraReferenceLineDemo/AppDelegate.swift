//
//  AppDelegate.swift
//  LZCameraReferenceLineDemo
//
//  Created by lzw on 2020/10/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = .black
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
        let lauchController = ViewController()
        window?.rootViewController = lauchController
        window?.makeKeyAndVisible()
        return true
    }

}

