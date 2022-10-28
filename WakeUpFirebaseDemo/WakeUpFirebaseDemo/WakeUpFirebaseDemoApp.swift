//
//  WakeUpFirebaseDemoApp.swift
//  WakeUpFirebaseDemo
//
//  Created by Anagha Srikumar on 10/27/22.
//

import SwiftUI
import Firebase
import Alamofire
import Foundation


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    
    //wakeupfirebaseDemo()

    return true
  }
}

@main
struct WakeUpFirebaseDemoApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    //let usr = UserDemo()


  var body: some Scene {
    WindowGroup {
      //NavigationView {
        ContentView()
      //}
    }
  }
}
