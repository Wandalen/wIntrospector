( function _JsAcorn_test_s_( )
{

'use strict';

if( typeof module !== 'undefined' )
{

  let _ = require( '../../../../node_modules/Tools' );
  require( './JsAbstract.test.s' );

}

//

const _ = _global_.wTools;
var fileProvider = _.fileProvider;
var path = fileProvider.path;
const Parent = wTests[ 'Tools.mid.Introspector.JsAbstract' ];

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
  test.true( context.defaultParser === _.introspector.Parser.JsAcorn );
  let sys = _.introspector.System({ defaultParserClass : context.defaultParser });
  let file = _.introspector.File({ data : sourceCode, sys });
  file.refine();
  logger.log( file.productExportInfo() );

  test.description = 'nodes';
  test.identical( file.product.nodes.length, 104 ); /* 96 */
  test.identical( _.mapKeys( file.product.byType ).length, 23 ); /* 20 */
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

const Proto =
{

  name : 'Tools.mid.Introspector.JsAcorn',

  context :
  {

    defaultParser : _.introspector.Parser.JsAcorn,

  },

  tests :
  {

    parseStringSpecial,

  },

}

//

const Self = wTestSuite( Proto ).inherit( Parent );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
