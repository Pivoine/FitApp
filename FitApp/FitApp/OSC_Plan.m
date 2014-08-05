//
//  OSC_Plan.m
//  FitApp
//
//  Created by MAC-04 on 10/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import "OSC_Plan.h"
#import <Parse/PFObject+Subclass.h>
#import <Parse/Parse.h>

@implementation OSC_Plan

@dynamic id, name, date, isnotified, period, user;



//****************** Constructor *****************

- (id)initWithName:(NSString*)aname
           AndDate:(NSString*)adate
     AndIsNotified:(BOOL)aisnotified
         AndPeriod:(int)aperiod
           AndUser:(PFUser*)auser{
    
    
    self.name = aname;
    self.date = adate;
    self.isnotified = aisnotified;
    self.period = aperiod;
    self.user = auser;
    
    return self;

}

//****************** Subclassing Methods *****************

+ (NSString *)parseClassName{
    return @"Plan";
}

@end
