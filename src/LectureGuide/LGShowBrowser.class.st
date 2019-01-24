Class {
	#name : #LGShowBrowser,
	#superclass : #LGShowWindowEntry,
	#category : #'LectureGuide-Entries'
}

{ #category : #composition }
LGShowBrowser class >> halfOfDisplayHeight [
	^ self new halfOfDisplayHeight
]

{ #category : #composition }
LGShowBrowser class >> halfOfDisplayWidth [
	^ self new halfOfDisplayWidth
]

{ #category : #composition }
LGShowBrowser class >> quarterOfDisplay [
	^ self new quarterOfDisplay
]

{ #category : #initialization }
LGShowBrowser >> initialize [
	super initialize.
	self windowSelector: #browserWindow.
	self showWindowSelector: #showBrowser.
	self hideWindowSelector: #hideBrowser.
]

{ #category : #printing }
LGShowBrowser >> printTextualRepresentationOn: aStream [
	aStream
		nextPutAll: 'Show browser'
]
