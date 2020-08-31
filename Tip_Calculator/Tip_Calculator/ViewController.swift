//
//  ViewController.swift
//  Tip_Calculator
//
//  Created by Laura Baker on 8/27/20.
//  Copyright © 2020 Kevin Baker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Creating gradient Layer
        let gradientLayer = CAGradientLayer()
        // Set the size of the layer equal to the display
        gradientLayer.frame = view.bounds
        // Set an array of Core Graphics colors (.cgColor) to create the gradient
        // Below uses a Color Literal and a UIColor from RGB values
        // Green square is color literal with values
        gradientLayer.colors = [#colorLiteral(red:0, green: 0.572540196, blue:0.2705882353, alpha:1).cgColor, UIColor(red: 252/255, green: 238/255, blue: 33/255, alpha:1).cgColor]
        // Rasterize this static layer to improve app performance
        gradientLayer.shouldRasterize = true
        // Apply the gradient to the backgroundGradient View
        backgroundView.layer.addSublayer(gradientLayer)
        
        self.view.sendSubviewToBack(backgroundView)
    }


    @IBAction func onTap(_ sender: Any) {
        print("Hello")
        
        view.endEditing(true)
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        
        // Get the bill amount
        let bill = Double(billField.text!) ?? 0
        
        // Calculate the tip and total
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update the tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

