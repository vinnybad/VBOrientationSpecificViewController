//
//  TwoLayoutViewController.m
//
//  Created by Vinayak Badrinathan on 12/16/13.
//  Copyright (c) 2013 DYC USA. All rights reserved.
//

#import "DCTwoLayoutViewController.h"
#import "DCCommon.h"

@interface TwoLayoutViewController ()
@property (assign, nonatomic) BOOL isViewReappearing;
@property (strong, nonatomic) NSDictionary *viewsForOrientations;
@end

@implementation TwoLayoutViewController

/**
 *  Designated Initializer that initializes this view controller with a base nib name.
 */
-(id)initWithBaseNibName:(NSString *)baseNibName {
    self = [super init];
    if( self ) {
        _baseNibName = baseNibName;
        _isViewReappearing = NO;
    }

    return self;
}

-(void)loadView {
    UIInterfaceOrientation statusBarOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    NSString *nibName = [self nibNameForInterfaceOrientation:statusBarOrientation];
    
    UIView *view = nil;
    if( !self.viewsForOrientations[nibName] ) {
        UIView* view = [[[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil] objectAtIndex:0];
    } else {
        view = self.viewsForOrientations[nibName];
    }
    
    self.view = view;
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

    view.frame = self.view.frame;
    [self.view addSubview:view];
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
}

@end
