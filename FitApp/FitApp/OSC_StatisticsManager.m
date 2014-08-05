//
//  OSC_StatisticsManager.m
//  FitApp
//
//  Created by MAC-04 on 11/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import "OSC_StatisticsManager.h"

@implementation OSC_StatisticsManager


//**************** GET LATEST STATISTICS ***********
-(OSC_Statistics*)getStatistics:(PFUser*)user{
    
    
    
    OSC_Statistics *stats = [OSC_Statistics object];
    PFQuery *query = [OSC_Statistics query];
    
    
    @try {
        
//        NSException *ex = [NSException exceptionWithName:@"RetrievingStatisticsException" reason:@"Error retrieving statistics !" userInfo:nil];
        //Get the plan
        [query whereKey:@"date" equalTo:@"12/12/12"];
        NSArray *objects = [query findObjects];
        
                
        OSC_Statistics *statistics = (OSC_Statistics*)objects[0];
               

        stats.objectId = statistics.objectId;
        stats.id_user = statistics.id_user;
        stats.distance = statistics.distance;
        stats.speed = statistics.speed;
        stats.steps = statistics.steps;
        stats.calories = statistics.calories;
        stats.date = statistics.date;
        
        
    }
    @catch (NSException *ex) {
        @throw;
    }
    
    
   

    
    return stats;
}

//**************** SAVE STATISTICS ***********
-(void)saveStatistics:(OSC_Statistics*) statistics{
    
    @try {
        NSException *ex = [NSException exceptionWithName:@"SavingStatsException" reason:@"Error Saving Statistics !" userInfo:nil];
        [statistics saveInBackgroundWithBlock: ^(BOOL succeeded, NSError *error) {
            
            if(error){
                @throw ex;
            }
        }];
        
        
    }
    @catch (NSException *ex) {
        @throw;
        
    }

}

@end
