Class {
	#name : #LGShowCommenter,
	#superclass : #LGShowWindowEntry,
	#category : #'LectureGuide-Entries'
}

{ #category : #initialization }
LGShowCommenter >> initialize [
	super initialize.
	self windowSelector: #commenterWindow.
	self showWindowSelector: #showCommenter.
	self hideWindowSelector: #hideCommenter.
]

{ #category : #printing }
LGShowCommenter >> printTextualRepresentationOn: aStream [
	aStream
		nextPutAll: 'Show commenter'
]
