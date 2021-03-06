//
//  ViewController.swift
//  Flo
//
//  Created by Nando on 09/11/16.
//  Copyright © 2016 Nando. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelCounter: UILabel!
    @IBOutlet weak var counterView: CounterView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressButton(_ sender: PushButtonView) {
        if sender.isAddButton {
            counterView++
        }else{
            counterView--
        }
        
        labelCounter.text = counterView.counter.description
    }

}

