//
//  TextViewController.swift
//  Psychologist
//
//  Created by Dana Gregg on 11/22/15.
//  Copyright © 2015 Dana Gregg. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.text = text
        }
    }
    
    var text: String = "" {
        didSet {
            textView?.text = text
        }
    }

}
