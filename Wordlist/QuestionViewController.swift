//
//  QuestionViewController.swift
//  Wordlist
//
//  Created by Zentaro Imai on 2021/05/10.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var nextButton: UIButton!
    
    var isAnswered = false
    var wordArray: [Dictionary<String, String>] = []
    var nowNumber = 0
    let SaveData = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wordArray = SaveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        wordArray.shuffle()
        questionLabel.text = wordArray[nowNumber]["english"]
    }
    
    @IBAction func nextButtonTapped() {
        if isAnswered {
            nowNumber += 1
            answerLabel.text = ""
            if nowNumber < wordArray.count {
                questionLabel.text = wordArray[nowNumber]["english"]
                isAnswered = false
                nextButton.setTitle("答えを表示", for: .normal)
            }else{
                nowNumber = 0
                performSegue(withIdentifier: "toFinishView", sender: nil)
            }
        } else {
            answerLabel.text = wordArray[nowNumber]["japanese"]
            isAnswered = true
            nextButton.setTitle("次へ", for: .normal)
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
