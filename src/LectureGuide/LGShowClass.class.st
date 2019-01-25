"
I am an entry describing the intent to show a Pharo class to the user in the system browser.

The name of the class to show is stored as a Symbol in #classToShow slot.
"
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
