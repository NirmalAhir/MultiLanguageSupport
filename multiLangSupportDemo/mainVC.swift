//
//  mainVC.swift
//  multiLangSupportDemo
//
//  Created by Nirmal ahir on 07/04/23.
//

import UIKit

class mainVC: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDiscription: UILabel!
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLang()
    }
    
    //MARK: - Functions
    
    func setLang() {
        if let language = Locale.current.language.languageCode?.identifier {
            let currentLang = "Flag-\(language)"
            self.lblTitle.text = "title".localizeString(string: language)
            self.lblDiscription.text = "info".localizeString(string: language)
        }
    }

}
