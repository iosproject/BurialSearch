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
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"new_tomb_database" ofType:@"json"];
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
        Tomb *tomb = [[Tomb alloc]initWithFirstName:[dict objectForKey:FPC_TOMB_FIRSTNAME]
                                        andLastName:[dict objectForKey:FPC_TOMB_LASTNAME]
                                      andMiddleName:[dict objectForKey:FPC_TOMB_MIDDLENAME]
                                       andBirthDate:([[dict objectForKey:FPC_TOMB_DOB] isEqualToString:@""]) ? @"n/a " : [dict objectForKey:FPC_TOMB_DOB]
                                       andDeathDate:([[dict objectForKey:FPC_TOMB_DOD] isEqualToString:@""]) ? @"n/a " : [dict objectForKey:FPC_TOMB_DOD]
                                          andPrefix:[dict objectForKey:FPC_TOMB_PREFIX]
                                          andSuffix:[dict objectForKey:FPC_TOMB_SUFFIX]
                                            andTour:[dict objectForKey:FPC_TOMB_TOUR]
                                        andInternet:[dict objectForKey:FPC_TOMB_INTERNETLINK]
                                           andNotes:[dict objectForKey:FPC_TOMB_NOTES]
                                    andSextonsNotes:[dict objectForKey:FPC_TOMB_NOTES]
                                         andEpitaph:[dict objectForKey:FPC_TOMB_EPITAPH]
                                         andSection:[dict objectForKey:FPC_TOMB_SECTION]
                                        andMaterial:[dict objectForKey:FPC_TOMB_MATERIAL]
                                           andYears:([[dict objectForKey:FPC_TOMB_YEARS] isEqualToString:@""]) ? @"n/a " : [dict objectForKey:FPC_TOMB_YEARS]
                                          andMonths:([[dict objectForKey:FPC_TOMB_MONTHS] isEqualToString:@""]) ? @"n/a " : [dict objectForKey:FPC_TOMB_MONTHS]
                                         andVeteran:[dict objectForKey:FPC_TOMB_VETERAN]
                                        andUniqueId:[dict objectForKey:FPC_TOMB_UID]
                                        andStanding:[dict objectForKey:FPC_TOMB_STANDING]
                                            andPoem:[dict objectForKey:FPC_TOMB_POEM]
                                             andWar:[dict objectForKey:FPC_TOMB_WAR]
                                           andApDob:[dict objectForKey:FPC_TOMB_APDOB]
                                    andCauseOfDeath:[dict objectForKey:FPC_TOMB_CAUSE_OF_DEATH]
                                       andHeadstone:[dict objectForKey:FPC_TOMB_HEADSTONE]
                                     andDateCreated:[dict objectForKey: FPC_TOMB_DATE_CREATED]
                                    andDateModified:[dict objectForKey:FPC_TOMB_DATE_MODIFIED]];
        
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
