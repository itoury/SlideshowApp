//
//  EnlargedImageViewController.swift
//  SlideshowApp
//
//  Created by 伊藤龍哉 on 2020/03/03.
//  Copyright © 2020 ryuya.ito. All rights reserved.
//

import UIKit

class EnlargedImageViewController: UIViewController {

    
    @IBOutlet weak var enlargedImageView: UIImageView!
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enlargedImageView.image = image
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
