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
        
//        let animals = ["イヌ", "ネコ", "ヤギ", "イヌ", "ネコ", "ヤギ", "イヌ", "ネコ", "イヌ", "ハムスター", "ヤギ", "モルモット", "ウサギ", "ウサギ"]
        let animals = TodoKobetsunonakami2
    

        let dict = animals.reduce(into: [:]) { $0[$1, default: 0] += 1 }
        let persons = [String](dict.keys)
        let counts = [Int](dict.values)
        print(dict)
        print(persons)
        print(counts)
        setChart(dataPoints: persons, values: counts)
    }
    func setChart(dataPoints: [String], values: [Int]){
        var dataEntries: [PieChartDataEntry] = []

        for i in 0..<dataPoints.count {
            let dataEntry1 = PieChartDataEntry(value: Double(values[i]), label: dataPoints[i])

            dataEntries.append(dataEntry1)
            print(dataEntries)
            
        }
            print(dataEntries)
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: "Units Sold")
            let pieChartData = PieChartData(dataSet: pieChartDataSet)
            PieChartView.data = pieChartData
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 2
        formatter.multiplier = 1.0
        PieChartView.data?.setValueFormatter(DefaultValueFormatter(formatter: formatter))
        PieChartView.usePercentValuesEnabled = true


        }
    }

