//
//  ViewController.swift
//  LZCameraReferenceLineDemo
//
//  Created by lzw on 2020/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        let referenceLineView =  ReferenceLineView.init(frame: self.view.bounds, row: 3, colum: 3)
        self.view.addSubview(referenceLineView)
    }

}

