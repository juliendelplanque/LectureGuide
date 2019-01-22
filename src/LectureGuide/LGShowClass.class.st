Class {
	#name : #LGShowClass,
	#superclass : #LGEntry,
	#instVars : [
		'browser',
		'classToShow'
	],
	#category : #'LectureGuide-Entries'
}

{ #category : #'instance creation' }
LGShowClass class >> classToShow: aSymbol [
	^ self new
		classToShow: aSymbol;
		yourself
]

{ #category : #running }
LGShowClass >> basicRun [
	self scenarist showClass: (self class environment at: self classToShow)
]

{ #category : #accessing }
LGShowClass >> classToShow [
	^ classToShow
]

{ #category : #accessing }
LGShowClass >> classToShow: anObject [
	classToShow := anObject
]

{ #category : #printing }
LGShowClass >> printTextualRepresentationOn: aStream [
	aStream
		nextPutAll: 'Show class "';
		nextPutAll: self classToShow;
		nextPut: $"
]
