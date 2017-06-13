//
//  ServiceInterface.m
//  GMCodingTest
//
//  Created by nishanth golla on 6/12/17.
//  Copyright © 2017 nishanth golla. All rights reserved.
//

#import "ServiceInterface.h"
#import "ForcastModel.h"

@implementation ServiceInterface
+(void)fetchUserRecordswithURL:(NSURL *)url completion:(void (^)(NSArray *, NSError *))completionBlock{
    NSURLSession *sharedSession = [NSURLSession sharedSession];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
   NSURLSessionDataTask *myTask = [sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSDictionary *records = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSDictionary *forecastDict = [records objectForKey:@"forecast"];
            NSDictionary *simpleForecastDict = [forecastDict objectForKey:@"simpleforecast"];
            NSArray *forecastDayArray = [simpleForecastDict objectForKey:@"forecastday"];
            NSMutableArray *FinalRecords = [[NSMutableArray alloc]init];
            for(NSDictionary *eachRecord in forecastDayArray){
                ForcastModel *forcastObject = [[ForcastModel alloc]initWithDict:eachRecord];
                [FinalRecords addObject:forcastObject];
            }
            
            if(FinalRecords.count > 0){
                dispatch_async(dispatch_get_main_queue(),^{
                    completionBlock(FinalRecords,nil);
                });
            }
            else{
                dispatch_async(dispatch_get_main_queue(),^{
                    completionBlock(nil,error);
                });
            }
            
        }
    }];
    [myTask resume];
}


@end
