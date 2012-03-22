// ClockWorkController.m
// by mbilker

#import "ClockWorkController.h"

#define HEIGHT 30

@implementation ClockWorkController

-(id)init
{
	if ((self = [super init]))
	{
	}
    
	return self;
}

-(void)dealloc
{
    [_lbl release];
	[_view release];
	[super dealloc];
}

- (UIView *)view
{
	if (_view == nil)
	{   
		_view = [[UIView alloc] initWithFrame:CGRectMake(2, 0, 316, HEIGHT)];
        
		UIImage *bg = [[UIImage imageWithContentsOfFile:@"/System/Library/WeeAppPlugins/ClockWork.bundle/WeeAppBackground.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:HEIGHT];
		UIImageView *bgView = [[UIImageView alloc] initWithImage:bg];
		bgView.frame = CGRectMake(0, 0, 316, HEIGHT);
		[_view addSubview:bgView];
		[bgView release];
        
		_lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 316, HEIGHT)];
		_lbl.backgroundColor = [UIColor clearColor];
        _lbl.textAlignment = UITextAlignmentCenter;
        _lbl.lineBreakMode = UILineBreakModeWordWrap;
        _lbl.numberOfLines = 1;
		_lbl.textColor = [UIColor whiteColor];
        _lbl.minimumFontSize = 16;
        [_lbl setFont:[UIFont fontWithName:@"Arial-BoldMT" size:16]];
		//_lbl.text = @"Time: 9:42:00 EST";
        _lbl.adjustsFontSizeToFitWidth = YES;
        [_view addSubview:_lbl];
	}
    
	return _view;
}

- (void)update:(NSTimer *)timer
{
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"hh:mm:ss aa zzz"];
    NSString *timeString = [timeFormat stringFromDate:[NSDate date]];
    //NSLog(@"DateString: %@",dateString);
    
    _lbl.text = [NSString stringWithFormat:@"Time: %@",timeString];
    
    [timeFormat release];
}

- (void)viewWillAppear
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(update:) userInfo:nil repeats:YES];
}

- (void)viewDidDisappear
{
    [_timer invalidate];
    _timer = nil;
}

- (float)viewHeight
{
	return HEIGHT;
}

@end