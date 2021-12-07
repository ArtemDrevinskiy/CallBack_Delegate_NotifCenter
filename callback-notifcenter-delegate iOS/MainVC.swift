//
//  MainVC.swift
//  callback-notifcenter-delegate iOS
//
//  Created by Artemius on 07.12.2021.
//

import UIKit

public class MainVC: UIViewController {
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let firstVC = FirstVC()
        firstVC.modalPresentationStyle = .fullScreen
        self.present(firstVC, animated: false, completion: nil)
    }
}
