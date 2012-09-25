//
//  SSMainViewController.m
//  UIActivityExample
//
//  Created by David Douglas on 9/24/12.
//  Copyright (c) 2012 David Douglas. All rights reserved.
//

#import "SSMainViewController.h"
#import "SSActivityViewController.h"
@interface SSMainViewController ()

@end

@implementation SSMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(SSFlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)showInfo:(id)sender
{    
    SSFlipsideViewController *controller = [[SSFlipsideViewController alloc] initWithNibName:@"SSFlipsideViewController" bundle:nil];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)activity:(id)sender
{
    [self setActivityController:[[SSActivityViewController alloc] initWithNibName:@"SSActivityViewController" bundle:nil]];
    [[self activityController] setDelegate:self];
    [[self activityController] getShare];
}

- (void)shareSelected:(ActivityType)activityType withController:(SSActivityViewController *)controller
{
    [self setActivityController:nil];
}

- (void)shareCancelled:(SSActivityViewController *)controller
{
    [self setActivityController:nil];
}

@end
