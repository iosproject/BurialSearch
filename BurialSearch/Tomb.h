//
//  Tomb.h
//  BurialSearch
//
//  Created by Joshua Lisojo on 3/6/13.
//  Copyright (c) 2013 Lisojo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tomb : NSObject

@property (strong, nonatomic) NSString* firstName;
@property (strong, nonatomic) NSString* lastName;
@property (strong, nonatomic) NSString* middleName;
@property (strong, nonatomic) NSString* firstAndLastName;
@property (strong, nonatomic) NSString* fullName;
@property (strong, nonatomic) NSString* deathDate;
@property (strong, nonatomic) NSString* birthDate;
@property (strong, nonatomic) NSString* prefix;
@property (strong, nonatomic) NSString* suffix;
@property (strong, nonatomic) NSString* ref;
@property (strong, nonatomic) NSString* tour;
@property (strong, nonatomic) NSString* internet;
@property (strong, nonatomic) NSString* notes;
@property (strong, nonatomic) NSString* sextonsNotes;
@property (strong, nonatomic) NSString* epitaph;
@property (strong, nonatomic) NSString* section;
@property (strong, nonatomic) NSString* tombId;
@property (strong, nonatomic) NSString* sandstone;
@property (strong, nonatomic) NSString* years;
@property (strong, nonatomic) NSString* months;
@property (strong, nonatomic) NSString* condition;
@property (strong, nonatomic) NSString* veteran;
@property (strong, nonatomic) NSString* uniqueId;

- (NSString *)viewDescription;

-(id)initWithFirstName:(NSString*)aFirstName
           andLastName:(NSString*)aLastName
         andMiddleName:(NSString*)aMiddleName
          andBirthDate:(NSString*)aBirthDate
          andDeathDate:(NSString*)aDeathDate
             andPrefix:(NSString*)aPrefix
             andSuffix:(NSString*)aSuffix
                andRef:(NSString*)aRef
               andTour:(NSString*)aTour
           andInternet:(NSString*)aInternet
              andNotes:(NSString*)aNotes
       andSextonsNotes:(NSString*)aSextonsNotes
            andEpitaph:(NSString*)anEpitaph
            andSection:(NSString*)aSection
                 andID:(NSString*)aTombID
           andSandston:(NSString*)aSandstone
              andYears:(NSString*)aYears
             andMonths:(NSString*)aMonths
          andCondition:(NSString*)aCondition
            andVeteran:(NSString*)aVeteran
           andUniqueId:(NSString*)aUniqueId;

@end
