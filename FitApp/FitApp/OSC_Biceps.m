//
//  OSC_Biceps.m
//  FitApp
//
//  Created by MAC-04 on 11/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import "OSC_Biceps.h"

@implementation OSC_Biceps

@dynamic id, order_activity, isdone, done_date, id_plan, series;



//****************** Constructor *****************

- (id)initWithOrder:(int*)aorder
          AndIsDone:(BOOL)aisdone
        AndDoneDate:(NSString*)adonedate
          AndIdPlan:(NSString*)aidplan
          AndSeries:(NSMutableArray*)aseries{
    
    self.order_activity = aorder;
    self.isdone = aisdone;
    self.done_date = adonedate;
    self.id_plan = aidplan;
    self.series = aseries;
    
    return self;
}

//****************** Subclassing Methods *****************

+ (NSString *)parseClassName{
    return @"Biceps";
}

//****************** ToString *****************
- (NSString *)description {
    return @"biceps";
}

@end
