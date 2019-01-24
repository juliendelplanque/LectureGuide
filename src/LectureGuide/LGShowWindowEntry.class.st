Class {
	#name : #LGShowWindowEntry,
	#superclass : #LGWindowEntry,
	#instVars : [
		'showWindowSelector',
		'hideWindowSelector'
	],
	#category : #'LectureGuide-Entries'
}

{ #category : #running }
LGShowWindowEntry >> basicRevert [
	self hideWindowSelector value: self scenarist
]

{ #category : #running }
LGShowWindowEntry >> basicRun [
	self showWindowSelector value: self scenarist
]

{ #category : #composition }
LGShowWindowEntry >> halfOfDisplayHeight [
	^ self + (LGResizeWindow windowSelector: self windowSelector) halfOfDisplayHeight
]

{ #category : #composition }
LGShowWindowEntry >> halfOfDisplayWidth [
	^ self + (LGResizeWindow windowSelector: self windowSelector) halfOfDisplayWidth
]

{ #category : #accessing }
LGShowWindowEntry >> hideWindowSelector [
	^ hideWindowSelector
]

{ #category : #accessing }
LGShowWindowEntry >> hideWindowSelector: anObject [
	hideWindowSelector := anObject
]

{ #category : #composition }
LGShowWindowEntry >> quarterOfDisplay [
	^ self + (LGResizeWindow windowSelector: self windowSelector) quarterOfDisplay
]

{ #category : #accessing }
LGShowWindowEntry >> showWindowSelector [
	^ showWindowSelector
]

{ #category : #accessing }
LGShowWindowEntry >> showWindowSelector: anObject [
	showWindowSelector := anObject
]
