//
//  OSC_Walking.h
//  FitApp
//
//  Created by MAC-04 on 24/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import <Parse/PFObject+Subclass.h>

@interface OSC_Walking : PFObject <PFSubclassing>

@property (retain) NSString *id;
@property int time;
@property float calories;
@property int order;
@property int steps;
@property BOOL isDone;
@property (retain) NSString *doneDate;
@property (retain) NSString *idPlan;
@property double *distance;
@property NSString *startLocation;
@property NSString *endLocation;



//****************** Constructor *****************

- (id)initWithOrder:(int)aorder
          AndIsDone:(BOOL)aisdone
        AndDoneDate:(NSString*)adonedate
          AndIdPlan:(NSString*)aidplan
        AndDistance:(double*)adistance
   AndStartLocation:(NSString*)astart
     AndEndLocation:(NSString*)aend
           AndSteps:(int)asteps;

//****************** Subclassing Methods *****************

+ (NSString *)parseClassName;

//****************** ToString *****************

- (NSString *)description;

@end

