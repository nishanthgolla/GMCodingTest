//
//  ServiceInterface.h
//  GMCodingTest
//
//  Created by nishanth golla on 6/12/17.
//  Copyright © 2017 nishanth golla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceInterface : NSObject
+(void)fetchUserRecordswithURL:(NSURL *)url completion:(void (^)(NSArray *, NSError *))completionBlock;
@end
