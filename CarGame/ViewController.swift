//
//  ViewController.swift
//  CarGame
//
//  Created by Hamza Abdullahi on 26/02/2018.
//  Copyright © 2018 Hamza Abdullahi. All rights reserved.
//

import UIKit
import AVFoundation

protocol subviewDelegate {
    func changeSomething()
}
var sHeight = UIScreen.main.bounds.height
var sWidth = UIScreen.main.bounds.width
class ViewController: UIViewController, subviewDelegate {
    
    @IBOutlet weak var scorenumber: UILabel!
    var collisionBehavior: UICollisionBehavior!
    var dynamicAnimator: UIDynamicAnimator!
    var dynamicItemBehavior: UIDynamicItemBehavior!
    var carAnimatation: UIDynamicAnimator!
    var SoundEffect: AVAudioPlayer?
    var soundzombie: AVAudioPlayer?
    var soundEffectGO: AVAudioPlayer?
    var screenHeight = UIScreen.main.bounds.height
    var screenWidth = UIScreen.main.bounds.width
    
    @IBOutlet weak var zombie: DraggingImageView!
    
    @IBOutlet weak var road: UIImageView!
 
    
    var fallingImagesArray = [1,2,3,4,5,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    
    let label = UILabel(frame: CGRect(x:0, y:0, width: 400,height:200))
    let labelscore = UILabel(frame: CGRect(x:0, y:25, width: 300,height:200))

    var Scores: [UIImageView] = []    //array for score
    var score_forGame = 0
    
    let gameover = UIImageView(image: nil)
    let button = UIButton(frame: CGRect(x:sWidth/2, y:sHeight/1.4, width:120, height:100))
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
        NSCopying, for: UIBezierPath(rect: zombie.frame))
        
        for car_player in Scores {
            if (zombie.frame.intersects(car_player.frame)){
               score_forGame = score_forGame - 2
                if score_forGame < 0{
                    score_forGame = 0
                    
                    let path = Bundle.main.path(forResource: "soundzombie.mp3", ofType:nil)!
                    let url = URL(fileURLWithPath: path)
                    do{
                        soundzombie =  try AVAudioPlayer(contentsOf: url)
                        soundzombie?.play()
                    }catch{
                        //no file exist
                    
                    }
                }
                self.scorenumber.textColor = UIColor.white
                self.scorenumber.text = String (self.score_forGame)
            }
        }
    }
    
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        func sound(){
            let path = Bundle.main.path(forResource: "scray.mp3", ofType:nil)!
            let url = URL(fileURLWithPath: path)
            do {
                SoundEffect = try AVAudioPlayer(contentsOf: url)
                SoundEffect?.play()
            } catch {
                // do nothing
            }
        }
       
        
        zombie.myDelegate = self
        
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
        road.image = UIImage.animatedImage(with: imageArray, duration: 0.4)
        road.frame = UIScreen.main.bounds
        randCarsFalling()
 
        var zombieArray: [UIImage]!
        zombieArray = [UIImage(named: "food1.png")!,
                      UIImage(named: "food2.png")!,
                      UIImage(named: "food3.png")!,
                      UIImage(named: "food4.png")!,
                      UIImage(named: "food5.png")!,
                      UIImage(named: "food6.png")!,]
        
        sound()
        
        
        self.view.addSubview(road)
        self.view.sendSubview(toBack: road)
        zombie.image = UIImage.animatedImage(with: zombieArray, duration: 0.4)
        zombie.frame = CGRect(x:screenWidth/2, y:screenHeight/1.5, width:96,  height:96)
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
                case 1: cars.image = UIImage(named: "zomb1.png")
                case 2: cars.image = UIImage(named: "zomb1.png")
                case 3: cars.image = UIImage(named: "zomb1.png")
                case 4: cars.image = UIImage(named: "zomb1.png")
                case 5: cars.image = UIImage(named: "zomb1.png")
                case 6: cars.image = UIImage(named: "zomb1.png")
                default: cars.image = UIImage(named: "zomb1.png")
                    
                }
                
    
                cars.frame = CGRect(x:randomnum, y:0, width:55, height: 55)
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
            
    
            self.button.setTitleColor(UIColor.white, for: .normal)
            self.button.setTitle("Play Again", for: [])
            self.button.addTarget(self, action: #selector(self.playButton), for: .touchUpInside)
            self.view.addSubview(self.button)
            

            self.gameover.image = UIImage(named: "gameover2.jpg")
            self.gameover.frame = UIScreen.main.bounds
            self.view.addSubview(self.gameover)
            self.view.bringSubview(toFront: self.gameover)
            self.view.bringSubview(toFront: self.button)
            
            
         
            self.label.center = CGPoint(x:self.screenWidth/2,y:self.screenHeight/4.3)
            self.label.textColor = UIColor.white
            self.label.textAlignment = .center
            self.label.text = "Score " + String(self.score_forGame)
            self.view.addSubview(self.label)
            
            
            
            self.label.font = UIFont.systemFont(ofSize: 45.0)
            self.label.font = UIFont.boldSystemFont(ofSize: 45.0)
            self.label.font = UIFont.italicSystemFont(ofSize: 45.0)
            }
    
    }

        
override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


    
    

    




