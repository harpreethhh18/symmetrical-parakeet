//
//  EarthquakeSummaryModel.h
//  EarthquakeDisplayApp
//
//  Created by Kheam on 19/5/19.
//  Copyright © 2019 Harpreet. All rights reserved.
//

#import "JSONModel.h"

@interface EarthquakeSummaryModel : JSONModel

@property (strong, nonatomic) NSDictionary *geometry;
@property (strong, nonatomic) NSString *id;
@property (strong, nonatomic) NSDictionary *properties;
@property (strong, nonatomic) NSString *type;

- (NSString *)place;
- (NSString *)type;
- (NSString *)timeStamp;
- (NSString *)magnitude;
- (NSDictionary *)coordinates;
@end

