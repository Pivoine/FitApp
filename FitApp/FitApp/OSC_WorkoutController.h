//
//  OSC_WorkoutController.h
//  FitApp
//
//  Created by MAC-04 on 01/08/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OSC_WorkoutController : UIViewController



- (IBAction)workoutButton:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *workoutImage;

@property NSArray *workoutsPng;

@end
