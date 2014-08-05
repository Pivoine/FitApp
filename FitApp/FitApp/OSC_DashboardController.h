//
//  OSC_DashboardController.h
//  FitApp
//
//  Created by MAC-04 on 31/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OSC_CalendarController.h"

@interface OSC_DashboardController : UIViewController

@property OSC_CalendarController *calendarController;

@property (strong, nonatomic) IBOutlet UIView *detailView;

- (IBAction)calendarSection:(id)sender;

@end
