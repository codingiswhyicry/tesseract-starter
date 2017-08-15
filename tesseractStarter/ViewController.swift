//
//  ViewController.swift
//  tesseractStarter
//
//  Created by Amanda Southworth on 8/6/17.
//  Copyright © 2017 Amanda Southworth. All rights reserved.
//

import UIKit
import TesseractOCR

class ViewController: UIViewController, G8TesseractDelegate {
    
    func recognizeText(image: UIImage) {
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tesseract?.delegate = self
        
    }
    
    func shouldCancelImageRecognition(for tesseract: G8Tesseract!) -> Bool {
        
        return false
    }
    
    var tesseract = G8Tesseract(language: "eng")
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var image1: UIButton!
    @IBAction func imageOneAction(_ sender: Any) {
        
    }
    
    @IBOutlet weak var image2: UIButton!
    @IBAction func imageTwoAction(_ sender: Any) {
        
    }
    
    @IBOutlet weak var image3: UIButton!
    @IBAction func imageThreeAction(_ sender: Any) {
        
    }
    
    @IBOutlet weak var image4: UIButton!
    @IBAction func imageFourAction(_ sender: Any) {
        
    }
    
    @IBOutlet weak var image5: UIButton!
    @IBAction func imageFiveAction(_ sender: Any) {
        
    }
    
    @IBOutlet weak var image6: UIButton!
    @IBAction func imageSixAction(_ sender: Any) {
        
    }
    
    @IBOutlet weak var image7: UIButton!
    @IBAction func imageSevenAction(_ sender: Any) {
        
    }
    
    @IBOutlet weak var image8: UIButton!
    @IBAction func imageEightAction(_ sender: Any) {
        
    }
    
    @IBOutlet weak var image9: UIButton!
    @IBAction func imageNineAction(_ sender: Any) {
        
    }
    
    @IBOutlet weak var image10: UIButton!
    @IBAction func imageTenAction(_ sender: Any) {
        
    }
    
    
}
