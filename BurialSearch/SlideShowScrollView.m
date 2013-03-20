//
//  SlideShowScrollView.m
//  BurialSearch
//
//  Created by Joshua Lisojo on 3/20/13.
//  Copyright (c) 2013 Lisojo. All rights reserved.
//

#import "SlideShowScrollView.h"

@implementation SlideShowScrollView

@synthesize imgViews = _imgViews,
pageControl = _pageControl,
timer = _timer;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setupSlideShow];
    }
    return self;
}

// Setup the home tab's slideshow.
- (void)setupSlideShow
{
    UIImage *img1 = [UIImage imageNamed:@"ssimage01.png"];
    UIImage *img2 = [UIImage imageNamed:@"ssimage02.png"];
    UIImage *img3 = [UIImage imageNamed:@"ssimage03.png"];
    UIImage *img4 = [UIImage imageNamed:@"ssimage04.png"];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:img4];
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:img1];
    UIImageView *imageView3 = [[UIImageView alloc] initWithImage:img2];
    UIImageView *imageView4 = [[UIImageView alloc] initWithImage:img3];
    UIImageView *imageView5 = [[UIImageView alloc] initWithImage:img4];
    UIImageView *imageView6 = [[UIImageView alloc] initWithImage:img1];
    
    
    _imgViews = [NSArray arrayWithObjects: imageView1, imageView2, imageView3, imageView4, imageView5, imageView6, nil];
    
    self.pagingEnabled = YES;
    self.bounces = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    self.scrollsToTop = NO;
    self.delegate = self;
    
    CGRect cRect = imageView1.bounds;
    UIImageView *cView;
    
    for (int i = 0; i < _imgViews.count; i++)
    {
        cView = [_imgViews objectAtIndex:i];
        cView.frame = cRect;
        [self addSubview:cView];
        cRect.origin.x += cRect.size.width;
    }
    
    self.contentSize = CGSizeMake(cRect.origin.x, self.bounds.size.height);
    [self setContentOffset:CGPointMake(320, 0) animated:YES];
    [self startSlideShow];
    
}

- (void) startSlideShow
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:3.0
                                              target:self
                                            selector:@selector(onTimer)
                                            userInfo:nil
                                             repeats:YES];
}

- (void) stopSlideShow
{
    [_timer invalidate];
}

// When the timer is done this method gets called.
- (void) onTimer
{
    [self setContentOffset:CGPointMake(self.contentOffset.x + 320, 0) animated:YES];
}

// Reset the timer.
-(void)resetTimer
{
    [_timer invalidate];
    _timer = [NSTimer scheduledTimerWithTimeInterval:3.0
                                              target:self
                                            selector:@selector(onTimer)
                                            userInfo:nil
                                             repeats:YES];
}

// Things to do when the scroll view has scrolled.
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.contentOffset.x == 0)
    {
        [self setContentOffset:CGPointMake(1280, 0) animated:NO];
    }
    else if (self.contentOffset.x == 1600)
    {
        [self setContentOffset:CGPointMake(320, 0) animated:NO];
    }
    
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth);
    _pageControl.currentPage = page;
}

-(void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self resetTimer];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
