//
//  MemoViewController.swift
//  MemoApp
//
//  Created by Woo0 on 2021/03/09.
//

import UIKit
import RealmSwift

class MemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.memoTextView.layer.borderWidth = 0.5
        self.memoTextView.layer.borderColor = UIColor.white.cgColor
        //self.navigationController?.navigationBar.tintColor = .white
        self.SaveBtnOutlet.tintColor = UIColor.blue
        
    }

    @IBOutlet weak var MemoTitleField: UITextField!
    @IBOutlet weak var memoTextView: UITextView!
    @IBOutlet weak var SaveBtnOutlet: UIBarButtonItem!
    
    @IBAction func SaveBtn(_ sender: Any) {
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        var date = formatter.string(from: Date())
        var getData = getNoData()
        
        let addData = MemoData()
        
        if getData != nil {
            let noData = realm.objects(MemoData.self)
            addData.no = noData.count+1
        } else {
            addData.no = 1
        }
        addData.title = MemoTitleField.text!
        addData.text = memoTextView.text!
        addData.date = date
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(addData)
        }
    }
    
    func getNoData() -> MemoData? {
        let realm = try! Realm()
        let result = realm.objects(MemoData.self)
        return result.first
    }
    
}

