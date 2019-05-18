//
//  GeoAPIServerManager.h
//  EarthquakeDisplayApp
//
//  Created by Kheam on 18/5/19.
//  Copyright © 2019 Harpreet. All rights reserved.
//

#import <Foundation/Foundation.h>
///  Lib
#import "AFHTTPSessionManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface GeoAPIServerManager : NSObject

#pragma mark - Singleton
+ (instancetype _Nonnull)sharedManager;

#pragma mark - Request Method
- (void)getEarthquakeSummaryInfoFromGeoServerWithSuccessHandler:(void(^)(NSArray *earthquakeSummary))successhandler failureHandler:(void(^)(NSString *failureInfo))failurehandler;

@end

NS_ASSUME_NONNULL_END
