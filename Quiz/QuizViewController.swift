//
//  QuizViewController.swift
//  Quiz
//
//  Created by 村上航輔 on 2019/09/22.
//  Copyright © 2019 kyamisuke. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    // quiz配列
    var quizArray = [Any]()
    
    // 正解数
    var correctAnswer: Int = 0
    
    @IBOutlet var quizTextView: UITextView!
    
    @IBOutlet weak var choiceButton1: UIButton!
    @IBOutlet weak var choiceButton2: UIButton!
    @IBOutlet weak var choiceButton3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 一時的にクイズを格納しておく配列
        var tempArray = [Any]()
        
        // tempArrayに問題文、3つの選択肢、答えの番号が入った配列を追加していく
        tempArray.append(["問題文１", "選択肢１", "選択肢２", "選択肢３", 1])
        tempArray.append(["問題文２", "選択肢１", "選択肢２", "選択肢３", 2])
        tempArray.append(["問題文３", "選択肢１", "選択肢２", "選択肢３", 2])
        tempArray.append(["問題文４", "選択肢１", "選択肢２", "選択肢３", 3])
        tempArray.append(["問題文５", "選択肢１", "選択肢２", "選択肢３", 3])
        tempArray.append(["問題文６", "選択肢１", "選択肢２", "選択肢３", 3])
        
        // 問題文をシャッフルしてquizArrayに追加してく
        while (tempArray.count > 0) {
            let index = Int(arc4random()) % tempArray.count
            quizArray.append(tempArray[index])
            tempArray.remove(at: index)
        }
        
        choiceQuiz()

        // Do any additional setup after loading the view.
    }
    
    func choiceQuiz() {
        // 一時的にクイズを取り出す配列
        let tempArray = quizArray[0] as! [Any]
        
        quizTextView.text = tempArray[0] as? String
        
        choiceButton1.setTitle(tempArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tempArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tempArray[3] as? String, for: .normal)
    }

    @IBAction func choiceAnswer(sender: UIButton) {
        let tempArray = quizArray[0] as! [Any]
        
        if tempArray[4] as! Int == sender.tag {
            correctAnswer += 1
        }
        
        quizArray.remove(at: 0)
        
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnswer = self.correctAnswer
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
