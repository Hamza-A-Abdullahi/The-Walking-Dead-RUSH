//
//  ViewController.swift
//  CarGame
//
//  Created by Hamza Abdullahi on 26/02/2018.
//  Copyright © 2018 Hamza Abdullahi. All rights reserved.
//

import UIKit

protocol subviewDelegate {
    func changeSomething()
}

class ViewController: UIViewController, subviewDelegate {
    
    @IBOutlet weak var scorenumber: UILabel!
    var collisionBehavior: UICollisionBehavior!
    var dynamicAnimator: UIDynamicAnimator!
    var dynamicItemBehavior: UIDynamicItemBehavior!
    var carAnimatation: UIDynamicAnimator!
    

    @IBOutlet weak var road: UIImageView!
    @IBOutlet weak var draggingCar: DraggingImageView!
    
    var fallingImagesArray = [1,2,3,4,5,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    var sWidth =  UIScreen.main.bounds.width
    var sHeight =  UIScreen.main.bounds.height
    let label = UILabel(frame: CGRect(x:0, y:0, width: 200,height:200))

    var Scores: [UIImageView] = []    //array for score
    var score_forGame = 0
    
    let gameover = UIImageView(image: nil)
    let button = UIButton(frame: CGRect(x:140, y:100, width:120, height:100))
    var allCars: [UIImageView] = []

    @objc func playButton (sender: UIButton!) {
        gameover.removeFromSuperview()
        button.removeFromSuperview()
        score_forGame = 0;
        
        label.removeFromSuperview()
        
        for i in allCars{
            i.removeFromSuperview()
        
            
        }
        viewDidLoad()
    }

    func changeSomething() {
        collisionBehavior.removeAllBoundaries()
        collisionBehavior.addBoundary(withIdentifier: "barrier" as
        NSCopying, for: UIBezierPath(rect: draggingCar.frame))
        
        for car_player in Scores {
            if (draggingCar.frame.intersects(car_player.frame)){
               score_forGame = score_forGame - 2
                self.scorenumber.text = String (self.score_forGame)
            }
        }
    }
    
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        draggingCar.Delegate = self
        
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
        
        self.view.addSubview(road)
        self.view.sendSubview(toBack: road)
        road.image = UIImage.animatedImage(with: imageArray, duration: 0.9)
        road.frame = UIScreen.main.bounds
        randCarsFalling()
        
        
    }
    func randCarsFalling(){
        dynamicItemBehavior = UIDynamicItemBehavior(items: [])
        carAnimatation = UIDynamicAnimator(referenceView: self.view)
        collisionBehavior = UICollisionBehavior(items: [])
        
        
        for index in 0...19 {
            
            let setadelay = Double(self.fallingImagesArray[index])
            let randomnum = (Int(arc4random_uniform(UInt32(243))) + 53)
            let settimer = DispatchTime.now() + setadelay
            DispatchQueue.main.asyncAfter(deadline: settimer){
                
                let cars = UIImageView(image:nil)
                let random = Int(arc4random_uniform(5))
                
                switch random{
                case 1: cars.image = UIImage(named: "car1.png")
                case 2: cars.image = UIImage(named: "car2.png")
                case 3: cars.image = UIImage(named: "car3.png")
                case 4: cars.image = UIImage(named: "car4.png")
                case 5: cars.image = UIImage(named: "car5.png")
                case 6: cars.image = UIImage(named: "car6.png")
                default: cars.image = UIImage(named: "car1.png")
                }
                
    
                cars.frame = CGRect(x:randomnum, y:0, width:45, height: 65)
                self.allCars.append(cars)
                
                self.view.addSubview(cars)
                self.view.bringSubview(toFront: cars)
                
                self.dynamicItemBehavior.addItem(cars)
                self.dynamicItemBehavior.addLinearVelocity(CGPoint(x: 0, y:500), for: cars)
                self.collisionBehavior.addItem(cars)
                self.collisionBehavior.translatesReferenceBoundsIntoBoundary = false
                
                self.Scores.append((cars))
                
                self.score_forGame = (self.score_forGame + 5)
                self.scorenumber.text =  String (self.score_forGame)
               
                
            }
            
            carAnimatation.addBehavior(dynamicItemBehavior)
            self.collisionBehavior.collisionMode = UICollisionBehaviorMode.everything
            carAnimatation.addBehavior(collisionBehavior)
            
        }
        
        let when = DispatchTime.now() + 20
        
        DispatchQueue.main.asyncAfter(deadline: when){
            
            self.button.backgroundColor = .green
            self.button.setTitleColor(UIColor.black, for: .normal)
            self.button.setTitle("Play Again", for: [])
            self.button.addTarget(self, action: #selector(self.playButton), for: .touchUpInside)
            self.view.addSubview(self.button)
            

            self.gameover.image = UIImage(named: "road.png")
            self.gameover.frame = UIScreen.main.bounds
            self.view.addSubview(self.gameover)
            self.view.bringSubview(toFront: self.gameover)
            self.view.bringSubview(toFront: self.button)
            
            self.label.center = CGPoint(x:160,y:285)
            self.label.textAlignment = .center
            self.label.text = String(self.score_forGame)
            self.view.addSubview(self.label)
            
            
            self.label.font = UIFont.systemFont(ofSize: 100.0)
            self.label.font = UIFont.boldSystemFont(ofSize: 100.0)
            self.label.font = UIFont.italicSystemFont(ofSize: 100.0)
        }
        

func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
}

    
    

    




