//
//  ViewController.swift
//  XO-Game
//
//  Created by Nishanth P on 4/1/16.
//  Copyright © 2016 Nishapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var player=1 // 1=cross 0=nought
    
    var game=[0,0,0,0,0,0,0,0,0]
    
    var win=[[0,1,2],[3,4,5],[6,7,8],
             [0,3,6],[1,4,7],[2,5,8],
             [0,4,8],[2,4,6]]
    
    var active=true
    
    @IBOutlet var Label: UILabel!

    @IBOutlet var button: UIButton!
    
    @IBOutlet var playagain: UIButton!
    
    @IBAction func playagain(sender: AnyObject) {
        
        game=[0,0,0,0,0,0,0,0,0]
        
        active=true
        
        player=1
        
        Label.hidden = true
        
        Label.center = CGPointMake(Label.center.x-500, Label.center.y)
        
        var clear : UIButton
        
        for i in 0 ..< 9
        {
            
            clear=view.viewWithTag(i) as! UIButton
            clear.setImage(nil, forState: .Normal)
            
        }
        
        

    }
    
    @IBAction func buttonPress(sender: AnyObject) {
        
        
        if(game[sender.tag]==0 && active == true){
            
            game[sender.tag]=player
            
            if player == 1{
        
                sender.setImage(UIImage(named:"cross.png"), forState: .Normal)
            
                player=2
            
            }else
            {
                sender.setImage(UIImage(named:"nought.png"), forState: .Normal)
                player=1
            }
            
            for combination in win{
                
                if(game[combination[0]] != 0&&game[combination[0]]==game[combination[1]]&&game[combination[1]]==game[combination[2]]){
                    
                    active=false
                    
                    if game[combination[0]] == 1{
                        Label.text = "X wins"
                        
                    }else{
                        
                        Label.text = "O wins"
                    }
                    endgame()
                }
                
                
            }
            if active == true{
            active=false
            for buttonstate in game{
                if buttonstate == 0{
                    active = true
                }
            }
                if active == false{
                    Label.text="Its a Draw!"
                    endgame()
                }
            }
        }
    }
    
    func endgame(){
        Label.hidden=false
        
        UIView.animateWithDuration(0.5, animations: {
            self.Label.center=CGPointMake(self.Label.center.x+500,self.Label.center.y)
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Label.hidden = true
        Label.center = CGPointMake(Label.center.x-500, Label.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
