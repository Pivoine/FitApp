//
//  OSC_IStatisticsManager.h
//  FitApp
//
//  Created by MAC-04 on 11/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "OSC_Statistics.h"

@protocol OSC_IStatisticsManager <NSObject>

-(OSC_Statistics*)getStatistics:(PFUser*)user;
-(void)saveStatistics:(OSC_Statistics*) statistics;


@end
@interface OSC_IStatisticsManager : NSObject

@end