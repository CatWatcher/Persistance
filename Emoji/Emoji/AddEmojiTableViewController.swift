//
//  AddEmojiTableViewController.swift
//  Emoji
//
//  Created by Феликс Фимберг on 04.09.2020.
//  Copyright © 2020 Феликс Фимберг. All rights reserved.
//

import UIKit

class AddEmojiTableViewController: UITableViewController {
    
    // создаем эмодзи по дефолту
    var emoji = EmojiStruct(name: "", description: "", emoji: "", isLiked: false)
    
    @IBOutlet weak var emojiTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var descriptionTF: UITextField!
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    
    @IBAction func saveBtnPushed(_ sender: UIBarButtonItem) {
    }
    
    
    override func viewDidLoad() {
          super.viewDidLoad()
        
        updateUI()
        
        // вызываем обновление кнопки при загрузке экрана
        updateSaveButton()
      }
    
    
    // обновление экрана эдит
    private func updateUI() {
        
        emojiTF.text = emoji.emoji
        nameTF.text = emoji.name
        descriptionTF.text = emoji.description
        
    }
    
    
    // создаем функция для отключения кнопки если не заполнены все текстфилды
    private func updateSaveButton () {
        // проверяем текстфилды на наличие значений и если их нет то оставляем пустыми
        let emoji = emojiTF.text ?? ""
        let name = nameTF.text ?? ""
        let description = descriptionTF.text ?? ""
        
        // В зависимости от результата сверху делаем кнопку доступной или нет
        saveBtn.isEnabled = !emoji.isEmpty && !name.isEmpty && !description.isEmpty
    }
    
    // делаем отслеживание всех текст филдов сразу
    // для этого перетягиваем связь от этого метода на все текст филды по очереди
    @IBAction func changedAllTF(_ sender: UITextField) {
        // и так же обновляем кнопку при изменении текст филдов
        updateSaveButton()
    }
    
    
    // метод для передачи данных перед использованием сегвея
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // переопределяем родительский метод
        super.prepare(for: segue, sender: sender)
        // проверяем какой сегвей используем
        // если сейв, то выполянем код дальше, если нет, то просто возвращаемся
        guard segue.identifier == "saveSegue" else {
            return
        }
        
        let emoji = emojiTF.text ?? ""
        let name = nameTF.text ?? ""
        let description = descriptionTF.text ?? ""
        
        // настраиваем новую эмодзи
        self.emoji = EmojiStruct(name: name, description: description, emoji: emoji, isLiked: self.emoji.isLiked)
    }
}
