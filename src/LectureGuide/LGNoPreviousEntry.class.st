"
I am the error raised when no more previous entry is available to the scenarist in the scenario.
"
Class {
	#name : #LGNoPreviousEntry,
	#superclass : #Error,
	#category : #'LectureGuide-Errors'
}

{ #category : #accessing }
LGNoPreviousEntry >> messageText [
	^ 'No more previous entry in the scenario.'
]
