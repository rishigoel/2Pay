//
//  ViewController.swift
//  2Pay
//
//  Created by Rishi Goel on 2016-01-09.
//  Copyright © 2016 Rishi Goel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CardIOPaymentViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background.png")!)
        CardIOUtilities.preload()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var cardImage: UIButton!
    
    @IBOutlet weak var lbl1: UILabel!
    @IBAction func scanCard(sender: AnyObject) {
        
        let cardIOVC = CardIOPaymentViewController(paymentDelegate: self)
        cardIOVC.modalPresentationStyle = .FormSheet
        cardIOVC.hideCardIOLogo = true
        presentViewController(cardIOVC, animated: true, completion: nil)
    }
    @IBOutlet weak var lbl2: UILabel!
    func userDidCancelPaymentViewController(paymentViewController: CardIOPaymentViewController!) {
        paymentViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func userDidProvideCreditCardInfo(cardInfo: CardIOCreditCardInfo!, inPaymentViewController paymentViewController: CardIOPaymentViewController!) {
        
        if let info = cardInfo {
            lbl1.text = info.redactedCardNumber
            lbl2.text = info.cvv
            
            
        }
        paymentViewController?.dismissViewControllerAnimated(true, completion: nil)
    }


}

