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
        
        addButton(with: UIColor.red, and: FIRST_BUTTON_FRAME )
        addButton(with: UIColor.orange, and: SECOND_BUTTON_FRAME )
        
    }
    func addButton(with color:UIColor, and frame:CGRect){
        let redButton = UIButton(frame: frame)
        redButton.backgroundColor = color
        view.addSubview(redButton)
    }
    
    
}
