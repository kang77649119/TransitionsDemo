//
//  Demo3PresentVC.swift
//  TransitionsDemo
//
//  Created by 也许、 on 2017/10/26.
//  Copyright © 2017年 也许、. All rights reserved.
//

import UIKit

class Demo3PresentVC: UIViewController {

    lazy var showImageView:UIImageView = {
        let imgView:UIImageView = UIImageView(frame: self.view.bounds)
        imgView.contentMode = .scaleAspectFit
        imgView.image = UIImage(named: "demo2")
        return imgView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }

}

extension Demo3PresentVC {
    
    func setupUI() {
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(showImageView)
    }
    
}
