Class {
	#name : #LGShowBrowser,
	#superclass : #LGEntry,
	#category : #'LectureGuide-Entries'
}

{ #category : #composing }
LGShowBrowser class >> halfOfDisplayHeight [
	^ self new halfOfDisplayHeight
]

{ #category : #composing }
LGShowBrowser class >> halfOfDisplayWidth [
	^ self new halfOfDisplayWidth
]

{ #category : #composing }
LGShowBrowser class >> quarterOfDisplay [
	^ self new quarterOfDisplay
]

{ #category : #running }
LGShowBrowser >> basicRevert [
	self scenarist hideBrowser
]

{ #category : #running }
LGShowBrowser >> basicRun [
	self scenarist showBrowser
]

{ #category : #composing }
LGShowBrowser >> halfOfDisplayHeight [
	^ self + (LGResizeWindow windowSelector: #browserWindow) halfOfDisplayHeight
]

{ #category : #composing }
LGShowBrowser >> halfOfDisplayWidth [
	^ self + (LGResizeWindow windowSelector: #browserWindow) halfOfDisplayWidth
]

{ #category : #printing }
LGShowBrowser >> printTextualRepresentationOn: aStream [
	aStream
		nextPutAll: 'Show browser'
]

{ #category : #composing }
LGShowBrowser >> quarterOfDisplay [
	^ self + (LGResizeWindow windowSelector: #browserWindow) quarterOfDisplay
]
