//
//  OSC_IActivityManager.h
//  FitApp
//
//  Created by MAC-04 on 11/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@protocol OSC_IActivityManager <NSObject>

-(NSArray*)getAllActivities;
-(void)saveActivity:(PFObject*)activity;
-(void)deleteActivity:(NSString*) idactivity;

@end

@interface OSC_IActivityManager : NSObject

@end
