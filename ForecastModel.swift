//
//  ForecastModel.swift
//  Stock
//
//  Created by cl on 15/5/30.
//  Copyright (c) 2015年 cl. All rights reserved.
//

import Foundation
class ForecastModel {

    struct SectionData {
        var cells:[CellData]
        var headerTitle:String?
    }
    struct CellData {
        var des:String
        var value:Float
        var percent:String?
        var state:Int?
    }
    var sectionDatas:[SectionData] = [SectionData(cells: [CellData(des: Language.ShanghaiCompositeIndex, value:1000.11, percent:nil, state:0)], headerTitle: nil),
        SectionData(cells: [CellData(des: Language.AverageForecastIndex, value:2000.22, percent:nil, state:0), CellData(des: Language.MyForecastIndex, value:2000.23, percent:nil, state:0)], headerTitle: Language.ForecastIndex),
        SectionData(cells: [CellData(des: Language.DayForecast, value:3000.33, percent:nil, state:0), CellData(des: Language.WeekForecast, value:3000.34, percent:nil, state:0), CellData(des: Language.MonthForecast, value:3000.35, percent:nil, state:0)], headerTitle: Language.ShanghaiCompositeIndexForecast)
    ]
}
