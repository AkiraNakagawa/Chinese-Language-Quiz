//
//  ViewController2.swift
//  Chinese Listening Practice
//
//  Created by 中川 亮 on 2015/02/02.
//  Copyright (c) 2015年 中川 亮. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController2: UIViewController {

    
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var HintButton: UIButton!
    
    @IBOutlet weak var choice1: UIButton!
    
    @IBOutlet weak var choice2: UIButton!
    
    @IBOutlet weak var choice3: UIButton!
    
    @IBOutlet weak var choice4: UIButton!
    
    @IBOutlet weak var Result: UILabel!
    
    @IBOutlet weak var NextButton: UIButton!
    
    var CorrectAnswer = String()
    
    var QuestionNumber = Int()
    
    //Sound variables (変数)
    //var mainbundle = NSBundle.mainBundle()
    var JintianFile = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("jintian", ofType: "m4a")!)
    var case1Sound = AVAudioPlayer()
    
    var TwoFile = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("er", ofType: "mp3")!)
    var case2Sound = AVAudioPlayer()
    
    var ThreeFile = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("san", ofType: "mp3")!)
    var case3Sound = AVAudioPlayer()
    
    var FourFile = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("si", ofType: "mp3")!)
    var case4Sound = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RandomQuestions()

        //println(NSBundle.mainBundle().pathForResource("jintian", ofType: "m4a")!)
        
        case1Sound = AVAudioPlayer(contentsOfURL: JintianFile, error: nil)
        case1Sound.prepareToPlay()
        
        case2Sound = AVAudioPlayer(contentsOfURL: TwoFile, error: nil)
        case2Sound.prepareToPlay()
        
        case3Sound = AVAudioPlayer(contentsOfURL: ThreeFile, error: nil)
        case2Sound.prepareToPlay()
        
        case4Sound = AVAudioPlayer(contentsOfURL: FourFile, error: nil)
        case4Sound.prepareToPlay()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func RandomQuestions(){
        var randomNumber = arc4random() % 4;  //choosing between 0 through 3 (arc4randomは適当な数をpick upする)
        randomNumber += 1; //(１から４までの適当な数字）
        switch (randomNumber){
        case 1:
            question.text = "今天"
            choice1.setTitle("jin1ten1", forState: UIControlState.Normal)
            choice2.setTitle("jing1tian1", forState: UIControlState.Normal)
            choice3.setTitle("gan1tian1", forState: UIControlState.Normal)
            choice4.setTitle("jin1tian4", forState: UIControlState.Normal)
            CorrectAnswer = "2"
            QuestionNumber = 1;
            
            break
            
        case 2:
            question.text = "二"
            choice1.setTitle("er1", forState: UIControlState.Normal)
            choice2.setTitle("er2", forState: UIControlState.Normal)
            choice3.setTitle("er3", forState: UIControlState.Normal)
            choice4.setTitle("er4", forState: UIControlState.Normal)
            CorrectAnswer = "2"
            QuestionNumber = 2
            break
            
        case 3:
            question.text = "三"
            choice1.setTitle("san1", forState: UIControlState.Normal)
            choice2.setTitle("sam1", forState: UIControlState.Normal)
            choice3.setTitle("san3", forState: UIControlState.Normal)
            choice4.setTitle("sam4", forState: UIControlState.Normal)
            CorrectAnswer = "1"
            QuestionNumber = 3
            break
            
        case 4:
            question.text = "四"
            choice1.setTitle("yon1", forState: UIControlState.Normal)
            choice2.setTitle("si1", forState: UIControlState.Normal)
            choice3.setTitle("shi3", forState: UIControlState.Normal)
            choice4.setTitle("si4", forState: UIControlState.Normal)
            CorrectAnswer = "4"
            QuestionNumber = 4
            break
            
        default:
            break;   //default文はif文に対するelseと同じで、その他の条件に当てはまらなかった場合に実行される処理を記述します。 もし５（１から４以外)の場合はbreak終了。
        }
    }
    
    //レーベルを隠したり出したりするファンクション（機能)
    func Hide(){
        Result.hidden = true;
        NextButton.hidden = true;
    }
    
    func unHide(){
        Result.hidden = false;
        NextButton.hidden = false;
    }
    
    //もし回答が正しかったら、Yes Correct!と表示される。間違えだったらWrong!
    @IBAction func choice1Action(sender: AnyObject) {
        unHide()
        if (CorrectAnswer == "1"){
            Result.text = "YES!!!!  Correct"
        }
        else{
            Result.text = "NOOOOOOOO!!!!!  WRONGGGGG"
        }
    }

    @IBAction func choice2Action(sender: AnyObject) {
        unHide()
        if (CorrectAnswer == "2"){
            Result.text = "YES!!!!  Correct"
        }
        else{
            Result.text = "NOOOOOOO!!! WRONGGGG"
        }
    }
    
    @IBAction func choice3Action(sender: AnyObject) {
        unHide()
        if (CorrectAnswer == "3"){
            Result.text = "YES!!!!  Correct"
        }
        else{
            Result.text = "NOOOOOOOO!!!  WRONGGG"
        }
    }
    
  
    @IBAction func choice4Action(sender: AnyObject) {
        unHide()
        if (CorrectAnswer == "4"){
            Result.text = "YES!!!!  Correct"
        }
        else{
            Result.text = "NOOOOOOO!!!!  WRONGGG"
        }
    }
    
    //Next:を回答者が選択肢を選ぶまで伏せておくためのfunction
    @IBAction func Next(sender: AnyObject) {
        RandomQuestions()
        Hide()
    }
    
    //Hint Sound depends on the question
    @IBAction func Hint(sender: UIButton) {
        
        if (QuestionNumber == 1){
            case1Sound.currentTime = 0;
            case1Sound.play()
        }
        if (QuestionNumber == 2){
            case2Sound.currentTime = 0;
            case2Sound.play()
        }
        if (QuestionNumber == 3){
            case3Sound.currentTime = 0;
            case3Sound.play()
        }
        if (QuestionNumber == 4){
            case4Sound.currentTime = 0;
            case4Sound.play()
        }
        
    }
    

}
