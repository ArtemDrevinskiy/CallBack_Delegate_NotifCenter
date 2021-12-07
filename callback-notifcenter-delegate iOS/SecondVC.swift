//
//  SecondVC.swift
//  callback-notifcenter-delegate iOS
//
//  Created by Artemius on 07.12.2021.
//

import UIKit

public class SecondVC: UIViewController {
    
    public var greenButton: UIButton!
    public var redButton: UIButton!
    // callback
    var completion: ((String) -> ())?
    // delegate
    var colorUpdateDelegate: ColorUpdateDelegate?
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configureRedButton()
        configureGreenButton()
        self.view.addSubview(greenButton)
        self.view.addSubview(redButton)
    }

    
    func configureGreenButton() {
        let width = 100
        let x = self.view.center.x - CGFloat(width/2)
        greenButton = UIButton(frame: CGRect(x: Int(x), y: 200, width: width, height: 40))
        greenButton.setTitle("Green", for: .normal)
        greenButton.setTitleColor(.white, for: .normal)
        greenButton.backgroundColor = .green
        greenButton.addTarget(self, action: #selector(greenButtonTapped), for: .touchUpInside)
    }
    func configureRedButton() {
        let width = 100
        let x = self.view.center.x - CGFloat(width/2)
        redButton = UIButton(frame: CGRect(x: Int(x), y: 300, width: width, height: 40))
        redButton.setTitle("Red", for: .normal)
        redButton.setTitleColor(.white, for: .normal)
        redButton.backgroundColor = .red
        redButton.addTarget(self, action: #selector(redButtonTapped), for: .touchUpInside)
    }
    
    @objc
    public func greenButtonTapped() {
        /// callback
        //completion?("green")
        /// delegate
        //colorUpdateDelegate?.update(textColor: "green")
        /// notification center
        let dictionary = ["color": "green"]
        NotificationCenter.default.post(name: Notification.Name(rawValue: "updateLabelColor"), object: nil, userInfo: dictionary)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc
    public func redButtonTapped() {
        /// callback
        //completion?("red")
        /// delegate
        //colorUpdateDelegate?.update(textColor: "red")
        /// notification center
        let dictionary = ["color": "red"]
        NotificationCenter.default.post(name: Notification.Name(rawValue: "updateLabelColor"), object: nil, userInfo: dictionary)

        self.dismiss(animated: true, completion: nil)
    }
    
}
