//
//  ViewController.swift
//  simpleApp
//
//  Created by Alec Deumers on 15/07/2021.
//

import UIKit

class CatFactController: UIViewController {
    
    @IBOutlet weak var factLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        factLabel.text = ""
        newFact()
    }

    @IBAction func factButtonTapped(_ sender: UIButton) {
        newFact()
    }
    
    func newFact() {
        factLabel.text = "surveying cats...."
        CatFactBrain.getFact { fact in
            if fact != nil {
                DispatchQueue.main.async {
                    self.factLabel.text = fact!
                }
            }
        }
    }
    
}

