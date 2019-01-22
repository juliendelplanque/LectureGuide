Class {
	#name : #LGShowBrowser,
	#superclass : #LGEntry,
	#category : #'LectureGuide-Entries'
}

{ #category : #running }
LGShowBrowser >> revert [
	self scenarist browserWindow hide
]

{ #category : #running }
LGShowBrowser >> run [
	self scenarist browserWindow show
]
