//
//  ViewController.swift
//  catchKenny
//
//  Created by Sinan Kulen on 16.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    var timer = Timer()
    var counter = 0
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    var score = 1
    var sonuc = 0
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapPic))
        imageView.addGestureRecognizer(gestureRecognizer)
    
        counter = 10
        timeLabel.text = " \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeFunc), userInfo: nil, repeats: true)
        
        score = 1
        
        let storedHighscore = UserDefaults.standard.object(forKey: "highscore")
        highscoreLabel.text = storedHighscore as? String
 
        
    }
   
    @objc func tapPic(){
       
        let scor = Int(exactly: score)!
        scoreLabel.text = "Score:  \(String(scor))"
        score  += 1
    }
    
    
    
    @objc func timeFunc(){
        timeLabel.text = "\(counter)"
        counter -= 1
       
        let a = Int.random(in: 0...300)
        let b = Int.random(in: 0...500)
        imageView.frame = CGRect(x: a, y: b, width: 60, height: 100)
        
        if counter == 0 {
            timer.invalidate()
            timeLabel.text = "Time's Over"
            

            if score > sonuc {
                sonuc  = score - 1
                let son = Int(exactly: sonuc)!
                highscoreLabel.text = "Highscore : \(son)"
                
            }
            UserDefaults.standard.set(highscoreLabel.text, forKey: "highscore")
            
            let alert = UIAlertController(title: "Time's Over", message: "Are you again play ?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { (UIAlertAction) in
                self.viewDidLoad() }
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
            
            
           
        }
        
    }
    
 

    
    
}

