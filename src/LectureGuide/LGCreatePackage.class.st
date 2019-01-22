Class {
	#name : #LGCreatePackage,
	#superclass : #LGEntry,
	#instVars : [
		'packageName'
	],
	#category : #'LectureGuide-Entries'
}

{ #category : #'instance creation' }
LGCreatePackage class >> packageNamed: aString [
	^ self new
		packageName: aString;
		yourself
]

{ #category : #accessing }
LGCreatePackage >> packageName [
	^ packageName
]

{ #category : #accessing }
LGCreatePackage >> packageName: anObject [
	packageName := anObject
]

{ #category : #running }
LGCreatePackage >> revert [
	(RPackage organizer packageNamed: self packageName) removeFromSystem
]

{ #category : #running }
LGCreatePackage >> run [
	(RPackage named: self packageName) register
]
