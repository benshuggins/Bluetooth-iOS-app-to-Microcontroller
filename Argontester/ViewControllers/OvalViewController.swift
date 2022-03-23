//
//  OvalViewController.swift
//  Argontester
//
//  Created by Ben Huggins on 9/24/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class OvalViewController: UIViewController {

    var labelText = String()
    var mynumber3: NSNumber = 0
    var mynumber4: NSNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
               print("change oval vc:\(labelText)")
               let backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
               backgroundView.backgroundColor = UIColor.brown
               let ovalView = OvalView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
            
               backgroundView.addSubview(ovalView)
               //let imageView = UIImageView(image: UIImage(named: ""))
               
               let imageView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
               
               let layer = CAGradientLayer()
               layer.frame = view.frame
               layer.colors = [UIColor.white.cgColor, UIColor.blue.cgColor]
             
       
        print("🥯🥯🥯🥯🥯")
        print(labelText)
     
        if let myInteger = Int(labelText) {
            var myNumber = NSNumber(value: myInteger)
            mynumber3 = myNumber
           print(mynumber3)
        } else {
            
        }
           print("🥘🥘🥘🥘🥘🥘")
           print(mynumber3)
           print(mynumber3)
        
        layer.locations = [(mynumber3), (mynumber3)] // 0 is full and 1.0 is empty and small distance between numbers gives a nice water effect.
               imageView.layer.addSublayer(layer)
                              //self.view.addSubview(imageView)

              // imageView.backgroundColor = .white
               imageView.contentMode = UIView.ContentMode.scaleAspectFill
               imageView.frame = ovalView.bounds
               ovalView.addSubview(imageView)
               self.view.addSubview(backgroundView)
               //self.view.addSubview(imageView)
               
               let view1 = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
               let view2 = UIView(frame: CGRect(x: 0, y: 580, width: view.frame.width, height: 100))
               view1.backgroundColor = .brown
               view2.backgroundColor = .brown
               backgroundView.addSubview(view1)
               backgroundView.addSubview(view2)
               
    }

}
