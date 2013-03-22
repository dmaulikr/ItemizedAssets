//
//  OverviewController.h
//  ItemizedAssets
//
//  Created by John Lee on 3/22/13.
//  Copyright (c) 2013 John Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AssetModel.h"

@interface OverviewController : UITableViewController

@property (strong, nonatomic) AssetModel *am;
@property (weak, nonatomic) IBOutlet UISlider *priceSlider;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *iraLabel;
@property (weak, nonatomic) IBOutlet UILabel *cashLabel;
@property (weak, nonatomic) IBOutlet UILabel *debtLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

- (IBAction)priceSliderChanged:(id)sender;
- (void)getAssetValues;

@end
