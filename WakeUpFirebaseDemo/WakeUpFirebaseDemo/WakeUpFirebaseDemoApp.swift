//
//  WakeUpFirebaseDemoApp.swift
//  WakeUpFirebaseDemo
//
//  Created by Anagha Srikumar on 10/27/22.
//

import SwiftUI
import FirebaseCore
import AVFoundation

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      
      guard let musicURL = Bundle.main.url(forResource: "music", withExtension: "mp3") else { return false }
      if let audioPlayer = try? AVAudioPlayer(contentsOf: musicURL) {
          audioPlayer.play()
      } else {
          print("Error creating audio player")
      }

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
      NavigationView {
        ContentView()
      }
    }
  }
}
