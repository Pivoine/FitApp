//
//  OSC_Statistics.h
//  FitApp
//
//  Created by MAC-04 on 10/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface OSC_Statistics : PFObject <PFSubclassing>

@property NSString *id;
@property NSString *date;
@property NSNumber *distance;
@property NSNumber *speed;
@property NSNumber *steps;
@property NSNumber *calories;
@property PFUser *id_user;



//****************** Constructor *****************

-(id)initWithDate:(NSString*)adate
      AndDistance:(NSNumber*)adistance
         AndSpeed:(NSNumber*)aspeed
      AndCalories:(NSNumber*)acalories
         AndSteps:(NSNumber*)asteps
        AndUser:(PFUser*)auser;

//****************** Subclassing Methods *****************

+ (NSString *)parseClassName;

@end
