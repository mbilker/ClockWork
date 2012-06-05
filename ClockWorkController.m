#import "BBWeeAppController-Protocol.h"

static NSBundle *_ClockWorkWeeAppBundle = nil;

@interface ClockWorkController: NSObject <BBWeeAppController> {
	UIView *_view;
	UIImageView *_backgroundView;
	UILabel *_lbl;
	NSTimer *_timer;
}
@property (nonatomic, retain) UIView *view;

- (void)update:(NSTimer *)timer;

@end

@implementation ClockWorkController
@synthesize view = _view;

+ (void)initialize {
	_ClockWorkWeeAppBundle = [[NSBundle bundleForClass:[self class]] retain];
}

- (id)init {
	if((self = [super init]) != nil) {
		
	} return self;
}

- (void)dealloc {
	[_view release];
	[_backgroundView release];
	[super dealloc];
}

- (void)refreshTime {
	NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
	[timeFormat setDateFormat:@"hh:mm:ss aa zzz"];
	NSString *timeString = [timeFormat stringFromDate:[NSDate date]];
	[timeFormat release];
	//NSLog(@"DateString: %@",dateString);
	_lbl.text = [NSString stringWithFormat:@"Time: %@",timeString];
}

- (void)loadFullView {
	// Add subviews to _backgroundView (or _view) here.
	_lbl = [[UILabel alloc] initWithFrame:(CGRect){CGPointZero, {316.f, [self viewHeight]}}];
	_lbl.backgroundColor = [UIColor clearColor];
	_lbl.textAlignment = UITextAlignmentCenter;
	_lbl.lineBreakMode = UILineBreakModeWordWrap;
	_lbl.numberOfLines = 1;
	_lbl.textColor = [UIColor whiteColor];
	_lbl.minimumFontSize = 16;
	[_lbl setFont:[UIFont fontWithName:@"Arial-BoldMT" size:16]];
	//_lbl.text = @"Time: 9:42:00 EST";
	_lbl.adjustsFontSizeToFitWidth = YES;
	_lbl.center = _view.center;
	[_view addSubview:_lbl];

	[self refreshTime];
	_timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(update:) userInfo:nil repeats:YES];
}

- (void)loadPlaceholderView {
	// This should only be a placeholder - it should not connect to any servers or perform any intense
	// data loading operations.
	//
	// All widgets are 316 points wide. Image size calculations match those of the Stocks widget.
	_view = [[UIView alloc] initWithFrame:(CGRect){CGPointZero, {316.f, [self viewHeight]}}];
	_view.autoresizingMask = UIViewAutoresizingFlexibleWidth;

	UIImage *bgImg = [UIImage imageWithContentsOfFile:@"/System/Library/WeeAppPlugins/StocksWeeApp.bundle/WeeAppBackground.png"];
	UIImage *stretchableBgImg = [bgImg stretchableImageWithLeftCapWidth:floorf(bgImg.size.width / 2.f) topCapHeight:floorf(bgImg.size.height / 2.f)];
	_backgroundView = [[UIImageView alloc] initWithImage:stretchableBgImg];
	_backgroundView.frame = CGRectInset(_view.bounds, 2.f, 0.f);
	_backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	[_view addSubview:_backgroundView];
}

- (void)update:(NSTimer *)timer
{
	[self refreshTime];
}

- (void)viewWillDisappear {
	[_timer invalidate];
	_timer = nil;
}

- (void)unloadView {
	[_view release];
	_view = nil;
	[_backgroundView release];
	_backgroundView = nil;
	[_lbl release];
	_lbl = nil;
	[_timer release];
	_timer = nil;
	// Destroy any additional subviews you added here. Don't waste memory :(.
}

- (float)viewHeight {
	return 30.f;
}

@end
