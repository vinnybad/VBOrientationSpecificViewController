//
//  VBViewController.m
//  Example-iOS-Project
//
//  Created by Vinayak Ram on 1/21/14.
//  Copyright (c) 2014 Vinayak Badrinathan. All rights reserved.
//

#import "VBViewController.h"

@interface VBViewController ()
@property (weak, nonatomic) IBOutlet UILabel *helloLabel;
@end

@implementation VBViewController

-(id)init {
    self = [super initWithBaseNibName:@"VBViewController"];
    if( self ) {
        self.delegate = self;
        
        // if you want the views to be reloaded each time, you can set this property to NO
//        self.cachesViews = NO;
    }
    return self;
}

-(void)portraitViewDidLoad {
    self.helloLabel.text = @"In portrait and I was set in code";
}

-(void)landscapeViewDidLoad {
    self.helloLabel.text = @"In landscape and I was set in code";
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    // You're welcome to catch the the will rotate to interface orientation method...but make sure to call super like we have above
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
