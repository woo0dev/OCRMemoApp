//
//  TableViewController.swift
//  MemoApp
//
//  Created by Woo0 on 2021/03/09.
//

import UIKit
import RealmSwift

let realm = try! Realm()
var items : Results<MemoData>?
var item : MemoData?
var titleInt = 0
var titleString = ""

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        MemoTableView.delegate = self
        MemoTableView.dataSource = self
        
        MemoTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        items = realm.objects(MemoData.self)
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.attributedTitle = NSAttributedString(string: "새로고침")
        self.refreshControl?.addTarget(self, action: #selector(pullToRefesh), for: .valueChanged)
        
        loadAllData()
    }
 
    @objc func pullToRefesh( sander: Any) {
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    @IBOutlet var TableViewCell: UITableViewCell!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //let realm = try! Realm()
        let result = realm.objects(MemoData.self)
        return result.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 70
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
//        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//
//        //self.present(MemoDetailViewController(), animated: true, completion: nil)
//        //self.performSegue(withIdentifier: "DetailSegue", sender: self)
//
//        //return cell
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue"{
            if let MemoDetailViewController = segue.destination as? MemoDetailViewController{ MemoDetailViewController.titleString = titleString } else { return }
        }
        
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cell")
        
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator

        //self.present(MemoDetailViewController(), animated: true, completion: nil)
        
        
        let row = indexPath.row
        let realm = try! Realm()
        let result = realm.objects(MemoData.self)
        
        cell.textLabel?.text = String(result[row].title)
        cell.detailTextLabel?.text = String(result[row].date)
        
        return cell
    }
    
    func loadAllData() {
        //let realm = try! Realm()
        let savedData = realm.objects(MemoData.self)
        print(savedData)
        print(Realm.Configuration.defaultConfiguration.fileURL!)
//        try! realm.write {
//            realm.deleteAll()
//        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt
        indexPath: IndexPath) {
        
        let deleteData = realm.objects(MemoData.self)
        
//        realm.delete(items[indexPath.row])
        if( editingStyle == UITableViewCell.EditingStyle.delete){
            if let item = items?[indexPath.row] {
                do {
                    try realm.write {
                        realm.delete(item)
                    }
                } catch {
                    print("Error deleting item, \(error)")
                }
                MemoTableView.reloadData()
            }
        }
        
    }
    
    @IBOutlet var MemoTableView: UITableView!
    

    @IBAction func SelectBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "DetailSegue", sender: titleString)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        let result = realm.objects(MemoData.self).filter("title == '" + cell!.textLabel!.text! + "'")
        
        titleString = result.first!.title
    }
    
    func getDatabase() -> MemoData? {
        let realm = try! Realm()
        let result = realm.objects(MemoData.self).filter("no == \(titleInt)")
        return result.first
    }
    
}

