//
//  SettingsViewController.m
//  ItemizedAssets
//
//  Created by John Lee on 3/22/13.
//  Copyright (c) 2013 John Lee. All rights reserved.
//

#import "SettingsViewController.h"

@implementation SettingsViewController

-(void)viewDidLoad
{
    // load super class
    [super viewDidLoad];
    // initialize "Asset Model" object
    _am = [[AssetModel alloc] init];
    // populate text fields with Asset Model values
    [self fillTextFields];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString* newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSNumberFormatter *nsnf = [[NSNumberFormatter alloc] init];
    return ([nsnf numberFromString: newString]) ? YES : NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // initalize number formatter object
    NSNumberFormatter *nsnf = [[NSNumberFormatter alloc] init];
    // fill the "asset model" values with data from text fields
    [nsnf setMaximumFractionDigits:2];
    _am.pricemin = [[nsnf numberFromString: _priceMinField.text] doubleValue];
    _am.pricemax = [[nsnf numberFromString: _priceMaxField.text] doubleValue];
    _am.cash     = [[nsnf numberFromString: _cashField.text]     doubleValue];
    _am.debt     = [[nsnf numberFromString: _debtField.text]     doubleValue];
    // fill the shares value
    [nsnf setMaximumFractionDigits:3];
    _am.shares   = [[nsnf numberFromString: _sharesField.text]   doubleValue];
    // reformat text fields
    [self fillTextFields];
    // withdraw keyboard
    [textField resignFirstResponder];
    return YES;
}

- (void) fillTextFields
{
    _priceMinField.text = [NSString stringWithFormat:@"%.2f",_am.pricemin];
    _priceMaxField.text = [NSString stringWithFormat:@"%.2f",_am.pricemax];
    _sharesField.text   = [NSString stringWithFormat:@"%.3f",_am.shares];
    _cashField.text     = [NSString stringWithFormat:@"%.2f",_am.cash];
    _debtField.text     = [NSString stringWithFormat:@"%.2f",_am.debt];
}

@end
