//
//  JornadasPopupTableViewController.m
//  Waterpolo Center
//
//  Created by Edu Hackintosh on 02/08/14.
//  Copyright (c) 2014 Eapps. All rights reserved.
//

#import "JornadasPopupTableViewController.h"
#import "AppDelegate.h"
@interface JornadasPopupTableViewController ()

@end

@implementation JornadasPopupTableViewController
NSMutableArray *Jornadas;
AppDelegate *a;
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
    Jornadas=[[NSMutableArray alloc] init];
    a=((AppDelegate*)[[UIApplication sharedApplication]delegate]);
    if ([Jornadas count]>0) {
        [Jornadas removeAllObjects];
    }
    for (int i=0; i==a.numeroJornadas; i++) {
        [Jornadas addObject:[NSString stringWithFormat:@"Jornada %d",i+1]];
        NSLog([Jornadas objectAtIndex:i]);
    }
   }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [Jornadas count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
@end
