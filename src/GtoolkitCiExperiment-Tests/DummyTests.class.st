Class {
	#name : #DummyTests,
	#superclass : #TestCase,
	#category : #'GtoolkitCiExperiment-Tests'
}

{ #category : #accessing }
DummyTests >> testAnswer [
    | dummy |
	dummy := Dummy new.
	self assert: dummy answer equals: 42
]
