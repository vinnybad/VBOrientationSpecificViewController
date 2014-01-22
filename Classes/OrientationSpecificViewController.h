//
//  OrientationSpecificViewController.h
//  OrientationSpecificViewController
//
//  Created by Vinayak Ram on 1/21/14.
//  Copyright (c) 2014 Vinayak Badrinathan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OrientationSpecificViewController : UIViewController {
    BOOL _cachesViews;
}

@property (assign, nonatomic) BOOL cachesViews;

@end
