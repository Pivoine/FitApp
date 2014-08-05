//
//  OSC_SkippingRope.m
//  FitApp
//
//  Created by MAC-04 on 11/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import "OSC_SkippingRope.h"

@implementation OSC_SkippingRope

@dynamic id,order,isDone,doneDate,idPlan, numberJumps, counter, calories, time;



//****************** Constructor *****************

- (id)initWithOrder:(int*)aorder
          AndIsDone:(BOOL)aisdone
        AndDoneDate:(NSString*)adonedate
          AndIdPlan:(NSString*)aidplan
     AndNumberJumps:(int*)ajumps{
    
    self.order = aorder;
    self.isDone = aisdone;
    self.doneDate = adonedate;
    self.idPlan = aidplan;
    self.numberJumps = ajumps;
    
    return self;
}


- (id)initWithTime:(int)atime
         AndIsDone:(BOOL)aisdone
       AndDoneDate:(NSString*)adonedate
       AndCalories:(float)acalories
        AndCounter:(int)acounter{
    
    self.time = atime;
    self.isDone = aisdone;
    self.doneDate = adonedate;
    self.calories = acalories;
    self.counter = acounter;
    
    
    return self;
}

//****************** Subclassing Methods *****************

+ (NSString *)parseClassName{
    return @"Skipping_rope";
}
//****************** ToString *****************
- (NSString *)description {
    return @"skippingrope";
}

@end