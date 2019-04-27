//
//  ViewController.swift
//  SwiftProject
//
//  Created by Piglet on 09.04.19.
//  Copyright © 2019 Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var viewProgress: UIView!
    @IBOutlet weak var lbl_1: UILabel!
    @IBOutlet weak var lbl_2: UILabel!
    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var indicatorView: DGActivityIndicatorView!
    @IBOutlet weak var constraint_viewBg_left: NSLayoutConstraint!
    @IBOutlet weak var slider: UISlider!
    
    
    var sliderValue : Float = 0
    var finalValue : Float = 0
    var startValue : Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewProgress.layer.cornerRadius = 25
        viewBg.layer.cornerRadius = 30
        indicatorView.type = DGActivityIndicatorAnimationType.ballSpinFadeLoader
        indicatorView.alpha = 0
        finalValue = Float(self.view.bounds.width - constraint_viewBg_left.constant*2 - self.viewBg.bounds.width)
        startValue = Float(constraint_viewBg_left.constant)
        
    }
    
    @IBAction func sliderTouchUpinside(_ sender: Any) {
        if sliderValue != 1 {
            slider.setValue(0, animated: true)
            sliderValue = 0
            self.moveViewBtn()
        }

    }
    @IBAction func sliderValueChanged(_ sender: Any) {
        if sliderValue < slider.value {
            sliderValue = slider.value
            self.moveViewBtn()
        }
        else
        {
            slider.setValue(sliderValue, animated: false)
        }
        
    }
    
    func startActivityIndicator() -> Void {
        indicatorView.alpha = 1
        indicatorView.startAnimating()
    }
    
    func stopActivityIndicator() -> Void {
        indicatorView.alpha = 0
        indicatorView.stopAnimating()
    }
    
    func moveViewBtn() -> Void {
        constraint_viewBg_left.constant = CGFloat(finalValue * sliderValue + startValue)
        
//        if sliderValue > 0.9 {
//            slider.setValue(1.0, animated: true)
//        }
        
        if sliderValue == 0
        {
            UIView.animate(withDuration: 0.3) {
                self.lbl_1.alpha = 1
                self.viewProgress.backgroundColor = UIColor(red: 46.0/255, green: 97.0/255, blue: 159.0/255, alpha: 0.3)
            }
        }
        else
        {
            UIView.animate(withDuration: 0.3) {
                self.lbl_1.alpha = 0
                self.viewProgress.backgroundColor = UIColor(red: 46.0/255, green: 97.0/255, blue: 159.0/255, alpha: 1)
            }
        }
        
        if sliderValue == 1 {
            self.startActivityIndicator()
            UIView.animate(withDuration: 0.3) {
                self.lbl_2.alpha = 1
            }

        }
        else
        {
            self.stopActivityIndicator()
            UIView.animate(withDuration: 0.3) {
                self.lbl_2.alpha = 0
            }

        }
    }
    
}

