NonInteractiveTranscript stdout
  show: 'Exporting knowledge base...'; cr.

knowledgeBase := LeDatabasesRegistry defaultLogicalDatabase
			databaseNamed: 'blueplanelabs/gtoolkit-lepiter-ci/lepiter'.

NonInteractiveTranscript stdout
  show: 'Knowledge base found: ', knowledgeBase databaseName ; cr.

mainPage := knowledgeBase pageNamed: 'Test Page'.

NonInteractiveTranscript stdout
  show: 'Main page found: ', mainPage title ; cr.

targetDir := './public' asFileReference.

NonInteractiveTranscript stdout
  show: 'Exporting to: ', targetDir asPath asString ; cr.


LeHtmlBookExporter new
			database: knowledgeBase;
			mainPage: mainPage;
			piece: LeHtmlGtBookPiece gtBook;
			integerSequencer;
			addGtBookAssets;
			export;
			saveToRootDirectory: targetDir.
