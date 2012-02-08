//
//  ClockWorkController.h
//  ClockWork
//
//  Created by System Administrator on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <BBWeeAppController-Protocol.h>

@interface ClockWorkController : NSObject <BBWeeAppController>
{
    UIView *_view;
}

- (UIView *)view;

@end