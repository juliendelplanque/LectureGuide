Class {
	#name : #LGSetPlaygroundContent,
	#superclass : #LGEntry,
	#instVars : [
		'content',
		'oldContent'
	],
	#category : #'LectureGuide-Entries'
}

{ #category : #running }
LGSetPlaygroundContent >> basicRevert [
	self scenarist setPlaygroundContent: oldContent.
	oldContent := nil.
	super basicRevert.
]

{ #category : #running }
LGSetPlaygroundContent >> basicRun [
	super basicRun.
	oldContent := self scenarist playgroundContent.
	self scenarist setPlaygroundContent: self content
]

{ #category : #accessing }
LGSetPlaygroundContent >> content [
	^ content
]

{ #category : #accessing }
LGSetPlaygroundContent >> content: anObject [
	content := anObject
]

{ #category : #printing }
LGSetPlaygroundContent >> printTextualRepresentationOn: aStream [
	aStream
		nextPutAll: 'Set playground contents'
]
