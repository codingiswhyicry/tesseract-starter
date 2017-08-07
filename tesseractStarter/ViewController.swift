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

class ViewController: UIViewController {
    
    func detectWord(box: VNTextObservation) {
        
        guard let boxes = box.characterBoxes else {
            return
        }
        
        var maxX: CGFloat = 9999.0
        var minX: CGFloat = 0.0
        var maxY: CGFloat = 9999.0
        var minY: CGFloat = 0.0
        
        for char in boxes {
            
            if char.bottomLeft.x < maxX {
                
                maxX = char.bottomLeft.x
            }
            
            if char.bottomRight.x > minX {
                
                minX = char.bottomRight.x
            }
            
            if char.bottomRight.y < maxY {
                
                maxY = char.bottomRight.y
            }
            
            if char.topRight.y < minY {
                
                minY = char.topRight.y
                
            }
        }
        
        let xCord = maxX * captureView.frame.size.width
        let yCord = (1 - minY) * captureView.frame.size.height
        let width = (minX - maxX) * captureView.frame.size.width
        let height = (minY - maxY) * captureView.frame.size.height
        
        let highlight = CALayer()
        highlight.frame = CGRect(x: xCord, y: yCord, width: width, height: height)
        highlight.borderColor = UIColor.white.cgColor
        highlight.borderWidth = 2
        
        captureView.layer.addSublayer(highlight)
    }
    
    func detectText() {
        
        let textReq = VNDetectTextRectanglesRequest(completionHandler: self.detectHandler)
        textReq.reportCharacterBoxes = true
        self.requests = [textReq]
        
    }
    
    func detectHandler(request: VNRequest, error: Error?) {
        
        guard let observations = request.results else {
            
            print("no result")
            return
        }
        
         let result = observations.map({$0 as? VNTextObservation})
        
        DispatchQueue.main.async() {
            self.captureView.layer.sublayers?.removeSubrange(1...)
            for region in result {
                guard let rg = region else {
                    continue
                }
                
                self.detectWord(box: rg)
            }
        }
    }
    
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
        
    }

    @IBOutlet weak var captureView: UIView!
    
    var captureSession: AVCaptureSession?
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    var requests = [VNRequest]()
    
    @IBOutlet weak var startScan: UIButton!
    @IBAction func startAction(_ sender: Any) {
        
        captureSession?.startRunning()
        detectText()
    }
    
    @IBOutlet weak var stopScan: UIButton!
    @IBAction func stopAction(_ sender: Any) {
        
        captureSession?.stopRunning()
    }
    
    @IBOutlet weak var textView: UITextView!
}

