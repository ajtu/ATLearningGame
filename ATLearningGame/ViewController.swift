//
//  ViewController.swift
//  ATLearningGame
//
//  Created by Alvin Tu on 10/25/20.
//  Copyright © 2020 Alvin Tu. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    var tapCounter: Int = 0
    var colors: [Color?] = []
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        colors = drawColors()
        setupUI()

    }
    
    
    func setupUI(){
        

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
            redButton.alpha = 0
        yellowButton.alpha = 0
        view.addSubview(redButton)
        view.addSubview(yellowButton)
        redButton.fadeIn()
        yellowButton.fadeIn()

        }
    }
    @objc func displayLeft(){
        let leftColor = colors[0]

        tapCounter += 1
        let VIEW_HEIGHT = view.frame.size.height
        let VIEW_WIDTH = view.frame.size.width
        let FIRST_BUTTON_FRAME = CGRect(x: 50, y: 0, width: VIEW_WIDTH/2, height: VIEW_HEIGHT )
        
        let leftLabel = UILabel(frame: FIRST_BUTTON_FRAME)
        if let color = leftColor {
            leftLabel.alpha = 0
            leftLabel.text = color.text
            playSound(resource: color.resource, ext: color.ext)
            leftLabel.fadeIn(completion: {
                    (finished: Bool) -> Void in
                    leftLabel.fadeOut()
                    })

        }
        leftLabel.font = UIFont.systemFont(ofSize: 88)
        
        view.addSubview(leftLabel)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.88) {
//            leftLabel.removeFromSuperview()
//        }
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
            rightLabel.alpha = 0
                     rightLabel.text = color.text
            playSound(resource: color.resource, ext: color.ext)
                     rightLabel.fadeIn(completion: {
                             (finished: Bool) -> Void in
                             rightLabel.fadeOut()
                             })        }
        
        
        rightLabel.textColor = UIColor.white
        rightLabel.font = UIFont.systemFont(ofSize: 88)
        view.addSubview(rightLabel)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.88) {
//            rightLabel.removeFromSuperview()
//        }
        
        if tapCounter%5 == 0 {
            colors.removeAll()
            for view in self.view.subviews {
                view.fadeOut()
            }

            colors = drawColors()
            setupUI()

        }
    }
    
    func drawColors()-> [Color?]{
        let yellow = Color(text: "YELLOW", color: UIColor.yellow, resource:"yellow", ext:"wav")
        let red = Color(text: "RED", color: UIColor.red, resource:"red", ext:"wav")
        let purple = Color(text: "PURPLE", color: UIColor.purple, resource:"purple", ext:"wav")
        let blue = Color(text: "BLUE", color: UIColor.blue, resource:"blue", ext:"wav")
        let orange = Color(text: "ORANGE", color: UIColor.orange, resource:"orange", ext:"wav")
        let indigo = Color(text: "GREEN", color: UIColor.green, resource:"green", ext:"wav")
        
        let colors = [yellow, red, purple, blue, orange ,indigo ]
        
        let color1 = colors.randomElement()
        let color2 = colors.randomElement()
        return [color1, color2]
    }
    
    func playSound(resource:String, ext:String) {
        guard let url = Bundle.main.url(forResource: resource, withExtension: ext) else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }

    
    
}
