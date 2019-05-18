//
//  GeoAPIServerManager.m
//  EarthquakeDisplayApp
//
//  Created by Kheam on 18/5/19.
//  Copyright © 2019 Harpreet. All rights reserved.
//

#import "GeoAPIServerManager.h"
#import "AFHTTPSessionManager.h"

// Model
#import "GeoAPIBaseResponseModel.h"

// API constants
NSString *const GeoAPIServerManager_Root_Url = @"https://earthquake.usgs.gov/earthquakes/feed/v1.0/";
NSString *const GeoAPIServerManager_Earthquake_Summary_Part_Url = @"summary/all_hour.geojson";
NSString *const GeoAPIServerManager_Earthquake_Definition_Part_Url = @"geojson.php";

// Response Related
NSString *const GeoAPIServerManager_Features_Key = @"features";

@interface GeoAPIServerManager ()
@property (strong, nonatomic) AFHTTPSessionManager *httpSessionManager;
@end

@implementation GeoAPIServerManager

#pragma mark - Singleton
+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    static GeoAPIServerManager *sharedObj = NULL;
    dispatch_once(&onceToken, ^{
        sharedObj = [[super allocWithZone:NULL] init];
    });
    return sharedObj;
}

#pragma mark - Getters && Setters
#pragma mark - Getters
- (AFHTTPSessionManager *)httpSessionManager
{
    if (_httpSessionManager == nil) {
        _httpSessionManager = [AFHTTPSessionManager manager];
        //_httpSessionManager.responseSerializer = [AFHTTPResponseSerializer serializer]; // only needed if the server is not returning JSON; if web service returns JSON, remove this line
        [_httpSessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
    }
    return _httpSessionManager;
}

#pragma mark - Request Methods
- (void)getEarthquakeSummaryInfoFromGeoServerWithSuccessHandler:(void(^)(NSArray *earthquakeSummary))successhandler failureHandler:(void(^)(NSString *failureInfo))failurehandler {
    NSURLSessionTask *task = [self.httpSessionManager GET:[self requestSummaryURLStr] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error;
        NSDictionary *responseDict = (NSDictionary *)responseObject;
        GeoAPIBaseResponseModel *baseResponse = [[GeoAPIBaseResponseModel alloc] initWithDictionary:responseDict error:&error];
        if (baseResponse.isSuccess) {
            successhandler(baseResponse.features);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failurehandler (error.description);
    }];
    
    if (!task) {
        failurehandler(NSLocalizedString(@"Internal Error Occured", @"Liven Internal Error String") );
    }
}

#pragma mark - Helper Methods
- (NSString *)requestSummaryURLStr {
    return [NSString stringWithFormat:@"%@%@",GeoAPIServerManager_Root_Url,GeoAPIServerManager_Earthquake_Summary_Part_Url];
}

- (NSString *)requestDefinitionURLStr {
    return [NSString stringWithFormat:@"%@%@",GeoAPIServerManager_Root_Url,GeoAPIServerManager_Earthquake_Definition_Part_Url];
}
@end
