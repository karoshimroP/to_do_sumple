//
//  ChartController.swift
//  to_do_sumple
//
//  Created by itsuki on 2020/06/28.
//  Copyright © 2020 itsuki kaji. All rights reserved.
//

import UIKit
import Charts

class ChartController: UIViewController{

    @IBOutlet weak var PieChartView: PieChartView!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           // 円グラフの中心に表示するタイトル
           self.PieChartView.centerText = "テストデータ"
           
           // グラフに表示するデータのタイトルと値
           let dataEntries = [
               PieChartDataEntry(value: 40, label: "A"),
               PieChartDataEntry(value: 35, label: "B"),
               PieChartDataEntry(value: 25, label: "C")
           ]
           
        let dataSet = PieChartDataSet(entries: dataEntries, label: "テストデータ")

           // グラフの色
           dataSet.colors = ChartColorTemplates.vordiplom()
           // グラフのデータの値の色
           dataSet.valueTextColor = UIColor.black
           // グラフのデータのタイトルの色
           dataSet.entryLabelColor = UIColor.black

           self.PieChartView.data = PieChartData(dataSet: dataSet)
           
           // データを％表示にする
           let formatter = NumberFormatter()
           formatter.numberStyle = .percent
           formatter.maximumFractionDigits = 2
           formatter.multiplier = 1.0
           self.PieChartView.data?.setValueFormatter(DefaultValueFormatter(formatter: formatter))
           self.PieChartView.usePercentValuesEnabled = true
           
//           view.addSubview(self.PieChartView)
    }
}
