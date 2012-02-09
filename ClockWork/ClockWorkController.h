// ClockWorkController.h
// by mbilker

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <BBWeeAppController-Protocol.h>

@interface ClockWorkController : NSObject <BBWeeAppController>
{
    UIView *_view;
    UILabel *_lbl;
    NSTimer *_timer;
}

- (UIView *)view;
- (void)update:(NSTimer *)timer;

@end