//
//  AnalyticsViewController.swift
//  KobzaHelper
//
//  Created by Anatolii Chernetskyi on 20.12.2023.
//

import UIKit
import Charts

class AnalyticsViewController: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var chartContainerView: UIView!
    var barChartView: BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarChart()
        setData()
    }
    
    func updateInfoLabel() {
        let totalWords = GameStatistics.numberOfGames
        let wonWords = GameStatistics.numberOfSuccessTries
        let winPercentage = totalWords > 0 ? (wonWords * 100 / totalWords) : 0
        
        let infoText = """
            Відгадано слів: \(wonWords)
            Всього слів: \(totalWords)
            Процент перемог: \(winPercentage)%
            """
        
        infoLabel.text = infoText
    }
    
    func setupBarChart() {
        barChartView = BarChartView(frame: chartContainerView.bounds)
        chartContainerView.addSubview(barChartView)
        
        barChartView.noDataText = "No data available"

        barChartView.xAxis.drawLabelsEnabled = false
        
        barChartView.xAxis.drawGridLinesEnabled = false
        barChartView.leftAxis.drawGridLinesEnabled = false
        
        barChartView.rightAxis.enabled = false
        
        barChartView.xAxis.drawAxisLineEnabled = true
        barChartView.leftAxis.drawAxisLineEnabled = false
    }
    
    func setData() {
        let entries = (1...6).map { count -> BarChartDataEntry in
            let numberOfWinsForCount = GameStatistics.countForNumberOfTriesToWin(forCount: count)
            return BarChartDataEntry(x: Double(count), y: Double(numberOfWinsForCount))
        }
        
        let dataSet = BarChartDataSet(entries: entries, label: "Number of Tries to Win")
        
        dataSet.colors = [UIColor.systemYellow]
        dataSet.valueTextColor = UIColor.white
        
        let data = BarChartData(dataSets: [dataSet])
        
        let formatter = DefaultValueFormatter(formatter: NumberFormatter())
        formatter.formatter!.minimumFractionDigits = 0
        formatter.formatter!.maximumFractionDigits = 0
        data.setValueFormatter(formatter)
        
        barChartView.data = data
        
        barChartView.notifyDataSetChanged()
        
        updateInfoLabel()
    }
}
