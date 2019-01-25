Class {
	#name : #LGScenarist,
	#superclass : #Object,
	#instVars : [
		'scenario',
		'currentEntry',
		'forwardStack',
		'backwardStack',
		'browser',
		'playground',
		'commenter'
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

{ #category : #'browser interactions' }
LGScenarist >> browserState [
	^ self browser snapshotState
]

{ #category : #'browser interactions' }
LGScenarist >> browserState: browserState [
	browserState restoreStateOf: self browser
]

{ #category : #accessing }
LGScenarist >> browserWindow [
	^ self browser window
]

{ #category : #cleaning }
LGScenarist >> clean [
	self browser close.
	self playgroundWindow close
]

{ #category : #accessing }
LGScenarist >> commenter [
	^ commenter ifNil: [ 
		commenter := TextPresenter new
							enabled: false;
							openWithSpec;
							yourself ]
]

{ #category : #accessing }
LGScenarist >> commenterWindow [
	^ self commenter window widget widget
]

{ #category : #accessing }
LGScenarist >> displayDownLeftCornerPosition [
	^ self displayTopLeftCornerPosition + (0 @ self displayExtent y)
]

{ #category : #accessing }
LGScenarist >> displayDownRightCornerPosition [
	^ self displayTopLeftCornerPosition + self displayExtent
]

{ #category : #accessing }
LGScenarist >> displayExtent [
	^ World extent
]

{ #category : #accessing }
LGScenarist >> displayTopLeftCornerPosition [
	^ 0@0
]

{ #category : #accessing }
LGScenarist >> displayTopRightCornerPosition [
	^ self displayTopLeftCornerPosition + (self displayExtent x @ 0)
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

{ #category : #'commenter interactions' }
LGScenarist >> hideCommenter [
	self commenterWindow hide
]

{ #category : #'playground interactions' }
LGScenarist >> hidePlayground [
	^ self playgroundWindow hide
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

{ #category : #accessing }
LGScenarist >> playground [
	^ playground ifNil: [ playground := Smalltalk tools workspace open model ]
]

{ #category : #'playground interactions' }
LGScenarist >> playgroundContent [
	^ self playground codePresentation text
]

{ #category : #accessing }
LGScenarist >> playgroundWindow [
	^ self playground window
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

{ #category : #'playground interactions' }
LGScenarist >> setPlaygroundContent: aString [
	self playground acceptContents: aString
]

{ #category : #'browser interactions' }
LGScenarist >> showBrowser [
	self browserWindow show
]

{ #category : #'browser interactions' }
LGScenarist >> showClass: aClass [
	self browser selectClass: aClass
]

{ #category : #'commenter interactions' }
LGScenarist >> showCommenter [
	self commenterWindow show
]

{ #category : #'browser interactions' }
LGScenarist >> showMethod: aCompiledMethod [
	self browser selectMethod: aCompiledMethod
]

{ #category : #'playground interactions' }
LGScenarist >> showPlayground [
	^ self playgroundWindow show
]

{ #category : #api }
LGScenarist >> upToLastEntry [
	[ self hasNextEntry ]
		whileFalse: [ self next ]
]
