//
//  ClasificacionTableViewCell.m
//  Waterpolo Center
//
//  Created by Edu Hackintosh on 26/07/14.
//  Copyright (c) 2014 Eapps. All rights reserved.
//

#import "ClasificacionTableViewCell.h"

@implementation ClasificacionTableViewCell
@synthesize numPosicion=_numPosicion;
@synthesize escudoImg=_escudoImg;
@synthesize nombreEquipo=_nombreEquipo;
@synthesize pj=_pj;
@synthesize pg=_pg;
@synthesize pe=_pe;
@synthesize pp=_pp;
@synthesize gf=_gf;
@synthesize gc=_gc;
@synthesize pt=_pt;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
