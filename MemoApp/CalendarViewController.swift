//
//  CalendarViewController.swift
//  MemoApp
//
//  Created by Woo0 on 2021/03/16.
//

import UIKit
import RealmSwift
import FSCalendar

class CalendarViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate {
    @IBOutlet var calendarView: FSCalendar!
    
    var dates = [""]
    var dateSegue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        calendarView.headerHeight = 50
        calendarView.appearance.headerMinimumDissolvedAlpha = 0.0
        calendarView.appearance.headerDateFormat = "YYYY년 M월"
        calendarView.appearance.headerTitleColor = .black
        
        calendarView.backgroundColor = UIColor.white
        calendarView.appearance.titleWeekendColor = .red
        calendarView.scrollEnabled = true
        calendarView.scrollDirection = .horizontal
        
        calendarView.calendarWeekdayView.weekdayLabels[0].text = "일"
        calendarView.calendarWeekdayView.weekdayLabels[1].text = "월"
        calendarView.calendarWeekdayView.weekdayLabels[2].text = "화"
        calendarView.calendarWeekdayView.weekdayLabels[3].text = "수"
        calendarView.calendarWeekdayView.weekdayLabels[4].text = "목"
        calendarView.calendarWeekdayView.weekdayLabels[5].text = "금"
        calendarView.calendarWeekdayView.weekdayLabels[6].text = "토"
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy-MM-dd"
        
        calendarView.allowsSelection = true
        calendarView.delegate = self
        calendarView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CalendarMemoSegue"{
            if let CalendarMemoViewController = segue.destination as? CalendarMemoViewController{ CalendarMemoViewController.date = dateSegue
            } else { return }
        }
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        
        let AddItem = UIBarButtonItem()
        AddItem.title = "Add"
        navigationItem.rightBarButtonItem = AddItem
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        dateSegue = dateFormatter.string(from: date)
        self.performSegue(withIdentifier: "CalendarMemoSegue", sender: dateSegue)
        //return dateSegue
    }
    
}
