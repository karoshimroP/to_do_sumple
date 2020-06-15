//
//  ViewController.swift
//  to_do_sumple
//
//  Created by itsuki kaji on 2020/06/11.
//  Copyright © 2020 itsuki kaji. All rights reserved.
//

import UIKit
//github 接続後kajiブランチ切ってみた
//classの継承を追加
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var ToDoArray:[String] = []
    //UITableView、numberOfRowsInSectionの追加(表示するcell数を決める)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //戻り値の設定(表示するcell数)
        return TodoKobetsunonakami.count
    }

    //UITableView、cellForRowAtの追加(表示するcellの中身を決める)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //変数を作る
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        //変数の中身を作る
        TodoCell.textLabel!.text = TodoKobetsunonakami[indexPath.row]
        //戻り値の設定（表示する中身)
        return TodoCell
    }

 
    //最初からあるコード
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        navigationItem.title = "title"
        navigationItem.rightBarButtonItem = editButtonItem
        //追加画面で入力した内容を取得する
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            TodoKobetsunonakami = UserDefaults.standard.object(forKey: "TodoList") as! [String]
        }
    }
    @IBAction func unwindPrev(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        self.navigationController?.isNavigationBarHidden = false
        navigationItem.title = "title"
        navigationItem.rightBarButtonItem = editButtonItem
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
