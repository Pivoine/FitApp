//
//  OSC_Statistics.m
//  FitApp
//
//  Created by MAC-04 on 10/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import "OSC_Statistics.h"
#import <Parse/PFObject+Subclass.h>

@implementation OSC_Statistics

@dynamic id, date, distance, speed, calories, id_user,steps;



//****************** Constructor *****************

-(id)initWithDate:(NSString*)adate
      AndDistance:(NSNumber*)adistance
         AndSpeed:(NSNumber*)aspeed
        AndCalories:(NSNumber*)acalories
         AndSteps:(NSNumber*)asteps
        AndUser:(PFUser*)auser{
    
    self.date = adate;
    self.distance = adistance;
    self.speed = aspeed;
    self.steps = asteps;
    self.calories = acalories;
    self.id_user = auser;
    return self;
}


//****************** Subclassing Methods *****************

+ (NSString *)parseClassName{
    return @"Statistics";
}

@end
