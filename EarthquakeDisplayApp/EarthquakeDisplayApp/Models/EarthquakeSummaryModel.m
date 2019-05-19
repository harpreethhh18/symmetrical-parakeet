//
//  EarthquakeSummaryModel.m
//  EarthquakeDisplayApp
//
//  Created by Kheam on 19/5/19.
//  Copyright © 2019 Harpreet. All rights reserved.
//

#import "EarthquakeSummaryModel.h"

NSString *const SummaryModel_properties_place_key = @"place";
NSString *const SummaryModel_properties_type_key = @"type";
NSString *const SummaryModel_properties_time_key = @"time";
NSString *const SummaryModel_properties_magnitude_key = @"mag";
NSString *const SummaryModel_geometry_coordinates_key = @"coordinates";

@implementation EarthquakeSummaryModel

- (NSString *)place {
    NSString *placeStr = [self.properties objectForKey:SummaryModel_properties_place_key];
    return placeStr.length ? placeStr : @"";
}

- (NSString *)type {
    NSString *typeStr = [self.properties objectForKey:SummaryModel_properties_type_key];
    return typeStr.length ? typeStr : @"";
}

- (NSString *)timeStamp {
    NSNumber *dateInMilliseconds = [self.properties objectForKey:SummaryModel_properties_time_key];
    if ([dateInMilliseconds isKindOfClass:[NSNull class]]) {
        return @"";
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:(dateInMilliseconds.intValue / 1000.0)];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    NSString *timeStamptStr = [formatter stringFromDate:date];
    return timeStamptStr;
}

- (NSDictionary *)coordinates {
    return [self.geometry objectForKey:SummaryModel_geometry_coordinates_key];
}
@end
