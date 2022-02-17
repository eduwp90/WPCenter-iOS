//
//  Utiles.m
//  Waterpolo Center
//
//  Created by Edu Hackintosh on 26/07/14.
//  Copyright (c) 2014 Eapps. All rights reserved.
//

#import "Utiles.h"

@implementation Utiles


NSString *convertiraescudo(NSString *string) {
    NSString *nombreimg;
    if ([string rangeOfString:@"MATAR"].location != NSNotFound) {
        nombreimg=@"mataro";
    
    } else if ([string rangeOfString:@"ASKAR"].location != NSNotFound) {
        nombreimg=@"askartza";
        
    }else if ([string rangeOfString:@"BARCELONA"].location != NSNotFound) {
        nombreimg=@"barcelona";
        
    }else if ([string rangeOfString:@"BARCELONETA"].location != NSNotFound) {
        nombreimg=@"barceloneta";
        
    }else if ([string rangeOfString:@"CABALLA"].location != NSNotFound) {
        nombreimg=@"caballa";
        
    }else if ([string rangeOfString:@"CANOE"].location != NSNotFound) {
        nombreimg=@"canoe";
        
    }else if ([string rangeOfString:@"CATALUNYA"].location != NSNotFound) {
        nombreimg=@"catalunya";
        
    }else if ([string rangeOfString:@"CONC"].location != NSNotFound) {
        nombreimg=@"concepcion";
        
    }else if ([string rangeOfString:@"COVIB"].location != NSNotFound) {
        nombreimg=@"covibar";
        
    }else if ([string rangeOfString:@"CAMINOS"].location != NSNotFound) {
        nombreimg=@"cuatrocaminos";
        
    }else if ([string rangeOfString:@"HERMANAS"].location != NSNotFound) {
        nombreimg=@"doshermanas";
        
    }else if ([string rangeOfString:@"ECHEYDE"].location != NSNotFound) {
        nombreimg=@"echeyde";
        
    }else if ([string rangeOfString:@"ESCUELA"].location != NSNotFound) {
        nombreimg=@"ewz";
        
    }else if ([string rangeOfString:@"HELIOS"].location != NSNotFound) {
        nombreimg=@"helios";
        
    }else if ([string rangeOfString:@"HORTA"].location != NSNotFound) {
        nombreimg=@"horta";
        
    }else if ([string rangeOfString:@"HOSPI"].location != NSNotFound) {
        nombreimg=@"hospitalet";
        
    }else if ([string rangeOfString:@"PALMAS"].location != NSNotFound) {
        nombreimg=@"laspalmas";
        
    }else if ([string rangeOfString:@"LATINA"].location != NSNotFound) {
        nombreimg=@"latina";
        
    }else if ([string rangeOfString:@"LEIOA"].location != NSNotFound) {
        nombreimg=@"leioa";
        
    }else if ([string rangeOfString:@"MEDITE"].location != NSNotFound) {
        nombreimg=@"mediterrani";
        
    }else if ([string rangeOfString:@"METROPOLE"].location != NSNotFound) {
        nombreimg=@"metropole";
        
    }else if ([string rangeOfString:@"MOLINS"].location != NSNotFound) {
        nombreimg=@"molins";
        
    }else if ([string rangeOfString:@"MOSCARD"].location != NSNotFound) {
        nombreimg=@"moscardo";
        
    }else if ([string rangeOfString:@"NAVARRA"].location != NSNotFound) {
        nombreimg=@"navarra";
        
    }else if ([string rangeOfString:@"98"].location != NSNotFound) {
        nombreimg=@"nueveocho";
        
    }else if ([string rangeOfString:@"POBLE"].location != NSNotFound) {
        nombreimg=@"poblenou";
        
    }else if ([string rangeOfString:@"PORTUGALETE"].location != NSNotFound) {
        nombreimg=@"portugalete";
        
    }else if ([string rangeOfString:@"PREMI"].location != NSNotFound) {
        nombreimg=@"premia";
        
    }else if ([string rangeOfString:@"RUBI"].location != NSNotFound) {
        nombreimg=@"rubi";
        
    }else if ([string rangeOfString:@"SABADELL"].location != NSNotFound) {
        nombreimg=@"sabadell";
        
    }else if ([string rangeOfString:@"ANDREU"].location != NSNotFound) {
        nombreimg=@"santandreu";
        
    }else if ([string rangeOfString:@"FELIU"].location != NSNotFound) {
        nombreimg=@"santfeliu";
        
    }else if ([string rangeOfString:@"TERRAS"].location != NSNotFound) {
        nombreimg=@"terassa";
        
    }else if ([string rangeOfString:@"TRES"].location != NSNotFound) {
        nombreimg=@"trescantos";
        
    }else if ([string rangeOfString:@"TURIA"].location != NSNotFound) {
        nombreimg=@"turia";
        
    }else if ([string rangeOfString:@"MALAGA"].location != NSNotFound) {
        nombreimg=@"wpmalaga";
        
    }else if ([string rangeOfString:@"SEVILLA"].location != NSNotFound) {
        nombreimg=@"wpsevilla";
        
    }else {
        nombreimg=@"sinescudo";
        
    }
    return nombreimg;
}

@end
