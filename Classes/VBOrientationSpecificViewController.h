//
//  VBOrientationSpecificViewController.h
//  VBOrientationSpecificViewController
//
//  Created by Vinayak Ram on 12/16/13.
//  Copyright (c) 2014 Vinayak Badrinathan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol VBOrientationSpecificViewControllerDelegate <NSObject>

/**
 * This is called when the portrait nib is loaded (and is only called one time).  
 *
 * Once the nib is loaded once, the view is cached and reloaded from the cache thereafter.
 */
-(void)portraitViewDidLoad;

/**
 * This is called when the landscape nib is loaded (and is only called one time).
 *
 * Once the nib is loaded once, the view is cached and reloaded from the cache thereafter.
 */
-(void)landscapeViewDidLoad;

@end

@interface VBOrientationSpecificViewController : UIViewController {
    BOOL _cachesViews;
}

@property (assign, nonatomic) BOOL cachesViews;
@property (weak, nonatomic) id<VBOrientationSpecificViewControllerDelegate> delegate;

-(id)initWithBaseNibName:(NSString *)baseNibName;

@end
