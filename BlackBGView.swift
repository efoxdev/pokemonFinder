//
//  BlackBGView.swift
//  Startrivia
//
//  Created by Ethan Fox on 1/25/21.
//

import UIKit

class BlackBGView: UIView {
    
    override func awakeFromNib() {
        layer.backgroundColor = CYAN_BG
        layer.cornerRadius = 10
    }
    
}

class BlackBGButton: UIButton {
    
    override func awakeFromNib() {
        layer.backgroundColor = CYAN_BG
        layer.cornerRadius = 10
    }
}

class BlackIconView: UIView {
    override func awakeFromNib() {
        layer.backgroundColor = CYAN_BG
        layer.cornerRadius = 10
    }
}
