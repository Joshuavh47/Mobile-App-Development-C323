//
//  AppDelegate.swift
//  GuessThreeLettersPersistent
//
//  Created by Joshua Eres on 2/3/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var theModel = ThreeLettersModel()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        theModel = theModel.loadGame() ?? ThreeLettersModel()
        
//        theModel.allTimeScore = (loadModel ?? theModel).allTimeScore
//        
//        theModel.fastestGame = (loadModel ?? theModel).fastestGame ?? 0
//        theModel.attemptsThisGame = (loadModel ?? theModel).attemptsThisGame
//        theModel.lCurrentWordIndex = (loadModel ?? theModel).lCurrentWordIndex ?? 0
//        theModel.correctLastAttempt = (loadModel ?? theModel).correctLastAttempt
//        theModel.gameIsOn = (loadModel ?? theModel).gameIsOn
//        theModel.fastestGameSoFar = (loadModel ?? theModel).fastestGameSoFar
        
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


}

