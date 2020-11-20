( function _Js_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{

  let _ = require( '../../../../wtools/Tools.s' );
  require( './JsAbstract.test.s' );

}

//

let _ = _global_.wTools;
var fileProvider = _.fileProvider;
var path = fileProvider.path;
let Parent = wTests[ 'Tools.mid.Introspector.JsAbstract' ];

// --
// tests
// --

function parseStringSpecial( test )
{
  let context = this;
  let sourceCode = context.defaultProgramSourceCode;

  test.description = 'setup';
  test.true( _.constructorIs( _.introspector.Parser.JsAcorn ) );
  test.true( _.constructorIs( context.defaultParser ) );
  // test.true( context.defaultParser === _.introspector.Parser.JsAcorn );
  // let sys = _.introspector.System({ defaultParserClass : context.defaultParser });
  let sys = _.introspector.System();
  let file = _.introspector.File({ data : sourceCode, filePath : '/ParseStringSpecial.js', sys });
  file.refine();
  logger.log( file.productExportInfo() );
  test.true( file.parser.constructor === _.introspector.Parser.JsAcorn );

  test.description = 'nodes';
  test.identical( file.product.nodes.length, 96 );
  test.identical( _.mapKeys( file.product.byType ).length, 20 );
  test.identical( file.product.byType.gRoutine.length, 8 );

  test.description = 'root';
  test.identical( file.product.byType.Program.length, 1 );
  test.true( file.product.byType.Program.first() === file.product.root );

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

  name : 'Tools.mid.Introspector.Js',

  context :
  {

    defaultParser : _.introspector.Parser.Js,

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
