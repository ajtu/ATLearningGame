//
//  ViewController.swift
//  ATLearningGame
//
//  Created by Alvin Tu on 10/25/20.
//  Copyright © 2020 Alvin Tu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //        view.backgroundColor = UIColor.red
        
        setupUI()
        
    }
    
    
    func setupUI(){
        let VIEW_HEIGHT = view.frame.size.height
        let VIEW_WIDTH = view.frame.size.width
        let FIRST_BUTTON_FRAME = CGRect(x: 0, y: 0, width: VIEW_WIDTH/2, height: VIEW_HEIGHT )
        let SECOND_BUTTON_FRAME = CGRect(x: VIEW_WIDTH/2, y: 0, width: VIEW_WIDTH/2, height: VIEW_HEIGHT )
        
//        addButton(with: UIColor.red, and: FIRST_BUTTON_FRAME )
//        addButton(with: UIColor.orange, and: SECOND_BUTTON_FRAME )
        
        let redButton = UIButton(frame: FIRST_BUTTON_FRAME)
        redButton.backgroundColor = UIColor.red
        redButton.addTarget(self,
        action: #selector(displayLeft),
        for: .touchUpInside)
        
        let yellowButton = UIButton(frame: SECOND_BUTTON_FRAME)
        yellowButton.backgroundColor = UIColor.yellow
        yellowButton.addTarget(self,
        action: #selector(displayRight),
        for: .touchUpInside)
        
        view.addSubview(redButton)
        view.addSubview(yellowButton)

    }
    @objc func displayLeft(){
        let VIEW_HEIGHT = view.frame.size.height
        let VIEW_WIDTH = view.frame.size.width
        let FIRST_BUTTON_FRAME = CGRect(x: VIEW_WIDTH/4, y: 0, width: VIEW_WIDTH/2, height: VIEW_HEIGHT )

        let redLabel = UILabel(frame: FIRST_BUTTON_FRAME)
//        yellowLabel.backgroundColor = UIColor.black
        redLabel.text = "RED"
        view.addSubview(redLabel)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            // code to remove your view
            redLabel.removeFromSuperview()
        }

    }
    @objc func displayRight(){
        let VIEW_HEIGHT = view.frame.size.height
        let VIEW_WIDTH = view.frame.size.width
        let SECOND_BUTTON_FRAME = CGRect(x: VIEW_WIDTH/1.50, y: 0, width: VIEW_WIDTH/2, height: VIEW_HEIGHT )

          let yellowLabel = UILabel(frame: SECOND_BUTTON_FRAME)
  //        yellowLabel.backgroundColor = UIColor.black
          yellowLabel.text = "YELLOW"

          view.addSubview(yellowLabel)
          DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
              // code to remove your view
              yellowLabel.removeFromSuperview()
          }

    }

    
}
