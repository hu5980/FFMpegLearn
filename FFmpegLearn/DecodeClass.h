//
//  DecodeClass.h
//  FFmpegLearn
//
//  Created by gavin hu on 2020/3/29.
//  Copyright © 2020 gavin hu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DecodeClass : NSObject

+(void) getAllDecoderEncoder;

+ (void)ffmpegOpenFile:(NSString *)filePath;

@end

NS_ASSUME_NONNULL_END
