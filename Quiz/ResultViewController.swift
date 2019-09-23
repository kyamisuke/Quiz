//
//  ResultViewController.swift
//  Quiz
//
//  Created by 村上航輔 on 2019/09/22.
//  Copyright © 2019 kyamisuke. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    // 正解数
    var correctAnswer: Int = 0
    
    // 結果を表示するラベル
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        resultLabel.text = String(correctAnswer)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func buck() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }

}
