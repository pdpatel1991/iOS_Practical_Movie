//
//  AppDelegate.swift
//  Practical_Movie
//
//  Created by Parth Patel on 12/03/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navController : UINavigationController = UINavigationController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
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

    func navigateToMovieList()
    {
        let contentViewController = MovieListVC.getMovieListVC()
        APP_DELEGATE.navController = UINavigationController(rootViewController: contentViewController)
        APP_DELEGATE.navController.navigationBar.isHidden = false
        window?.rootViewController = APP_DELEGATE.navController
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: Theme.Color.White]
        APP_DELEGATE.navController.navigationItem.standardAppearance = appearance
        APP_DELEGATE.navController.navigationItem.scrollEdgeAppearance = appearance
        window?.makeKeyAndVisible()
    }
}

