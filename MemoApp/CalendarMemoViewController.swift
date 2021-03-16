//
//  CalendarMemoViewController.swift
//  MemoApp
//
//  Created by Woo0 on 2021/03/16.
//

import UIKit
import RealmSwift
import FSCalendar

class CalendarMemoViewController: UIViewController {
    
    @IBOutlet weak var CalendarMemoTextField: UITextField!
    @IBOutlet weak var CalendarMemoTextView: UITextView!
    var date: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func AddBtn(_ sender: Any) {
        var getData = getNoData()
        let addData = MemoData()
        if getData != nil {
            let noData = realm.objects(MemoData.self)
            addData.no = noData.count+1
        } else {
            addData.no = 1
        }
        addData.title = CalendarMemoTextField.text!
        addData.text = CalendarMemoTextField.text!
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
