//
//  OSC_DataStore.h
//  FitApp
//
//  Created by MAC-08 on 17/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
/*
@interface WallImage : NSObject
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) id objectId;
@property (nonatomic, strong) NSDictionary<FBGraphUser> *user;
@property (nonatomic, strong) NSDate *createdDate;
@property (nonatomic, strong) NSMutableArray *comments;
@end

@interface WallImageComment : NSObject
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSDictionary<FBGraphUser> *user;
@property (nonatomic, strong) NSDate *createdDate;
@end
*/
@interface OSC_DataStore : NSObject


@property (nonatomic, strong) NSMutableDictionary *fbFriends;
@property (nonatomic, strong) NSMutableArray *wallImages;
@property (nonatomic, strong) NSMutableDictionary *wallImageMap;


+ (OSC_DataStore *) instance;
- (void) reset;
@end
