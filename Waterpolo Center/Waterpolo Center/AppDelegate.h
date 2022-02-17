//
//  AppDelegate.h
//  Waterpolo Center
//
//  Created by Edu Hackintosh on 07/07/14.
//  Copyright (c) 2014 Eapps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "AFNetworking.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (retain, nonatomic) NSString *httpUrl;
@property int numeroJornadas;
@end
