//
//  OSC_DataStore.m
//  FitApp
//
//  Created by MAC-08 on 17/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import "OSC_DataStore.h"


@implementation OSC_DataStore

static OSC_DataStore *instance = nil;
+ (OSC_DataStore *) instance
{
    @synchronized (self) {
        if (instance == nil) {
            instance = [[OSC_DataStore alloc] init];
        }
    }
    return instance;
}

- (id) init
{
    self = [super init];
    if (self) {
        _fbFriends = [[NSMutableDictionary alloc] init];
     //   _wallImages = [[NSMutableArray alloc] init];
      //  _wallImageMap = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void) reset
{
    [_fbFriends removeAllObjects];
 //   [_wallImages removeAllObjects];
  //  [_wallImageMap removeAllObjects];
}

@end
