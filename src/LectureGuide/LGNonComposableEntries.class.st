"
I am the error raised when two entries are not composable together in the composite entry.
"
Class {
	#name : #LGNonComposableEntries,
	#superclass : #Error,
	#instVars : [
		'targetEntry',
		'toBeComposedWithEntry'
	],
	#category : #'LectureGuide-Errors'
}

{ #category : #signalling }
LGNonComposableEntries class >> signalEntry: anEntryClass canNotBeComposedWith: anotherEntryClass [
	^ self new
		targetEntry: anEntryClass;
		toBeComposedWithEntry: anotherEntryClass;
		signal
]

{ #category : #accessing }
LGNonComposableEntries >> targetEntry [
	^ targetEntry
]

{ #category : #accessing }
LGNonComposableEntries >> targetEntry: anObject [
	targetEntry := anObject
]

{ #category : #accessing }
LGNonComposableEntries >> toBeComposedWithEntry [
	^ toBeComposedWithEntry
]

{ #category : #accessing }
LGNonComposableEntries >> toBeComposedWithEntry: anObject [
	toBeComposedWithEntry := anObject
]
