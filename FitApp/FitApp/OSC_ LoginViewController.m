//
//  OSC_ LoginViewController.m
//  FitApp
//
//  Created by MAC-08 on 16/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import "OSC_ LoginViewController.h"
#import "OSC_Comms.h"
#import <Parse/Parse.h>
#import "OSC_LoginPlist.h"

@interface OSC__LoginViewController () <CommsDelegate>

@end

@implementation OSC__LoginViewController

OSC_LoginPlist *plist;
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
    plist=[[OSC_LoginPlist alloc] init];
    // Do any additional setup after loading the view.
    if ([FBSession activeSession].isOpen) {
        int isLogin = [plist readTextSize];
        NSLog(@" isLogin in did login succesful : %i", isLogin );
           if ( isLogin == 1) {
        [self performSegueWithIdentifier:@"GoToDashFromLogin" sender:self];
          }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
- (IBAction)loginPress:(id)sender {
    // Disable the Login button to prevent multiple touches
    [_btnLogin setEnabled:NO];
    
    // Show an activity indicator
   // [_activityLogin startAnimating];
    [[OSC_DataStore instance] reset];
    // Do the login
    [OSC_Comms login:self];
}
- (void) commsDidLogin:(BOOL)loggedIn {
	// Re-enable the Login button
	[_btnLogin setEnabled:YES];
    
	// Stop the activity indicator
	//[_activityLogin stopAnimating];
    
	// Did we login successfully ?
	if (loggedIn) {
		// Seque to the Image Wall
        _btnLogOut.hidden=FALSE;
        
        int isLogin = [plist readTextSize];
        NSLog(@" isLogin in did login succesful : %i", isLogin );
       if ( isLogin == 0) {
            [self performSegueWithIdentifier:@"OSC_ChartViewController" sender:self];
          }
        else if(isLogin == 1){
            [self performSegueWithIdentifier:@"GoToDashFromLogin" sender:self];
        }
		
        
	} else {
		// Show error alert
		[[[UIAlertView alloc] initWithTitle:@"Login Failed"
                                    message:@"Facebook Login failed. Please try again"
                                   delegate:nil
                          cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil] show];
	}
}
- (IBAction)logout:(id)sender {
    [PFUser logOut];
}

@end
