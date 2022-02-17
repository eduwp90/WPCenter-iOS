//
//  ResultadosViewController.h
//  Waterpolo Center
//
//  Created by Edu Hackintosh on 19/07/14.
//  Copyright (c) 2014 Eapps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultadosViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *seleccionaJornadaBtn;
@property(nonatomic,strong) NSArray *resultadosObjects;
@property (strong, nonatomic) IBOutlet UITableView *tableView1;
@end
