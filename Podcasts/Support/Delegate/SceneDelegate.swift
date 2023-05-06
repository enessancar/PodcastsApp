//
//  SceneDelegate.swift
//  Podcasts
//
//  Created by Enes Sancar on 6.05.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = MainTabBarController()
        self.window = window
        window.makeKeyAndVisible()
    }
}

