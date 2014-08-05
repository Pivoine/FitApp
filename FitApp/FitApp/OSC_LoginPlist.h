//
//  OSC_LoginPlist.h
//  FitApp
//
//  Created by MAC-08 on 30/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OSC_LoginPlist : NSObject{
    NSArray *paths;
    NSString *documentsDirectory;
    NSString *path;
}
-(int)readTextSize;
-(void)writeTextSizeWithint:(int)x;

@end
