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
        CardIOUtilities.preload()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func scanCard(sender: AnyObject) {
        
        let cardIOVC = CardIOPaymentViewController(paymentDelegate: self)
        cardIOVC.modalPresentationStyle = .FormSheet
        cardIOVC.hideCardIOLogo = true
        presentViewController(cardIOVC, animated: true, completion: nil)
    }
    func userDidCancelPaymentViewController(paymentViewController: CardIOPaymentViewController!) {
        paymentViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func userDidProvideCreditCardInfo(cardInfo: CardIOCreditCardInfo!, inPaymentViewController paymentViewController: CardIOPaymentViewController!) {
        
        if let info = cardInfo {
            let str = NSString(format: "Received card info.\n Number: %@\n expiry: %02lu/%lu\n cvv: %@.", info.redactedCardNumber, info.expiryMonth, info.expiryYear, info.cvv)
            print(str as String)
        }
        paymentViewController?.dismissViewControllerAnimated(true, completion: nil)
    }


}

