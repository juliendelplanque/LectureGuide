Class {
	#name : #LGScenarist,
	#superclass : #Object,
	#instVars : [
		'scenario',
		'currentEntry',
		'forwardStack',
		'backwardStack',
		'browser'
	],
	#category : #'LectureGuide-Core'
}

{ #category : #'instance creation' }
LGScenarist class >> read: aLGScenario [
	^ self new
		scenario: aLGScenario;
		setForwardStackFromScenario;
		yourself
]

{ #category : #api }
LGScenarist >> backToFirstEntry [
	[ self hasPreviousEntry ]
		whileFalse: [ self previous ]
]

{ #category : #private }
LGScenarist >> backwardStack [
	^ backwardStack
]

{ #category : #accessing }
LGScenarist >> browser [
	^ browser ifNil: [ browser := Smalltalk tools browser open ]
]

{ #category : #accessing }
LGScenarist >> browserWindow [
	^ self browser window
]

{ #category : #cleaning }
LGScenarist >> clean [
	self browser close
]

{ #category : #private }
LGScenarist >> forwardStack [
	^ forwardStack
]

{ #category : #testing }
LGScenarist >> hasNextEntry [
	^ self forwardStack isNotEmpty
]

{ #category : #testing }
LGScenarist >> hasPreviousEntry [
	^ self backwardStack isNotEmpty
]

{ #category : #'browser interactions' }
LGScenarist >> hideBrowser [
	self browserWindow hide
]

{ #category : #initialization }
LGScenarist >> initialize [
	super initialize.
	backwardStack := Stack new.
	forwardStack := Stack new
]

{ #category : #accessing }
LGScenarist >> lastEntryRun [
	^ self backwardStack top
]

{ #category : #api }
LGScenarist >> next [
	self hasNextEntry
		ifFalse: [ LGNoNextEntry signal ].
		
	self backwardStack
		push: (self forwardStack pop
					scenarist: self;
					run;
					yourself)
]

{ #category : #api }
LGScenarist >> previous [
	self hasPreviousEntry
		ifFalse: [ LGNoPreviousEntry signal ].
		
	self forwardStack
		push: (self backwardStack pop
					scenarist: self;
					revert;
					yourself)
]

{ #category : #accessing }
LGScenarist >> scenario [
	^ scenario
]

{ #category : #accessing }
LGScenarist >> scenario: anObject [
	scenario := anObject
]

{ #category : #initialization }
LGScenarist >> setForwardStackFromScenario [
	forwardStack := Stack newFrom: scenario entries
]

{ #category : #'browser interactions' }
LGScenarist >> showBrowser [
	self browserWindow show
]

{ #category : #'browser interactions' }
LGScenarist >> showClass: aClass [
	self browser selectClass: aClass
]

{ #category : #'browser interactions' }
LGScenarist >> showMethod: aCompiledMethod [
	self browser selectMethod: aCompiledMethod
]

{ #category : #api }
LGScenarist >> upToLastEntry [
	[ self hasNextEntry ]
		whileFalse: [ self next ]
]
