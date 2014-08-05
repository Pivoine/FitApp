//
//  OSC_ActivityManager.m
//  FitApp
//
//  Created by MAC-04 on 11/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import "OSC_ActivityManager.h"


@implementation OSC_ActivityManager


//************ GET ALL ACTIVITIES ****************
-(NSArray*)getAllActivities{
    //Get the activity
//    OSC_Activity *activity = [OSC_Activity new];
//    PFQuery *query = [PFQuery queryWithClassName:nameactivity];
//    [query getObjectInBackgroundWithId:idplan block:^(PFObject *plan, NSError *error) {
//        e.error = TRUE;
//        e.message = error.description;
//    }];
    
    return nil;
}

//************ SAVE/UPDATE ACTIVITY ****************
-(void)saveActivity:(PFObject*)activity{
        @try {
            NSException *ex = [NSException exceptionWithName:@"SavingActivityException" reason:@"Error Saving Activity !" userInfo:nil];
            
            //Save the activity
            switch ([self getActivityCode:activity.description]) {
                //Case Abs
                case 1:{
                    
                    [((OSC_Abs*)activity) saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                        if(error){
                            @throw ex;
                        }
                    }];
                }
                    break;
                //Case Cycling
                case 2:{
                    [((OSC_Cycling*)activity) saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                        if(error){
                            @throw ex;
                        }
                    }];
                
                }
                break;
                    
                //Case Footing
                case 3:{
                    [((OSC_Footing*)activity) saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                        if(error){
                            @throw ex;
                        }
                    }];
                    
                }
                break;
                    
                    
                //Case Pullups
                case 4:{
                    [((OSC_Pullups*)activity) saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                        if(error){
                            @throw ex;
                        }
                    }];
                    
                    
                }
                break;
                    
                //Case Pushups
                case 5:{
                    [((OSC_Pushups*)activity) saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                        if(error){
                            @throw ex;
                        }
                    }];
                    
                }
                break;
                    
                //Case Skipping Rope
                case 6:{
                    [((OSC_SkippingRope*)activity) saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                        if(error){
                            @throw ex;
                        }
                    }];
                    
                }
                    break;
                default:{
                    @throw ex;
                }
                    break;
            }
        }
        @catch (NSException *ex) {
            @throw;
        }
    
}

//************ DELETE ACTIVITY ****************
-(void)deleteActivity:(NSString*) idactivity{}

//**************** RETURN INT OF THE ACTIVITY ***********
-(int)getActivityCode:(NSString*)activity{
    if([activity isEqualToString:@"abs"]){
        return 1;
    }
    
    if([activity isEqualToString:@"cycling"]){
        return 2;
    }
    
    if([activity isEqualToString:@"footing"]){
        return 3;
    }
    
    if([activity isEqualToString:@"pullups"]){
        return 4;
    }
    
    if([activity isEqualToString:@"pushups"]){
        return 5;
    }
    
    if([activity isEqualToString:@"skippingrope"]){
        return 6;
    }
    
    else
        return 0;
    
}

@end
