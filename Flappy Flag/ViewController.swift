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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.label!.text = "USA"
		WhereYat.locate { (location, error) in
			if (error == nil) {
				self.label!.text = location?.country
			}
		}
	}

}

