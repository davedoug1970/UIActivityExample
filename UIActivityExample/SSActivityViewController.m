//
//  SSActivityViewController.m
//  UIActivityExample
//
//  Created by David Douglas on 9/24/12.
//  Copyright (c) 2012 David Douglas. All rights reserved.
//

#import "SSActivityViewController.h"

@interface SSActivityViewController ()

@property (nonatomic,strong) UIView *backing;
@property (nonatomic) CGFloat viewHeight;

@end

@implementation SSActivityViewController
@synthesize cancelButton;
@synthesize delegate;
@synthesize backing;
@synthesize viewHeight;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setViewHeight:[UIScreen mainScreen].bounds.size.height];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIImage *btnImage = [UIImage imageNamed:@"UIAlertSheetBlackCancelButton.png"];
    UIImage *tempButtonImage = [btnImage stretchableImageWithLeftCapWidth:13 topCapHeight:0];
    [[self cancelButton] setBackgroundImage:tempButtonImage forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getShare
{
    [self setBacking:[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, [self viewHeight])]];
    [[self backing] setBackgroundColor:[UIColor blackColor]];
    [[self backing] setAlpha:0];
    [[delegate view] addSubview:[self backing]];
    [[self view] setFrame:CGRectMake(0, [self viewHeight], 320, 276)];
    [[delegate view] addSubview:[self view]];
    [UIView animateWithDuration:.5 animations:^(void) {
            [[self view] setFrame:CGRectMake(0, [self viewHeight] - 296, 320, 276)];
            [[self backing] setAlpha:.55];
        }];
}

- (void)removeFromView
{
    [UIView animateWithDuration:.5 animations:^(void) {
        [[self view] setFrame:CGRectMake(0, [self viewHeight], 320, 276)];
        [[self backing] setAlpha:0];
    } completion:^(BOOL finished) {
        if (finished)
            [[self view] removeFromSuperview];
            [[self backing] removeFromSuperview];
    }];
}

- (IBAction)actvityTypeSelected:(id)sender
{
    [self removeFromView];
    
    UIButton *selected = (UIButton *)sender;
    [delegate shareSelected:(ActivityType)(int)[selected tag] withController:self];
}

- (IBAction)cancel:(id)sender
{
    [self removeFromView];
    
    if ([delegate respondsToSelector:@selector(shareCancelled:)])
        [delegate shareCancelled:self];
}

@end
