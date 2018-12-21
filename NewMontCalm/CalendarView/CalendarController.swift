//
//  ViewController.swift
//  Calendar
//
//  Created by Jeevan chandra on 16/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarController: UIViewController, OpenCalendar {
   
    
    func openCalendar(value: Int) {
        if value == 1 {
            calendarType = CalendarType.checkInDate
        }else{
            calendarType = CalendarType.checkOutDate
        }
    }
    
    
        let dateView = CheckInCheckOutView()
    
    var delegate: getCheckInOutDate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
    }

    func setup(){
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        addViews()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showCheckIn()

        let calendar1 = Calendar(identifier: .gregorian)
        let checkOutDate = calendar1.date(byAdding:  .day, value: 1, to: Date())

        currentCheckInDate = calendar1.date(bySettingHour: 0, minute: 0, second: 0, of: Date())
        currentCheckOutDate = calendar1.date(bySettingHour: 0, minute: 0, second: 0, of: checkOutDate!)

        calendar.selectDates(from: currentCheckInDate, to: currentCheckOutDate, triggerSelectionDelegate: false, keepSelectionIfMultiSelectionAllowed: false)

    }



    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // addSubLayer(layerView: checkInView, shapeLayer: checkInLayer, toValue: 1.0, fromValue: 0.0, color: UIColor.brown)

    }

    
    var calendarType : CalendarType!
    var currentCheckInDate : Date!
    var currentCheckOutDate : Date!

    enum CalendarType {
        case checkInDate
        case checkOutDate
    }
    


    
    let confirmButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Confirm", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.addTarget(self, action: #selector(handleConfirmButton), for: .touchUpInside)
        btn.backgroundColor = #colorLiteral(red: 0.5176470588, green: 0.4156862745, blue: 0.2392156863, alpha: 1)
        return btn
    }()


    lazy var calendar: JTAppleCalendarView = {
        let view = JTAppleCalendarView()
        view.minimumLineSpacing = 0
        view.minimumInteritemSpacing = 0
        view.allowsMultipleSelection = true
        view.isRangeSelectionUsed = true
        view.scrollDirection = .horizontal
        view.showsVerticalScrollIndicator = false
        view.isPagingEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.calendarDataSource = self
        view.backgroundColor = .white
        view.calendarDelegate = self
        view.register(CalendarCell.self, forCellWithReuseIdentifier: "CalendarCell")
        view.register(CalendarHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "CalendarHeader")

        return view
    }()

  

    func alertController(controller: UIViewController){
        let alert = UIAlertController(title: "Alert", message: "Don't click it ", preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        alert.addAction(action)
        controller.present(alert, animated: true, completion: nil)
    }


}


