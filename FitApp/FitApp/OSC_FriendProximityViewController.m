//
//  OSC_FriendProximityViewController.m
//  FitApp
//
//  Created by MAC-08 on 31/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import "OSC_FriendProximityViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>
@interface OSC_FriendProximityViewController ()

@end

@implementation OSC_FriendProximityViewController

GMSMutablePath *path;
CLLocation *location;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   location=[[CLLocation alloc] init];

    NSLog(@"latitude : %f",_proxyMap.myLocation.coordinate.latitude);
    NSLog(@"longitude : %f",_proxyMap.myLocation.coordinate.longitude);
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:self.proxyMap.myLocation.coordinate.latitude
                                                            longitude:self.proxyMap.myLocation.coordinate.longitude
                                                                 zoom:5];
    
    path = [GMSMutablePath path];
    
    
    self.proxyMap = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    _proxyMap.myLocationEnabled = YES;
    self.proxyMap = _proxyMap;

    
    // ENABLE LOCATION COMPASS ...
    _proxyMap.myLocationEnabled = YES;
    _proxyMap.settings.compassButton = YES;
    _proxyMap.settings.myLocationButton = YES;
    _proxyMap.settings.indoorPicker = NO;
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
