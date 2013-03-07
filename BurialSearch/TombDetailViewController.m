//
//  TombDetailViewController.m
//  BurialSearch
//
//  Created by Joshua Lisojo on 3/6/13.
//  Copyright (c) 2013 Lisojo. All rights reserved.
//

#import "TombDetailViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface TombDetailViewController ()

@end

@implementation TombDetailViewController

@synthesize selectedTomb = _selectedTomb;
@synthesize scrollView = _scrollView;
@synthesize epitaphTextView = _epitaphTextView,
            bornTextField = _bornTextField,
            diedTextField = _diedTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.scrollView setContentSize:CGSizeMake(320, 455)];
    [_bornTextField setText:_selectedTomb.birthDate];
    [_diedTextField setText:_selectedTomb.deathDate];
    [_sectionTextField setText:_selectedTomb.section];
    
    if ([_selectedTomb.years isEqualToString:@"0"])
    {
        [_ageTextField setText:[NSString stringWithFormat:@"%@ months", _selectedTomb.months]];
    }
    else if ([_selectedTomb.birthDate isEqualToString:@"n/a"])
    {
        [_ageTextField setText:@"n/a"];
    }
    else if ([_selectedTomb.birthDate isEqualToString:@" "])
    {
        [_ageTextField setText:@"n/a"];
    }
    else
        [_ageTextField setText:[NSString stringWithFormat:@"%@ years", _selectedTomb.years]];
    
    [self designEpitaphTextView];
    [_epitaphTextView setText: [NSString stringWithFormat:@"%@", _selectedTomb.epitaph,nil]];
    
    self.epitaphTextView.contentSize = [self.epitaphTextView.text sizeWithFont:[UIFont systemFontOfSize:14]
                                               constrainedToSize:CGSizeMake(100, 200)
                                                   lineBreakMode:UIViewAutoresizingFlexibleHeight];
    
    [self.scrollView flashScrollIndicators];
}

- (void) designEpitaphTextView
{
    [_epitaphTextView.layer setBackgroundColor: [[UIColor whiteColor] CGColor]];
    [_epitaphTextView.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [_epitaphTextView.layer setBorderWidth: 1.0];
    [_epitaphTextView.layer setCornerRadius:8.0f];
    [_epitaphTextView.layer setMasksToBounds:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    // set the tiitle of the navigation bar
    if([_selectedTomb.middleName isEqual:nil] || [_selectedTomb.middleName isEqual:NULL] || [_selectedTomb.middleName isEqualToString:@""])
    {
        if([_selectedTomb.middleName length] == 1)
        {
            [_selectedTomb.middleName stringByAppendingString:@"."];
        }
        [self setTitle:[NSString stringWithFormat:@"%@ %@", _selectedTomb.firstName, _selectedTomb.lastName]];
    }
    else
    {
        [self setTitle:[NSString stringWithFormat:@"%@ %@ %@", _selectedTomb.firstName, _selectedTomb.middleName,_selectedTomb.lastName]];
    }
}

@end
