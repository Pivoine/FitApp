//
//  osc_ViewController.m
//  FitApp
//
//  Created by MAC-04 on 10/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import "osc_ViewController.h"
#import "OSC_UserManager.h"
#import <Parse/Parse.h>
#import "strings.h"
#include <math.h>




#define kFilteringFactor 0.1

@interface osc_ViewController ()

@end

@implementation osc_ViewController


//MANAGERS

@synthesize usermanager,planmanager,activitymanager ,statsmanager;

@synthesize  workouts, workoutScrollView, workoutsPng;

//STOPWATCH TOOLS
@synthesize startTimeInterval, stopTimeInterval, timeHour, timeMinute, timeSecond;


//WORKOUT ACTIVITY
@synthesize chosenSection, chosenWorkout, chosenWorkoutPng, workoutCounter, repeat,distance, speed, selectedWorkout, workoutImage;

//WORKOUT DETECTOR
@synthesize wdetector;

//COACH
@synthesize wrkc;

// PRIMITIVE TYPES
int hours, minutes, seconds;
int secondsLeft;
bool isShown = true;
int idChosenWorkout;

//ANIMATION TOOL
CATransition *animation;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // ***** INITIALIZE
    
    workouts = @[abs,cycling,footing,pullups,pushups,skippingRope];
    workoutsPng = @[absPng, cyclingPng, footingPng, pullupsPng, pushupsPng, skippingRopePng];
    
    [workoutImage setBackgroundImage:[UIImage imageNamed:workoutsPng[selectedWorkout]] forState:UIControlStateNormal];
    
  
    // ***** INITIALIZE WORKOUT COUNTER
    wdetector = [[OSC_WorkoutDetector alloc] init];
    workoutCounter = 0;
    
    
    //******************* INITIALIZING COACH
    wrkc = [[OSC_WorkoutCoach alloc] init];
    
    
}

//******************** INITIALIZE PROXIMITY SENSOR
-(void)enableProximitySensor{
    UIDevice *device = [UIDevice currentDevice];
    device.proximityMonitoringEnabled = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(proximityChanged:) name:@"UIDeviceProximityStateDidChangeNotification" object:device];
}

-(void)disableProximitySensor{
    
    UIDevice *device = [UIDevice currentDevice];
    device.proximityMonitoringEnabled = NO;
    
}

- (void)proximityChanged:(NSNotification *)notification {
	UIDevice *device = [notification object];
    if (device.proximityState == 1) {
        int j = [wdetector pushupsCounter];
        self.repeat.text = [NSString stringWithFormat:@"%d", j];
        
    } else {
        
    }
}


//******************** INITIALIZE ACCELEROMETER
-(void)enableAccelerometer{
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = .2;
    self.motionManager.gyroUpdateInterval = .2;
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
                                             withHandler:^(CMAccelerometerData  *accelerometerData, NSError *error) {
                                                 [self outputAccelertionData:accelerometerData.acceleration];
                                                 if(error){
                                                     
                                                     NSLog(@"%@", error);
                                                 }
                                             }];
}

-(void)outputAccelertionData:(CMAcceleration)acceleration
{
    switch (idChosenWorkout) {
            //Abs
        case 0:{
            self.repeat.text = [NSString stringWithFormat:@"%d", [wdetector absCounterWithAccX:acceleration.x AndAccY:acceleration.y AndAccZ:acceleration.z]];
        }
            break;
            //Pullups
        case 3:{
            self.repeat.text = [NSString stringWithFormat:@"%d", [wdetector pullupsCounterWithAccX:acceleration.x AndAccY:acceleration.y AndAccZ:acceleration.z]];
        }
            break;
            //skipping rope
        case 5:{
            
            self.repeat.text = [NSString stringWithFormat:@"%d", [wdetector jumpCounterWithAccX:acceleration.x AndAccY:acceleration.y AndAccZ:acceleration.z]];
        }
            break;
        default:
            break;
    }
    
    
}


//******************** START WORKOUT ANIMATION

-(void)startWorkoutAnimation{

    
    //SHOW/HIDE LABELS
    animation = [CATransition animation];
    animation.type = kCATransitionFade;
    animation.duration = 0.4;
    
    [speed.layer addAnimation:animation forKey:nil];
    [distance.layer addAnimation:animation forKey:nil];
    [repeat.layer addAnimation:animation forKey:nil];
    
    speed.hidden = YES;
    distance.hidden = YES;
    repeat.hidden = NO;
    
    
    //MOVE UP SELECTED WORKOUT
    
    [UIView beginAnimations:nil context:NULL]; // animate the following:
    chosenSection.frame = CGRectMake(self.chosenSection.frame.origin.x, chosenSection.frame.size.width - chosenSection.frame.size.width * 0.5, chosenSection.frame.size.width, chosenSection.frame.size.height);
    [UIView setAnimationDuration:100];
    [UIView commitAnimations];
    
}

//******************** HIDE WORKOUT ANIMATION

-(void)hideWorkoutAnimation{
    
    //MOVE DOWN SELECTED WORKOUT
    [UIView beginAnimations:nil context:NULL]; // animate the following:
    chosenSection.frame = CGRectMake(self.chosenSection.frame.origin.x, chosenSection.frame.size.width - chosenSection.frame.size.width * 0.25, chosenSection.frame.size.width, chosenSection.frame.size.height);
    [UIView setAnimationDuration:100];
    [UIView commitAnimations];
    
 
    
}


//******************** START FOOTING/CYCLING

-(void)startFootingAnimation{
    [self startWorkoutAnimation];
    
    //SHOW LABELS
    animation = [CATransition animation];
    animation.type = kCATransitionFade;
    animation.duration = 0.4;
    
    [speed.layer addAnimation:animation forKey:nil];
    [distance.layer addAnimation:animation forKey:nil];
    [repeat.layer addAnimation:animation forKey:nil];
    
    speed.hidden = NO;
    distance.hidden = NO;
    repeat.hidden = YES;
    
    
}


//*********************

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    wdetector = [[OSC_WorkoutDetector alloc] init];
}

//*************** Return Key

-(IBAction)textFieldReturn:(id)sender {
    [sender resignFirstResponder];
}

//*************** STOPWATCH

-(void) clockTime {
    seconds++;
    
    if (seconds == 60)
    {
        NSLog(@"%i", seconds);
        seconds = 0;
        minutes++;
        
        if (minutes == 60)
        {
            minutes = 0;
            hours++;
        }
    }
    
    self.timeSecond.text = [NSString stringWithFormat:@"%02i:%02i:%02i", hours, minutes, seconds];
    
}

- (IBAction)stopWorkout:(id)sender {
    NSLog(@"Stopped");
    [timer invalidate];
    timer = nil;
    
    [self hideWorkoutAnimation];
    [self disableProximitySensor];
    
    
    //GET TODAY'S DATE
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"MMM dd, yyyy"];
    NSString *dateString = [dateFormat stringFromDate:date];
    
    activitymanager = [[OSC_ActivityManager alloc] init];
    
    // Activity Name
    NSString *activityName = self.chosenWorkout.text;
    // Time
    int activityTime = seconds + minutes*60 + hours*3600 ;
    
    //[PFUser logInWithUsername:@"pivoine" password:@"pivoine"];
    
    switch ([activitymanager getActivityCode:[[activityName stringByReplacingOccurrencesOfString:@" " withString:@""] lowercaseString]]) {
            
        case 1 :{ //ABS
            NSLog(@"ABS SELECTED");
            // Compteur
            int activityCounter = [self.repeat.text intValue] ;
            //Save activity
            
            OSC_Abs *absActivity = [[OSC_Abs object] initWithTime:activityTime AndIsDone:TRUE AndDoneDate:dateString AndCalories:0 AndCounter:activityCounter];
            [activitymanager saveActivity:absActivity];
            
        }
            
            break;
        case 2 :{ //CYCLING
            NSLog(@"CYCLING SELECTED");
            // Compteur
            int activityDistance = [self.distance.text intValue];
            int activitySpeed = [self.speed.text intValue];
            //Save activity
            OSC_Cycling *c = [OSC_Cycling object];
            c.distance = activityDistance;
            c.speed = activitySpeed;
            c.calories = 0;
            
            //MEHER
            
            
            
        }
            break;
            
        case 3 :{ //FOOTING
            NSLog(@"FOOTING SELECTED");
            // Compteur
            //            int activityDistance = [self.distance.text intValue];
            //            int activitySpeed = [self.speed.text intValue];
            //Save activity
            
            //MEHER
            
        }
            break;
            
        case 4 :{ //PULLUPS
            
            NSLog(@"PULLUPS SELECTED");
            // Compteur
            int activityCounter = [self.repeat.text intValue] ;
            //Save activity
            
            OSC_Pullups *pullupsActivity = [[OSC_Pullups object] initWithTime:activityTime AndIsDone:TRUE AndDoneDate:dateString AndCalories:0 AndCounter:activityCounter];
            [activitymanager saveActivity:pullupsActivity];
            
        }
            break;
            
        case 5 :{ //PUSHUPS
            NSLog(@"PUSHUPS SELECTED");
            // Compteur
            int activityCounter = [self.repeat.text intValue] ;
            //Save activity
            OSC_Pushups *pushupsActivity = [[OSC_Pushups object] initWithTime:activityTime AndIsDone:TRUE AndDoneDate:dateString AndCalories:0 AndCounter:activityCounter];
            [activitymanager saveActivity:pushupsActivity];
            
        }
            break;
            
        case 6 :{ //SKIPPING ROPE
            NSLog(@"SKIPPING ROPE SELECTED");
            // Compteur
            int activityCounter = [self.repeat.text intValue] ;
            //Save activity
            OSC_SkippingRope *skippingRopeActivity = [[OSC_SkippingRope object] initWithTime:activityTime AndIsDone:TRUE AndDoneDate:dateString AndCalories:0 AndCounter:activityCounter];
            [activitymanager saveActivity:skippingRopeActivity];
        }
            break;
            
        default:
            break;
    }
    
    
    
}

- (IBAction)startWorkOut:(id)sender {
    NSLog(@"Started");
    wdetector = [[OSC_WorkoutDetector alloc] init];
    self.repeat.text = [NSString stringWithFormat:@"%d", 0] ;
    
    if (timer == nil)
    {
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0/1.0
                                                 target:self
                                               selector:@selector(clockTime)
                                               userInfo:nil
                                                repeats:YES];
        startTimeInterval = [NSDate date];
        
        
    }
    else
    {
        [timer invalidate];
        timer = nil;
        stopTimeInterval = [NSDate date];
        
        NSTimeInterval timeInterval = [stopTimeInterval timeIntervalSinceDate:startTimeInterval];
        totalTime += timeInterval;
        
        
        startButtonPressed = YES;
        
    }
    
    
    switch (idChosenWorkout) {
            //abs
        case 0:{
            //Abs
            [self startWorkoutAnimation];
            [self enableAccelerometer];
        }
            break;
            //cycling
        case 1:{
            [self startFootingAnimation];
        }
            break;
            //footing
        case 2:{
            [self startFootingAnimation];
        }
            break;
            //pullups
        case 3:{
            [self startWorkoutAnimation];
            [self enableAccelerometer];
        }
            break;
            //pushups
        case 4:{
            [self startWorkoutAnimation];
            [self enableProximitySensor];
        }
            break;
            //skipping rope
        case 5:{
            [self startWorkoutAnimation];
            [self enableAccelerometer];
        }
            break;
        default:
            break;
    }
    
}

-(int)getActivityTypeWithName:(NSString*)activity{
    if(([activity  isEqual: abs])|| ([activity  isEqual: pullups])|| ([activity  isEqual: pushups])|| ([activity  isEqual: skippingRope])){
        return 0; //IT IS A WORKOUT
    }
    
    else
        return 1; //Cycling, Walking, Footing
    
}

- (IBAction)didSwipe:(id)sender {
    
    NSLog(@"Swiped");
    if(selectedWorkout == 5){
        selectedWorkout = 0 ;
    }
    else{
        selectedWorkout ++;
    }
    
    self.chosenWorkout.text = workouts[selectedWorkout];
    [workoutImage setBackgroundImage:[UIImage imageNamed:workoutsPng[selectedWorkout]] forState:UIControlStateNormal];
    
   
    
 
}
@end
