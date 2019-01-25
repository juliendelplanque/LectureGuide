"
I am an abstract entry describing the intent to interact with a window.

The selector of the window with which this entry interact is stored in #windowSelector slot.
"
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
