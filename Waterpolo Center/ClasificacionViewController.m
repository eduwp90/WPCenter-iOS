//
//  ClasificacionViewController.m
//  Waterpolo Center
//
//  Created by Edu Hackintosh on 26/07/14.
//  Copyright (c) 2014 Eapps. All rights reserved.
//

#import "ClasificacionViewController.h"
#import "TFHpple.h"
#import "ClasificacionItem.h"
#import "ClasificacionTableViewCell.h"
#import "AFNetworking.h"
#import "Utiles.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"


@interface ClasificacionViewController ()

@end

@implementation ClasificacionViewController
@synthesize clasificacionObjects=_clasificacionObjects;

NSMutableArray *Clasificacion;
AppDelegate *a;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView2.rowHeight = 44.0;
    Clasificacion = [[NSMutableArray alloc]initWithCapacity:(0)];
    
    a=((AppDelegate*)[[UIApplication sharedApplication]delegate]);
    
    [self actualizar];
}

-(void)actualizar{
    
        
        NSLog(@"actualizarrr");
        
        NSURL *Url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.rfen.es/publicacion/waterpolo/asp/clasificacion.asp?c=%@", a.httpUrl]];
        NSURLRequest *request = [NSURLRequest requestWithURL:Url];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"Cargando";
    hud.userInteractionEnabled=NO;
    [hud show:YES];
        
        
        AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSData *html =[NSData dataWithData:responseObject];
            // 2
            TFHpple *Parser = [TFHpple hppleWithHTMLData:html];
            
            // 3
           NSString *equipoXpathQueryString = @"//tr/td/a";
            NSString *statsXpathQueryString = @"//tr/td[@class='titulo2'] [@width='5%'] [@align='center']";
            NSArray *equipoNodes = [Parser searchWithXPathQuery:equipoXpathQueryString];
            NSArray *statsNodes = [Parser searchWithXPathQuery:statsXpathQueryString];
            
            //Si la lista de goleadores esta completa la borramos
            if ([Clasificacion count] != 0) {
                [Clasificacion removeAllObjects];
            }
            for (int i=0 ; i<[equipoNodes count] ;i++) {
                ClasificacionItem *clasificacionItem=[[ClasificacionItem alloc]init];
                [Clasificacion addObject:clasificacionItem];
                clasificacionItem.nombreEquipo=[[equipoNodes[i] firstChild]content];
                clasificacionItem.escudoImg=convertiraescudo([[equipoNodes[i] firstChild]content]);
                clasificacionItem.pj=[[statsNodes[(i*17)+2] firstChild]content];
                clasificacionItem.pt=[[statsNodes[(i*17)+1] firstChild]content];
                clasificacionItem.gf=[[statsNodes[(i*17)+3] firstChild]content];
                clasificacionItem.gc=[[statsNodes[(i*17)+4] firstChild]content];
                int pg = [[[statsNodes[(i*17)+6] firstChild]content] intValue]+[[[statsNodes[(i*17)+12] firstChild]content]intValue];
                int pe = [[[statsNodes[(i*17)+7] firstChild]content] intValue]+[[[statsNodes[(i*17)+13] firstChild]content]intValue];
                int pp = [[[statsNodes[(i*17)+8] firstChild]content] intValue]+[[[statsNodes[(i*17)+14] firstChild]content]intValue];
                clasificacionItem.pg=[NSString stringWithFormat:@"%d",pg];
                clasificacionItem.pe=[NSString stringWithFormat:@"%d",pe];
                clasificacionItem.pp=[NSString stringWithFormat:@"%d",pp];
                NSLog([NSString stringWithFormat:@"%d",pg]);
                
                
            }
            _clasificacionObjects=Clasificacion;
            NSLog(@"num %ld",[Clasificacion count]);
            [self.tableView2 reloadData];

            
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
    return [self.clasificacionObjects count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"clasificacionTableCell";
    
    ClasificacionTableViewCell *cell = [tableView
                                     dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[ClasificacionTableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.numPosicion.text = [NSString stringWithFormat:@"%d", indexPath.row+1];;
    
    ClasificacionItem *esteequipo =[_clasificacionObjects objectAtIndex:[indexPath row]];
    
    cell.nombreEquipo.text=esteequipo.nombreEquipo;
    cell.pj.text=esteequipo.pj;
    cell.pg.text=esteequipo.pg;
    cell.pe.text=esteequipo.pe;
    cell.pp.text=esteequipo.pp;
    cell.gf.text=esteequipo.gf;
    cell.gc.text=esteequipo.gc;
    cell.pt.text=esteequipo.pt;
    cell.escudoImg.image = [UIImage imageNamed:esteequipo.escudoImg];
    
    return cell;
}

@end
