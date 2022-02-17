//
//  ClasificacionTableViewCell.h
//  Waterpolo Center
//
//  Created by Edu Hackintosh on 26/07/14.
//  Copyright (c) 2014 Eapps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClasificacionTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *numPosicion;
@property (weak, nonatomic) IBOutlet UIImageView *escudoImg;
@property (weak, nonatomic) IBOutlet UILabel *nombreEquipo;
@property (weak, nonatomic) IBOutlet UILabel *pj;
@property (weak, nonatomic) IBOutlet UILabel *pg;
@property (weak, nonatomic) IBOutlet UILabel *pe;
@property (weak, nonatomic) IBOutlet UILabel *pp;
@property (weak, nonatomic) IBOutlet UILabel *gf;
@property (weak, nonatomic) IBOutlet UILabel *gc;
@property (weak, nonatomic) IBOutlet UILabel *pt;

@end
