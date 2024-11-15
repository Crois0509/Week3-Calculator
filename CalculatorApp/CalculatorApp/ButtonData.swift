//
//  ButtonData.swift
//  CalculatorApp
//
//  Created by 장상경 on 11/12/24.
//

import UIKit

class ButtonData {
    // 계산기에 들어갈 버튼 선언
    let firstRow = ["7", "8", "9", "+"]
    let secondRow = ["4", "5", "6", "-"]
    let thirdRow = ["1", "2", "3", "*"]
    let fourthRow = ["AC", "0", "=", "/"]
    
    var buttonRowList: [[String]]
    
    init() {
        self.buttonRowList = [firstRow, secondRow, thirdRow, fourthRow]
    }
    
    /// 파라미터 변수를 UIButton 배열로 반환해주는 함수
    /// - Parameter rows: UIButton으로 변환할 데이터
    /// - Returns: 변환된 UIButton을 담은 배열 -> [UIButton]
    func setButtonRow(_ rows: [[String]]) -> [[UIButton]] {
        var buttons = [UIButton]()
        var buttonsList = [[UIButton]]()
        
        for row in rows {
            for data in row {
                let button = UIButton()
                var config = UIButton.Configuration.filled()
                
                var titleAttr = AttributedString.init(data)
                titleAttr.font = .systemFont(ofSize: 30, weight: .bold)
                
                config.attributedTitle = titleAttr
                config.baseBackgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
                config.baseForegroundColor = .white
                config.cornerStyle = .capsule
                
                button.configuration = config
                button.translatesAutoresizingMaskIntoConstraints = false
                
                button.configurationUpdateHandler = { 
                    switch $0.state {
                    case .normal:
                        $0.configuration?.baseBackgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
                        $0.configuration?.baseForegroundColor = .white
                        
                    case .highlighted:
                        $0.configuration?.baseBackgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0).withAlphaComponent(0.7)
                        $0.configuration?.baseForegroundColor = .white.withAlphaComponent(0.7)
                        
                    default:
                        break
                    }
                }
                
                NSLayoutConstraint.activate([
                    button.heightAnchor.constraint(equalToConstant: 80),
                    button.widthAnchor.constraint(equalToConstant: 80)
                ])
                
                buttons.append(button)
            }
            
            buttonsList.append(buttons)
            buttons.removeAll()
            
        }
        
        return buttonsList
    }
}

