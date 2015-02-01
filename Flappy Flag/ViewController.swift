//
//  ViewController.swift
//  Flappy Flag
//
//  Created by Zane Shannon on 2/1/15.
//  Copyright (c) 2015 Where Y'at. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet var flag:UIImageView?
	@IBOutlet var label:UILabel?
	@IBOutlet var sublabel:UILabel?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		WhereYat.locate { (location, error) in
			if (error == nil) {
				self.label!.text = location?.country
				var divisions:[String] = []
				if let city = location?.city { divisions.append(city) }
				if let state = location?.subdivisions?.first { divisions.append(state["name"]!) }
				if let country = location?.country { divisions.append(country) }
				if let country_code = location?.country_code {
					let url = NSURL(string: "http://flagpedia.net/data/flags/normal/\(country_code.lowercaseString).png")
					if let data = NSData(contentsOfURL: url!) {
						self.flag!.image = UIImage(data: data)
						let rotationAnimation = CABasicAnimation(keyPath:"transform.rotation.z")
						rotationAnimation.toValue = (M_PI * 2.0) * 0.025
						rotationAnimation.duration = 0.5
						rotationAnimation.autoreverses = true
						rotationAnimation.repeatCount = 10000000
						rotationAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
						self.flag!.layer.addAnimation(rotationAnimation, forKey: "rotationAnimation")
					}
				}
				self.sublabel!.text = ", ".join(divisions)
			}
		}
	}

}

