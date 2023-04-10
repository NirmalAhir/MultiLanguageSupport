//
//  ViewController.swift
//  multiLangSupportDemo
//
//  Created by Nirmal ahir on 06/02/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    //MARK: - IBOutlet

    @IBOutlet weak var tblData: UITableView!
    
    //MARK: - Local Variable
    
    var lang = ""
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - IBAction
    
    @IBAction func actionBtnLang(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            // English
            self.lang = "en"
            self.tblData.reloadData()
        case 2:
            // German
            self.lang = "de"
            self.tblData.reloadData()
        case 3:
            // French
            self.lang = "fr"
            self.tblData.reloadData()
        default:
            print("tag",sender.tag)
        }
    }
    
    //MARK: - UiTableView Delegate and DataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblData.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableCell
        cell.lblTitle.text =  "title".localizeString(string: lang)
        cell.lblDiscription.text = "info".localizeString(string: lang)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

//MARK: - String Extention

extension String {
    func localizeString(string: String) -> String {
        let path = Bundle.main.path(forResource: string, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}

//MARK: - UiTableView delegate Class

class TableCell : UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDiscription: UILabel!
    
}
