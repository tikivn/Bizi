//
//  ViewController.swift
//  Foo
//
//  Created by LAP00718 on 27/01/2021.
//

import UIKit

final class ViewController: UIViewController {
    
    init() {
        super.init(
            nibName: String(describing: Self.self),
            bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
