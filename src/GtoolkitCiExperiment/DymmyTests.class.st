Class {
	#name : #DymmyTests,
	#superclass : #TestCase,
	#category : #GtoolkitCiExperiment
}

{ #category : #accessing }
DymmyTests >> testAnswer [
    | dummy |
	dummy := Dummy new.
	self assert: dummy answer equals: 42
]
