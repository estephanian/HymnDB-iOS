/*
 Copyright 2017-present the Material Components for iOS authors. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "MaterialColorScheme.h"
#import "MaterialNavigationBar.h"

/**
 A color themer for MDCNavigationBar that implements the Material design color system mappings.
 */
@interface MDCNavigationBarColorThemer : NSObject

/**
 Applies a color scheme's properties to an MDCNavigationBar using the primary mapping.

 Uses the primary color as the most important color for the component.

 @param colorScheme The color scheme to apply to MDCNavigationBar.
 @param navigationBar An MDCNavigationBar instance to which the color scheme should be applied.
 */
+ (void)applySemanticColorScheme:(nonnull id<MDCColorScheming>)colorScheme
                 toNavigationBar:(nonnull MDCNavigationBar *)navigationBar;

/**
 Applies a color scheme's properties to an MDCNavigationBar using the surface variant.

 Uses the surface color as the most important color for the component.

 @param colorScheme The color scheme to apply to MDCNavigationBar.
 @param navigationBar An MDCNavigationBar instance to which the color scheme should be applied.
 */
+ (void)applySurfaceVariantWithColorScheme:(nonnull id<MDCColorScheming>)colorScheme
                           toNavigationBar:(nonnull MDCNavigationBar *)navigationBar;

#pragma mark - Soon to be deprecated

/**
 Applies a color scheme to theme a MDCNavigationBar. Use a UIAppearance proxy to apply a color
 scheme to all instances of MDCNavigationBar.

 This method will soon be deprecated. Consider using +applySemanticColorScheme:toNavigationBar:
 instead.

 @param colorScheme The color scheme to apply to MDCNavigationBar.
 @param navigationBar A MDCNavigationBar instance to apply a color scheme.
 */
+ (void)applyColorScheme:(nonnull id<MDCColorScheme>)colorScheme
         toNavigationBar:(nonnull MDCNavigationBar *)navigationBar;

@end
