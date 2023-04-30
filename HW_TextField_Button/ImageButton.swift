//
//  ImageButton.swift
//  HW_TextField_Button
//
//  Created by 曹家瑋 on 2023/4/30.
//

import UIKit

// 設置button點選時變半透明
class ImageButton: UIButton {

    required init?(coder: NSCoder) {
            super.init(coder: coder)
            
            configurationUpdateHandler = { button in
                
                button.alpha = button.isHighlighted ? 0.5 : 1
            }
        }

}
