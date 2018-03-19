//
//  ViewController.swift
//  CarGame
//
//  Created by Hamza Abdullahi on 26/02/2018.
//  Copyright © 2018 Hamza Abdullahi. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    var dynamicAnimator: UIDynamicAnimator!
    var dynamicItemBehavior: UIDynamicItemBehavior!
    
    
    @IBOutlet weak var moveroadImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var imageArray: [UIImage]!
        
        imageArray = [UIImage(named: "road1.png")!,
                      UIImage(named: "road2.png")!,
                      UIImage(named: "road3.png")!,
                      UIImage(named: "road4.png")!,
                      UIImage(named: "road5.png")!,
                      UIImage(named: "road6.png")!,
                      UIImage(named: "road7.png")!,
                      UIImage(named: "road8.png")!,
                      UIImage(named: "road9.png")!,
                      UIImage(named: "road10.png")!,
                      UIImage(named: "road11.png")!,
                      UIImage(named: "road12.png")!,
                      UIImage(named: "road13.png")!,
                      UIImage(named: "road14.png")!,
                      UIImage(named: "road15.png")!,
                      UIImage(named: "road16.png")!,
                      UIImage(named: "road17.png")!,
                      UIImage(named: "road18.png")!,
                      UIImage(named: "road19.png")!,
                      UIImage(named: "road20.png")!]
        
        moveroadImage.image = UIImage.animatedImage(with: imageArray, duration: 0.5)
        moveroadImage.frame = UIScreen.main.bounds
    
        
        //making car image come down
        let carImage = UIImageView(image: nil)

        carImage.image = UIImage(named: "car1.png")
        
        
        //position a car on the display
        carImage.frame = CGRect(x:100, y: -300, width: 50, height: 80)
        self.view.addSubview(carImage)
        self.view.bringSubview(toFront: carImage)
        
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        dynamicItemBehavior = UIDynamicItemBehavior(items: [carImage])
        
        self.dynamicItemBehavior.addLinearVelocity(CGPoint(x: 0, y: 300), for: carImage)
        dynamicAnimator.addBehavior(dynamicItemBehavior)
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
    
    

    




