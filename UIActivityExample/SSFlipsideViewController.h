//
//  SSFlipsideViewController.h
//  UIActivityExample
//
//  Created by David Douglas on 9/24/12.
//  Copyright (c) 2012 David Douglas. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SSFlipsideViewController;

@protocol SSFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(SSFlipsideViewController *)controller;
@end

@interface SSFlipsideViewController : UIViewController

@property (weak, nonatomic) id <SSFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
