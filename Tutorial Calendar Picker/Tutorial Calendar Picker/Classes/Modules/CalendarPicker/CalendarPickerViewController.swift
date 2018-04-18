//
//  CalendarPickerViewController.swift
//  Tutorial Calendar Picker
//
//  Created by Ari Munandar on 18/04/18.
//  Copyright © 2018 Artdev Indonesia. All rights reserved.
//

import UIKit
import JTAppleCalendar

protocol CalendarPickerDelegate {
	func getDateString(date: String)
}

class CalendarPickerViewController: UIViewController {

	@IBOutlet weak var bottomContentView: NSLayoutConstraint!
	@IBOutlet weak var currentDate: UILabel!
	@IBOutlet weak var collectionView: JTAppleCalendarView!
	@IBOutlet weak var selectedButton: UIButton!
	
	let todaysDate = Date()
	let dateFormatter = DateFormatter()
	var selectedDate: String = ""
	
	var delegate: CalendarPickerDelegate?
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.bottomContentView.constant = -UIScreen.main.bounds.width
		self.view.layoutIfNeeded()
		DispatchQueue.main.async {
			UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
				self.bottomContentView.constant = 0
				self.view.layoutIfNeeded()
			}, completion: nil)
		}
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()

		self.collectionView.calendarDelegate = self
		self.collectionView.calendarDataSource = self
        self.collectionView.register(UINib(nibName: "CalendarPickerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "dateCell")
		
		DispatchQueue.main.async {
			self.collectionView.visibleDates({ (visibleDates) in
				self.setupViewsOfCalendar(from: visibleDates)
			})
		}
		
		self.collectionView.selectDates([self.todaysDate])
		self.collectionView.scrollToDate(self.todaysDate, animateScroll: false)
    }
	
	func handleCellSelected(cell: JTAppleCell?, cellState: CellState) {
		guard let validCell = cell as? CalendarPickerCollectionViewCell else {
			return
		}
		
		if validCell.isSelected {
			validCell.backgroundColor = #colorLiteral(red: 0.1787312123, green: 0.6596592942, blue: 1, alpha: 1)
			validCell.dateLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
		} else {
			validCell.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
			validCell.dateLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
		}
	}
	
	func setupViewsOfCalendar(from visibleDates: DateSegmentInfo) {
		DispatchQueue.main.async {
			guard let date = visibleDates.monthDates.first?.date else { return }
			self.dateFormatter.dateFormat = "MMM, yyyy"
			self.currentDate.text = self.dateFormatter.string(from: date)
		}
	}
	
	@IBAction func handleSelectedDate(_ sender: UIButton) {
		DispatchQueue.main.async {
			UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
				self.bottomContentView.constant = -UIScreen.main.bounds.width
				self.view.layoutIfNeeded()
				self.dismiss(animated: true) {
					self.delegate?.getDateString(date: self.selectedDate)
				}
			}, completion: nil)
		}
	}
	
}

extension CalendarPickerViewController: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
	
	func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
		self.handleCellSelected(cell: cell, cellState: cellState)
	}
	
	func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
		let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "dateCell", for: indexPath) as! CalendarPickerCollectionViewCell
		cell.layer.cornerRadius = 5
		cell.dateLabel.text = cellState.text
		self.handleCellSelected(cell: cell, cellState: cellState)
		return cell
	}
	
	func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
		self.dateFormatter.dateFormat = "dd MM yyyy"
		self.dateFormatter.locale = Calendar.current.locale
		self.dateFormatter.timeZone = Calendar.current.timeZone
		
		let startDate = self.dateFormatter.date(from: "01 12 2010")!
		let endDate = self.dateFormatter.date(from: "31 12 2100")!
		let parameter = ConfigurationParameters(startDate: startDate, endDate: endDate)
		return parameter
	}
	
	func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
		self.dateFormatter.dateFormat = "dd MMM yyyy"
		self.dateFormatter.locale = Calendar.current.locale
		self.dateFormatter.timeZone = Calendar.current.timeZone
		self.selectedDate = self.dateFormatter.string(from: date)
		self.handleCellSelected(cell: cell, cellState: cellState)
	}
	
	func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
		self.handleCellSelected(cell: cell, cellState: cellState)
	}
	
	func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
		self.setupViewsOfCalendar(from: visibleDates)
	}
	
	
}
