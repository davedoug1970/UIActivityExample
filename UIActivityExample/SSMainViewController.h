//
//  SSMainViewController.h
//  UIActivityExample
//
//  Created by David Douglas on 9/24/12.
//  Copyright (c) 2012 David Douglas. All rights reserved.
//

#import "SSFlipsideViewController.h"
#import "SSActivityViewController.h"
@interface SSMainViewController : UIViewController <SSFlipsideViewControllerDelegate, SSActivityControllerDelegate>

@property (nonatomic, strong) SSActivityViewController *activityController;

- (IBAction)showInfo:(id)sender;
- (IBAction)activity:(id)sender;

@end
