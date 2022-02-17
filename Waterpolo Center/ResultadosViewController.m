//
//  ResultadosViewController.m
//  Waterpolo Center
//
//  Created by Edu Hackintosh on 19/07/14.
//  Copyright (c) 2014 Eapps. All rights reserved.
//

#import "ResultadosViewController.h"
#import "AppDelegate.h"
#import "RMPickerViewController.h"
#import "MBProgressHUD.h"
#import "TFHpple.h"
#import "PartidoItem.h"
#import "Utiles.h"
#import "ResultadosTableViewCell.h"

@interface ResultadosViewController () <RMPickerViewControllerDelegate>


@end

@implementation ResultadosViewController
NSMutableArray *Jornadas;
AppDelegate *a;
NSUserDefaults *prefs;
@synthesize seleccionaJornadaBtn;
@synthesize resultadosObjects=_resultadosObjects;
NSMutableArray *Resultados;
UIImage *roundedImage;
static NSString *CellIdentifier = @"ResultadosTableCell";
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
    Resultados = [[NSMutableArray alloc]initWithCapacity:(0)];
    self.tableView1.rowHeight = 70.0;
    
    

    
    //preparar fondo de las cells
    roundedImage = [UIImage imageNamed:@"fondoresultadocell3"];
    roundedImage = [roundedImage resizableImageWithCapInsets:UIEdgeInsetsMake(20.0, 20.0, 20.0, 20.0)];

    prefs = [NSUserDefaults standardUserDefaults];
    // Crear array con el numero de jornadas de la division seleccionada
    Jornadas=[[NSMutableArray alloc] init];
    a=((AppDelegate*)[[UIApplication sharedApplication]delegate]);
    NSLog(@"num jornadas %d",a.numeroJornadas);
    if ([Jornadas count]>0) {
        [Jornadas removeAllObjects];
        NSLog(@"elimina jornadas");
    }
    for (int i=0; i<a.numeroJornadas; i++) {
        [Jornadas addObject:[NSString stringWithFormat:@"Jornada %d",i+1]];
        NSLog(@"llus jornadas %d",i);
    }
    //Recuperar la jornada seleccionada en esta división y sino esta guardada poner jornada 1
    NSInteger jornadaactual =[prefs integerForKey:[NSString stringWithFormat:@"Jornadasel%@",a.httpUrl]];
    if (jornadaactual==0) {
        [self actualizarJornada:(1)];
    }else{
        [self actualizarJornada:(jornadaactual)];
    }

}

- (IBAction)openPickerController:(id)sender {
    

    RMPickerViewController *pickerVC = [RMPickerViewController pickerController];
    pickerVC.delegate = self;
    pickerVC.titleLabel.text = @"Selecciona la jornada";
    
    //You can enable or disable bouncing and motion effects
    //pickerVC.disableBouncingWhenShowing = YES;
    //pickerVC.disableMotionEffects = YES;
    
    [pickerVC show];
    
    //You can also adjust colors (enabling example will result in a black version)
    pickerVC.tintColor = [UIColor blueColor];
    //pickerVC.backgroundColor = [UIColor colorWithWhite:0.25 alpha:1];
    //pickerVC.titleLabel.textColor = [UIColor whiteColor];
}

#pragma mark - RMPickerViewController Delegates
- (void)pickerViewController:(RMPickerViewController *)vc didSelectRows:(NSArray *)selectedRows {
    
    //cambiar el nombre del label superior
    [self actualizarJornada:([selectedRows[0] intValue]+1)];
    //guardar la jornada seleccionada en esta division
    [prefs setInteger:([selectedRows[0] intValue]+1) forKey:[NSString stringWithFormat:@"Jornadasel%@",a.httpUrl]];
    [prefs synchronize];
}

- (void)pickerViewControllerDidCancel:(RMPickerViewController *)vc {
    NSLog(@"Selection was canceled");
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [Jornadas count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [NSString stringWithFormat:@"Jornada %lu", (long)row+1];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]  initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(actualizarJornada:)];
    self.tabBarController.navigationItem.rightBarButtonItem = rightButton;
}
- (void)actualizarJornada:(NSInteger)numJornada{
    [seleccionaJornadaBtn setTitle:[NSString stringWithFormat:@"JORNADA %ld",(long)numJornada] forState:UIControlStateNormal];
    
    
        
        NSLog([NSString stringWithFormat:@"http://www.rfen.es/publicacion/waterpolo/asp/resultados.asp?c=%@&j=%ld", a.httpUrl,numJornada]);
        
        NSURL *Url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.rfen.es/publicacion/waterpolo/asp/resultados.asp?c=%@&j=%ld", a.httpUrl,numJornada]];
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
            NSString *fhoraXpathQueryString = @"//tr/td[@class='titulo2'] [@width='10%']";
            NSString *golesXpathQueryString = @"//tr/td/a/b";
            NSString *equiposXpathQueryString = @"//tr/td[@class='contenido2'] ";
            NSString *fichaXpathQueryString = @"//tr/td [@class='titulo2'] [@width='5%']";
            NSArray *fhoraNodes = [Parser searchWithXPathQuery:fhoraXpathQueryString];
            NSArray *equiposNodes = [Parser searchWithXPathQuery:equiposXpathQueryString];
            NSArray *golesNodes = [Parser searchWithXPathQuery:golesXpathQueryString];
            NSArray *fichaNodes = [Parser searchWithXPathQuery:fichaXpathQueryString];
            if ([Resultados count] != 0) {
                [Resultados removeAllObjects];
            }
            if ([fhoraNodes count]==0) {
                NSLog(@"vacioooooooooo");
            }
            for (int i=0 ; i<[fhoraNodes count] ;i++) {
                NSLog(@"EQUIPOS:%@",[[equiposNodes[i*2] firstChild]text]);
                
                NSLog(@"EQUIPOS:%@",[[equiposNodes[i*2+1] firstChild]text]);
                
                NSLog(@"EQUIPOS:%@",[[fhoraNodes[i] firstChild]content]);
                NSLog(@"EQUIPOS:%@",[[fichaNodes[i*2] firstChild]objectForKey:@"href"]);
                PartidoItem *partidoItem = [[PartidoItem alloc]init];
                [Resultados addObject:partidoItem];
                partidoItem.nombreEquipoLocal=[[equiposNodes[i*2] firstChild]text];
                partidoItem.nombreEquipoVisitante=[[equiposNodes[i*2+1] firstChild]text];
                partidoItem.escudoLocal=convertiraescudo([[equiposNodes[i*2] firstChild]text]);
                partidoItem.escudoVisitante=convertiraescudo([[equiposNodes[i*2+1] firstChild]text]);
                NSString *periodo =[[fhoraNodes[i] firstChild]content];
                
                if ([periodo isEqualToString:@"Finalizado"]) {
                    NSString *gollocal=[[golesNodes[i*2] firstChild]content];
                    NSString *golvisitante=[[golesNodes[i*2+1] firstChild]content];
                    partidoItem.resultado=[NSString stringWithFormat:@"%@ - %@",gollocal,golvisitante];
                    partidoItem.fechaHora_periodo=@"Finalizado";
                }else{
                    partidoItem.resultado=[NSString stringWithFormat:@"0 - 0"];
                    partidoItem.fechaHora_periodo=@"xupaaaaaaaa";
                }
                NSLog(@"EQUIPOS:%@",[[equiposNodes[i*2] firstChild]text]);
                NSLog(@"EQUIPOS:%@",[[equiposNodes[i*2+1] firstChild]text]);
                
                NSLog(@"EQUIPOS:%@",[[fhoraNodes[i] firstChild]content]);
                NSLog(@"EQUIPOS:%@",[[fichaNodes[i*2] firstChild]objectForKey:@"href"]);
                
            }
            _resultadosObjects=Resultados;
            [self.tableView1 reloadData];

            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];
        [op start];
    [hud hide:YES];
    
        
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.resultadosObjects count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    ResultadosTableViewCell *cell = [tableView
                                        dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[ResultadosTableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    cell.dataSource=self;
    
    cell.backgroundView=[[UIImageView alloc] initWithImage:roundedImage];
    PartidoItem *esteequipo =[_resultadosObjects objectAtIndex:[indexPath row]];
    
    cell.fecha_periodoLabel.text=esteequipo.fechaHora_periodo;
    cell.localLabel.text=esteequipo.nombreEquipoLocal;
    cell.visitanteLabel.text=esteequipo.nombreEquipoVisitante;
    cell.resultadoLabel.text=esteequipo.resultado;
    
    cell.localescudoImage.image= [UIImage imageNamed:esteequipo.escudoLocal];
    cell.visitanteescudoImage.image= [UIImage imageNamed:esteequipo.escudoVisitante];
    
    return cell;
}

- (NSArray*)rightButtonItemsInRevealTableViewCell:(ResultadosTableViewCell *)revealTableViewCell
{
    SWCellButtonItem *item1 = [SWCellButtonItem itemWithTitle:@"Delete" handler:^(SWCellButtonItem *item, SWRevealTableViewCell *cell)
                               {
                                   NSLog( @"Delete");
                               }];
    
    item1.backgroundColor = [UIColor redColor];
    item1.tintColor = [UIColor whiteColor];
    item1.width = 75;
    
    return @[item1];
}

@end
