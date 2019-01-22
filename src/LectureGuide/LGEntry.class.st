Class {
	#name : #LGEntry,
	#superclass : #Object,
	#instVars : [
		'scenarist'
	],
	#category : #'LectureGuide-Core'
}

{ #category : #arithmetic }
LGEntry >> + aLGEntry [
	^ LGComposedEntry new
		entries: { self . aLGEntry };
		yourself
]

{ #category : #running }
LGEntry >> revert [
	"Actions to do in order to undo an entry that has been run."
]

{ #category : #running }
LGEntry >> run [
	"Actions to do when the entry is run."
]

{ #category : #accessing }
LGEntry >> scenarist [
	^ scenarist
]

{ #category : #accessing }
LGEntry >> scenarist: anObject [
	scenarist := anObject
]
