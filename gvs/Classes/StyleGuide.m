#import "StyleGuide.h"

@implementation StyleGuide

#pragma mark - Fonts

+ (UIFont *)regularTextFont
{
    return [UIFont fontWithName:@"OpenSans" size:16.0];
}

#pragma mark - Colors

+ (UIColor *)newKidOnTheBlockBlue
{
	return [UIColor colorWithRed:46/255.0f green:162/255.0f blue:204/255.0f alpha:1.0f];
}

@end
