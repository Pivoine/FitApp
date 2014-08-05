//
//  OSC_StatsController.m
//  FitApp
//
//  Created by MAC-04 on 23/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import "OSC_StatsController.h"

@interface OSC_StatsController ()

@end

@implementation OSC_StatsController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    NQBarGraph * barGraph=[[NQBarGraph alloc] initWithFrame:CGRectMake(10, 10, self.view.bounds.size.width-20, self.view.bounds.size.height-20)];
//    barGraph.autoresizingMask=(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
//    
//    UIColor *white = [UIColor whiteColor];
//    UIColor *black = [UIColor blackColor];
//    
//    barGraph.linesColor = black;
//    barGraph.numbersColor = white;
//    barGraph.barColor = black;
//    barGraph.dottedLineColor = black;
//    barGraph.barOuterLine = white;
//    barGraph.numbersTextColor = black;
//    barGraph.backgroundColor = white;
//    
//    [self.view addSubview:barGraph];
//    
//    NSMutableArray * dataArray=[NSMutableArray array];
//    
//    NSDate * nowDate=[NSDate date];
//    
//    
//    NQData * firstData=[NQData dataWithDate:nowDate andNumber:[NSNumber numberWithInt:3]];
//    
//    [dataArray addObject:firstData];
//    for (int i=86400; i<8640000; i+=86400) {
//        int rand=1+arc4random()%8;
//        NQData * data=[NQData dataWithDate:[NSDate dateWithTimeInterval:i sinceDate:nowDate] andNumber:[NSNumber numberWithInt:rand]];
//        [dataArray addObject:data];
//    }
//    
//    barGraph.dataSource=dataArray;
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
