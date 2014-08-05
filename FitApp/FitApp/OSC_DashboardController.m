//
//  OSC_DashboardController.m
//  FitApp
//
//  Created by MAC-04 on 31/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import "OSC_DashboardController.h"
#import "OSC_CalendarController.h"
#import "osc_ViewController.h"

@interface OSC_DashboardController ()
@property UIViewController  *currentDetailViewController;

@end

@implementation OSC_DashboardController

@synthesize calendarController, detailView;


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
 
//    self.calendarController.view.frame = self.detailView.bounds;
//    [self.detailView addSubview:self.currentDetailViewController.view];
    
    
    //[self presentDetailController:calendarController];
    
    

    
}

-(void)awakeFromNib
{
    [super awakeFromNib];
 
    
   // [self performSegueWithIdentifier:@"calendarcontroller" sender:self.view];
    
    calendarController = [self.storyboard instantiateViewControllerWithIdentifier:@"calendarcontroller"];
    
    
    
    [self addChildViewController:calendarController];
    calendarController.view.frame = [self frameForDetailController];
    [self.detailView addSubview:calendarController.view];
    [calendarController didMoveToParentViewController:self];
    
    self.currentDetailViewController = calendarController;
    //UIViewController *calendarControl = [[UIViewController alloc] init];
    
    
    
}

- (void)presentDetailController:(UIViewController*)detailVC{
    //0. Remove the current Detail View Controller showed
    if(self.currentDetailViewController){
        [self removeCurrentDetailViewController];
    }
    //1. Add the detail controller as child of the container
    [self addChildViewController:detailVC];
    
    //2. Define the detail controller's view size
    detailVC.view.frame = [self frameForDetailController];
    
    //3. Add the Detail controller's view to the Container's detail view and save a reference to the detail View Controller
    [self.detailView addSubview:detailVC.view];
    self.currentDetailViewController = detailVC;
    
    //4. Complete the add flow calling the function didMoveToParentViewController
    [detailVC didMoveToParentViewController:self];
    
}

- (CGRect)frameForDetailController{
    CGRect detailFrame = CGRectMake(20, 20, 400, 500);
    
    return detailFrame;
}



- (void)removeCurrentDetailViewController{
    
    //1. Call the willMoveToParentViewController with nil
    //   This is the last method where your detailViewController can perform some operations before neing removed
    [self.currentDetailViewController willMoveToParentViewController:nil];
    
    //2. Remove the DetailViewController's view from the Container
    [self.currentDetailViewController.view removeFromSuperview];
    
    //3. Update the hierarchy"
    //   Automatically the method didMoveToParentViewController: will be called on the detailViewController)
    [self.currentDetailViewController removeFromParentViewController];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"calendarcontroller"]) {
        
        OSC_CalendarController *detailVC = [segue destinationViewController];
        self.currentDetailViewController = detailVC;
        
    }
    
}

- (IBAction)calendarSection:(id)sender {
    NSLog(@"CLIIIIIIIICKED !!!");
}
@end
