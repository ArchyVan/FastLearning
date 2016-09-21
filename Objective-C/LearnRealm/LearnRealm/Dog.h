//
//  Dog.h
//  LearnRealm
//
//  Created by Objective-C on 2016/9/21.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

#import <Realm/Realm.h>

@class Person;

@interface Dog : RLMObject
@property NSString *name;
@property NSInteger age;
@property Person *owner;
@property (readonly) RLMLinkingObjects *otherOwners;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<Dog>
RLM_ARRAY_TYPE(Dog)

@interface Person : RLMObject
@property NSString *name;
@property NSDate *birthdate;
@property RLMArray<Dog *><Dog> *dogs;
@end
RLM_ARRAY_TYPE(Person)
