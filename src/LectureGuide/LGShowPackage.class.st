Class {
	#name : #LGShowPackage,
	#superclass : #LGEntry,
	#instVars : [
		'packageName'
	],
	#category : #'LectureGuide-Entries'
}

{ #category : #'instance creation' }
LGShowPackage class >> packageNamed: aString [
	^ self new
		packageName: aString;
		yourself
]

{ #category : #accessing }
LGShowPackage >> packageName [
	^ packageName
]

{ #category : #accessing }
LGShowPackage >> packageName: anObject [
	packageName := anObject
]

{ #category : #printing }
LGShowPackage >> printTextualRepresentationOn: aStream [
	aStream
		nextPutAll: 'Show package "';
		nextPutAll: self packageName;
		nextPut: $"
]

{ #category : #running }
LGShowPackage >> run [
	self scenarist browser selectPackage: (RPackage organizer packageNamed: self packageName)
]
