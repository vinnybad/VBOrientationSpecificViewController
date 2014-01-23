//
//  TwoLayoutViewController.h
//
//  Created by Vinayak Badrinathan on 12/16/13.
//  Copyright (c) 2013 DYC USA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwoLayoutViewController : UIViewController

/**
 *  baseNibName identifies the base name of nib files that this view controller looks for.  
 *  
 *  Suppose baseNibName has the value ExampleName, here is how different devices resolve names:
 *  - iPhone - ExampleName-iPhone-portrait.xib, ExampleName-iPhone-landscape.xib
 *  - iPad   - ExampleName-iPad-portrait.xib, ExampleName-iPad-landscape.xib
 */
@property (strong, nonatomic) NSString *baseNibName;

-(id)initWithBaseNibName:(NSString *)baseNibName;
-(NSString*) nibNameForInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;

@end
