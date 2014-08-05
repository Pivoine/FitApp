//
//  OSC_Walking.m
//  FitApp
//
//  Created by MAC-04 on 24/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import "OSC_Walking.h"

@implementation OSC_Walking

@dynamic id,order,isDone,doneDate,idPlan,distance,startLocation,endLocation, steps, time, calories;

- (id)initWithOrder:(int)aorder
          AndIsDone:(BOOL)aisdone
        AndDoneDate:(NSString*)adonedate
          AndIdPlan:(NSString*)aidplan
        AndDistance:(double*)adistance
   AndStartLocation:(NSString*)astart
     AndEndLocation:(NSString*)aend
           AndSteps:(int)asteps{

    self.order = aorder;
    self.isDone = aisdone;
    self.doneDate = adonedate;
    self.idPlan = aidplan;
    self.distance = adistance;
    self.startLocation = astart;
    self.endLocation = aend;
    self.steps = asteps;
    
    return self;
}

//****************** Subclassing Methods *****************

+ (NSString *)parseClassName{
    return @"Walking";
}

//****************** ToString *****************

- (NSString *)description{
    return @"walking";
}


@end
