# HSClusterMapView

## Description

HSClusterMapView is a subclass of GMSMapView (Google iOS SDK Map) which clusters groups of GMSMarkers and replaces them with a single GMSMarker, enabling the developer to generate a custom UIImage for each cluster marker on the fly. 

Also included is a GMSMapView subclass, HSMapView, which will keep track of the markers on the GMSMapView for the developer. This is unlike the stock GMSMapView, which forces the developer to keep the GMSMarker objects they want to show on the map in data structure external to GMSMapView.

HSClusterMapView and HSMapView aim to provide clean map interfaces to work with the Google Maps for iOS SDK.

## Requirements

Include the Google Maps for iOS SDK in the same project as HSClusterMapView.

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

HSClusterMapView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "HSClusterMapView"
```

## License

HSClusterMapView is available under the MIT license. See the LICENSE file for more info.
