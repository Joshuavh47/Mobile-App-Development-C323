//
//  InputViewController.swift
//  Lab22TabbedTable
//
//  Created by Joshua Eres on 4/3/24.
//

import UIKit

class InputViewController: UIViewController {

    var myAppDelegate: AppDelegate?
    var myDataModel: Lab22DataModel?
    @IBOutlet weak var columnsBox: UITextField!
    @IBOutlet weak var rowsBox: UITextField!
    
    @IBAction func enterButton(_ sender: Any) {
        myDataModel?.columns = columnsBox.text!
        myDataModel?.rows = rowsBox.text!
    }

    override func viewDidLoad() {
        self.myAppDelegate = UIApplication.shared.delegate as? AppDelegate
        self.myDataModel = self.myAppDelegate?.myModel
        super.viewDidLoad()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
