//
//  SceneDelegate.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 13.08.2024.
//

import UIKit
import RealmSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var notesStorage: ProductDomainModelStorage = .init()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        window = .init(windowScene: windowScene)
        window?.rootViewController = RootViewController.instantiate()
        window?.makeKeyAndVisible()
        
        //
        guard notesStorage.read().isEmpty else { return }
        
        notesStorage.store(item: .init(image: "orange", title: "ORANGE", price: 1, isFavorite: false, descriptions: "ORANGEORANGEORANGE"))
        notesStorage.store(item: .init(image: "redApple", title: "RED APPLE", price: 2, isFavorite: false, descriptions: "RED APPLERED APPLE"))
        notesStorage.store(item: .init(image: "greenApple", title: "GREEN APPLE", price: 3, isFavorite: false, descriptions: "GREEN APPLEGREEN APPLE"))
        notesStorage.store(item: .init(image: "pinapple", title: "PINAPPLE", price: 4, isFavorite: false, descriptions: "PINAPPLEPINAPPLE"))
        notesStorage.store(item: .init(image: "watermalon", title: "WATERMALON", price: 3, isFavorite: false, descriptions: "WATERMALONWATERMALON"))
        notesStorage.store(item: .init(image: "pear", title: "PEAR", price: 2, isFavorite: false, descriptions: "PEARPEAR"))
        
        notesStorage.store(item: .init(image: "bananas", title: "BANANAS", price: 1, isFavorite: false, descriptions: "BANANASBANANAS"))
        notesStorage.store(item: .init(image: "plum", title: "PLUM", price: 2, isFavorite: false, descriptions: "PLUMPLUM"))
        notesStorage.store(item: .init(image: "grape", title: "GRAPE", price: 3, isFavorite: false, descriptions: "GRAPEGRAPE"))
        notesStorage.store(item: .init(image: "melon", title: "MELON", price: 4, isFavorite: false, descriptions: "MELONMELON"))
        notesStorage.store(item: .init(image: "mango", title: "MANGO", price: 3, isFavorite: false, descriptions: "MANGOMANGO"))
        notesStorage.store(item: .init(image: "nectarine", title: "NECTARINE", price: 2, isFavorite: false, descriptions: "NECTARINENECTARINE"))
        
        notesStorage.store(item: .init(image: "kiwi", title: "KIWI", price: 1, isFavorite: false, descriptions: "KIWIKIWI"))
        notesStorage.store(item: .init(image: "passion", title: "PASSION FRUIT", price: 2, isFavorite: false, descriptions: "PASSION FRUIT"))
        notesStorage.store(item: .init(image: "peach", title: "PEACH", price: 3, isFavorite: false, descriptions: "PEACHPEACH"))
        notesStorage.store(item: .init(image: "lime", title: "LIME", price: 4, isFavorite: false, descriptions: "LIMELIME"))
        notesStorage.store(item: .init(image: "strawberrie", title: "STRAWBERRIE", price: 3, isFavorite: false, descriptions: "STRAWBERRIE"))
        notesStorage.store(item: .init(image: "tangerine", title: "tangerined", price: 2, isFavorite: false, descriptions: "TANGERINE"))

        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        guard let windowScene = scene as? UIWindowScene else { return }
//        
//        window = .init(windowScene: windowScene)
//        window?.rootViewController = MainUIKitViewController.instantiate()
//        window?.makeKeyAndVisible()
//
//        guard let _ = (scene as? UIWindowScene) else { return }
//    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

