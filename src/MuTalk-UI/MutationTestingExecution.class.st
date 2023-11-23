Class {
	#name : #MutationTestingExecution,
	#superclass : #Object,
	#instVars : [
		'testCases',
		'classesToMutate',
		'operatorCollection',
		'evaluationStrategy',
		'generationStrategy',
		'iterations',
		'resultFile'
	],
	#category : #'MuTalk-UI'
}

{ #category : #'class initialization' }
MutationTestingExecution class >> onPackage: aString [

	^ self new
		  classesToMutate: aString asPackage definedClasses;
		  testCases:
			  ((aString , '-Tests') asPackage definedClasses select:
					   #isTestCase)
]

{ #category : #'class initialization' }
MutationTestingExecution class >> withClasses: classCollection andTestCases: testCollection [

	^ self new
		  classesToMutate: classCollection;
		  testCases: testCollection
]

{ #category : #accessing }
MutationTestingExecution >> classesToMutate [

	^ classesToMutate
]

{ #category : #accessing }
MutationTestingExecution >> classesToMutate: classes [

	classesToMutate := classes
]

{ #category : #'accessing - defaults' }
MutationTestingExecution >> defaultEvaluationStrategy [

	^ AllTestsMethodsRunningMutantEvaluationStrategy new
]

{ #category : #'accessing - defaults' }
MutationTestingExecution >> defaultGenerationStrategy [

	^ AllMutationsGenerationStrategy new
]

{ #category : #'accessing - defaults' }
MutationTestingExecution >> defaultNumberOfIterations [

	^ 30
]

{ #category : #'accessing - defaults' }
MutationTestingExecution >> defaultOperators [

	^ MutantOperator contents
]

{ #category : #accessing }
MutationTestingExecution >> evaluationStrategy [

	^ evaluationStrategy
]

{ #category : #accessing }
MutationTestingExecution >> evaluationStrategy: anEvaluationStrategy [

	evaluationStrategy := anEvaluationStrategy
]

{ #category : #accessing }
MutationTestingExecution >> generationStrategy [

	^ generationStrategy
]

{ #category : #accessing }
MutationTestingExecution >> generationStrategy: aGenerationStrategy [

	generationStrategy := aGenerationStrategy
]

{ #category : #initialization }
MutationTestingExecution >> initialize [

	super initialize.
	evaluationStrategy := self defaultEvaluationStrategy.
	generationStrategy := self defaultGenerationStrategy.
	operatorCollection := self defaultOperators.
	iterations := self defaultNumberOfIterations
]

{ #category : #accessing }
MutationTestingExecution >> iterations [

	^ iterations
]

{ #category : #accessing }
MutationTestingExecution >> iterations: aNumber [

	iterations := aNumber
]

{ #category : #accessing }
MutationTestingExecution >> operators [

	^ operatorCollection
]

{ #category : #accessing }
MutationTestingExecution >> operators: aCollection [

	operatorCollection := aCollection
]

{ #category : #accessing }
MutationTestingExecution >> resultFile [

	^ resultFile
]

{ #category : #accessing }
MutationTestingExecution >> resultFile: aFileReference [

	resultFile := aFileReference
]

{ #category : #generating }
MutationTestingExecution >> run [

	| analysis |
	analysis := MutationTestingAnalysis
		            testCasesFrom: testCases
		            mutating: classesToMutate
		            using: operatorCollection
		            with: evaluationStrategy
		            with: generationStrategy.
	1 to: iterations do: [ :i |
		resultFile writeStreamDo: [ :stream |
			stream
				setToEnd;
				nextPutAll: [ analysis run ] timeToRun asString;
				tab;
				nextPutAll: analysis generalResult mutationScore asString;
				cr ] ]
]

{ #category : #accessing }
MutationTestingExecution >> testCases [

	^ testCases
]

{ #category : #accessing }
MutationTestingExecution >> testCases: testClasses [

	testCases := testClasses
]
