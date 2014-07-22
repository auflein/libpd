//
//  PdPoly.h
//  libpd
//
//  Created by Luke Iannini on 7/17/14.
//
//

#import <Foundation/Foundation.h>

@class PdFile;
@interface PdPoly : NSObject

+ (instancetype)polyWithFileName:(NSString *)fileName polyphony:(NSUInteger)polyphony;
- (PdFile *)next;

@end
