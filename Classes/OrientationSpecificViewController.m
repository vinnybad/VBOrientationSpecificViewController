//
//  OrientationSpecificViewController.m
//  OrientationSpecificViewController
//
//  Created by Vinayak Ram on 1/21/14.
//  Copyright (c) 2014 Vinayak Badrinathan. All rights reserved.
//

#import "OrientationSpecificViewController.h"

#define IS_IPHONE() [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone
#define IS_IPHONE_4_INCHES() ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 568)
#define IS_IPHONE_3_5_INCHES() ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height < 568)
#define IS_IPAD() [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad


@interface OrientationSpecificViewController()
@property (strong, nonatomic) NSString *baseNibName;
@property (assign, nonatomic) BOOL isViewReappearing;
@property (strong, nonatomic) NSMutableDictionary *viewTypeToViewMappings;
@end

@implementation OrientationSpecificViewController

@synthesize cachesViews = _cachesViews;

-(id)initWithBaseNibName:(NSString *)baseNibName {
    self = [super init];
    if( self ) {
        _baseNibName = baseNibName;
        _isViewReappearing = NO;
    }
    
    return self;
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.isViewReappearing = YES;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if( self.isViewReappearing ) {
        [self loadView];
    }
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    NSString *nibName = [self nibNameForInterfaceOrientation:toInterfaceOrientation];
    UIView* view = [[[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil] objectAtIndex:0];
    for (UIView *v in self.view.subviews) {
        [v removeFromSuperview];
    }
    
    [self.view addSubview:view];
}

-(void)loadView {
    UIInterfaceOrientation statusBarOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    NSString *nibName = [self nibNameForInterfaceOrientation:statusBarOrientation];
    self.view = [self rootViewWithNibName:nibName];
}

-(UIView *)rootViewWithNibName:(NSString *)nibName {
    UIView *view;
    if( self.cachesViews && !self.viewTypeToViewMappings[nibName] ) {
        view = [[[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil] objectAtIndex:0];
        self.view = view;
    } else {
        view = self.viewTypeToViewMappings[nibName];
    }

    return view;
}

- (NSString*) nibNameForInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    NSString *postfix = (UIInterfaceOrientationIsPortrait(interfaceOrientation)) ? @"portrait" : @"landscape";
    NSString *deviceType = IS_IPAD() ? @"iPad" : @"iPhone";
    return [NSString stringWithFormat:@"%@-%@-%@", self.baseNibName, deviceType, postfix];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    [self.viewTypeToViewMappings removeAllObjects];
}


@end
