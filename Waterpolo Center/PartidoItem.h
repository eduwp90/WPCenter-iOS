//
//  PartidoItem.h
//  Waterpolo Center
//
//  Created by Edu Hackintosh on 28/08/14.
//  Copyright (c) 2014 Eapps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PartidoItem : NSObject

@property (nonatomic,copy) NSString *escudoLocal;
@property (nonatomic,copy) NSString *nombreEquipoLocal;
@property (nonatomic,copy) NSString *escudoVisitante;
@property (nonatomic,copy) NSString *nombreEquipoVisitante;
@property (nonatomic,copy) NSString *resultado;
@property (nonatomic,copy) NSString *fechaHora_periodo;
@property (nonatomic) NSInteger  *Informador;

@end
