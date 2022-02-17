//
//  ResultadosTableViewCell.h
//  Waterpolo Center
//
//  Created by Edu Hackintosh on 04/09/14.
//  Copyright (c) 2014 Eapps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealTableViewCell.h"

@interface ResultadosTableViewCell : SWRevealTableViewCell
@property (nonatomic, strong) IBOutlet UIImageView *localescudoImage;
@property (nonatomic, strong) IBOutlet UIImageView *visitanteescudoImage;
@property (nonatomic, strong) IBOutlet UILabel *fecha_periodoLabel;
@property (nonatomic, strong) IBOutlet UILabel *localLabel;
@property (nonatomic, strong) IBOutlet UILabel *visitanteLabel;
@property (nonatomic, strong) IBOutlet UILabel *resultadoLabel;

@end
