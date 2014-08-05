//
//  OSC_Footing.m
//  FitApp
//
//  Created by MAC-04 on 11/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import "OSC_Footing.h"

@implementation OSC_Footing

@dynamic id,order,isDone,doneDate,idPlan,distance,startLocation,endLocation;

//****************** Constructor *****************

- (id)initWithOrder:(int*)aorder
          AndIsDone:(BOOL)aisdone
        AndDoneDate:(NSString*)adonedate
          AndIdPlan:(NSString*)aidplan
        AndDistance:(double*)adistance
   AndStartLocation:(NSString*)astart
     AndEndLocation:(NSString*)aend{
    
    self.order = aorder;
    self.isDone = aisdone;
    self.doneDate = adonedate;
    self.idPlan = aidplan;
    self.distance = adistance;
    self.startLocation = astart;
    self.endLocation = aend;
    
    return self;
}

//****************** Subclassing Methods *****************

+ (NSString *)parseClassName{
    return @"Footing";
}

//****************** ToString *****************
- (NSString *)description {
    return @"footing";
}
@end