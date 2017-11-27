//
//  CalendarDelegates.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 15/09/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import UIKit
import JTAppleCalendar

extension CalendarController{

    func addSubLayer(layerView: UIView, shapeLayer: CAShapeLayer, toValue: CGFloat, fromValue: CGFloat, color: UIColor){

        //layerView.layer.removeFromSuperlayer()
        shapeLayer.removeFromSuperlayer()
        let bezeirPath = UIBezierPath()
        bezeirPath.move(to: CGPoint(x: 0, y: 0))
        bezeirPath.addLine(to: CGPoint(x: (UIScreen.main.bounds.width - 96)/2, y: 0))
        bezeirPath.addLine(to: CGPoint(x: (UIScreen.main.bounds.width - 96)/2, y: view.frame.height * 0.15))
        bezeirPath.addLine(to: CGPoint(x: 0, y: view.frame.height * 0.15))
        bezeirPath.close()

        shapeLayer.path = bezeirPath.cgPath
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.fillColor = nil
        shapeLayer.lineWidth = 3.0
        shapeLayer.lineCap = kCALineCapRound


        // Adding Animation
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = 1.0
        pathAnimation.fromValue = fromValue
        pathAnimation.toValue = toValue
        shapeLayer.add(pathAnimation, forKey: "strokeEnd")

        layerView.layer.addSublayer(shapeLayer)


    }





    // MARK: JTCalendar Delegate



    func handleDate(cell: JTAppleCell, cellState: CellState){


        // Calendar View idea
        let myCustomCell = cell as! CalendarCell

        handleCellTextColor(view: cell, cellState: cellState)

        let calendar = Calendar(identifier: .gregorian)

        if cellState.date == calendar.date(bySettingHour: 0, minute: 0, second: 0, of: currentCheckInDate)!{

            myCustomCell.leftView.isHidden = false

            myCustomCell.rightView.isHidden = true

            myCustomCell.selectedView.isHidden = true

        }else if cellState.date == calendar.date(bySettingHour: 0, minute: 0, second: 0, of: currentCheckOutDate)!{

            myCustomCell.leftView.isHidden = true

            myCustomCell.rightView.isHidden = false

            myCustomCell.selectedView.isHidden = true

        }else{

            switch cellState.selectedPosition() {

            case .full, .right, .left, .middle:

                myCustomCell.leftView.isHidden = true

                myCustomCell.rightView.isHidden = true

                myCustomCell.selectedView.isHidden = false


            default:

                myCustomCell.leftView.isHidden = true

                myCustomCell.rightView.isHidden = true

                myCustomCell.selectedView.isHidden = true

            }
        }




    }


    private func handleCellTextColor(view: JTAppleCell?, cellState: CellState) {

        guard let myCustomCell = view as? CalendarCell  else {
            return
        }

        if cellState.isSelected {

            myCustomCell.dateLabel.textColor = UIColor.white

        } else {

            if cellState.dateBelongsTo == .thisMonth {

                myCustomCell.dateLabel.textColor = UIColor.black

            } else {

                myCustomCell.dateLabel.textColor = UIColor.gray
            }
        }


        let calendar = Calendar(identifier: .gregorian)

        let date = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: Date())

        if cellState.date < date!{

            myCustomCell.dateLabel.textColor = UIColor.gray
        }

        var components = DateComponents()

        components.year = 1

        let endDate = calendar.date(byAdding: components, to: Date())!

        if cellState.date > calendar.date(bySettingHour: 0, minute: 0, second: 0, of: endDate)!{

            myCustomCell.dateLabel.textColor = UIColor.gray
        }
    }









    private func changeDate(date dateToChange:Date, by days:Int) -> Date {

        var date : Date

        let calendar = Calendar(identifier: .gregorian)

        var components = DateComponents()

        components.day = days

        date = calendar.date(byAdding: components, to: dateToChange)!

        return date
    }


     func showCheckIn(){

        self.calendarType = .checkInDate
    }

     func showCheckOut(){



        self.calendarType = .checkOutDate
    }

    // MARK: UI Elements



    @objc func handleCheckIn(){
        addSubLayer(layerView: checkInView, shapeLayer: checkInLayer, toValue: 1.0, fromValue: 0.0, color: UIColor.brown)
        addSubLayer(layerView: checkOutView, shapeLayer: checkOutLayer, toValue: 0.0, fromValue: 1.0, color: UIColor.brown)


        if calendarType == .checkOutDate{

            showCheckIn()
        }
    }

    @objc func handleCheckOut(){
        addSubLayer(layerView: checkOutView, shapeLayer: checkOutLayer, toValue: 1.0, fromValue: 0.0, color: UIColor.brown)
        addSubLayer(layerView: checkInView, shapeLayer: checkInLayer, toValue: 0.0, fromValue: 1.0, color: UIColor.brown)

        if calendarType == .checkInDate{

            showCheckOut()
        }


    }


    @objc func handleConfirmButton(){
        self.dismiss(animated: true)
    }


}
extension CalendarController: JTAppleCalendarViewDataSource {

    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell


        handleDate(cell: cell, cellState: cellState)
        if !cell.isSelected{
            cell.selectedView.isHidden = true
            cell.leftView.isHidden = true
            cell.rightView.isHidden = true
        }
        cell.dateLabel.text = cellState.text

        return cell

    }

    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {

        let startDate = Date()
        var components = DateComponents()
        components.setValue(1, for: .year)
        let calendar = Calendar(identifier: .gregorian)
        let endDate = calendar.date(byAdding: components, to: startDate)
        return ConfigurationParameters(startDate: startDate, endDate: endDate!, numberOfRows: 6, calendar: Calendar.current, generateInDates: .forAllMonths, generateOutDates: .tillEndOfGrid, firstDayOfWeek: .sunday)
    }




    // Header of Calendar View

    func calendarSizeForMonths(_ calendar: JTAppleCalendarView?) -> MonthSize? {
        return MonthSize(defaultSize: (calendar?.frame.height)! * 0.17)
    }

    func calendar(_ calendar: JTAppleCalendarView, headerViewForDateRange range: (start: Date, end: Date), at indexPath: IndexPath) -> JTAppleCollectionReusableView {
        let header = calendar.dequeueReusableJTAppleSupplementaryView(withReuseIdentifier: "CalendarHeader", for: indexPath) as! CalendarHeader

        let tempCalendar = Calendar(identifier: .gregorian)
        let day = tempCalendar.component(.month, from: range.end)
        let year = tempCalendar.component(.year, from: range.end)

        let dateFormatter = DateFormatter()
        let months = dateFormatter.monthSymbols
        if let monthName = months{
            header.monthLabel.text = monthName[day - 1]
            header.yearLabel.text = String(year)
        }

        return header
    }


}

extension CalendarController: JTAppleCalendarViewDelegate{

    func calendar(_ calendar: JTAppleCalendarView, shouldSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) -> Bool {


        let calendar = Calendar(identifier: .gregorian)
        let dateTemp = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: Date())

        if calendarType == .checkInDate{

            if date < dateTemp!{

                return false
            }

        }else {

            if date <= dateTemp!{

                // showAlert(forDate: "check out")

                return false
            }
        }

        var components = DateComponents()

        components.year = 1

        let endDate = calendar.date(byAdding: components, to: Date())!


        if calendarType == .checkInDate{

            if date >= calendar.date(bySettingHour: 0, minute: 0, second: 0, of: endDate)!{

                //  showAlert(forDate: "check in")

                return false
            }

        }else{

            if date > calendar.date(bySettingHour: 0, minute: 0, second: 0, of: endDate)!{

                return false
            }

        }

        return true
    }



    func calendar(_ calendar:JTAppleCalendarView, didSelectDate date:Date, cell:JTAppleCell?, cellState:CellState) {

        print("calendar type", calendarType)
        calendar.deselectAllDates(triggerSelectionDelegate: false)

        if calendarType == .checkInDate{

            currentCheckInDate = date

            if currentCheckOutDate < currentCheckInDate{

                currentCheckOutDate = changeDate(date: currentCheckInDate, by: 1)
            }

            showCheckOut()

        }else{

            currentCheckOutDate = date

            if currentCheckInDate >= currentCheckOutDate{

                currentCheckInDate = changeDate(date: currentCheckOutDate, by: -1)
            }

            // updateCheckOutLabelText()
        }

        calendar.selectDates(from: currentCheckInDate, to: currentCheckOutDate, triggerSelectionDelegate: false, keepSelectionIfMultiSelectionAllowed: true)

    }


    func calendar(_ calendar: JTAppleCalendarView, shouldDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) -> Bool {
        let calendar1 = Calendar(identifier: .gregorian)



        var components = DateComponents()

        components.year = 1

        let endDate = calendar1.date(byAdding: components, to: Date())!

        if date >= calendar1.date(bySettingHour: 0, minute: 0, second: 0, of: endDate)! && calendarType == .checkInDate{

            // showAlert(forDate: "check in")

            return false

        }

        let dateTemp = calendar1.date(bySettingHour: 0, minute: 0, second: 0, of: Date())

        if date <= dateTemp! && calendarType == .checkOutDate{

            // showAlert(forDate: "check out")

            return false
        }


        calendar.deselectAllDates(triggerSelectionDelegate: false)

        if calendarType == .checkInDate{

            if date > currentCheckInDate && date != currentCheckOutDate{

                currentCheckInDate = date

                showCheckOut()

            }else if date == currentCheckOutDate{

                //  showAlert(forDate: "check in")
            }

        }else{

            if date < currentCheckOutDate && date != currentCheckInDate{

                currentCheckOutDate = date

                //  updateCheckOutLabelText()

            }else if date == currentCheckInDate{

                //  showAlert(forDate: "check out")
            }
        }

        calendar.selectDates(from: currentCheckInDate, to: currentCheckOutDate, triggerSelectionDelegate: false, keepSelectionIfMultiSelectionAllowed: true)

        return false
    }

}
