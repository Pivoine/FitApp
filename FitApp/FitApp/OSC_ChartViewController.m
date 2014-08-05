//
//  OSC_ChartViewController.m
//  FitApp
//
//  Created by MAC-08 on 16/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import "OSC_ChartViewController.h"
#import <Parse/Parse.h>
#import <FacebookSDK/FacebookSDK.h>
#import "OSC_LoginPlist.h"
@interface OSC_ChartViewController ()

@end

@implementation OSC_ChartViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _accepteButton.hidden=true;

  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)isOn:(id)sender {
    if (_agree.isOn) {
        NSLog(@"je suis activer");
        _accepteButton.hidden=false;
    }
    else{
        NSLog(@"je suis non activer");
        _accepteButton.hidden=true;
    }
}
- (IBAction)accepte:(id)sender {
    OSC_LoginPlist *plist =[[OSC_LoginPlist alloc] init];
    [plist writeTextSizeWithint:1];
    NSLog(@" after accept %i", [plist readTextSize]);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
