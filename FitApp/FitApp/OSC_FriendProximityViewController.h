//
//  OSC_FriendProximityViewController.h
//  FitApp
//
//  Created by MAC-08 on 31/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
@interface OSC_FriendProximityViewController : UIViewController <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet GMSMapView *proxyMap;

@end
