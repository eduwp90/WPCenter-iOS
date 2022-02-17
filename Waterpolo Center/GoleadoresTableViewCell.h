//
//  GoleadoresTableViewCell.h
//  Waterpolo Center
//
//  Created by Edu Hackintosh on 25/07/14.
//  Copyright (c) 2014 Eapps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoleadoresTableViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UIImageView *escudoImage;
@property (nonatomic, strong) IBOutlet UILabel *posicionLabel;
@property (nonatomic, strong) IBOutlet UILabel *nombrejugadorLabel;
@property (nonatomic, strong) IBOutlet UILabel *goleslLabel;
@end
