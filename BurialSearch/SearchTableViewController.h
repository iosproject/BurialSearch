//
//  SearchTableViewController.h
//  BurialSearch
//
//  Created by Joshua Lisojo on 3/6/13.
//  Copyright (c) 2013 Lisojo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchTableViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>

@property (strong,nonatomic) NSArray *tombArray;
@property (strong,nonatomic) NSMutableArray *filteredTombArray;

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
-(IBAction)goToSearch:(id)sender;

@end
