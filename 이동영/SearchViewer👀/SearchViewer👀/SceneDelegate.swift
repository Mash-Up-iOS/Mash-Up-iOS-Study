//
//  SceneDelegate.swift
//  SearchViewer👀
//
//  Created by 이동영 on 27/09/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let model = SearchResultRepository(searchResults: [
            .init(title: "test1",
                  imageUrl: URL(string:"www.naver.com")!,
                  thumnailImage: nil),
            .init(title: "test2",
                  imageUrl: URL(string:"www.naver.com")!,
                  thumnailImage: nil),
            .init(title: "test3",
                  imageUrl: URL(string:"www.naver.com")!,
                  thumnailImage: nil),
            .init(title: "test4",
                  imageUrl: URL(string:"www.naver.com")!,
                  thumnailImage: nil),
            .init(title: "test1",
                  imageUrl: URL(string:"www.naver.com")!,
                  thumnailImage: nil),
            .init(title: "test2",
                  imageUrl: URL(string:"www.naver.com")!,
                  thumnailImage: nil),
            .init(title: "test3",
                  imageUrl: URL(string:"www.naver.com")!,
                  thumnailImage: nil),
            .init(title: "test4",
                  imageUrl: URL(string:"www.naver.com")!,
                  thumnailImage: nil),
            .init(title: "test1",
                  imageUrl: URL(string:"www.naver.com")!,
                  thumnailImage: nil),
            .init(title: "test2",
                  imageUrl: URL(string:"www.naver.com")!,
                  thumnailImage: nil),
            .init(title: "test3",
                  imageUrl: URL(string:"www.naver.com")!,
                  thumnailImage: nil),
            .init(title: "test4",
                  imageUrl: URL(string:"www.naver.com")!,
                  thumnailImage: nil),
            .init(title: "test1",
                  imageUrl: URL(string:"www.naver.com")!,
                  thumnailImage: nil),
            .init(title: "test2",
                  imageUrl: URL(string:"www.naver.com")!,
                  thumnailImage: nil),
            .init(title: "test3",
                  imageUrl: URL(string:"www.naver.com")!,
                  thumnailImage: nil),
            .init(title: "test4",
                  imageUrl: URL(string:"www.naver.com")!,
                  thumnailImage: nil),
            .init(title: "test1",
                  imageUrl: URL(string:"www.naver.com")!,
                  thumnailImage: nil),
            .init(title: "test2",
                  imageUrl: URL(string:"www.naver.com")!,
                  thumnailImage: nil),
            .init(title: "test3",
                  imageUrl: URL(string:"www.naver.com")!,
                  thumnailImage: nil),
            .init(title: "test4",
                  imageUrl: URL(string:"www.naver.com")!,
                  thumnailImage: nil),
            .init(title: "test1",
                  imageUrl: URL(string:"www.naver.com")!,
                  thumnailImage: nil),
            .init(title: "test2",
                  imageUrl: URL(string:"www.naver.com")!,
                  thumnailImage: nil),
            .init(title: "test3",
                  imageUrl: URL(string:"www.naver.com")!,
                  thumnailImage: nil),
            .init(title: "test4",
                  imageUrl: URL(string:"www.naver.com")!,
                  thumnailImage: nil)
        ])
        let view = window?.rootViewController as? MainViewController
        let presenter = MainPresenter(model: model)
        
        view?.presenter = presenter
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
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

