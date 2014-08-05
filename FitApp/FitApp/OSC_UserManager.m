//
//  OSC_UserManager.m
//  FitApp
//
//  Created by MAC-04 on 10/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import "OSC_UserManager.h"
#import <Parse/Parse.h>


@implementation OSC_UserManager


//************ Add User ****************

-(void)saveUser:(PFUser*) user{

    @try {
        NSException *ex = [NSException exceptionWithName:@"UpdatingUserException" reason:@"Error updating user !" userInfo:nil];
        [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if(error){
                @throw ex;
            }
        }];
        
        
    }
    @catch (NSException *ex) {
        @throw;
    }

    
    
    
}

//************ Current User ****************

-(PFUser*)getcurrentUser{
    PFUser *user;
    
    @try {
        NSException *ex = [NSException exceptionWithName:@"UpdatingUserException" reason:@"Error updating user !" userInfo:nil];
        user = [PFUser currentUser];
        if(user == nil){
            @throw ex;
        }
    
    }
    @catch (NSException *ex) {
        @throw;
    }
    
    
    return user;
}


@end
