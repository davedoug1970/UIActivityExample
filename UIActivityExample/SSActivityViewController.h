//
//  SSActivityViewController.h
//  UIActivityExample
//
//  Created by David Douglas on 9/24/12.
//  Copyright (c) 2012 David Douglas. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SSActivityViewController;

typedef enum ActivityType {
    shareByEmail = 0,
    shareByFacebook = 1,
    shareByTwitter = 2,
    shareBySMS = 3
} ActivityType;

@protocol SSActivityControllerDelegate <NSObject>

- (UIView *)view;
- (void)shareSelected:(ActivityType)activityType withController:(SSActivityViewController *)controller;

@optional
- (void)shareCancelled:(SSActivityViewController *)controller;

@end

@interface SSActivityViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIButton *cancelButton;
@property (nonatomic, assign) id<SSActivityControllerDelegate> delegate;

- (void)getShare;
- (void)removeFromView;
- (IBAction)actvityTypeSelected:(id)sender;
- (IBAction)cancel:(id)sender;

@end
