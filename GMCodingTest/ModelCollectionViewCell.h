//
//  ModelCollectionViewCell.h
//  GMCodingTest
//
//  Created by nishanth golla on 6/13/17.
//  Copyright © 2017 nishanth golla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModelCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UITextField *textFieldHigh;
@property (weak, nonatomic) IBOutlet UITextField *textFieldLow;
@property (weak, nonatomic) IBOutlet UITextField *textFieldSummary;

@end
