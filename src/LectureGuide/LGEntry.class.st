Class {
	#name : #LGEntry,
	#superclass : #Object,
	#instVars : [
		'scenarist'
	],
	#category : #'LectureGuide-Entries'
}

{ #category : #'ston-core' }
LGEntry class >> stonAllInstVarNames [
	^ self allInstVarNames \ #(#scenarist)
]

{ #category : #arithmetic }
LGEntry >> + aLGEntry [
	^ LGComposedEntry new
		entries: { self . aLGEntry } asOrderedCollection;
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
