//
//  AppDelegate.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 13.08.2024.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        
        let authService: AuthService = .init()
        
        _ = SessionManager.shared
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            authService.logout()
////            authService.deleteUserAccount { result in
//                Task { @MainActor in
////                    try? await authService.register(
////                        email: "andrey@gmail.com",
////                        password: "qwerty12345",
////                        name: "Andrey And123"
////                    )
//                    
//                    try? await authService.login(email: "andrey@gmail.com", password: "qwerty12345")
//                }
////            }
//        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

