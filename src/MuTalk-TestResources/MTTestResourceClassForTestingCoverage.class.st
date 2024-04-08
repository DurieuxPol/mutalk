Class {
	#name : 'MTTestResourceClassForTestingCoverage',
	#superclass : 'TestResource',
	#category : 'MuTalk-TestResources',
	#package : 'MuTalk-TestResources'
}

{ #category : 'as yet unclassified' }
MTTestResourceClassForTestingCoverage >> doSomething [

	^ MTClassForTestingCoverage new aCoveredMethod
]

{ #category : 'as yet unclassified' }
MTTestResourceClassForTestingCoverage >> setUp [
	self doSomething
]
