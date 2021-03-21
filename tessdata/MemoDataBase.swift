//
//  MemoDataBase.swift
//  MemoApp
//
//  Created by Woo0 on 2021/03/09.
//

import Foundation
import RealmSwift

class MemoData: Object {
    @objc dynamic var no: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var text: String = ""
    @objc dynamic var date: String = ""
    
    
}
