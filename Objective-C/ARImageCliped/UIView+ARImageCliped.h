//
//  UIView+ARImageCliped.h
//  bearead
//
//  Created by Objective-C on 16/8/26.
//  Copyright © 2016年 bearead. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ARClipedCallback)(UIImage *clipedImage);

@interface UIView (ARImageCliped)

#pragma mark - 边框相关属属性，仅对生成圆形图片和矩形图片有效
/**
 *	默认为0.0，当小于0时，不会添加边框，仅对生成圆形图片和矩形图片有效
 */
@property (nonatomic, assign) CGFloat ar_borderWidth;
/**
 *	当小于0时，不会添加边框。默认为0.仅对生成圆形图片和矩形图片有效
 */
@property (nonatomic, assign) CGFloat ar_pathWidth;
/**
 *	边框线的颜色，默认为[UIColor lightGrayColor]，仅对生成圆形图片和矩形图片有效
 */
@property (nonatomic, strong) UIColor *ar_borderColor;
/**
 *	Path颜色，默认为白色。仅对生成圆形图片和矩形图片有效
 */
@property (nonatomic, strong) UIColor *ar_pathColor;

/**
 *	内部默认是会缓存corner所生成的圆角或者添加曲线之类的，如果view需要动态地调整，则
 *  每次复用时，应该设置它为YES,则不会缓存。
 *  默认为NO
 */
@property (nonatomic, assign) BOOL ar_shouldRefreshCache;

#pragma mark - 给任意UIView添加圆角（非图片，性能不如直接使用cornerRadius，但是下面的API支持任意圆角）
/**
 *	给控件本身添加圆角，不是通过图片实现的。要求控件本身的frame是确定的，非自动布局才行。
 *
 *	@param corner			  多个圆角可通过UIRectCornerTopLeft | UIRectCornerTopRight这样来使用
 *	@param cornerRadius	圆角大小
 *
 *  @Example
 *  [cornerView3 ar_setImage:@"bimg8.jpg" cornerRadius:10 rectCorner:UIRectCornerTopLeft |UIRectCornerBottomRight isEqualScale:NO onCliped:^(UIImage *clipedImage) {
 // 如果需要复用，可在异步剪裁后，得到已剪裁后的图片，可另行他用
 }];
 */
- (void)ar_addCorner:(UIRectCorner)corner cornerRadius:(CGFloat)cornerRadius;

// 圆角颜色不应该与背景色相同时，传过来
- (void)ar_addCorner:(UIRectCorner)corner cornerRadius:(CGFloat)cornerRadius backgroundColor:(UIColor *)backgroundColor;

/**
 * corner为UIRectCornerAllCorners，bounds大小已经有才能使用
 *
 * @Example
 * 添加一个圆角：[view1 ar_addCorner:UIRectCornerTopLeft cornerRadius:10];
 */
- (void)ar_addCornerRadius:(CGFloat)cornerRadius;

/**
 *  corner为UIRectCornerAllCorners，bounds要外部指定
 *
 *	@param cornerRadius	加钱大小
 *	@param targetSize		指frame.size
 */
- (void)ar_addCornerRadius:(CGFloat)cornerRadius size:(CGSize)targetSize;

/**
 *  给控件本身添加圆角，不是通过图片实现的。
 *
 *	@param corner       添加哪些圆角
 *	@param cornerRadius	圆角大小
 *	@param targetSize		目标大小，即控件的frame.size
 *  @param backgroundColor 控件的背景色与剪裁后的背景色是一样的时候，若需要指定为不一样，传此参数。
 *                         若没有传此参数，默认取最顶层父视图的背景色，若为透明，则取本身背景色，若也为透明，则取白色
 */
- (void)ar_addCorner:(UIRectCorner)corner
         cornerRadius:(CGFloat)cornerRadius
                 size:(CGSize)targetSize
      backgroundColor:(UIColor *)backgroundColor;


#pragma mark - 生成适应大小的图片显示
/**
 *	使用指定的图片来填充，充当UIImageView。
 *  对于自动布局的控件，如果在设置图片时，没有指定大小，就无法得到正确的图片大小。
 *
 *	@param image	图片名称或者图片对象，甚至支持NSData
 *	@param isEqualScale 是否是等比例缩放
 *  @param targetSize 图片大小。如果没有此参数，表示使用控件本身的大小。
 *  @parma callback   只有当图片真正被裁剪成功后，才会回调，返回裁剪后的图片
 *
 *	@return 裁剪前的图片
 */
- (UIImage *)ar_setImage:(id)image size:(CGSize)targetSize isEqualScale:(BOOL)isEqualScale onCliped:(ARClipedCallback)callback;
/**
 * 使用指定的图片来填充图片。对于在填充图片之前，肯定有控件大小的，可以直接使用些API。
 */
- (UIImage *)ar_setImage:(id)image isEqualScale:(BOOL)isEqualScale onCliped:(ARClipedCallback)callback;

#pragma mark - 生成圆形图片显示
/**
 *	使用指定的图片来填充，但是生成的是圆形图片，背景颜色为白色。
 *
 *	@param image			图片名称或者图片对象，甚至支持NSData
 *	@param targetSize	生成指定大小的图片
 *	@param isEqualScale	是否等比例缩放图片
 *  @param backgroundColor 默认取最顶层父视图的背景色，若为透明，则取本身背景色，若也为透明，则取白色
 *  @parma callback   只有当图片真正被裁剪成功后，才会回调，返回裁剪后的图片
 *
 *	@return 裁剪前的图片
 */
- (UIImage *)ar_setCircleImage:(id)image
                           size:(CGSize)targetSize
                   isEqualScale:(BOOL)isEqualScale
                 backgrounColor:(UIColor *)backgroundColor
                       onCliped:(ARClipedCallback)callback;
/// 使用指定的图片来填充，但是生成的是圆形图片，背景颜色为白色。
- (UIImage *)ar_setCircleImage:(id)image
                           size:(CGSize)targetSize
                   isEqualScale:(BOOL)isEqualScale
                       onCliped:(ARClipedCallback)callback;
/**
 *  使用指定的图片来填充，但是生成的是圆形图片，默认背景颜色为白色。当调用此API时，若控件本身
 *  已经有确定的大小，则可以直接使用此API
 */
- (UIImage *)ar_setCircleImage:(id)image
                   isEqualScale:(BOOL)isEqualScale
                       onCliped:(ARClipedCallback)callback;

#pragma mark - 生成四个带圆角图片来填充
/**
 *	使用指定图片来填充，生成带四个圆角的图片来填充。生成的图片带有圆角后，为了解决图层混合，需要指定
 *  背景颜色，以便在生成的图片颜色与控件背景颜色一致，可提高性能。
 *
 *	@param image						图片名称或者图片对象，甚至支持NSData
 *	@param targetSize			  生成的图片目标大小
 *	@param cornerRaidus		  圆角大小
 *	@param backgroundColor	背景颜色，用于解决图层混合。默认取最顶层父视图的背景色，若为透明，则取本身背景色，若也为透明，则取白色
 *	@param isEqualScale			是否等比例缩放图片
 *  @parma callback   只有当图片真正被裁剪成功后，才会回调，返回裁剪后的图片
 *
 *	@return 裁剪前的图片
 */
- (UIImage *)ar_setImage:(id)image
                     size:(CGSize)targetSize
             cornerRadius:(CGFloat)cornerRaidus
          backgroundColor:(UIColor *)backgroundColor
             isEqualScale:(BOOL)isEqualScale
                 onCliped:(ARClipedCallback)callback;
/**
 * 生成带四个圆角的图片，默认使用白色背景、isEqualScale=YES
 */
- (UIImage *)ar_setImage:(id)image
                     size:(CGSize)targetSize
             cornerRadius:(CGFloat)cornerRaidus
                 onCliped:(ARClipedCallback)callback;

/**
 * 生成带四个圆角的图片，默认使用白色背景、isEqualScale=YES。当调用此API时，若控件本身大小是确定的，才能起效！
 */
- (UIImage *)ar_setImage:(id)image
             cornerRadius:(CGFloat)cornerRaidus
                 onCliped:(ARClipedCallback)callback;

#pragma mark - 生成任意圆角图片来填充
/**
 *	生成任意圆角的图片来填充控件。
 *
 *	@param image						图片名称或者图片对象，甚至支持NSData
 *	@param targetSize			  生成图片大小
 *	@param cornerRaidus		  圆角大小
 *	@param rectCorner			  指定哪些添加圆角。如果有多个圆角，可以这样UIRectCornerTopRight|UIRectCornerTopLeft
 *	@param backgroundColor	当带有圆角时，背景颜色可用于解决图层混合问题。默认取最顶层父视图的背景色，若为透明，则取本身背景色，若也为透明，则取白色
 *	@param isEqualScale			是否等比例缩放图片
 *  @parma callback   只有当图片真正被裁剪成功后，才会回调，返回裁剪后的图片
 *
 *	@return 裁剪前的图片
 */
- (UIImage *)ar_setImage:(id)image
                     size:(CGSize)targetSize
             cornerRadius:(CGFloat)cornerRaidus
               rectCorner:(UIRectCorner)rectCorner
          backgroundColor:(UIColor *)backgroundColor
             isEqualScale:(BOOL)isEqualScale
                 onCliped:(ARClipedCallback)callback;
/**
 * 生成任意圆角的图片来填充控件。默认取最顶层父视图的背景色，若为透明，则取本身背景色，若也为透明，则取白色、isEqualScale=YES
 */
- (UIImage *)ar_setImage:(id)image
                     size:(CGSize)targetSize
             cornerRadius:(CGFloat)cornerRaidus
               rectCorner:(UIRectCorner)rectCorner
                 onCliped:(ARClipedCallback)callback;
/**
 * 生成任意圆角的图片来填充控件。默认取最顶层父视图的背景色，若为透明，则取本身背景色，若也为透明，则取白色。如果控件本身大小确定，
 * 可以直接使用此API来生成与控件大小相同的图片来填充。
 */
- (UIImage *)ar_setImage:(id)image
             cornerRadius:(CGFloat)cornerRaidus
               rectCorner:(UIRectCorner)rectCorner
             isEqualScale:(BOOL)isEqualScale
                 onCliped:(ARClipedCallback)callback;
/**
 * 生成任意圆角的图片来填充控件。默认取最顶层父视图的背景色，若为透明，则取本身背景色，若也为透明，则取白色、isEqualScale=YES。如果控件本身大小确定，
 * 可以直接使用此API来生成与控件大小相同的图片来填充。
 */
- (UIImage *)ar_setImage:(id)image
             cornerRadius:(CGFloat)cornerRaidus
               rectCorner:(UIRectCorner)rectCorner
                 onCliped:(ARClipedCallback)callback;


@end
