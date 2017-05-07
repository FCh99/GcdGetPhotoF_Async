//
//  ViewController.swift
//  GcdGetPhotoF
//
//  Created by Fausto Checa on 7/5/17.
//  Copyright © 2017 Fausto Checa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getPhoto(_ sender: Any) {
        
        let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")
        
        if let actualUrl = url {
            
            // Go to background thread
            DispatchQueue.global(qos: .userInitiated).async {
                
                let imageData = NSData(contentsOf: actualUrl)! as Data
                
                // Go to main thread to update UI
                DispatchQueue.main.async {
                    
                    let image = UIImage(data: imageData)
                    self.imageView.image = image
                    
                }
                
            }
         
        }
        
    }

}

