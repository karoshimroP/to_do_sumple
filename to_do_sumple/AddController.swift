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
    }

    //最初からあるコード
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
