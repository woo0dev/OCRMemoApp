//
//  MemoDetailViewController.swift
//  MemoApp
//
//  Created by Woo0 on 2021/03/09.
//

import UIKit
import RealmSwift

class MemoDetailViewController: UIViewController {
    
    @IBOutlet weak var textTitle: UITextView!
    @IBOutlet weak var textText: UITextView!
    
    var titleInt: Int = 0
    var titleString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        if getDatabase() != nil {
            textTitle.text = String(getDatabase()!.title)
            textText.text = String(getDatabase()!.text)
        }
        
    }
    func getDatabase() -> MemoData? {
        let realm = try! Realm()
        let result = realm.objects(MemoData.self).filter("title == '" + titleString + "'")
        return result.first
    }

    @IBAction func modifyBtn(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.string(from: Date())

        try? realm.write {
            let realm = try! Realm()
            let result = realm.objects(MemoData.self).filter("title == '" + titleString + "'")
            result.first?.title = textTitle.text!
            result.first?.text = textText.text!
            result.first?.date = date
        }
    }
    
}
