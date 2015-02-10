//
//  ViewControllerForDictation.swift
//  Chinese Listening Practice
//
//  Created by 中川 亮 on 2015/02/04.
//  Copyright (c) 2015年 中川 亮. All rights reserved.
//

import UIKit

class ViewControllerForDictation: UIViewController, UITextFieldDelegate {
    //UITextFieldDelegate is needed to put there for usgage of UITexField things
    //delegate(デリゲート)を使うときは、Class定義の端に"UITextFieldDelegate"を追加で書く必要がある。
    @IBOutlet weak var Question: UILabel!

    @IBOutlet weak var Answer: UITextField!
    
    @IBOutlet weak var Result: UILabel!
    
    @IBOutlet weak var NextButton: UIButton!
    
    var QuestionNumber = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RandomQuestions()
        
        Answer.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func RandomQuestions(){
        var randomNumber = arc4random() % 4; //from 0 through 3
        randomNumber += 1; //from 1
        
        switch (randomNumber){
        case 1:
            Question.text = "You"
            QuestionNumber = 1
            break
        case 2:
            Question.text = "I (me, my)"
            QuestionNumber = 2
            break
        case 3:
            Question.text = "Surname"
            QuestionNumber = 3
            break
        case 4:
            Question.text = "to ask (verb)"
            QuestionNumber = 4
            break
        default:
            break
        }
    }
    
    //Hide function and appear function
    func Hide(){
        Result.hidden = true
        NextButton.hidden = true
    }
    func Appear(){
        Result.hidden = false
        NextButton.hidden = false
    }
    
    @IBAction func AnswerQuestion(sender: UITextField) {
        if (QuestionNumber == 1 && Answer.text == "你"){
            Result.text = "You are correct!"
            Appear()
        }
        if (QuestionNumber == 1 && Answer.text != "你"){
            Result.text = "Wrong Answer"
            Appear()
        }
        if (QuestionNumber == 2 && Answer.text == "我"){
            Result.text = "You are correct!"
            Appear()
        }
        if (QuestionNumber == 2 && Answer.text != "我"){
            Result.text = "Wrong Answer!"
            Appear()
        }
        if (QuestionNumber == 3 && Answer.text == "姓"){
            Result.text = "You are correct!"
            Appear()
        }
        if (QuestionNumber == 3 && Answer.text != "姓"){
            Result.text = "Wrong Answer"
            Appear()
        }
        if (QuestionNumber == 4 && Answer.text == "問"){
            Result.text = "You are correct!"
            Appear()
        }
        if (QuestionNumber == 4 && Answer.text != "問"){
            Result.text = "Wrong Answer"
            Appear()
        }
    }
  
    //Next Bottun
    @IBAction func NextQuestion(sender: UIButton) {
        RandomQuestions()
        Hide()
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        
        self.view.endEditing(true)
        println(self.Answer.text)
        return true
    }
    
    /*
    UITextFieldが編集された直後に呼ばれる.
    */
    func textFieldDidBeginEditing(textField: UITextField){
        println("textFieldDidBeginEditing:" + textField.text)
    }
    
    /*
    UITextFieldが編集終了する直前に呼ばれる.
    */
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        println("textFieldShouldEndEditing:" + textField.text)
        
        return true
    }
    
    /*
    改行ボタンが押された際に呼ばれる.
    */
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

    


}
