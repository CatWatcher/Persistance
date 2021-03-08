//
//  ViewController.swift
//  WeekdayFinder
//
//  Created by Феликс Фимберг on 24.08.2020.
//  Copyright © 2020 Феликс Фимберг. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    
    @IBOutlet weak var resultLable: UILabel!
    
    @IBAction func findDay(_ sender: UIButton) {
        
        // Проверяем текстовые поля на наличие значений
        guard let day = dateTF.text, let month = monthTF.text, let year = yearTF.text else {
            return
        }
        
        // выбираем тип календаря
        let calendar = Calendar.current
        
        // Тут описываем из каких частей будет состоять наша дата
        // Это день, месяц и год
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        // задаем формат даты
        let dateFormatter = DateFormatter()
        // Говорим что нужен день недели (можно поискать в документации)
        dateFormatter.dateFormat = "EEEE"
        
        // Собираем дату из кусочков
        // и заодно проверяем смогли ли мы её получить (гуард)
        guard let date = calendar.date(from: dateComponents) else { return }
        
        // Пихаем дату в дэйт форматтер
        // и он возвращает нам день недели
        // (т.к мы указали формат ЕЕЕЕ)
        let result = dateFormatter.string(from: date)
        
        // меняем текст лейбла
        resultLable.text = result
        
        
    }
    
    // позволяет скрыть клавиатуру при нажатии на экран
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}

