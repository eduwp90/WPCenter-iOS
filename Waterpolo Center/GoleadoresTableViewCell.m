//
//  GoleadoresTableViewCell.m
//  Waterpolo Center
//
//  Created by Edu Hackintosh on 25/07/14.
//  Copyright (c) 2014 Eapps. All rights reserved.
//

#import "GoleadoresTableViewCell.h"

@implementation GoleadoresTableViewCell
@synthesize posicionLabel = _posicionLabel;
@synthesize nombrejugadorLabel = _nombrejugadorLabel;
@synthesize escudoImage = _escudoImage;
@synthesize goleslLabel =_goleslLabel;
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
