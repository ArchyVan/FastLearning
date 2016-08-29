//
//  ARImageClipedManager.h
//  bearead
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 bearead. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^ARCacheImage)(UIImage *image);

@interface ARImageClipedManager : NSObject

/**
 *	允许存入内存的最大值，单位为byte，默认为60M
 */
@property (nonatomic, assign) NSUInteger totalCostInMemory;

/**
 *	是否存入Cache，默认为YES
 */
@property (nonatomic, assign) BOOL shouldCache;

/// 外部尽量不要使用，供内部使用的
@property (nonatomic, strong, readonly) NSCache *sharedCache;

+ (instancetype)shared;

/**
 *	根据存储时指定的key从本地获取已剪裁好的图片。同步操作，不建议使用！
 *
 *	@param key	通常是URL。在内部会进行MD5
 *
 *	@return 从本地读取图片，不会存储到内存中，用于解决图片列表中内存暴涨问题
 */
+ (UIImage *)clipedImageFromDiskWithKey:(NSString *)key;

/**
 *	根据存储时指定的key先从缓存读取，若没有则读取本地文件。异步操作！推荐使用！
 *
 *	@param key				key
 *	@param completion	若有图片，则返回图片，否则返回nil
 */
+ (void)clipedImageFromDiskWithKey:(NSString *)key completion:(ARCacheImage)completion;

/**
 *	在裁剪成功后，可以调用此API，将剪裁后的图片存储到本地。异步操作。
 *
 *	@param clipedImage	已剪裁好的图片
 *	@param key					唯一key，通常是指URL。内部会进行MD5.
 */
+ (void)storeClipedImage:(UIImage *)clipedImage toDiskWithKey:(NSString *)key;

/**
 *	获取本地已存储的所有已剪裁的缓存大小，单位为bytes
 *
 *	@return 缓存大小
 */
+ (unsigned long long)imagesCacheSize;

/**
 *	清除缓存，异步操作
 */
+ (void)clearClipedImagesCache;


@end
