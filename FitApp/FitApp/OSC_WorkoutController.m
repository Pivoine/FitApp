//
//  OSC_WorkoutController.m
//  FitApp
//
//  Created by MAC-04 on 01/08/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import "OSC_WorkoutController.h"
#import "strings.h"
#import "osc_ViewController.h"

@interface OSC_WorkoutController ()

@end

@implementation OSC_WorkoutController

@synthesize workoutImage, workoutsPng;


UIImageView *image1;
UIImageView *image2;

int selectedWorkout = 0 ;

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
    workoutsPng = @[absPng, cyclingPng, footingPng, pullupsPng, pushupsPng, skippingRopePng];
   
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    osc_ViewController *dest = (osc_ViewController *)[segue destinationViewController];
    
    dest.selectedWorkout = selectedWorkout;
    
}


- (IBAction)workoutButton:(id)sender {
    if(selectedWorkout == 5){
        selectedWorkout = 0 ;
    }
    else{
        selectedWorkout ++;
    }
    
    
   [workoutImage setBackgroundImage:[UIImage imageNamed:workoutsPng[selectedWorkout]] forState:UIControlStateNormal];
}
@end
