//
//  ViewController.swift
//  tesseractStarter
//
//  Created by Amanda Southworth on 8/6/17.
//  Copyright © 2017 Amanda Southworth. All rights reserved.
//

import UIKit
import AVFoundation
import Vision
import TesseractOCR

class ViewController: UIViewController, G8TesseractDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tesseract?.delegate = self
        
        
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
    
    func shouldCancelImageRecognition(for tesseract: G8Tesseract!) -> Bool {
        
        return false
    }
    
    var tesseract = G8Tesseract(language: "eng")
    
    @IBOutlet weak var captureView: UIView!
    
    var captureSession: AVCaptureSession?
    var previewLayer: AVCaptureVideoPreviewLayer?
    var imageOutput: AVCapturePhotoOutput?
    
    @IBOutlet weak var startScan: UIButton!
    @IBAction func startAction(_ sender: Any) {
        
        captureSession?.startRunning()
    }
    
    @IBOutlet weak var stopScan: UIButton!
    @IBAction func stopAction(_ sender: Any) {
        
        captureSession?.stopRunning()
    }
    
    @IBOutlet weak var textView: UITextView!
    
}

