//
//  GeoAPIBaseResponseModel.h
//  EarthquakeDisplayApp
//
//  Created by Kheam on 18/5/19.
//  Copyright © 2019 Harpreet. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GeoAPIBaseResponseModel : JSONModel
@property (strong, nonatomic) NSArray *features;

- (BOOL)isSuccess;

@end

NS_ASSUME_NONNULL_END
