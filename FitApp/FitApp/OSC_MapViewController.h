//
//  OSC_MapViewController.h
//  FitApp
//
//  Created by MAC-08 on 18/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
@interface OSC_MapViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *distance;
@property (weak, nonatomic) IBOutlet UILabel *vitesse;
@property (weak, nonatomic) IBOutlet UILabel *vMoy;
@property (weak, nonatomic) IBOutlet UIView *viewInfo;
@property (weak, nonatomic) IBOutlet UIButton *goTO;
@property (weak, nonatomic) IBOutlet UIButton *testNav;


@property (strong, nonatomic) IBOutlet GMSMapView *mapView;
@end
