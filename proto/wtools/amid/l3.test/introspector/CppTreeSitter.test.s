( function _CppTreeSitter_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{

  let _ = require( '../../../../wtools/Tools.s' );
  require( './CppAbstract.test.s' );

}

//

let _ = _global_.wTools;
var fileProvider = _.fileProvider;
var path = fileProvider.path;
let Parent = wTests[ 'Tools.mid.Introspector.Cpp' ];

// --
// tests
// --

function parseStringSpecial( test )
{
  let context = this;
  let sourceCode = context.defaultProgramSourceCode;

  test.description = 'setup';

  test.is( _.constructorIs( _.introspector.Parser.CppTreeSitter ) );
  test.is( _.constructorIs( context.defaultParser ) );
  test.is( context.defaultParser === _.introspector.Parser.CppTreeSitter );

  let sys = _.introspector.System({ defaultParserClass : context.defaultParser });
  let file = _.introspector.File({ data : sourceCode, sys });
  file.refine();
  logger.log( file.productExportInfo() );

  test.description = 'nodes';
  test.identical( file.product.nodes.length, 423 );
  test.identical( _.mapKeys( file.product.byType ).length, 48 );

  test.description = 'root';
  test.identical( file.product.byType.translation_unit.length, 1 );
  test.is( file.product.byType.translation_unit.first() === file.product.root );

  return null;
}

parseStringSpecial.description =
`
Parsing from string with espima js parser produce proper AST.
`

// --
// declare
// --

var Proto =
{

  name : 'Tools.mid.Introspector.CppTreeSitter',

  context :
  {

    defaultParser : _.introspector.Parser.CppTreeSitter,

  },

  tests :
  {

    parseStringSpecial,

  },

}

//

let Self = new wTestSuite( Proto ).inherit( Parent );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
