# whereyat-swift
Swift class for Where Y'at IP-based geolocation.

## How to Use
It's pretty easy:

```swift
WhereYat.locate { (location, error) in
	if (error == nil) {
    // location looks like this:
    // var success:Bool = false // eg. true
    // var city:String? // eg. "New Orleans"
    // var metro_code:NSNumber? // eg. "504"
    // var country:String? // eg. "United States"
    // var country_code_:String? // eg. "US"
    // var time_zone:String? // eg. "America/Chicago"
    // var longitude:NSNumber? // eg. "30.123"
    // var latitude:NSNumber? // eg. "-90.001"
    // var ip:String? // eg. "1.2.3.4"
    // var subdivisions:[Dictionary<String, String>]? // e.g. [{name: "Louisiana"}]
    //
    // Now that you have this information,
    // Do your job here
    //
    //
	}
}
```

## Where's This From?
[WhereYat](http://www.wherey.at/) was originally built as a responsive Javascript tool. It's pretty nice, you should check it out.

## License?
This is MIT licensed, so whatever.

## Contributions?
Yes, please. Taking pull requests here.