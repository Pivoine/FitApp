//
//  OSC_Pushups.m
//  FitApp
//
//  Created by MAC-04 on 11/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import "OSC_Pushups.h"

@implementation OSC_Pushups

@dynamic id, order, isDone, doneDate, idPlan, series, counter, calories, time;



//****************** Constructor *****************

- (id)initWithOrder:(int*)aorder
AndIsDone:(BOOL)aisdone
AndDoneDate:(NSString*)adonedate
AndIdPlan:(NSString*)aidplan
AndSeries:(NSMutableArray*)aseries{
    
    self.order = aorder;
    self.isDone = aisdone;
    self.doneDate = adonedate;
    self.idPlan = aidplan;
    self.series = aseries;
    
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
    return @"Pushups";
}

//****************** ToString *****************
- (NSString *)description {
    return @"pushups";
}

@end
