//
//  Tomb.h
//  BurialSearch
//
//  Created by Joshua Lisojo on 3/6/13.
//  Copyright (c) 2013 Lisojo. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FPC_TOMB_DATE_CREATED @"Date_Created"
#define FPC_TOMB_DATE_MODIFIED @"Date_Modified"
#define FPC_TOMB_LASTNAME @"Last_Name"
#define FPC_TOMB_FIRSTNAME @"First_Name"
#define FPC_TOMB_HEADSTONE @"Headstone"
#define FPC_TOMB_TOUR @"Tour"
#define FPC_TOMB_DOD @"Date_of_Death"
#define FPC_TOMB_MIDDLENAME @"Middle"
#define FPC_TOMB_PREFIX @"Prefix"
#define FPC_TOMB_INTERNETLINK @"Internet_Link"
#define FPC_TOMB_NOTES @"Notes"
#define FPC_TOMB_SEXTONNOTES @"Sextons_Notes"
#define FPC_TOMB_SECTION @"Section"
#define FPC_TOMB_EPITAPH @"Epitaph"
#define FPC_TOMB_SUFFIX @"Suffix"
#define FPC_TOMB_MATERIAL @"Material"
#define FPC_TOMB_YEARS @"Years"
#define FPC_TOMB_MONTHS @"Months"
#define FPC_TOMB_STANDING @"Standing"
#define FPC_TOMB_VETERAN @"Veteran"
#define FPC_TOMB_UID @"Unique_ID"
#define FPC_TOMB_CAUSE_OF_DEATH @"Cause_of_Death"
#define FPC_TOMB_WAR @"War"
#define FPC_TOMB_DOB @"Date_of_Birth"
#define FPC_TOMB_APDOB @"ApDoB"
#define FPC_TOMB_POEM @"Poem"


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
@property (strong, nonatomic) NSString* tour;
@property (strong, nonatomic) NSString* internet;
@property (strong, nonatomic) NSString* notes;
@property (strong, nonatomic) NSString* sextonsNotes;
@property (strong, nonatomic) NSString* epitaph;
@property (strong, nonatomic) NSString* section;
@property (strong, nonatomic) NSString* material;
@property (strong, nonatomic) NSString* years;
@property (strong, nonatomic) NSString* months;
@property (strong, nonatomic) NSString* veteran;
@property (strong, nonatomic) NSString* uniqueId;
@property (strong, nonatomic) NSString* standing;
@property (strong, nonatomic) NSString* poem;
@property (strong, nonatomic) NSString* war;
@property (strong, nonatomic) NSString* apDob;
@property (strong, nonatomic) NSString* causeOfDeath;
@property (strong, nonatomic) NSString* headstone;
@property (strong, nonatomic) NSString* dateCreated;
@property (strong, nonatomic) NSString* dateModified;

- (NSString *)viewDescription;

-(id)initWithFirstName:(NSString*)aFirstName
           andLastName:(NSString*)aLastName
         andMiddleName:(NSString*)aMiddleName
          andBirthDate:(NSString*)aBirthDate
          andDeathDate:(NSString*)aDeathDate
             andPrefix:(NSString*)aPrefix
             andSuffix:(NSString*)aSuffix
               andTour:(NSString*)aTour
           andInternet:(NSString*)aInternet
              andNotes:(NSString*)aNotes
       andSextonsNotes:(NSString*)aSextonsNotes
            andEpitaph:(NSString*)anEpitaph
            andSection:(NSString*)aSection
           andMaterial:(NSString*)aMaterial
              andYears:(NSString*)aYears
             andMonths:(NSString*)aMonths
            andVeteran:(NSString*)aVeteran
           andUniqueId:(NSString*)aUniqueId
           andStanding:(NSString*)aStanding
               andPoem:(NSString*)aPoem
                andWar:(NSString*)aWar
              andApDob:(NSString*)anApDob
       andCauseOfDeath:(NSString*)aCauseOfDeath
          andHeadstone:(NSString*)aHeadstone
        andDateCreated:(NSString*)aDateCreated
       andDateModified:(NSString*)aDateModified;




@end
