Class {
	#name : #LGWindowEntry,
	#superclass : #LGEntry,
	#instVars : [
		'windowSelector'
	],
	#category : #'LectureGuide-Entries'
}

{ #category : #'instance creation' }
LGWindowEntry class >> windowSelector: aSymbol [
	^ self new
		windowSelector: aSymbol;
		yourself
]

{ #category : #running }
LGWindowEntry >> window [
	^ self windowSelector value: self scenarist
]

{ #category : #accessing }
LGWindowEntry >> windowSelector [
	^ windowSelector
]

{ #category : #accessing }
LGWindowEntry >> windowSelector: aSymbol [
	windowSelector := aSymbol
]
