//
//  Color.swift
//  ATLearningGame
//
//  Created by Alvin Tu on 1/23/21.
//  Copyright © 2021 Alvin Tu. All rights reserved.
//

import Foundation
import UIKit

struct Color {
    let text: String
    let color: UIColor
    let resource: String
    let ext: String
    init(text: String, color: UIColor, resource: String, ext:String) {
        self.text   = text
        self.color = color
        self.resource  = resource
        self.ext  = ext
    }
}
