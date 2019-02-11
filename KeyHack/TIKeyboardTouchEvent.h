#import <Foundation/Foundation.h>

@interface TIKeyboardTouchEvent : NSObject <NSSecureCoding>

@property (nonatomic, readonly) int fingerID;
@property (nonatomic, readonly) long long forcedKeyCode;
@property (nonatomic, readonly) CGPoint location;
@property (nonatomic, readonly) long long pathIndex;
@property (nonatomic, readonly) double radius;
@property (nonatomic, readonly) int stage;
@property (nonatomic, readonly) double timestamp;

+ (bool)supportsSecureCoding;
+ (id)touchEventWithStage:(int)arg1 location:(CGPoint)arg2 radius:(double)arg3 timestamp:(double)arg4 pathIndex:(long long)arg5 fingerID:(int)arg6 forcedKeyCode:(long long)arg7;
+ (id)touchEventWithStage:(int)arg1 location:(CGPoint)arg2 radius:(double)arg3 timestamp:(double)arg4 pathIndex:(long long)arg5 forcedKeyCode:(long long)arg6;

- (id)description;
- (void)encodeWithCoder:(id)arg1;
- (int)fingerID;
- (long long)forcedKeyCode;
- (id)initWithCoder:(id)arg1;
- (id)initWithStage:(int)arg1 location:(CGPoint)arg2 radius:(double)arg3 timestamp:(double)arg4 pathIndex:(long long)arg5 fingerID:(int)arg6 forcedKeyCode:(long long)arg7;
- (CGPoint)location;
- (long long)pathIndex;
- (double)radius;
- (id)shortDescription;
- (int)stage;
- (double)timestamp;

@end
