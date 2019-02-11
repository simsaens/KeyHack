//
//  ViewController.m
//  KeyHack
//
//  Created by Simeon Saint-Saens on 11/2/19.
//  Copyright © 2019 Two Lives Left. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

#import "TIKeyboardTouchEvent.h"

@interface TIKeyboardTouchEventHaptics : NSObject

@end

@implementation TIKeyboardTouchEventHaptics

+ (void) load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        Class privateClass = objc_getClass("TIKeyboardTouchEvent");
        
        SEL originalSelector = @selector(touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:);
        SEL swizzledSelector = @selector(track_touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:);
        
        Method originalMethod = class_getClassMethod(privateClass, originalSelector);
        Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
        
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

+ (id)track_touchEventWithStage:(int)arg1 location:(CGPoint)arg2 radius:(double)arg3 timestamp:(double)arg4 pathIndex:(long long)arg5 fingerID:(int)arg6 forcedKeyCode:(long long)arg7; {
    
    //arg1 == 0 is key down
    //arg1 == 2 is key up
    
    if( arg1 == 0 ) {
        UIImpactFeedbackGenerator *feedback = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
        [feedback impactOccurred];
    }
    
    
    return [[objc_getClass("TIKeyboardTouchEvent") alloc] initWithStage:arg1 location:arg2 radius:arg3 timestamp:arg4 pathIndex:arg5 fingerID:arg6 forcedKeyCode:arg7];
}

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}


@end


