//
//  ViewController.h
//  GMCodingTest
//
//  Created by nishanth golla on 6/12/17.
//  Copyright © 2017 nishanth golla. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
- (IBAction)submitRequest:(id)sender;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

