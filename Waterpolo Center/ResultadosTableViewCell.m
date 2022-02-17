//
//  ResultadosTableViewCell.m
//  Waterpolo Center
//
//  Created by Edu Hackintosh on 04/09/14.
//  Copyright (c) 2014 Eapps. All rights reserved.
//

#import "ResultadosTableViewCell.h"

@implementation ResultadosTableViewCell
@synthesize localescudoImage=_localescudoImage;
@synthesize visitanteescudoImage=_visitanteescudoImage;
@synthesize fecha_periodoLabel=_fecha_periodoLabel;
@synthesize localLabel=_localLabel;
@synthesize visitanteLabel=_visitanteLabel;
@synthesize resultadoLabel=_resultadoLabel;


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
