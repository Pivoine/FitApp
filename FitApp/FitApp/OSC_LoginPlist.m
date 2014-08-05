//
//  OSC_LoginPlist.m
//  FitApp
//
//  Created by MAC-08 on 30/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import "OSC_LoginPlist.h"

@implementation OSC_LoginPlist


-(int)readTextSize
{
  //  [self LoadPropertyListFile];
    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
    documentsDirectory = [paths objectAtIndex:0]; //2
    path = [documentsDirectory stringByAppendingPathComponent:@"isLoginList.plist"];
    NSMutableDictionary *savedStock = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
    
    //load from savedStock example int value
    int value;
    value = [[savedStock objectForKey:@"isLogin"] intValue];
    
    return value;
}

-(void)writeTextSizeWithint:(int)x
{
    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
    documentsDirectory = [paths objectAtIndex:0]; //2
    path = [documentsDirectory stringByAppendingPathComponent:@"isLoginList.plist"];
    //[self LoadPropertyListFile];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
    
    //here add elements to data file and write data to file
    int value = x;
    [data setObject:[NSNumber numberWithInt:value] forKey:@"isLogin"];
    [data writeToFile: path atomically:YES];
}
@end
