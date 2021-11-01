//
//  AppDelegate.swift
//  RetailApp
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import UIKit
import Core
import Data

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = createInitialController()
        window.makeKeyAndVisible()
        self.window = window
        return true
        
    }
    
    private func createInitialController() -> UIViewController {
        let viewModel = ProductListViewModel(productServices: ProductServices())
        let controller = ProductListViewController(viewModel: viewModel)
        let navigation = UINavigationController(rootViewController: controller)
        return navigation
    }
}

