Class {
	#name : #LGScenaristPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'previousButton',
		'nextButton'
	],
	#category : #'LectureGuide-Spec'
}

{ #category : #specs }
LGScenaristPresenter class >> defaultSpec [
	^ SpecLayout composed
		newRow: [ :row |
			row
				newColumn: #previousButton;
				newColumn: #nextButton ]
]

{ #category : #adapting }
LGScenaristPresenter >> adaptToLGScenarist: aLGScenarist [
	self nextButton
		action: [ aLGScenarist next ].
		
	self previousButton
		action: [ aLGScenarist previous ]
]

{ #category : #initialization }
LGScenaristPresenter >> initializeWidgets [
	nextButton := self newButton.
	nextButton icon: (self iconNamed: #forward).
	
	previousButton := self newButton.
	previousButton icon: (self iconNamed: #back)
]

{ #category : #accessing }
LGScenaristPresenter >> nextButton [
	^ nextButton
]

{ #category : #accessing }
LGScenaristPresenter >> previousButton [
	^ previousButton
]
