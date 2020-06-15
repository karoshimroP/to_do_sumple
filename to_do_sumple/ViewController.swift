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
        print(TodoKobetsunonakami)
        //追加画面で入力した内容を取得する
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            TodoKobetsunonakami = UserDefaults.standard.object(forKey: "TodoList") as! [String]
        }
    }
    @IBAction func unwindPrev(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        self.loadView()
        self.viewDidLoad()
    }
    //最初からあるコード
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
