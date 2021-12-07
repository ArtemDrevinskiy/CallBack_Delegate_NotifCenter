//
//  FirstVC.swift
//  callback-notifcenter-delegate iOS
//
//  Created by Artemius on 07.12.2021.
//

import UIKit


protocol ColorUpdateDelegate {
    func update(textColor: String)
}

public class FirstVC: UIViewController {
    
    public var textLabel: UILabel!
    public var nextVCButton: UIButton!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configureText()
        configureButton()
        self.view.addSubview(textLabel)
        self.view.addSubview(nextVCButton)
        
        // Notification Center
        NotificationCenter.default.addObserver(self, selector: #selector(updateLabelColor), name: NSNotification.Name(rawValue: "updateLabelColor"), object: nil)
    }
    
    @objc
    func updateLabelColor(notification: Notification) {
        guard let userInfo = notification.userInfo, let labelColor = userInfo["color"] as? String else {
            return
        }
        switch labelColor {
        case "green":
            textLabel.textColor = .green
        case "red":
            textLabel.textColor = .red
        default:
            return
        }
        
    }
    func configureText() {
        let width = 200
        let x = self.view.center.x - CGFloat(width/2)
        textLabel = UILabel(frame: CGRect(x: Int(x), y: 100, width: width, height: 50))
        textLabel.text = "Hello world"
        textLabel.textAlignment = .center
        textLabel.layer.borderWidth = 3
    }
    
    func configureButton() {
        let width = 100
        let x = self.view.center.x - CGFloat(width/2)
        nextVCButton = UIButton(frame: CGRect(x: Int(x), y: 300, width: width, height: 40))
        nextVCButton.setTitle("Next", for: .normal)
        nextVCButton.setTitleColor(.black, for: .normal)
        nextVCButton.backgroundColor = .yellow
        nextVCButton.addTarget(self, action: #selector(nextVCButtonTapped), for: .touchUpInside)
    }
    
    @objc
    public func nextVCButtonTapped() {
        let secondVC = SecondVC()
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.colorUpdateDelegate = self
        // delegate
//        secondVC.completion = { [weak self] color in
//            switch color {
//            case "green":
//                self?.textLabel.textColor = .green
//            case "red":
//                self?.textLabel.textColor = .red
//
//            default:
//                return
//            }
//
//        }
        self.present(secondVC, animated: false, completion: nil)
    }
    
}

extension FirstVC: ColorUpdateDelegate {
    func update(textColor: String) {
        switch textColor {
        case "green":
            textLabel.textColor = .green
        case "red":
            textLabel.textColor = .red
        default:
            return
        }
    }
}
