Extension { #name : #CompiledMethod }

{ #category : #'*LectureGuide-ScenarioBuilder' }
CompiledMethod >> asLGCreateMethod [
	^ LGCreateMethod new
		targetClassName: self methodClass instanceSide name;
		isClassSide: self methodClass isClassSide;
		sourceCode: self sourceCode;
		protocol: self protocol;
		yourself
]
