//
//  ViewController.m
//  GMCodingTest
//
//  Created by nishanth golla on 6/12/17.
//  Copyright © 2017 nishanth golla. All rights reserved.
//

#import "ViewController.h"
#import "ServiceInterface.h"
#import "ModelCollectionViewCell.h"
#import "ForcastModel.h"


@interface ViewController ()
-(NSURL*)buildingUrltheCity:(NSString *)city andState:(NSString *)state;
@property (strong,nonatomic) NSArray<ForcastModel *>* FinalData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _collectionView.delegate = self;
    _collectionView.dataSource =self;
    
    NSString *str = @"assessment2017";
    

    
    NSLog(@"%@", [str substringToIndex:6]);
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//===============To Submit The request================================================
//=====so tthis is now done in developer branch
- (IBAction)submitRequest:(id)sender {
    
    if ([_cityTextField.text length] != 0 && [_stateTextField.text length] != 0) {
        [ServiceInterface fetchUserRecordswithURL:[self buildingUrltheCity:self.cityTextField.text andState:self.stateTextField.text] completion:^(NSArray *records, NSError *error) {
            if(records.count > 0){
                _FinalData = records;
                [_collectionView reloadData];
            }else{
                UIAlertController *ServiceFailureAlert = [UIAlertController alertControllerWithTitle:@"Service Error" message:@"Please enter correct state And city" preferredStyle:UIAlertControllerStyleAlert];
                [ServiceFailureAlert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
                [self presentViewController:ServiceFailureAlert animated:YES completion:nil];
            }
        }];
    }
    else{
        
        NSLog(@"please enter the city and state name");
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Field Entry Missing" message:@"Please enter state and city" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
}

//========================Building the URL for the text fields============================
-(NSURL*)buildingUrltheCity:(NSString *)city andState:(NSString *)state{
    
    NSString *formattedCityString = [city stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    
    NSString *newString = [NSString stringWithFormat:@"http://api.wunderground.com/api/a43b8912fe6ee17e/forecast/geolookup/conditions/q/%@/%@%@",state,formattedCityString,@".json"];
    
    NSURL *finalUrl = [NSURL URLWithString:newString];
    return finalUrl;
}
//====================UICollection View Delegate Protocal Methods==========================
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

#pragma mark COLLECTION VIEW DELEGATE METHODS

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _FinalData.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ModelCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    ForcastModel *data = [_FinalData objectAtIndex:indexPath.item];
    
    cell.textFieldHigh.text = [NSString stringWithFormat:@"High:%@",data.highTemp];
    cell.textFieldLow.text = [NSString stringWithFormat:@"Low:%@",data.lowTemp];
    cell.textFieldSummary.text =[NSString stringWithFormat:@"Sky looks %@",data.summaryString];
    
    return cell;
}


@end
