//
//  AppDelegate.swift
//  FileSystemDemo01
//
//  Created by Joshua Eres on 2/20/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let lDocsPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask,true).last
        if let lDocsString: NSString = lDocsPath as NSString? {
            let lFileNameWithPath = lDocsString.appendingPathComponent("theFile.txt")
            print("in appDelegate: lDocsPath is \(lDocsPath!)")
            print("in appDelegate: lDocsString is \(lDocsString)")
            print("in appDelegate: lFileNameWithPath is \(lFileNameWithPath)")
        }
        if let myTmpDirPath: NSString = NSTemporaryDirectory() as NSString? {
            let myTmpFilePath  = myTmpDirPath.appendingPathComponent("aTemporaryFileName.txt")
            print("in appDelegate: myTmpFilePath is \(myTmpDirPath)")
        }
        return true
    }

    
    var theFolderNameURLWithPath = URL(fileURLWithPath: "")
    
    func createDirectoryAction() {
        let lFM = FileManager()
        
        let lDocumentsDirectoryURL = try! lFM.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        print("***** in createDirectoryAction, the URL for 'Documents/' is...\n***** \(lDocumentsDirectoryURL)")
        
        let lFolderNameURLWithPath = lDocumentsDirectoryURL.appendingPathComponent("MyFolder", isDirectory: true)
        
        do{
            try lFM.createDirectory(at: lFolderNameURLWithPath, withIntermediateDirectories: true,
                attributes: nil)
            self.theFolderNameURLWithPath = lFolderNameURLWithPath
        } catch let err as NSError{
            print("***** DANGER \(err) detected when creating directory *****")
        }
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

