Class {
	#name : #LGShowBrowser,
	#superclass : #LGShowWindowEntry,
	#category : #'LectureGuide-Entries'
}

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
