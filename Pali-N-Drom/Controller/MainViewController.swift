//
//  ViewController.swift
//  Pali-N-Drom
//
//  Created by Анастасия Ларина on 01.06.2021.
//

import UIKit

class MainViewController: UIViewController, UIGestureRecognizerDelegate {

    // MARK: - Outlets
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var maxPalindromLadel: UILabel!
    @IBOutlet weak var numberOfCharactersLabel: UILabel!
    
    // MARK: - Life cicles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.hideKeyboardOnSwipeDown))
        swipeDown.delegate = self
        swipeDown.direction =  UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    // MARK: - Action
    
    @IBAction func findPalindrome(_ sender: Any) {
        let text = textField.text?.lowercased() ?? ""
        let palindromes = allPalindromes(str: text)
        let maxPalindrom = maxPalindrome(palindromes)
        maxPalindromLadel.text = "Palindrome of maximum length: \(maxPalindrom)"
        numberOfCharactersLabel.text = "The number of characters in the palindrome: \(maxPalindrom.count)"
    }
    
    @IBAction func updateText(_ sender: Any) {
        maxPalindromLadel.text = ""
        numberOfCharactersLabel.text = ""
        textField.text = ""
    }
    
    // MARK: - Find palindrome func
    
    func allPalindromes(str: String) -> [String] {
        var palindromes: [String] = []
        
        if let firstChar = str.first,
           let firstIndex = str.firstIndex(of: firstChar),
           let lastChar = str.last,
           let lastIndex = str.lastIndex(of: lastChar) {
            var k = 0
            for char in str {
                if str.firstIndex(of: char) != nil {
                    let substring = str[str.index(firstIndex, offsetBy: k)...lastIndex]
                    var n = 0
                    for _ in substring {
                        if let firstSubstringChar = substring.first,
                           let firstSubstringIndex = substring.firstIndex(of: firstSubstringChar) {
                            let subSubstring = substring[firstSubstringIndex...substring.index(firstSubstringIndex, offsetBy: n)]
                            if String(subSubstring) == String(subSubstring.reversed()) {
                                palindromes.append(String(subSubstring))
                            }
                            n += 1
                        }
                    }
                }
                k += 1
            }
        
    }
    return palindromes
}
    
    func maxPalindrome(_ array: [String]) -> String {
        var longestString = ""
        for string in array {
            longestString = string.count > longestString.count ? string : longestString
        }
        return longestString
    }
  
    // MARK: - Keyboard
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            return true
        }
    
    @objc func hideKeyboardOnSwipeDown() {
            view.endEditing(true)
        }
    
    
}
