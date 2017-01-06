//
//  ViewController.m
//  AnimationiOS
//
//  Created by TIKAM CHANDRAKAR on 06/01/17.
//  Copyright © 2017 DEXATI. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
 -(IBAction)show:(id)sender
{
   AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    [app showHelpMessage:@"Hey I am the popup screen with some title " title:@"Msg Title" height:0];
}
@end
