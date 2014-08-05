//
//  OSC_PlanManager.m
//  FitApp
//
//  Created by MAC-04 on 11/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import "OSC_PlanManager.h"

#import <Parse/Parse.h>


@implementation OSC_PlanManager



//************Get Plan By ID ****************

-(OSC_Plan*)getPlanById:(NSString*)idplan{
    
    
    OSC_Plan *plan = [OSC_Plan object];
    PFQuery *query = [OSC_Plan query];
    
    
    @try {
        
      //  NSException *ex = [NSException exceptionWithName:@"RetrievingPlanException" reason:@"Error retrieving plan !" userInfo:nil];
      //Get the plan
        PFObject *obj = [query getObjectWithId:idplan];
        OSC_Plan *p = (OSC_Plan*)obj;
        plan.name = p.name;
        plan.objectId = p.objectId;
        plan.period = p.period;
        plan.isnotified = p.isnotified;
        plan.date = p.date;
        plan.user = p.user;
        
    }
    @catch (NSException *ex) {
        @throw;
    }
    

    return plan;
    

}

//************ SAVE/UPDATE Plan ****************

-(void)savePlan:(OSC_Plan*)plan{
    
    @try {
        NSException *ex = [NSException exceptionWithName:@"SavingPlanException" reason:@"Error Saving Plan !" userInfo:nil];
        [plan saveInBackgroundWithBlock: ^(BOOL succeeded, NSError *error) {
            
            if(error){
                @throw ex;
            }
        }];


    }
    @catch (NSException *ex) {
        @throw;
  
    }
}

//************ Delete Plan By ID****************

-(void)deletePlan:(NSString*) idplan{
    
    
    OSC_Plan *p = [self getPlanById:idplan];
    
    @try{
        NSException *ex = [NSException exceptionWithName:@"DeletingPlanException" reason:@"Error Deleting User !" userInfo:nil];
        [p deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if(error){
                @throw ex;
            }
        }];
    }
    @catch (NSException *ex){
        
        @throw;
    }
    
    

    

}


@end

