//
//  SearchTableViewController.h
//  BurialSearch
//
//  Created by Joshua Lisojo on 3/6/13.
//  Copyright (c) 2013 Lisojo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchTableViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>

@property (nonatomic) NSArray *tombArray;
@property (nonatomic) NSArray *searchResults;

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@end
