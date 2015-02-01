//
//  WhereYat.swift
//  Flappy Flag
//
//  Created by Zane Shannon on 2/1/15.
//  Copyright (c) 2015 Where Y'at. All rights reserved.
//

import Foundation

public class WhereYat {
	
	public class func locate(completionHandler: (WhereYatLocation?, NSError?) -> Void) -> Void {
		let request = NSURLRequest(URL: NSURL(string: "https://ip.wherey.at/")!)
		let urlSession = NSURLSession.sharedSession()
		let dataTask = urlSession.dataTaskWithRequest(request) {
			(var data, var response, var error) in
			var location:WhereYatLocation? = nil
			if (error == nil) {
				var parseError : NSError?
				let jsonResponse = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &parseError) as Dictionary<String, AnyObject>
				location = WhereYatLocation(api_response: jsonResponse)
			} else {
				println(error)
			}
			dispatch_async(dispatch_get_main_queue()) {
				completionHandler(location, error)
			}
		}
		dataTask.resume()
	}
	
}

public class WhereYatLocation: NSObject {
	
	var success:Bool = false
	var city:String?
	var metro_code:NSNumber?
	var country:String?
	var time_zone:String?
	var longitude:NSNumber?
	var latitude:NSNumber?
	var ip:String?
	var subdivisions:[Dictionary<String, String>]?
	
	init(api_response: Dictionary<String, AnyObject>?) {
		if let response = api_response {
			if response["status"] as String? == "ok" {
				self.success = true
				self.city = response["city"] as String?
				self.metro_code = response["metro_code"] as NSNumber?
				self.country = response["country"] as String?
				self.time_zone = response["time_zone"] as String?
				self.longitude = response["longitude"] as NSNumber?
				self.latitude = response["latitude"] as NSNumber?
				self.ip = response["ip"] as String?
				self.subdivisions = response["subdivisions"] as [Dictionary<String, String>]?
			}
		}
		
	}
	
}