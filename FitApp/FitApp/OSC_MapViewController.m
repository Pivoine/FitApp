//
//  OSC_MapViewController.m
//  FitApp
//
//  Created by MAC-08 on 18/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import "OSC_MapViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>

@interface OSC_MapViewController ()

@end

@implementation OSC_MapViewController
{
    CLLocationManager *locationManager;
    CLLocation *location;
    GMSMutablePath *path;
    GMSPolyline *rectangle;
    CLLocationDirection locationDistance;
    
    NSDate *previousDate;
    
    NSDate *today;
    NSDateFormatter *dateFormatter;
    NSString *currentTime;
    
    NSMutableArray *vitessMoy;
    NSMutableArray *sommeLocation;
    int sommeVitesse;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
          sommeVitesse=0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    location=[[CLLocation alloc] init];
    vitessMoy=[[NSMutableArray alloc] init];
    sommeLocation=[[NSMutableArray alloc] init];
    locationManager = [[CLLocationManager alloc] init];
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    locationManager.distanceFilter=100.0f;
    [locationManager startUpdatingLocation];
    previousDate=today;
    NSLog(@"latitude : %f",_mapView.myLocation.coordinate.latitude);
     NSLog(@"longitude : %f",_mapView.myLocation.coordinate.longitude);
    // GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:location.coordinate.latitude
    //                                                         longitude:location.coordinate.longitude
    //                                                             zoom:5];
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:_mapView.myLocation.coordinate.latitude
                                                            longitude:_mapView.myLocation.coordinate.longitude
                                                                 zoom:5];
    
    path = [GMSMutablePath path];
    
    
    self.mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    _mapView.myLocationEnabled = YES;
    self.view = _mapView;
    [_mapView addSubview: _viewInfo];
    [_mapView addSubview:_goTO];
    [_mapView addSubview:_testNav];
    
    // ENABLE LOCATION COMPASS ...
    _mapView.myLocationEnabled = YES;
    _mapView.settings.compassButton = YES;
    _mapView.settings.myLocationButton = YES;
    _mapView.settings.indoorPicker = NO;
    
    today= [NSDate date];
    dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterFullStyle];
    currentTime = [dateFormatter stringFromDate:today];
    NSLog(@"User's current time in their preference format:%@",currentTime);
    
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    location = newLocation;
    if (location != nil) {
        
        
        [path addCoordinate:CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)];
        rectangle = [GMSPolyline polylineWithPath:path];
        rectangle.map = _mapView;
        locationDistance =[oldLocation distanceFromLocation:newLocation]/1000;
        //_distance.text=  [NSString stringWithFormat:@"%.2d  KM",[NSNumber numberWithDouble:locationDistance]];
        NSLog(@"Distance %f", locationDistance);
        [sommeLocation addObject:location];
        
        _distance.text = [NSString stringWithFormat:@"%.2f   KM",[_distance.text floatValue]+ locationDistance];        
        today= [NSDate date];
        dateFormatter= [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterFullStyle];
        currentTime = [dateFormatter stringFromDate:today];
        NSTimeInterval distanceBetweenDates = [today timeIntervalSinceDate:previousDate];
        NSLog(@"difference de temps :%f",distanceBetweenDates);
        NSInteger minuteBetweenDates = distanceBetweenDates / 60;
        if ([_distance.text intValue ] == 0) {
            _vitesse.text= @"0";
        }
        else{
            _vitesse.text= [NSString stringWithFormat:@"%.2f   KM/H",(locationDistance*60)/minuteBetweenDates ];
            
            [vitessMoy addObject:[NSNumber numberWithInt:[_vitesse.text intValue] ]];
            
            for (int i=0; i<[vitessMoy count]; i++) {
                sommeVitesse= sommeVitesse + [[vitessMoy objectAtIndex:i]intValue];
            }
            _vMoy.text= [NSString stringWithFormat:@"%.2u  KM/H",sommeVitesse / [vitessMoy count] ];
            
        }
        
        previousDate=today;
        
    }
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
