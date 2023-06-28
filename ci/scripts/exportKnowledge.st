NonInteractiveTranscript stdout show: 'Forcing reload of the default logical database...'; cr.

knowledgeBase := LeDatabasesRegistry defaultLogicalDatabase
			databaseNamed: 'blueplanelabs/gtoolkit-ci-experiment/lepiter'.

mainPage := knowledgeBase pageNamed: 'Test Page'.

targetDir := './public' asFileReference.

LeHtmlBookExporter new
			database: aKnowledgeBase;
			mainPage: aMainPage;
			piece: LeHtmlGtBookPiece gtBook;
			integerSequencer;
			addGtBookAssets;
			export;
			saveToRootDirectory: targetDir.
