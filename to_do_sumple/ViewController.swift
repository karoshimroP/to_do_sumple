//
//  ViewController.swift
//  to_do_sumple
//
//  Created by itsuki kaji on 2020/06/11.
//  Copyright © 2020 itsuki kaji. All rights reserved.
//

import UIKit

//classの継承を追加
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    //UITableView、numberOfRowsInSectionの追加(表示するcell数を決める)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //戻り値の設定(表示するcell数)
        return TodoKobetsunonakami.count
    }
//    func tableView2(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        //戻り値の設定(表示するcell数)
//        return TodoKobetsunonakami2.count
//    }

    //UITableView、cellForRowAtの追加(表示するcellの中身を決める)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //変数を作る
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        //変数の中身を作る
        TodoCell.textLabel!.text = TodoKobetsunonakami[indexPath.row]
        //戻り値の設定（表示する中身)
        return TodoCell
    }
    
//    func tableView2(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        //変数を作る
//        let TodoCell2 : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell2", for: indexPath)
//        //変数の中身を作る
//        TodoCell2.textLabel!.text = TodoKobetsunonakami2[indexPath.row]
//        //戻り値の設定（表示する中身)
//        return TodoCell2
//    }

 
    //最初からあるコード
    override func viewDidLoad() {
        super.viewDidLoad()
        //追加画面で入力した内容を取得する
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            TodoKobetsunonakami = UserDefaults.standard.object(forKey: "TodoList") as! [String]
        }
//        if UserDefaults.standard.object(forKey: "TodoList2") != nil {
//            TodoKobetsunonakami2 = UserDefaults.standard.object(forKey: "TodoList2") as! [String]
//        }
        print(TodoKobetsunonakami)
        print(TodoKobetsunonakami2)
    }

    @IBAction func unwindPrev(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        self.loadView()
        self.viewDidLoad()
    }
    
    //セルの編集許可
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    //スワイプしたセルを削除　※arrayNameは変数名に変更してください
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            TodoKobetsunonakami.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    //最初からあるコード
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
