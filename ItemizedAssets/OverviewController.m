//
//  OverviewController.m
//  ItemizedAssets
//
//  Created by John Lee on 3/22/13.
//  Copyright (c) 2013 John Lee. All rights reserved.
//

#import "OverviewController.h"

@implementation OverviewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // initialize asset model instance
    _am = [[AssetModel alloc] init];
    // retrieve initial values
    [self getAssetValues];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self getAssetValues];
}

- (IBAction)priceSliderChanged:(id)sender {
    [self getAssetValues];
}

- (void)getAssetValues
{
    float priceSlider = _priceSlider.value;
    _priceLabel.text = [NSString stringWithFormat:@"%.2f",[_am getIRAPrice: priceSlider]];
    _iraLabel.text   = [_am printCurrency: [_am getIRAValue: priceSlider]];
    _cashLabel.text  = [_am printCurrency: _am.cash];
    _debtLabel.text  = [_am printCurrency: _am.debt];
    _totalLabel.text = [_am printCurrency: [_am getTotalValue: priceSlider]];
}

@end
