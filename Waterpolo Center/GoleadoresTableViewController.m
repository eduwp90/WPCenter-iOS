//
//  GoleadoresTableViewController.m
//  Waterpolo Center
//
//  Created by Edu Hackintosh on 18/07/14.
//  Copyright (c) 2014 Eapps. All rights reserved.
//

#import "GoleadoresTableViewController.h"
#import "TFHpple.h"
#import "Goleador.h"
#import "GoleadoresTableViewCell.h"
#import "AFNetworking.h"
#import "Utiles.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"

@interface GoleadoresTableViewController ()

@end

@implementation GoleadoresTableViewController
@synthesize objects =_objects;
NSMutableArray *Goleadores;
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
    self.tableView.rowHeight = 44.0;
    self.navigationController.navigationBar.translucent = NO;
    Goleadores = [[NSMutableArray alloc]initWithCapacity:(0)];
    a=((AppDelegate*)[[UIApplication sharedApplication]delegate]);
    [self actualizar];
}

-(void)actualizar{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"Cargando";
    hud.userInteractionEnabled=NO;
    [hud show:YES];
    
    NSLog(@"actualizarrr");
        
    NSURL *Url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.rfen.es/publicacion/waterpolo/asp/goleadores.asp?c=%@", a.httpUrl]];
    NSURLRequest *request = [NSURLRequest requestWithURL:Url];
    
    
    
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *html =[NSData dataWithData:responseObject];
        // 2
        TFHpple *tutorialsParser = [TFHpple hppleWithHTMLData:html];
        
        // 3
        NSString *JugadoresXpathQueryString = @"//tr/td/a";
        NSString *GolesXPathQueryString = @"//tr/td[@class='titulo2'] [@width='30%'] [@align='center']";
        NSArray *JugadoresNodes = [tutorialsParser searchWithXPathQuery:JugadoresXpathQueryString];
        NSArray *GolesNodes = [tutorialsParser searchWithXPathQuery:GolesXPathQueryString];
        
        //Si la lista de goleadores esta completa la borramos
        if ([Goleadores count] != 0) {
            [Goleadores removeAllObjects];
        }
    
        for (int i=0 ; i<[GolesNodes count] ;i++) {
            TFHppleElement *golElement =GolesNodes[i];
            TFHppleElement *jugadorElement = JugadoresNodes[i*2];
            TFHppleElement *equipoElement = JugadoresNodes[(i*2)+1];
            NSString *gol= [[golElement firstChild]content];
            NSString *jug= [[jugadorElement firstChild]content];
            NSString *equipo= [[equipoElement firstChild]content];
            NSLog(@"Nombre = %@", jug);
            NSLog(@"Value of gol = %@", gol);
            NSLog(@"Value of equipo = %@", equipo);
            
            //Crear un goleador y asignar datos
            Goleador *goleador =[[Goleador alloc]init];
            [Goleadores addObject:goleador];
            goleador.nombreGoleador=jug;
            goleador.numGoles=gol;
            goleador.escudo=equipo;
            
        }
        _objects =Goleadores;
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    [op start];
    
    [hud hide:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]  initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(actualizar)];
    self.tabBarController.navigationItem.rightBarButtonItem = rightButton;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.objects count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"goleadoresTableCell";
    
    GoleadoresTableViewCell *cell = [tableView
                              dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[GoleadoresTableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.posicionLabel.text = [NSString stringWithFormat:@"%d", indexPath.row+1];;
    
    Goleador *estegoleador =[_objects objectAtIndex:[indexPath row]];

    cell.nombrejugadorLabel.text =estegoleador.nombreGoleador;
    cell.goleslLabel.text = estegoleador.numGoles;
    
    cell.escudoImage.image = [UIImage imageNamed:convertiraescudo(estegoleador.escudo)];
        
    return cell;
}


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
