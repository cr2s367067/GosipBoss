//
//  GosipBossApp.swift
//  GosipBoss
//
//  Created by Kuan on 2022/8/6.
//

import SwiftUI
import FirebaseCore

@main
struct GosipBossApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var appVM = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {            
                ContentView()
                    .environmentObject(appVM)
            }
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
