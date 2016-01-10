//
//  shippingCViewController.swift
//  2Pay
//
//  Created by Rishi Goel on 2016-01-09.
//  Copyright © 2016 Rishi Goel. All rights reserved.
//

import UIKit

class shippingCViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background.png")!)
        nameTxt.text = fullName
        streetTxt.text = address
        cityTxt.text = city
        codeTxt.text = postal
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var nameTxt: UITextField!
    
    @IBOutlet weak var codeTxt: UITextField!
    @IBOutlet weak var cityTxt: UITextField!
    @IBOutlet weak var streetTxt: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
