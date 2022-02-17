//
//  MenuViewController.m
//  Waterpolo Center
//
//  Created by Edu Hackintosh on 07/07/14.
//  Copyright (c) 2014 Eapps. All rights reserved.
//

#import "MenuViewController.h"
#import "AppDelegate.h"

@interface MenuViewController ()
@end

@implementation MenuViewController
NSUserDefaults *prefs;
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
    a=((AppDelegate*)[[UIApplication sharedApplication]delegate]);
    prefs = [NSUserDefaults standardUserDefaults];
    NSString *guardado = [prefs stringForKey:@"opcionMenu"];
    if (guardado==nil) {
        guardado=@"dhm";
    }
    [self performSegueWithIdentifier: guardado sender: self];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id) sender
{
    
    UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"dhm"]) {
        NSLog(@"pantalla Opcion 1");
        [prefs setValue:@"dhm" forKey:@"opcionMenu"];
        destViewController.title = @"División de Honor ♂";
        a.httpUrl=@"341";
        a.numeroJornadas=22;
        
    }
    if ([segue.identifier isEqualToString:@"primeram"]) {
        NSLog(@"pantalla Opcion 2");
        [prefs setValue:@"primeram" forKey:@"opcionMenu"];
        destViewController.title = @"Primera División ♂";
        a.httpUrl=@"345";
        a.numeroJornadas=22;
    }
    if ([segue.identifier isEqualToString:@"dhf"]) {
        NSLog(@"pantalla Opcion 1");
        [prefs setValue:@"dhf" forKey:@"opcionMenu"];
        destViewController.title = @"División de Honor ♀";
        a.httpUrl=@"344";
        a.numeroJornadas=18;
    }
    if ([segue.identifier isEqualToString:@"primeraf"]) {
        NSLog(@"pantalla Opcion 2");
        [prefs setValue:@"primeraf" forKey:@"opcionMenu"];
        destViewController.title = @"Primera División ♀";
        a.httpUrl=@"311";
        a.numeroJornadas=14;
    }
    if ([segue.identifier isEqualToString:@"segundam"]) {
        NSLog(@"pantalla Opcion 2");
        [prefs setValue:@"segundam" forKey:@"opcionMenu"];
        destViewController.title = @"Segunda División ♂";
        a.httpUrl=@"310";
        a.numeroJornadas=18;
    }
    [prefs synchronize];

    if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] ) {
        SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*) segue;
        
        swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc) {
            
            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
            [navController setViewControllers: @[dvc] animated: NO ];
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
        };
        
    }
    }

#pragma mark - Table view data source

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
