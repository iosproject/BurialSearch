//
//  SlideShowScrollView.h
//  BurialSearch
//
//  Created by Joshua Lisojo on 3/20/13.
//  Copyright (c) 2013 Lisojo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideShowScrollView : UIScrollView <UIScrollViewDelegate>

@property (weak, nonatomic) UIPageControl *pageControl;
@property (nonatomic, retain) NSArray *imgViews;
@property (nonatomic, retain) NSTimer *timer;

@end
