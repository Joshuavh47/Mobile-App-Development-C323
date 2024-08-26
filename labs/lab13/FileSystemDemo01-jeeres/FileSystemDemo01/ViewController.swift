//
//  ViewController.swift
//  FileSystemDemo01
//
//  Created by Joshua Eres on 2/20/24.
//

import UIKit

class ViewController: UIViewController {

    func dir() -> Bool {
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
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        dir()
        createDirectoryAction()
        // Do any additional setup after loading the view.
    }


}

