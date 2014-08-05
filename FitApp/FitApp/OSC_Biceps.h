//
//  OSC_Biceps.h
//  FitApp
//
//  Created by MAC-04 on 11/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import <Parse/PFObject+Subclass.h>

@interface OSC_Biceps : PFObject <PFSubclassing>

@property (retain) NSString *id;
@property int *order_activity;
@property BOOL isdone;
@property (retain) NSString *done_date;
@property (retain) NSString *id_plan;
@property NSMutableArray *series;



//****************** Constructor *****************

- (id)initWithOrder:(int*)aorder
          AndIsDone:(BOOL)aisdone
        AndDoneDate:(NSString*)adonedate
          AndIdPlan:(NSString*)aidplan
          AndSeries:(NSMutableArray*)aseries;

//****************** Subclassing Methods *****************

+ (NSString *)parseClassName;

//****************** ToString *****************

- (NSString *)description;

@end



