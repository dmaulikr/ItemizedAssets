//
//  AssetModel.h
//  ItemizedAssets
//
//  Created by John Lee on 3/22/13.
//  Copyright (c) 2013 John Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AssetModel : NSObject

@property double pricemin;
@property double pricemax;
@property double shares;
@property double cash;
@property double debt;

+ (AssetModel*)sharedManager;
+ (id)allocWithZone:(NSZone *)zone;
- (id)copyWithZone:(NSZone *)zone;

- (float)getIRAPrice:(float)sliderValue;
- (float)getIRAValue:(float)sliderValue;
- (float)getTotalValue:(float)sliderValue;
- (NSString*)printCurrency:(float)value;

@end
