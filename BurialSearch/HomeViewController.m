//
//  HomeViewController.m
//  BurialSearch
//
//  Created by Joshua Lisojo on 3/6/13.
//  Copyright (c) 2013 Lisojo. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"new_tomb_database" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    NSError *error = nil;
    NSDictionary *jsonTombData = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:kNilOptions
                                                                   error:&error];

    for (NSDictionary *tomb in jsonTombData)
    {
        NSLog(@"%@ ", [tomb objectForKey:@"First_Name"]);
    }
    
    NSLog(@"%d", [jsonTombData count]);
     

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
