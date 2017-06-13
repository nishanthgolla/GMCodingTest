//
//  GMCodingTestTests.m
//  GMCodingTestTests
//
//  Created by nishanth golla on 6/12/17.
//  Copyright © 2017 nishanth golla. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ForcastModel.h"
#import "ServiceInterface.h"

@interface GMCodingTestTests : XCTestCase

@property ForcastModel *forecastModelInstance;

@end

@implementation GMCodingTestTests

- (void)setUp {
    [super setUp];
    
    
    self.forecastModelInstance = [[ForcastModel alloc]initWithDict:nil];
    
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    
    
    //given
    NSDictionary *testDict = [[NSDictionary alloc]init];
    testDict = nil;
    
    //when
    ForcastModel *result = [self.forecastModelInstance initWithDict:testDict];
    
    //then
    XCTAssertNil(result.summaryString);
    
    
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testInitWithDict {
    
    
    //given
    
    NSArray *hkeys = [NSArray arrayWithObjects:@"fahrenheit",nil];
    NSArray *hobjects = [NSArray arrayWithObjects:@"40",nil];
    NSDictionary *high = [NSDictionary dictionaryWithObjects:hobjects
                                                           forKeys:hkeys];
    NSArray *lkeys = [NSArray arrayWithObjects:@"fahrenheit",nil];
    NSArray *lobjects = [NSArray arrayWithObjects:@"40",nil];
    NSDictionary *low = [NSDictionary dictionaryWithObjects:lobjects
                                                     forKeys:lkeys];

    NSArray *keys = [NSArray arrayWithObjects:@"high",@"low",@"conditions",nil];
    NSArray *objects = [NSArray arrayWithObjects:high,low,@"jdhs",nil];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:objects
                                                           forKeys:keys];
    
    //when
    ForcastModel *result = [self.forecastModelInstance initWithDict:dictionary];
    
    //then
    XCTAssertNotNil(result.summaryString);

}

- (void)testLoadWeatherDataFromCloud{
    //given
    XCTestExpectation *expectation = [self expectationWithDescription:@"Expected load pancakes from cloud to fail"];
    NSURL *url = [NSURL URLWithString:@"http://api.wunderground.com/api/a43b8912fe6ee17e/forecast/geolookup/conditions/q/CA/San_Francisco.json"];
    //when
    
    [ServiceInterface fetchUserRecordswithURL:url completion:^(NSArray * records, NSError *error) {
        [expectation fulfill];
    }];
    //then
    
    [self waitForExpectationsWithTimeout:10 handler:nil];
    
}



@end
