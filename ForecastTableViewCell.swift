//
//  ForecastTableViewCell.swift
//  Stock
//
//  Created by cl on 15/5/30.
//  Copyright (c) 2015年 cl. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell, IForecastTableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    
    func refresh(data:ForecastModel.CellData) {
        titleLabel?.text = data.des
        valueLabel?.text = "\(data.value)"
        if let color = data.state {
            valueLabel?.textColor = color == 0 ? UIColor.redColor() : UIColor.blackColor()
        }
        percentLabel?.text = "100%"
        
    }

}
class ForecastTableViewEditCell: UITableViewCell, IForecastTableViewCell, UITextFieldDelegate {
    

    
    //for cell3
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueTextfield: UITextField! {
        didSet {
            valueTextfield?.text = "\(tempValue)"

            valueTextfield.addTarget(self, action: "valueChanged:", forControlEvents: UIControlEvents.EditingChanged)
        }
    }
    func valueChanged(sender:AnyObject?) {
        if sender as! UITextField == valueTextfield {
            if let str = valueTextfield?.text
            {
                tempValue = (str as NSString).floatValue
            }
        }
        
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        println("dddd")
    }
    var type:Int?
    
    private var tempValue:Float = 0.0 {
        didSet {
            valueTextfield?.text = "\(tempValue)"
        }
    }
    private var value:Float = 0.0 {
        didSet {
            tempValue = value
        }
    }

    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        switch operation{
        case "−":
            tempValue -= 100.0
        case "+":
            tempValue += 100.0
        case "√":
            value = tempValue
        default: break
        }

    }

    func refresh(data:ForecastModel.CellData) {
        titleLabel?.text = data.des
        value = data.value
        
    }
    
}
protocol IForecastTableViewCell {
    
    func refresh(data:ForecastModel.CellData) -> Void
}