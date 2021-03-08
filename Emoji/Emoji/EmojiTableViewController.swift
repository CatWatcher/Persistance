//
//  EmojiTableViewController.swift
//  Emoji
//
//  Created by Феликс Фимберг on 02.09.2020.
//  Copyright © 2020 Феликс Фимберг. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    // создаем массив наших смайлов из которого и будем их добавлять в ячейки
    var smiles = [
        EmojiStruct(name: "Cat", description: "The best animal in the world", emoji: "🐱", isLiked: false),
        EmojiStruct(name: "Dog", description: "Just a good friend", emoji: "🐶", isLiked: false),
        EmojiStruct(name: "Tiger", description: "It can eat you", emoji: "🐯", isLiked: false),
        EmojiStruct(name: "Bird", description: "Some food", emoji: "🦆", isLiked: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // делаем в навигатор баре сверху кнопки эдит
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        // устанавливаем заголовок
        self.title = "Emojies"
    }
    
    // метод для редактирования уже сущ ячейки
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // проверяем из какого сегвея пришли
        guard segue.identifier == "editEmojiSegue" else {
            return
        }
        
        // lостаем индекс паc для выбранной ячейи и эмодзи из нее
        let indexPath = tableView.indexPathForSelectedRow!
        let emoji = smiles[indexPath.row]
        
        // достаем нашу страничку редактирования через навигейшн вью
        let navigationVC = segue.destination as! UINavigationController
        let editVC = navigationVC.topViewController as! AddEmojiTableViewController
        
        // наследуем все свойства эмодзи в страницу редактирования
        editVC.emoji = emoji
        editVC.title = "Edit"
        
    }
    
    // метод для возврата на этот экран при нажатии на кансел или сейв
    @IBAction func unwindSegue (segue: UIStoryboardSegue) {
        // проверяем с какой кнопки пришли на этот экран
        guard segue.identifier == "saveSegue" else { return }
        // добираемся до данных на экране редактирования
        // и берем оттуда готовую эмодзи
        let segueSource = segue.source as! AddEmojiTableViewController
        let emoji = segueSource.emoji
        
        // проверяем есть ли уже индекс пас для выделенной ячейки
        // и если да, то ячейку редактируем
        // если нет, то добавляем новый объект
        if let selectedIP = tableView.indexPathForSelectedRow {
            smiles[selectedIP.row] = emoji
            tableView.reloadRows(at: [selectedIP], with: .automatic)
        } else {
            
            // пихаем нашу эмодзи
            // для этого сначала создадим новый индекс пас, чтобы пихать в конец
            let newIP = IndexPath(row: smiles.count, section: 0)
            // в массив смайлов
            smiles.append(emoji)
            // и добавляем новую строку для смайла на наш тейбл вью
            tableView.insertRows(at: [newIP], with: .fade)
            
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // количество секций
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // количество ячеек в секции
        return smiles.count
    }

    // настройка ячейки
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // указываем на нашу ячейку и кастим её до созданного для неё класса
        let cell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for: indexPath) as! EmojiTableViewCell
        
        // достаем обьект из нашего массива по номеру строки в секции (indexPath.row)
        // и пихаем его значения в ячейку
        // настройка ячейки вынесена в тэйбл целл!!
        cell.set(object: smiles[indexPath.row])
        
        
        return cell
    }

    // метод позволяет настроить кнопку слева от нашего блока при открытии эдит
    // .delete - удаление .insert - добавление .none - пусто
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    // обрабатываем нажатие кнопки удаления
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // удаляем из нашей коллекции в коде
            smiles.remove(at: indexPath.row)
            // удаляем из TableView
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // возвращает тру - можно передвигать объекты
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // логика передвижений
    // sourceIndexPath - место с которого передвигаем
    // destinationIndexPath - куда передвигаем
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // функция remove возвращает удаляемое значение
        // сразу сохраняем его
        let temp = smiles.remove(at: sourceIndexPath.row)
        // вставляем наш объект на новое место, другие объекты при этом смещаются
        smiles.insert(temp, at: destinationIndexPath.row)
        
        // обновление данных в tableView
        tableView.reloadData()
    }
    
    
    
    // Создание кнопок по свайпу влево
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // создаем наши действия в этом методе
        let deleteBtn = deleteSwipeBtn(at: indexPath)
        let likeBtn = likeSwipeBtn(at: indexPath)
        // возвращаем массив с нашими действиями
        return UISwipeActionsConfiguration(actions: [deleteBtn, likeBtn])
    }
    
    // описание действий. Метод должен возвращать объект UIContextualAction
    
    // для начала организуем удаление
    func deleteSwipeBtn(at indexPath: IndexPath) -> UIContextualAction {
        
        // создаем объект нашего действия с типом UIContextualAction,
        // именно такиее объекты принимает в массив метод выше
        // и настраиваем его
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            
            // удаляем ячейку
            self.smiles.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            // указываем что действие закончено!
            completion(true)
        }
        action.backgroundColor = .systemRed
        action.image = UIImage(systemName: "delete.right")
        return action
    }
    
    func likeSwipeBtn(at indexPath: IndexPath) -> UIContextualAction {
        
        // достаем наш объект из массива
        var temp = smiles[indexPath.row]
        
        let action = UIContextualAction(style: .normal, title: "Like") { (action, view, competion) in
            temp.isLiked = !temp.isLiked
            // вставляем объект с измененным свойством на место существующего
            self.smiles[indexPath.row] = temp
            competion(true)
        }
        action.backgroundColor = temp.isLiked ? .systemPink : .darkGray
        action.image = temp.isLiked ? UIImage(systemName: "suit.heart.fill") : UIImage(systemName: "suit.heart")
        
        return action
    }
}


