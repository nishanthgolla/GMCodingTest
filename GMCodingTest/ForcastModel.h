//
//  ForcastModel.h
//  GMCodingTest
//
//  Created by nishanth golla on 6/12/17.
//  Copyright © 2017 nishanth golla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ForcastModel : NSObject

@property (strong, nonatomic) NSString *highTemp;
@property (strong, nonatomic) NSString *lowTemp;
@property (strong, nonatomic) NSString *summaryString;

- (instancetype)initWithDict:(NSDictionary*)dict;

@end
