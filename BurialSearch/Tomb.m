//
//  Tomb.m
//  BurialSearch
//
//  Created by Joshua Lisojo on 3/6/13.
//  Copyright (c) 2013 Lisojo. All rights reserved.
//

#import "Tomb.h"

@implementation Tomb

@synthesize firstName, lastName, middleName, fullName,
            firstAndLastName, birthDate, deathDate, prefix,
            suffix, tour, internet, headstone,
            notes, sextonsNotes, epitaph, section,
            poem, war, dateCreated, dateModified,
            apDob, material, years, months,
            veteran, standing, causeOfDeath, uniqueId;

- (id) initWithFirstName:(NSString *)aFirstName
             andLastName:(NSString *)aLastName
           andMiddleName:(NSString *)aMiddleName
            andBirthDate:(NSString *)aBirthDate
            andDeathDate:(NSString *)aDeathDate
               andPrefix:(NSString *)aPrefix
               andSuffix:(NSString *)aSuffix
                 andTour:(NSString *)aTour
             andInternet:(NSString *)aInternet
                andNotes:(NSString *)aNotes
         andSextonsNotes:(NSString *)aSextonsNotes
              andEpitaph:(NSString *)anEpitaph
              andSection:(NSString *)aSection
             andMaterial:(NSString *)aMaterial
                andYears:(NSString *)aYears
               andMonths:(NSString *)aMonths
              andVeteran:(NSString *)aVeteran
             andUniqueId:(NSString *)aUniqueId
             andStanding:(NSString *)aStanding
                 andPoem:(NSString *)aPoem
                  andWar:(NSString *)aWar
                andApDob:(NSString *)anApDob
         andCauseOfDeath:(NSString *)aCauseOfDeath
            andHeadstone:(NSString *)aHeadstone
          andDateCreated:(NSString *)aDateCreated
         andDateModified:(NSString *)aDateModified
{
    self = [super init];
    if (self) {
        self.firstName = aFirstName;
        self.lastName = aLastName;
        self.middleName = aMiddleName;
        self.fullName = [NSString stringWithFormat:@"%@ %@ %@", self.firstName, self.middleName, self.lastName];
        
        self.firstAndLastName = [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
        self.birthDate = aBirthDate;
        self.deathDate = aDeathDate;
        self.prefix = aPrefix;
        
        self.suffix = aSuffix;
        self.tour = aTour;
        self.internet = aInternet;
        self.notes = aNotes;
        
        self.sextonsNotes = aSextonsNotes;
        self.epitaph = anEpitaph;
        self.section = aSection;
        self.causeOfDeath =  aCauseOfDeath;
        
        self.material = aMaterial;
        self.years = aYears;
        self.months = aMonths;
        self.dateCreated = aDateCreated;
        
        self.dateModified = aDateModified;
        self.war = aWar;
        self.veteran = aVeteran;
        self.uniqueId = aUniqueId;
        
        self.apDob = anApDob;
        self.standing = aStanding;
        self.poem = aPoem;
        self.causeOfDeath = aCauseOfDeath;
    }
    return self;
}

- (NSString *)viewDescription
{
    return [NSString stringWithFormat:@"Tomb: firstName = %@ lastName = %@ deathDate = %@", self.firstName, self.lastName, self.deathDate];
}

@end
