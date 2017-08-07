//
//  ViewController.swift
//  tesseractStarter
//
//  Created by Amanda Southworth on 8/6/17.
//  Copyright © 2017 Amanda Southworth. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let captureDev = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        do {
            
            let input = try AVCaptureDeviceInput(device: captureDev)
            captureSession = AVCaptureSession()
            captureSession?.addInput(input)
            
        } catch {
            
            print(error)
            
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        previewLayer?.frame = captureView.layer.bounds
        captureView.layer.addSublayer(previewLayer!)
        
        captureSession?.startRunning()
        
    }

    @IBOutlet weak var captureView: UIView!
    
    var captureSession: AVCaptureSession?
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    @IBOutlet weak var startScan: UIButton!
    @IBAction func startAction(_ sender: Any) {
        
        
    }
    
    @IBOutlet weak var stopScan: UIButton!
    @IBAction func stopAction(_ sender: Any) {
        
        
    }
    
    @IBOutlet weak var textView: UITextView!
}

