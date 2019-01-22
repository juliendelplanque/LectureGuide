"
I am the error raised when no more next entry is available to the scenarist in the scenario.
"
Class {
	#name : #LGNoNextEntry,
	#superclass : #Error,
	#category : #'LectureGuide-Errors'
}

{ #category : #accessing }
LGNoNextEntry >> messageText [
	^ 'No more next entry in the scenario.'
]
