//
//  OSC_ActivityManager.h
//  FitApp
//
//  Created by MAC-04 on 11/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "OSC_IActivityManager.h"
#import "OSC_Abs.h"
#import "OSC_Cycling.h"
#import "OSC_Footing.h"
#import "OSC_Pullups.h"
#import "OSC_Pushups.h"
#import "OSC_SkippingRope.h"


@interface OSC_ActivityManager : NSObject <OSC_IActivityManager>

-(NSArray*)getAllActivities;

-(void)saveActivity:(PFObject*)activity;
-(void)deleteActivity:(NSString*) activity;

-(int)getActivityCode:(NSString*)activity;

@end
