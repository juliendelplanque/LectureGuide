Class {
	#name : #LGCreatePackage,
	#superclass : #LGEntry,
	#instVars : [
		'packageName'
	],
	#category : #'LectureGuide-Entries'
}

{ #category : #'instance creation' }
LGCreatePackage class >> named: aString [
	^ self new
		packageName: aString;
		yourself
]

{ #category : #'instance creation' }
LGCreatePackage class >> packageNamed: aString [
	^ self named: aString
]

{ #category : #running }
LGCreatePackage >> basicRevert [
	(RPackage organizer packageNamed: self packageName) removeFromSystem.
	super basicRevert.
]

{ #category : #running }
LGCreatePackage >> basicRun [
	super basicRun.
	(RPackage named: self packageName) register
]

{ #category : #accessing }
LGCreatePackage >> packageName [
	^ packageName
]

{ #category : #accessing }
LGCreatePackage >> packageName: anObject [
	packageName := anObject
]

{ #category : #printing }
LGCreatePackage >> printTextualRepresentationOn: aStream [
	aStream
		nextPutAll: 'Create package "';
		nextPutAll: self packageName;
		nextPut: $"
]

{ #category : #composition }
LGCreatePackage >> thenShowIt [
	"Returns a new composed operator that execute myself and then show the class created."
	^ self + (LGShowPackage packageNamed: self packageName)
]
