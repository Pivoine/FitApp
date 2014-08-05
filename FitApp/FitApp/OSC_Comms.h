//
//  OSC_Comms.h
//  FitApp
//
//  Created by MAC-08 on 16/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CommsDelegate <NSObject>
@optional
- (void) commsDidLogin:(BOOL)loggedIn;

@end

@interface OSC_Comms : NSObject
+ (void) login:(id<CommsDelegate>)delegate;
@end