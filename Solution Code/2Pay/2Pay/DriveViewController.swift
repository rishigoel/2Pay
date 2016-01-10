//
//  DriveViewController.swift
//  2Pay
//
//  Created by Rishi Goel on 2016-01-09.
//  Copyright © 2016 Rishi Goel. All rights reserved.
//

import AVFoundation
import UIKit

var fullName:String = "a"
var address:String = "b"
var city:String = "c"
var postal:String = "d"
var count = 0

class DriveViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blackColor()
        captureSession = AVCaptureSession()
        
        let videoCaptureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed();
            return;
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
            metadataOutput.metadataObjectTypes = [AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypePDF417Code]
        } else {
            failed()
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession);
        previewLayer.frame = view.layer.bounds;
        previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        view.layer.addSublayer(previewLayer);
        
        captureSession.startRunning();
    }
    
    func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(ac, animated: true, completion: nil)
        captureSession = nil
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if (captureSession?.running == false) {
            captureSession.startRunning();
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (captureSession?.running == true) {
            captureSession.stopRunning();
        }
    }
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        captureSession.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            let readableObject = metadataObject as! AVMetadataMachineReadableCodeObject;
            
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            foundCode(readableObject.stringValue);
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func foundCode(code: String) {
        var lastName = code.substringWithRange(Range<String.Index>(start: (code.rangeOfString("DCS")?.endIndex)!, end: (code.rangeOfString("DCT")?.startIndex)!))
        lastName = lastName.stringByReplacingOccurrencesOfString(",", withString: "")
        let firstName = code.substringWithRange(Range<String.Index>(start: (code.rangeOfString("DCT")?.endIndex)!, end: (code.rangeOfString("DBD")?.startIndex)!))
        var street = code.substringWithRange(Range<String.Index>(start: (code.rangeOfString("DAG")?.endIndex)!, end: (code.rangeOfString("DAI")?.startIndex)!))
        street = street.stringByReplacingOccurrencesOfString(",", withString: "")
        var prov = code.substringWithRange(Range<String.Index>(start: (code.rangeOfString("DAI")?.endIndex)!, end: (code.rangeOfString("DAK")?.startIndex)!))
        prov = prov.stringByReplacingOccurrencesOfString("DAJ", withString: ",")
        let post = code.substringWithRange(Range<String.Index>(start: (code.rangeOfString("DAK")?.endIndex)!, end: (code.rangeOfString("DAQ")?.startIndex)!))
        print(lastName)
        print(firstName)
        print(street)
        print(prov)
        print(post)
        fullName = firstName
        fullName += " "
        fullName += lastName
        address = street.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        city = prov.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        postal=post.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        count = 1
        let front = FrontViewController()
        front.change()
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    @IBOutlet weak var button: UIButton!
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .Portrait
    }
}