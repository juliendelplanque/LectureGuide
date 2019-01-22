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

{ #category : #private }
LGScenarist >> forwardStack [
	^ forwardStack
]

{ #category : #testing }
LGScenarist >> hasLastEntryRun [
	^ self backwardStack isNotEmpty
]

{ #category : #testing }
LGScenarist >> hasNextEntry [
	^ self forwardStack isNotEmpty
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
					fullRun;
					yourself)
]

{ #category : #api }
LGScenarist >> previous [
	self hasLastEntryRun
		ifFalse: [ LGNoPreviousEntry signal ].
		
	self forwardStack
		push: (self backwardStack pop
					scenarist: self;
					fullRevert;
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
LGScenarist >> showClass: aClass [
	self browser selectClass: aClass
]

{ #category : #'browser interactions' }
LGScenarist >> showMethod: aCompiledMethod [
	self browser selectMethod: aCompiledMethod
]
