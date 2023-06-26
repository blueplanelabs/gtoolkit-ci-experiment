Metacello new
	repository: 'github://blueplanelabs/gtoolkit-ci-experiment:main/src';
	baseline: 'GtoolkitCiExperiment';
	load.

spartaBuilders := BlSpartaCanvasBuilder allSubclasses.

NonInteractiveTranscript stdout show: 'Sparta Builders: ', spartaBuilders asString; cr.

NonInteractiveTranscript stdout show: 'Forcing reload of the default logical database...'; cr.

LeDatabasesRegistry default defaultLogicalDatabase reload.

NonInteractiveTranscript stdout show: 'Loading knowledge database...'; cr.

BaselineOfGtoolkitCiExperiment loadKnowledge.

databaseNames := LeDatabasesRegistry defaultLogicalDatabase databases collect: #databaseName.

NonInteractiveTranscript stdout show: 'Databases: ', databaseNames asString; cr.

NonInteractiveTranscript stdout show: 'Applying knowledge snippets...'; cr.

testPage := (LeDatabasesRegistry defaultLogicalDatabase databaseNamed: 'gtoolkit-ci-experiment/gtoolkit-ci-experiment/lepiter') pages first.

NonInteractiveTranscript stdout show: 'Found Test Page'; cr.

snippets := testPage allChildrenSnippetsMatching: [ :aSnippet |
    aSnippet isKindOf: LePharoSnippet].

NonInteractiveTranscript stdout show: 'Found ', (snippets size) asString , ' Pharo snippets to be applied.'; cr.

snippets do: [ :aSnippet |
    aSnippet coder doItAll ].

NonInteractiveTranscript stdout show: 'Exists LepiterDefinedClass? ', (Smalltalk at: #LepiterDefinedClass) isNotNil asString; cr.

Smalltalk snapshot: true andQuit: false.
