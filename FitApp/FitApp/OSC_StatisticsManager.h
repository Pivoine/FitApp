//
//  OSC_StatisticsManager.h
//  FitApp
//
//  Created by MAC-04 on 11/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "OSC_IStatisticsManager.h"
#import "OSC_Statistics.h"
@interface OSC_StatisticsManager : NSObject <OSC_IStatisticsManager>


-(OSC_Statistics*)getStatistics:(PFUser*)user;
-(void)saveStatistics:(OSC_Statistics*) statistics;

@end
