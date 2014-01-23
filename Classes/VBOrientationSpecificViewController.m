//
//  VBOrientationSpecificViewController.m
//  VBOrientationSpecificViewController
//
//  Created by Vinayak Ram on 12/16/13.
//  Copyright (c) 2014 Vinayak Badrinathan. All rights reserved.
//

#import "VBOrientationSpecificViewController.h"

@interface VBOrientationSpecificViewController()
@property (strong, nonatomic) NSString *baseNibName;
@property (assign, nonatomic) BOOL isViewReappearing;
@property (strong, nonatomic) NSMutableDictionary *viewsForOrientations;
@end

@implementation VBOrientationSpecificViewController

@synthesize cachesViews = _cachesViews;

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
    CGRect frame = [[UIScreen mainScreen] bounds];
    self.view = [[UIView alloc] initWithFrame:frame];
    
    [self reloadViewForCurrentOrientation];
}

-(void)reloadViewForCurrentOrientation {
    UIInterfaceOrientation statusBarOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    [self reloadViewForOrientation:statusBarOrientation];
}

-(void)reloadViewForOrientation:(UIInterfaceOrientation)interfaceOrientation {
    NSString *nibName = [self nibNameForInterfaceOrientation:interfaceOrientation];
    
    UIView *view = nil;
    if( !self.viewsForOrientations[nibName] ) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
        view = views[0];
        [self cacheView:view forKey:nibName];
        
        if( UIInterfaceOrientationIsLandscape(interfaceOrientation) ) {
            [self.delegate landscapeViewDidLoad];
        } else {
            [self.delegate portraitViewDidLoad];
        }
    } else {
        view = self.viewsForOrientations[nibName];
    }
    
    [self removeAllSubviews];
    view.frame = self.view.frame;
    [self.view addSubview:view];
}

-(void)cacheView:(UIView *)view forKey:(NSString *)key {
    if( self.cachesViews ) {
        self.viewsForOrientations[key] = view;
    }
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.isViewReappearing = YES;
    [self removeAllSubviews];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if( self.isViewReappearing ) {
        [self reloadViewForCurrentOrientation];
    }
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    [self reloadViewForOrientation:toInterfaceOrientation];
}

-(void)removeAllSubviews {
    for (UIView *v in self.view.subviews) {
        [v removeFromSuperview];
    }
}

- (NSString*) nibNameForInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    NSString *orientation = (UIInterfaceOrientationIsPortrait(interfaceOrientation)) ? @"portrait" : @"landscape";
    return [NSString stringWithFormat:@"%@-%@", self.baseNibName, orientation];
}

-(NSMutableDictionary *)viewsForOrientations {
    if( !_viewsForOrientations ) {
        _viewsForOrientations = [[NSMutableDictionary alloc] init];
    }

    return _viewsForOrientations;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
