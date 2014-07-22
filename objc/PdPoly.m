//
//  PdPoly.m
//  libpd
//
//  Created by Luke Iannini on 7/17/14.
//
//

#import "PdPoly.h"
#import "PdFile.h"
@implementation PdPoly {
    NSMutableArray *rotation;
}

+ (instancetype)polyWithFileName:(NSString *)fileName polyphony:(NSUInteger)polyphony {
    return [[self alloc] initWithFileName:fileName polyphony:polyphony];
}

- (instancetype)initWithFileName:(NSString *)fileName polyphony:(NSUInteger)polyphony {
    self = [super init];
    if (self) {
        rotation = [NSMutableArray arrayWithCapacity:polyphony];
        for (NSUInteger i = 0; i<polyphony; i++) {
            PdFile *file = [PdFile openFileNamed:[NSString stringWithFormat:@"%@.pd", fileName]
                                            path:[NSBundle mainBundle].bundlePath];
            [rotation addObject:file];
        }
    }
    return self;
}

- (PdFile *)next {
    PdFile *next = [rotation lastObject];
    [rotation removeLastObject];
    [rotation insertObject:next atIndex:0];
    return next;
}

@end
