//
//  CalendarViewController.swift
//  TestProject
//
//  Created by iMac27 on 30.06.17.
//  Copyright © 2017 appCoda. All rights reserved.
//

import UIKit
import CVCalendar

class CalendarViewController: UIViewController, CVCalendarViewDelegate, CVCalendarMenuViewDelegate {
  
  func firstWeekday() -> Weekday {
    return .sunday

  }

  func presentationMode() -> CalendarMode {
 return .monthView
  }

  
  @IBOutlet weak var menuView: CVCalendarMenuView!
  
  @IBOutlet weak var calendarView: CVCalendarView!
  
 
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    menuView.commitMenuViewUpdate()
    calendarView.commitCalendarViewUpdate()
 
    // Commit frames' updates
    self.menuView.commitMenuViewUpdate()
    self.calendarView.commitCalendarViewUpdate()
  
  }

 
  override func viewDidLoad() {
        super.viewDidLoad()

    // CVCalendarMenuView initialization with frame
//    self.menuView = CVCalendarMenuView(frame: CGRect( x: 0,y: 0,width: 300,height: 15))
//    
//    // CVCalendarView initialization with frame
//    self.calendarView = CVCalendarView(frame: CGRect(x:0,y: 20,width: 300,height: 450))
    
    // Appearance delegate [Unnecessary]
    self.calendarView.calendarAppearanceDelegate = self
   
    // Animator delegate [Unnecessary]
    self.calendarView.animatorDelegate = self
    
    // Menu delegate [Required]
    self.menuView.menuViewDelegate = self
    
    // Calendar delegate [Required]
    self.calendarView.calendarDelegate = self
    
   let currentCalendar = Calendar.init(identifier: .gregorian)
    self.tabBarController?.navigationItem.title = CVDate(date: Date(), calendar: currentCalendar).globalDescription

  }

override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  

      /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
