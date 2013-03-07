//
//  SearchTableViewController.m
//  BurialSearch
//
//  Created by Joshua Lisojo on 3/6/13.
//  Copyright (c) 2013 Lisojo. All rights reserved.
//

#import "SearchTableViewController.h"
#import "Tomb.h"
#import "TombDetailViewController.h"

@interface SearchTableViewController ()

@end

@implementation SearchTableViewController

@synthesize tombArray = _tombArray;

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
    if (!_tombArray) {
        self.tombArray = [[NSMutableArray alloc]init];
    }
    
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
        [self.tombArray addObject:tomb];
        //NSLog(@"%@", [tomb viewDescription]);
    }
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
    [self readLocalJSON];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tombArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TombCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Tomb *tomb = [self.tombArray objectAtIndex:indexPath.row];
    
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
        TombDetailViewController *vc = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        [vc setSelectedTomb:[self.tombArray objectAtIndex:indexPath.row]];
    }
}
@end
