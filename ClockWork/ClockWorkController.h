//
//  ClockWorkController.h
//  ClockWork
//
//  Created by Matt Bilker on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SpringBoard/BBWeeAppController.h"

@interface ClockWorkController : NSObject <BBWeeAppController>
{
    UIView *_view;
}

- (UIView *)view;

@end