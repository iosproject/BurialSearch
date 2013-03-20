//
//  SearchTableViewController.h
//  BurialSearch
//
//  Created by Joshua Lisojo on 3/6/13.
//  Copyright (c) 2013 Lisojo. All rights reserved.
//

#import <UIKit/UIKit.h>

#define FILE_URL @"http://eve.kean.edu/~jplisojo/result2.json"
#define LOCAL_FILE_NAME @"result.json"


@interface SearchTableViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>

@property (strong,nonatomic) NSArray *tombArray;
@property (strong,nonatomic) NSMutableArray *filteredTombArray;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property (nonatomic, retain) UIActivityIndicatorView * activityView;
@property (nonatomic, retain) UIView *loadingView;
@property (nonatomic, retain) UILabel *loadingLabel;

-(IBAction)goToSearch:(id)sender;

@end
