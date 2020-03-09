//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 伊藤龍哉 on 2020/03/03.
//  Copyright © 2020 ryuya.ito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer: Timer!
    var imageArray = [UIImage]()
    var arrayIndex = 0
    var isStarted = false
    let numberOfImage = 3
    var image: UIImage!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startOrStopButton: UIButton!
    
    
    @IBOutlet weak var previousButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...numberOfImage {
            let image = UIImage(named: "cat\(i).jpg")
            imageArray.append(image!)
        }
        imageView.image = imageArray[arrayIndex]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if timer != nil {
            slideshowStop()
        }
        let enlargedImageVC = segue.destination as! EnlargedImageViewController
        enlargedImageVC.image = imageView.image
    }
    
    @objc func slideshow() {
        arrayIndex = arrayIndex == imageArray.count - 1 ? 0 : arrayIndex + 1
        imageView.image = imageArray[arrayIndex]
    }
    
    func slideshowStart() {
        self.isStarted = true
        startOrStopButton.setImage(UIImage(named: "stop.jpeg"), for: UIControl.State.normal)
        previousButton.isEnabled = false
        nextButton.isEnabled = false
        self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(slideshow), userInfo: nil, repeats: true)
    }
    
    func slideshowStop() {
        self.isStarted = false
        startOrStopButton.setImage(UIImage(named: "start.jpeg"), for: UIControl.State.normal)
        previousButton.isEnabled = true
        nextButton.isEnabled = true
        self.timer.invalidate()
    }
  
    @IBAction func startOrStop(_ sender: Any) {
        if self.isStarted {
            slideshowStop()
        } else {
            slideshowStart()
        }
    }
    

    @IBAction func previousImage(_ sender: Any) {
        arrayIndex = arrayIndex == 0 ? imageArray.count - 1 : arrayIndex - 1
        imageView.image = imageArray[arrayIndex]
    }
    
    @IBAction func nextImage(_ sender: Any) {
        arrayIndex = arrayIndex == imageArray.count - 1 ? 0 : arrayIndex + 1
        imageView.image = imageArray[arrayIndex]
    }
}

