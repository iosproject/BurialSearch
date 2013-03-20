//
//  TombDetailViewController.h
//  BurialSearch
//
//  Created by Joshua Lisojo on 3/6/13.
//  Copyright (c) 2013 Lisojo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tomb.h"

@interface TombDetailViewController : UIViewController

@property (nonatomic, retain) Tomb *selectedTomb;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UITextField *bornTextField;
@property (strong, nonatomic) IBOutlet UITextField *diedTextField;
@property (strong, nonatomic) IBOutlet UITextField *ageTextField;
@property (strong, nonatomic) IBOutlet UITextField *sectionTextField;
@property (strong, nonatomic) IBOutlet UITextView *epitaphTextView;

@property (strong, nonatomic) IBOutlet UITextField *causeOfDeathTextField;
@property (strong, nonatomic) IBOutlet UITextField *veteranTextField;

@end
