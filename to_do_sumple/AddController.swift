//
//  AddController.swift
//  to_do_sumple
//
//  Created by itsuki kaji on 2020/06/11.
//  Copyright © 2020 itsuki kaji. All rights reserved.
//

import UIKit

//変数の設置
var TodoKobetsunonakami = [String]()
var TodoKobetsunonakami2 = [String]()

class AddController: UIViewController {
let datePicker = UIDatePicker()
    //テキストフィールドの設定
    @IBOutlet weak var TodoTextField: UITextField!
    @IBOutlet weak var TodoTextField2: UITextField!
    
    //追加ボタンの設定
    @IBAction func TodoAddButten(_ sender: Any) {
        //変数に入力内容を入れる
        TodoKobetsunonakami.append(TodoTextField.text!)
        TodoKobetsunonakami2.append(TodoTextField2.text!)
        //追加ボタンを押したらフィールドを空にする
        TodoTextField.text = ""
        TodoTextField2.text = ""
        //変数の中身をUDに追加
        UserDefaults.standard.set( TodoKobetsunonakami, forKey: "TodoList" )
        UserDefaults.standard.set( TodoKobetsunonakami2, forKey: "TodoList2" )
    }
    //最初からあるコード
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
    }
    func createDatePicker(){

           // DatePickerModeをDate(日付)に設定
           datePicker.datePickerMode = .date

           // DatePickerを日本語化
           datePicker.locale = NSLocale(localeIdentifier: "ja_JP") as Locale

           // textFieldのinputViewにdatepickerを設定
           TodoTextField.inputView = datePicker

           // UIToolbarを設定
           let toolbar = UIToolbar()
           toolbar.sizeToFit()

           // Doneボタンを設定(押下時doneClickedが起動)
           let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneClicked))

           // Doneボタンを追加
           toolbar.setItems([doneButton], animated: true)

           // FieldにToolbarを追加
           TodoTextField.inputAccessoryView = toolbar
    }
    @objc func doneClicked(){
        let dateFormatter = DateFormatter()

        // 持ってくるデータのフォーマットを設定
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale    = NSLocale(localeIdentifier: "ja_JP") as Locale?
        dateFormatter.dateStyle = DateFormatter.Style.medium

        // textFieldに選択した日付を代入
        TodoTextField.text = dateFormatter.string(from: datePicker.date)

        // キーボードを閉じる
        self.view.endEditing(true)
    }
    //最初からあるコード
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
