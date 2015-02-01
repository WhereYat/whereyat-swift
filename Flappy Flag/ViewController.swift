//
//  ViewController.swift
//  Flappy Flag
//
//  Created by Zane Shannon on 2/1/15.
//  Copyright (c) 2015 Where Y'at. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet var label:UILabel?
	@IBOutlet var sublabel:UILabel?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		WhereYat.locate { (location, error) in
			if (error == nil) {
				self.label!.text = location?.city
				self.sublabel!.text = location?.country
			}
		}
	}

}

