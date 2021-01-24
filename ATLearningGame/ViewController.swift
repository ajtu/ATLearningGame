//
//  ViewController.swift
//  ATLearningGame
//
//  Created by Alvin Tu on 10/25/20.
//  Copyright © 2020 Alvin Tu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tapCounter: Int = 0
    var colors: [Color?] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colors = drawColors()
        setupUI()

    }
    
    
    func setupUI(){
        for view in self.view.subviews {
            view.removeFromSuperview()
        }
        

        let VIEW_HEIGHT = view.frame.size.height
        let VIEW_WIDTH = view.frame.size.width
        let FIRST_BUTTON_FRAME = CGRect(x: 0, y: 0, width: VIEW_WIDTH/2, height: VIEW_HEIGHT )
        let SECOND_BUTTON_FRAME = CGRect(x: VIEW_WIDTH/2, y: 0, width: VIEW_WIDTH/2, height: VIEW_HEIGHT )
        guard colors.count > 1 else {return}
        if let leftColor = colors[0],
            let rightColor = colors[1] {

        let redButton = UIButton(frame: FIRST_BUTTON_FRAME)
        redButton.backgroundColor = leftColor.color
        redButton.addTarget(self,
                            action: #selector(displayLeft),
                            for: .touchUpInside)
        
        let yellowButton = UIButton(frame: SECOND_BUTTON_FRAME)
        yellowButton.backgroundColor = rightColor.color
        yellowButton.addTarget(self,
                               action: #selector(displayRight),
                               for: .touchUpInside)
        
        view.addSubview(redButton)
        view.addSubview(yellowButton)
        }
    }
    @objc func displayLeft(){
        
        tapCounter += 1
        let VIEW_HEIGHT = view.frame.size.height
        let VIEW_WIDTH = view.frame.size.width
        let FIRST_BUTTON_FRAME = CGRect(x: 50, y: 0, width: VIEW_WIDTH/2, height: VIEW_HEIGHT )
        
        let leftColor = colors[0]
        let leftLabel = UILabel(frame: FIRST_BUTTON_FRAME)
        if let color = leftColor {
            leftLabel.text = color.text
        }
        leftLabel.font = UIFont.systemFont(ofSize: 88)
        
        view.addSubview(leftLabel)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.88) {
            leftLabel.removeFromSuperview()
        }
        if tapCounter%5 == 0 {
            colors.removeAll()
            colors = drawColors()
            setupUI()

        }

        
    }
    @objc func displayRight(){
        tapCounter += 1
        let VIEW_HEIGHT = view.frame.size.height
        let VIEW_WIDTH = view.frame.size.width
        let SECOND_BUTTON_FRAME = CGRect(x: VIEW_WIDTH/2 + 10, y: 0, width: VIEW_WIDTH/2, height: VIEW_HEIGHT )
        let rightColor = colors[1]
        
        let rightLabel = UILabel(frame: SECOND_BUTTON_FRAME)
        if let color = rightColor {
            rightLabel.text = color.text
        }
        
        
        rightLabel.textColor = UIColor.black
        rightLabel.font = UIFont.systemFont(ofSize: 88)
        view.addSubview(rightLabel)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.88) {
            rightLabel.removeFromSuperview()
        }
        
        if tapCounter%8 == 0 {
            colors.removeAll()
            colors = drawColors()
            setupUI()

        }
    }
    
    func drawColors()-> [Color?]{
        let yellow = Color(text: "YELLOW", color: UIColor.yellow, soundByte: "")
        let red = Color(text: "RED", color: UIColor.red, soundByte: "")
        let purple = Color(text: "PURPLE", color: UIColor.purple, soundByte: "")
        let blue = Color(text: "BLUE", color: UIColor.blue, soundByte: "")
        let orange = Color(text: "ORANGE", color: UIColor.orange, soundByte: "")
        let indigo = Color(text: "GREEN", color: UIColor.green, soundByte: "")
        
        let colors = [yellow, red, purple, blue, orange ,indigo ]
        
        let color1 = colors.randomElement()
        let color2 = colors.randomElement()
        return [color1, color2]
    }
    
    
}
