//
//  OSC_Cycling.h
//  FitApp
//
//  Created by MAC-04 on 11/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import <Parse/PFObject+Subclass.h>

@interface OSC_Cycling : PFObject <PFSubclassing>

@property (retain) NSString *id;
@property int time;
@property float calories;
@property float speed;
@property int *order;
@property BOOL isDone;
@property (retain) NSString *doneDate;
@property (retain) NSString *idPlan;
@property double distance;
@property NSString *startLocation;
@property NSString *endLocation;



//****************** Constructor *****************

- (id)initWithOrder:(int*)aorder
          AndIsDone:(BOOL)aisdone
        AndDoneDate:(NSString*)adonedate
          AndIdPlan:(NSString*)aidplan
        AndDistance:(double)adistance
   AndStartLocation:(NSString*)astart
     AndEndLocation:(NSString*)aend;

//****************** Subclassing Methods *****************

+ (NSString *)parseClassName;

//****************** ToString *****************

- (NSString *)description;

@end
