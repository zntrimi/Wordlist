//
//  AddViewController.swift
//  Wordlist
//
//  Created by Zentaro Imai on 2021/05/10.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    
    var wordArray: [Dictionary<String, String>] = []
    let saveData = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveWord() {
        let wordDictionary = ["english": englishTextField.text!, "japanese": japaneseTextField.text!]
        if saveData.array(forKey: "WORD") != nil {
            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        }
        wordArray.append(wordDictionary)
        saveData.set(wordArray, forKey: "WORD")
        let alert = UIAlertController(
            title: "保存完了", message: "単語の登録が完了しました", preferredStyle: .alert)
        alert.addAction(UIAlertAction(
            title: "OK", style: .default, handler: nil
        ))
        present(alert, animated: true, completion: nil)
        englishTextField.text = ""
        japaneseTextField.text = ""

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
