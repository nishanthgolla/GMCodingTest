//
//  ForcastModel.m
//  GMCodingTest
//
//  Created by nishanth golla on 6/12/17.
//  Copyright © 2017 nishanth golla. All rights reserved.
//

#import "ForcastModel.h"

@implementation ForcastModel

-(instancetype)initWithDict:(NSDictionary*)dict{
    
    self.highTemp = [[dict objectForKey:@"high"]objectForKey:@"fahrenheit"];
    self.lowTemp =  [[dict objectForKey:@"low"]objectForKey:@"fahrenheit"];
    self.summaryString = [dict objectForKey:@"conditions"];
    
    return self;
}

@end
