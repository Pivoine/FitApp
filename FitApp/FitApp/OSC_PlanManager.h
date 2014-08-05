//
//  OSC_PlanManager.h
//  FitApp
//
//  Created by MAC-04 on 11/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OSC_IPlanManager.h"

#import <Parse/Parse.h>

@interface OSC_PlanManager : NSObject <OSC_IPlanManager>



//-(OSC_Plan*)getAllPlans:(PFUser*)user;
-(OSC_Plan*)getPlanById:(NSString*)idplan;
-(void)savePlan:(OSC_Plan*)plan;
-(void)deletePlan:(NSString*) idplan;

@end
