//
//  SSAppDelegate.h
//  UIActivityExample
//
//  Created by David Douglas on 9/24/12.
//  Copyright (c) 2012 David Douglas. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SSMainViewController;

@interface SSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) SSMainViewController *mainViewController;

@end
