//
//  AssetModel.m
//  ItemizedAssets
//
//  Created by John Lee on 3/22/13.
//  Copyright (c) 2013 John Lee. All rights reserved.
//

#import "AssetModel.h"

@implementation AssetModel

- (id)init
{
    self = [super init];
    NSString *plistPath;
    if (self) {
        plistPath = [[NSBundle mainBundle] pathForResource:@"AssetData" ofType:@"plist"];
        NSArray *assetData = [NSArray arrayWithContentsOfFile: plistPath];
        _pricemin = (!_pricemin) ? [[assetData objectAtIndex: 0] doubleValue] : _pricemin;
        _pricemax = (!_pricemax) ? [[assetData objectAtIndex: 1] doubleValue] : _pricemax;
        _shares   = (!_shares)   ? [[assetData objectAtIndex: 2] doubleValue] : _shares;
        _cash     = (!_cash)     ? [[assetData objectAtIndex: 3] doubleValue] : _cash;
        _debt     = (!_debt)     ? [[assetData objectAtIndex: 4] doubleValue] : _debt;
    }
    return self;
}

static AssetModel *sharedAssets = nil;

+ (AssetModel*)sharedManager
{
    if (sharedAssets == nil) {
        sharedAssets = [[super allocWithZone:NULL] init];
    }
    return sharedAssets;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedManager];
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (float)getIRAPrice:(float)sliderValue
{
    // calculate the share price based on the slider value
    float priceRange    = _pricemax - _pricemin;
    float sharePrice    = _pricemin + (priceRange * sliderValue);
    sharePrice = floorf(sharePrice * 100.000 + 0.500) / 100.000;
    return sharePrice;
}

- (float)getIRAValue:(float)sliderValue
{
    float sharePrice = [self getIRAPrice: sliderValue];
    return sharePrice * _shares;
}

- (float)getTotalValue:(float)sliderValue
{
    float iraValue = [self getIRAValue: sliderValue];
    return (iraValue + _cash - _debt);
}

- (NSString*)printCurrency:(float)value
{
    NSString *currencyString = [NSNumberFormatter localizedStringFromNumber:@(value) numberStyle:NSNumberFormatterCurrencyStyle];
    return [currencyString stringByReplacingOccurrencesOfString:@"$" withString:@"$ "];
}

@end
