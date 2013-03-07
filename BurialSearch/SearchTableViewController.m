//
//  SearchTableViewController.m
//  BurialSearch
//
//  Created by Joshua Lisojo on 3/6/13.
//  Copyright (c) 2013 Lisojo. All rights reserved.
//

#import "SearchTableViewController.h"
#import "TombDetailViewController.h"
#import "Tomb.h"

@interface SearchTableViewController ()

@end

@implementation SearchTableViewController

@synthesize tombArray = _tombArray,
            searchBar = _searchBar,
            filteredTombArray = _filteredTombArray;




- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
	// Update the filtered array based on the search text and scope.
	
    // Remove all objects from the filtered search array
	[self.filteredTombArray removeAllObjects];
    
	// Filter the array using NSPredicate
    NSPredicate *predicate;
    NSArray *tempArray;
    
    if([scope isEqualToString:@"Name"])
    {
        predicate = [NSPredicate predicateWithFormat:@"(fullName CONTAINS[cd] %@) OR (firstAndLastName CONTAINS[cd] %@)", searchText, searchText];
        tempArray = [_tombArray filteredArrayUsingPredicate:predicate];
    }
    else if ([scope isEqualToString:@"Y.O.D."])
    {
        predicate = [NSPredicate predicateWithFormat:@"(deathDate CONTAINS[cd] %@)", searchText];
        tempArray = [_tombArray filteredArrayUsingPredicate:predicate];
    }
    else if ([scope isEqualToString:@"Age"])
    {
        predicate = [NSPredicate predicateWithFormat:@"(years CONTAINS[cd] %@)", searchText];
        tempArray = [_tombArray filteredArrayUsingPredicate:predicate];
    }
    else if ([scope isEqualToString:@"Section"])
    {
        predicate = [NSPredicate predicateWithFormat:@"(section CONTAINS[cd] %@)", searchText];
        tempArray = [_tombArray filteredArrayUsingPredicate:predicate];
    }
    
    _filteredTombArray = [NSMutableArray arrayWithArray:tempArray];
}


- (void) readLocalJSON
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"tomb_database" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    NSError *error = nil;
    NSDictionary *jsonTombData = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:kNilOptions
                                                                   error:&error];
    /*
    for (NSDictionary *tomb in jsonTombData)
    {
        NSLog(@"%@ ", [tomb objectForKey:@"FirstName"]);
    }
    NSLog(@"%d", [jsonTombData count]);
    */
    [self buildTombObjectsFromDictionary:jsonTombData];
}

-(void)buildTombObjectsFromDictionary:(NSDictionary *)jsonTombData
{
    NSMutableArray *tempArray = [[NSMutableArray alloc]init];
 
    for (NSDictionary *dict in jsonTombData)
    {
        Tomb *tomb = [[Tomb alloc]initWithFirstName:[dict objectForKey:@"FirstName"]
                                        andLastName:[dict objectForKey:@"LastName"]
                                      andMiddleName:[dict objectForKey:@"Middle"]
                                       andBirthDate:([[dict objectForKey:@"DOB"] isEqualToString:@""]) ? @"n/a " : [dict objectForKey:@"DOB"]
                                       andDeathDate:([[dict objectForKey:@"DOD"] isEqualToString:@""]) ? @"n/a " : [dict objectForKey:@"DOD"]
                                          andPrefix:[dict objectForKey:@"Prefix"]
                                          andSuffix:[dict objectForKey:@"Suffix"]
                                             andRef:[dict objectForKey:@"Ref"]
                                            andTour:[dict objectForKey:@"Tour"]
                                        andInternet:[dict objectForKey:@"InternetLink"]
                                           andNotes:[dict objectForKey:@"Notes"]
                                    andSextonsNotes:[dict objectForKey:@"SextonsNotes"]
                                         andEpitaph:[dict objectForKey:@"Epitaph"]
                                         andSection:[dict objectForKey:@"Section"]
                                              andID:[dict objectForKey:@"ID"]
                                        andSandston:[dict objectForKey:@"Sandstone"]
                                           andYears:([[dict objectForKey:@"DOB"] isEqualToString:@""]) ? @"n/a " : [dict objectForKey:@"Years"]
                                          andMonths:([[dict objectForKey:@"DOB"] isEqualToString:@""]) ? @"n/a " : [dict objectForKey:@"Months"]
                                       andCondition:[dict objectForKey:@"Condition"]
                                         andVeteran:[dict objectForKey:@"Veteran"]
                                        andUniqueId:[dict objectForKey:@"UID"]];
        [tempArray addObject:tomb];
        //NSLog(@"%@", [tomb viewDescription]);
    }
    
    self.tombArray = [[NSArray alloc]initWithArray:tempArray];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // style the search bar
    [_searchBar setShowsScopeBar:NO];
    [_searchBar sizeToFit];
    
    // Hide the search bar until user scrolls up
    CGRect newBounds = self.tableView.bounds;
    newBounds.origin.y = newBounds.origin.y + _searchBar.bounds.size.height;
    self.tableView.bounds = newBounds;
    
    // read local JSON file
    [self readLocalJSON];
    
    // initialize the array to hold search results
    _filteredTombArray = [NSMutableArray arrayWithCapacity:[_tombArray count]];
    
    // Reload the table
    [[self tableView] reloadData];
}

-(IBAction)goToSearch:(id)sender
{
    [_searchBar becomeFirstResponder];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [_filteredTombArray count];
    } else {
        return [_tombArray count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TombCell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    Tomb *tomb = nil;
    
    // selecct the tombs
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        tomb = [self.filteredTombArray objectAtIndex:indexPath.row];
    } else {
        tomb = [self.tombArray objectAtIndex:indexPath.row];
    }
     
    // configure the srtings
    if([tomb.middleName isEqual:nil] || [tomb.middleName isEqual:NULL] || [tomb.middleName isEqualToString:@""])
    {
        cell.textLabel.text = [NSString stringWithFormat: @"%@ %@", tomb.firstName, tomb.lastName, nil];
    }
    else
    {
        if([tomb.middleName length] == 1)
        {
            tomb.middleName = [tomb.middleName stringByAppendingString:@"."];
        }
        cell.textLabel.text = [NSString stringWithFormat: @"%@ %@ %@", tomb.firstName, tomb.middleName ,tomb.lastName, nil];
    }
    
    
    if(![tomb.birthDate isEqualToString:@""] && ![tomb.deathDate isEqualToString:@""])
    {
        cell.detailTextLabel.text = [NSString stringWithFormat: @"%@ - %@", [tomb.birthDate substringToIndex:4], [tomb.deathDate substringToIndex:4], nil];
    }
    else
    {
        cell.detailTextLabel.text = @"";
    }
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowTombDetails"])
    {
        TombDetailViewController *tombDetailViewController = [segue destinationViewController];
        
        // In order to manipulate the destination view controller, another check on which table (search or normal) is displayed is needed
        if([self.searchDisplayController isActive]) {
            NSIndexPath *indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            Tomb *destinationTomb = [self.filteredTombArray objectAtIndex:[indexPath row]];
            [tombDetailViewController setSelectedTomb:destinationTomb];
        }
        else {
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            Tomb *destinationTomb = [self.tombArray objectAtIndex:[indexPath row]];
            [tombDetailViewController setSelectedTomb:destinationTomb];
        }
    }
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}


- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:[self.searchDisplayController.searchBar text] scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

@end
