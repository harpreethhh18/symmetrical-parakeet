//
//  GeoAPIBaseResponseModel.m
//  EarthquakeDisplayApp
//
//  Created by Kheam on 18/5/19.
//  Copyright © 2019 Harpreet. All rights reserved.
//

#import "GeoAPIBaseResponseModel.h"

@implementation GeoAPIBaseResponseModel
- (BOOL)isSuccess {
    return self.features.count > 0 ? YES:NO;
}
@end
