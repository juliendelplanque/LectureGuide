"
I am an entry describing the intent to show a Pharo method to the user in the system browser.

The name of the method to show is stored as a Symbol in #methodSelectorToShow slot.

#isClassSide slot allows to specify if the method is located in class side or instance side.
"
Class {
	#name : #LGShowMethod,
	#superclass : #LGShowClass,
	#instVars : [
		'methodSelectorToShow',
		'isClassSide'
	],
	#category : #'LectureGuide-Entries'
}

{ #category : #'instance creation' }
LGShowMethod class >> class: aSymbol methodSelectorToShow: selector [
	^ (self classToShow: aSymbol)
			methodSelectorToShow: selector;
			yourself
]

{ #category : #running }
LGShowMethod >> basicRun [
	| target |
	super basicRun.
	target := self class environment at: self classToShow.
	self isClassSide
		ifTrue: [ target := target class ].
	self scenarist
		showMethod:
			target >> self methodSelectorToShow
]

{ #category : #initialization }
LGShowMethod >> initialize [
	super initialize.
	self isClassSide: false
]

{ #category : #accessing }
LGShowMethod >> isClassSide [
	^ isClassSide
]

{ #category : #accessing }
LGShowMethod >> isClassSide: anObject [
	isClassSide := anObject
]

{ #category : #accessing }
LGShowMethod >> methodSelectorToShow [
	^ methodSelectorToShow
]

{ #category : #accessing }
LGShowMethod >> methodSelectorToShow: anObject [
	methodSelectorToShow := anObject
]

{ #category : #printing }
LGShowMethod >> printTextualRepresentationOn: aStream [
	aStream
		nextPutAll: 'Show method "';
		nextPutAll: self classToShow;
		nextPutAll: '>>';
		nextPutAll: self methodSelectorToShow;
		nextPut: $"
]
