Class {
	#name : #LGShowBrowser,
	#superclass : #LGEntry,
	#category : #'LectureGuide-Core'
}

{ #category : #running }
LGShowBrowser >> revert [
	self scenarist browserWindow hide
]

{ #category : #running }
LGShowBrowser >> run [
	self scenarist browserWindow show
]

{ #category : #'ston persistence' }
LGShowBrowser >> stonContainSubObjects [ 
	^ false
]
