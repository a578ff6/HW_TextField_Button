//
//  ViewController.swift
//  HW_TextField_Button
//
//  Created by 曹家瑋 on 2023/4/29.
//

import UIKit
// 導入 AVFoundation
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var constellationTextField: UITextField!
    @IBOutlet weak var fortuneMonthTextField: UITextField!
    @IBOutlet weak var personalityTraitTextField: UITextField!
    @IBOutlet weak var goalTextField: UITextField!
    @IBOutlet weak var resultTextView: UITextView!
    @IBOutlet weak var startAnalysisButton: UIButton!
    @IBOutlet weak var clearContentButton: UIButton!
    
    // 產生說話的合成器
    let synthesizer = AVSpeechSynthesizer()
    
    // 設置停止語音 function
    func stopSpeak() {
        synthesizer.stopSpeaking(at: .immediate)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // startAnalysisButton 漸層
        let startButtonGradientLayer = CAGradientLayer()
        startButtonGradientLayer.colors = [CGColor(srgbRed: 1, green: 127/255, blue: 80/255, alpha: 1), CGColor(srgbRed: 1, green: 228/255, blue: 196/255, alpha: 1)]
        startButtonGradientLayer.locations = [0.0, 1.0]
        startButtonGradientLayer.frame = startAnalysisButton.bounds
        startAnalysisButton.layer.insertSublayer(startButtonGradientLayer, at: 0)
        
        // Button 漸層、圓角屬性
        startAnalysisButton.layer.cornerRadius = 20.0
        startAnalysisButton.clipsToBounds = true

        // clearContentButton 漸層
        let clearButtonGradientLayer = CAGradientLayer()
        clearButtonGradientLayer.colors = [CGColor(srgbRed: 1, green: 127/255, blue: 80/255, alpha: 1), CGColor(srgbRed: 1, green: 228/255, blue: 196/255, alpha: 1)]
        clearButtonGradientLayer.locations = [0.0, 1.0]
        clearButtonGradientLayer.frame = clearContentButton.bounds
        clearContentButton.layer.insertSublayer(clearButtonGradientLayer, at: 0)
    
        // Button 漸層、圓角屬性
        clearContentButton.layer.cornerRadius = 20.0
        clearContentButton.clipsToBounds = true

        // 點擊畫面上的任何一個位置時，鍵盤就會自動收起。建立一個 UITapGestureRecognizer 物件
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        // 設定觸發手勢的數量為 1
        tapGesture.numberOfTouchesRequired = 1
        // 將手勢加到畫面上
        view.addGestureRecognizer(tapGesture)
        
    }

    // 開始分析
    @IBAction func startAnalysisButtonPressed(_ sender: Any) {
        
        // 輸入的訊息
        let message = "嗨，\(nameTextField.text!)，讓我這個星座大師來給你分析\(constellationTextField.text!)在\(fortuneMonthTextField.text!)月的運勢吧！\n\(constellationTextField.text!)的朋友們這個月的運勢可以用「火熱」來形容。\n由於你們\(personalityTraitTextField.text!)，這個月會充滿各種機會和挑戰，可以說是非常忙碌的一個月。  \n整體而言，\(constellationTextField.text!)需要保持冷靜和客觀的態度，才能充分發揮自己的能力，面對這個\(goalTextField.text!)的挑戰。"
        
        // 語音設定
        let utteranceToSpeak = AVSpeechUtterance(string: message)
        utteranceToSpeak.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        utteranceToSpeak.pitchMultiplier = 1.3
        utteranceToSpeak.rate = 0.5
        synthesizer.speak(utteranceToSpeak)
        
        // TextView屬性 (要在加強了解)
        let messageParagraphStyle = NSMutableParagraphStyle()
        messageParagraphStyle.lineSpacing = 5
        
        let messageAttributedString = NSMutableAttributedString(string: message)
        messageAttributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: messageParagraphStyle, range: NSMakeRange(0, messageAttributedString.length))
        messageAttributedString.addAttribute(NSAttributedString.Key.font, value: UIFont(name: "jf-openhuninn-2.0", size: 15)!, range: NSMakeRange(0, messageAttributedString.length))
        
        resultTextView.attributedText = messageAttributedString
        
        
    }
    
    // 清除內容、停止語音
    @IBAction func clearButtonTapped(_ sender: Any) {
        
        // 清除TextField、TextView
        nameTextField.text = ""
        constellationTextField.text = ""
        fortuneMonthTextField.text = ""
        personalityTraitTextField.text = ""
        goalTextField.text = ""
        resultTextView.text = ""
        
        // 停止語音
        stopSpeak()
        
    }
    
    // 收起鍵盤
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}





