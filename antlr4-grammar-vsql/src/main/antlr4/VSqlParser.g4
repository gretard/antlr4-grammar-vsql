parser grammar VSqlParser;

@header {
  package org.antlr4.vsql;
}

options {
	tokenVocab = VSqlLexer;
}

root: ( statement SEMI?)* EOF?;

statement:
	(
		alter_access_policy_statement
		| alter_authentication_statement
		| alter_database_drop_statement
		| alter_fault_group_statement
		| alter_function_statement
		| alter_hcatalog_schema_statement
		| alter_library_statement
		| alter_model_statement
		| alter_network_interface_statement
		| alter_node_statement
		| alter_notfifier_statement
		| alter_projection_statement
		| alter_profile_statement
		| alter_profile_rename_statement
		| alter_resource_pool_statement // to do update params
		| alter_role_rename_statement
		| alter_schema_statement
		| alter_sequence_statement
		| alter_session_statement
		| alter_subnet_statement
		| alter_table_rename_statement
		| alter_table_general_statment //todo
		| alter_user_statement //todo
		| alter_view_statement //todo
		| begin_transaction_statement
		| comment_on_statement
		| commit_statement
		| connect_statement
		| copy_statement
		| copy_local_statement
		| copy_from_vertica_statement
		| create_access_policy_statement
		| create_authentication_statement
		| create_branch_statement
		| create_external_table_as_copy_statement
		| create_fault_group_statement
		| create_flex_table_statement
		| create_flex_external_table_as_copy_statement
		| create_function_statements_statement
		| create_hcatalog_schema_statement
		| create_library_statement
		| create_load_balance_group_statement
		| create_local_temporary_view_statement
		| create_location_statement
		| create_network_address_statement
		| create_network_interface_statement
		| create_notifier_statement
		| create_procedure_statement
		| create_profile_statement
		| create_projection_statement
		| create_projection_live_aggregate_projections_statement
		| create_projection_udtfs_statement
		| create_resource_pool_statement
		| create_role_statement
		| create_routing_rule_statement
		| create_schema_statement
		| create_sequence_statement
		| create_subnet_statement
		| create_table_statement
		| create_temporary_table_statement
		| create_text_index_statement
		| create_user_statement
		| create_view_statement
		| delete_statement
		| directed_query_statements_statement
		| disconnect_statement
		| drop_access_policy_statement
		| drop_aggregate_function_statement
		| drop_authentication_statement
		| drop_branch_statement
		| drop_fault_group_statement
		| drop_function_statement
		| drop_source_statement
		| drop_filter_statement
		| drop_parser_statement
		| drop_model_statement
		| drop_library_statement
		| drop_load_balance_group_statement
		| drop_network_address_statement
		| drop_network_interface_statement
		| drop_notifier_statement
		| drop_procedure_statement
		| drop_profile_statement
		| drop_projection_statement
		| drop_resource_pool_statement
		| drop_role_statement
		| drop_routing_rule_statement
		| drop_schema_statement
		| drop_sequence_statement
		| drop_subnet_statement
		| drop_table_statement
		| drop_text_index_statement
		| drop_transform_function_statement
		| drop_user_statement
		| drop_view_statement
		| end_statement
		| explain_statement
		| export_to_parquet_statement
		| export_to_vertica_statement
		| grant_statements_statement
		| insert_statement
		| merge_statement
		| profile_statement
		| release_savepoint_statement
		| revoke_statements_statement
		| rollback_statement
		| rollback_to_savepoint_statement
		| savepoint_statement
		| select_statement
		| set_datestyle_statement
		| set_escape_string_warning_statement
		| set_intervalstyle_statement
		| set_locale_statement
		| set_role_statement
		| set_search_path_statement
		| set_session_autocommit_statement
		| set_session_characteristics_as_transaction_statement
		| set_session_graceperiod_statement
		| set_session_idlesessiontimeout_statement
		| set_session_memorycap_statement
		| set_session_multipleactiveresultsets_statement
		| set_session_resource_pool_statement
		| set_session_runtimecap_statement
		| set_session_tempspacecap_statement
		| set_standard_conforming_strings_statement
		| set_time_zone_statement
		| show_statement
		| show_current_statement
		| show_database_statement
		| show_node_statement
		| show_session_statement
		| start_transaction_statement
		| truncate_table_statement
		| update_statement
		| empty_statement
	);

dml_statement:
	select_statement
	| insert_statement
	| update_statement
	| merge_statement
	| delete_statement;

ddl_statement:;

dcl_statement:;

tcl_statement:;

other_statement:;

empty_statement: SEMI;

alter_access_policy_statement:
	K_ALTER K_ACCESS K_POLICY K_ON tableReference (
		( K_FOR K_COLUMN column expressions?)
		| (K_FOR K_ROWS ( K_WHERE expressions)?) (
			K_ENABLE
			| K_DISABLE
		)
	)
	| (
		( K_FOR K_COLUMN column)
		| ( K_FOR K_ROWS) K_COPY K_TO K_TABLE table
	);

alter_authentication_statement:
	K_ALTER K_AUTHENTICATION identifier (
		( K_ENABLE | K_DISABLE)
		| (
			K_LOCAL
			| (
				K_HOST (K_TLS | K_NO K_TLS) (
					IPV4_ADDR
					| IPV6_ADDR
				)
			)
		)
		| ( K_RENAME K_TO identifier)
		| ( K_METHOD identifier)
		| ( K_SET keyValuePairs)
		| (
			K_PRIORITY identifier //int
		)
	);

alter_database_drop_statement:
	K_ALTER K_DATABASE dbname (
		( K_DROP K_ALL K_FAULT K_GROUP)
		| ( K_EXPORT K_ON ( identifier | K_DEFAULT))
		| ( K_RESET K_STANDBY)
		| ( K_SET ( K_PARAMETER)? keyValuePairs)
		| ( K_CLEAR ( K_PARAMETER)? entities)
	);

alter_fault_group_statement:
	K_ALTER K_FAULT K_GROUP identifier (
		( K_ADD K_NODE identifier)
		| ( K_DROP K_NODE identifier)
		| ( K_ADD K_FAULT K_GROUP identifier)
		| ( K_DROP K_FAULT K_GROUP identifier)
		| ( K_RENAME K_TO identifier)
	);

alter_function_statement:
	K_ALTER K_FUNCTION functionReference arglist? CLOSE_PAREN (
		( K_OWNER K_TO identifier)
		| ( K_RENAME K_TO identifier)
		| ( K_SET K_SCHEMA identifier)
		| ( K_SET K_FENCED bool_expression)
	);

alter_hcatalog_schema_statement:
	K_ALTER K_HCATALOG K_SCHEMA schema K_SET keyValuePairs;

alter_library_statement:
	K_ALTER K_LIBRARY (schemaReference DOT)? identifier (
		K_DEPENDS identifier (K_LANGUAGE identifier)?
	)? K_AS identifier;

alter_model_statement:
	K_ALTER K_MODEL (schemaReference DOT)? identifier (
		( K_OWNER K_TO identifier)
		| ( K_RENAME K_TO identifier)
		| ( K_SET K_SCHEMA identifier)
	);

alter_network_interface_statement:
	K_ALTER K_NETWORK K_INTERFACE identifier K_RENAME K_TO identifier;

alter_node_statement:
	K_ALTER K_NODE identifier (
		( K_EXPORT K_ON ( identifier | K_DEFAULT))
		| ( K_IS) identifier
		| K_REPLACE ( K_WITH identifier)
		| K_RESET
		| K_SET ( K_PARAMETER)? keyValuePairs
		| K_CLEAR ( K_PARAMETER)? entities
	);

alter_notfifier_statement:
	K_ALTER K_NOTIFIER identifier notifierParam (
		COMMA notifierParam
	)*;

alter_projection_statement:
	K_ALTER K_PROJECTION (schemaReference DOT)? identifier K_RENAME K_TO identifier;

alter_profile_statement:
	K_ALTER K_PROFILE (identifier) K_LIMIT password_parameter identifier;

alter_profile_rename_statement:
	K_ALTER K_PROFILE identifier K_RENAME K_TO identifier;

alter_resource_pool_statement:
	K_ALTER K_RESOURCE K_POOL identifier identifier;

alter_role_rename_statement:
	K_ALTER K_ROLE identifier K_RENAME K_TO identifier;

alter_schema_statement:
	K_ALTER K_SCHEMA (
		(
			schemaReference (
				(
					K_DEFAULT (K_INCLUDE | K_EXCLUDE) K_SCHEMA K_PRIVILEGES
				)
				| ( K_OWNER K_TO identifier ( K_CASCADE)?)
			)
		)
		| (
			schemaReference (COMMA schema)* (
				K_RENAME K_TO entities
			)
		)
	);

alter_sequence_statement:
	K_ALTER K_SEQUENCE (
		(
			(schemaReference DOT)? identifier (
				K_INCREMENT K_BY DECIMAL
			)? (( K_MINVALUE DECIMAL) | ( K_NO K_MINVALUE))? (
				( K_MAXVALUE DECIMAL)
				| ( K_NO K_MAXVALUE)
			)? (K_RESTART K_WITH DECIMAL)? (
				( K_CACHE DECIMAL)
				| ( K_NO K_CACHE) ( K_CYCLE | K_NO K_CYCLE)
			)?
		)
		| (
			(schemaReference DOT)? identifier (
				( K_RENAME K_TO identifier)
				| ( K_SET K_SCHEMA identifier)
				| ( K_OWNER K_TO identifier)
			)
		)
	);

alter_session_statement:
	K_ALTER K_SESSION (
		( K_SET K_PARAMETER? keyValuePairs)
		| ( K_CLEAR K_PARAMETER? entities?)
		| (K_SET K_UDPARAMETER ( K_FOR identifier)? keyValuePairs)
		| (K_CLEAR K_UDPARAMETER ( K_FOR identifier)? entities?)
	);

alter_subnet_statement:
	K_ALTER K_SUBNET identifier K_RENAME K_TO identifier;

alter_table_rename_statement:
	K_ALTER K_TABLE tableReference (COMMA table)* K_RENAME K_TO entities;
// todo

alter_table_general_statment:
	K_ALTER K_TABLE tableReference (
		alter_table_item ( COMMA alter_table_item)*
	);

alter_table_item:
	(K_ADD K_COLUMN ( K_IF K_NOT K_EXISTS)? column dataTypes);

alter_user_statement: todo_statement;

alter_view_statement:
	K_ALTER K_VIEW (schemaReference DOT)? (
		entities (
			K_OWNER K_TO identifier
			| K_SET K_SCHEMA identifier
			| (K_INCLUDE | K_EXCLUDE | K_MATERIALIZE) (K_SCHEMA)? K_PRIVILEGES
		)
		| K_RENAME K_TO entities
	);

todo_statement: identifier+;

begin_transaction_statement:
	K_BEGIN (K_WORK | K_TRANSACTION) K_ISOLATION K_LEVEL isolationLevel transactionMode;

comment_on_statement: comment_on_column_statement;

comment_on_column_statement:
	K_COMMENT K_ON K_COLUMN (dbname DOT)? (schema DOT)? projection DOT column K_IS (
		identifier
		| K_NULL
	);

commit_statement: K_COMMIT ( K_WORK | K_TRANSACTION)?;

connect_statement:
	K_CONNECT K_TO K_VERTICA dbname K_USER identifier K_PASSWORD identifier K_ON identifier COMMA
		DECIMAL (K_TLSMODE K_PREFER)?;

copy_statement: todo_statement;

copy_local_statement: todo_statement;

copy_from_vertica_statement:
	K_COPY tableReference (column ( COMMA column)*)? K_FROM K_VERTICA tableReference (
		column ( COMMA column)*
	)? (K_AUTO | K_DIRECT | K_TRICKLE)? (
		K_STREAM K_NAME identifier
	)? (K_NO K_COMMIT)?;

create_access_policy_statement:
	K_CREATE K_ACCESS K_POLICY K_ON tableReference (
		( K_FOR K_COLUMN column expressions)
		| ( K_FOR K_ROWS K_WHERE expressions)
	) (K_ENABLE | K_DISABLE);

create_authentication_statement: todo_statement;

create_branch_statement: todo_statement;

create_external_table_as_copy_statement: todo_statement;

create_fault_group_statement: todo_statement;

create_flex_table_statement: todo_statement;

create_flex_external_table_as_copy_statement: todo_statement;

create_function_statements_statement: todo_statement;

create_hcatalog_schema_statement: todo_statement;

create_library_statement: todo_statement;

create_load_balance_group_statement: todo_statement;

create_local_temporary_view_statement: todo_statement;

create_location_statement: todo_statement;

create_network_address_statement: todo_statement;

create_network_interface_statement: todo_statement;

create_notifier_statement: todo_statement;

create_procedure_statement: todo_statement;

create_profile_statement: todo_statement;

create_projection_statement: todo_statement;

create_projection_live_aggregate_projections_statement:
	todo_statement;

create_projection_udtfs_statement: todo_statement;

create_resource_pool_statement: todo_statement;

create_role_statement: todo_statement;

create_routing_rule_statement: todo_statement;

create_schema_statement: todo_statement;

create_sequence_statement: todo_statement;

create_subnet_statement: todo_statement;

create_table_statement: todo_statement;

create_temporary_table_statement: todo_statement;

create_text_index_statement: todo_statement;

create_user_statement: todo_statement;

create_view_statement:
	K_CREATE (K_OR K_REPLACE)? K_VIEW identifier (
		OPEN_PAREN columnReference (COMMA columnReference)* CLOSE_PAREN
	)? ((K_INCLUDE | K_EXCLUDE) K_SCHEMA? K_PRIVILEGES)? K_AS select_statement;

delete_statement:
	K_DELETE hints? K_FROM tableReference where_clause;

directed_query_statements_statement: todo_statement;

disconnect_statement: K_DISCONNECT dbname;

drop_access_policy_statement:
	K_DROP K_ACCESS K_POLICY K_ON table K_FOR (
		K_COLUMN column
		| K_ROWS
	);

drop_aggregate_function_statement:
	K_DROP K_AGGREGATE K_FUNCTION (K_IF K_EXISTS)? functionReference arglist;

drop_authentication_statement:
	K_DROP K_AUTHENTICATION (K_IF K_EXISTS)? identifier (
		K_CASCADE
	)?;

drop_branch_statement: todo_statement;

drop_fault_group_statement:
	K_DROP K_FAULT K_GROUP (K_IF K_EXISTS) identifier;

drop_function_statement:
	K_DROP K_FUNCTION (K_IF K_EXISTS)? functionReference arglist;

drop_source_statement:
	K_DROP K_SOURCE (schemaReference DOT)? identifier OPEN_PAREN CLOSE_PAREN;

drop_filter_statement:
	K_DROP K_FILTER (schemaReference DOT)? identifier OPEN_PAREN CLOSE_PAREN;

drop_parser_statement:
	K_DROP K_PARSER (schemaReference DOT)? identifier OPEN_PAREN CLOSE_PAREN;

drop_model_statement:
	K_DROP K_MODEL (K_IF K_EXISTS)? (schemaReference DOT)? identifier (
		COMMA identifier
	)*;

drop_library_statement:
	K_DROP K_LIBRARY (K_IF K_EXISTS)? (schemaReference DOT)? identifier K_CASCADE?;

drop_load_balance_group_statement: todo_statement;

drop_network_address_statement: todo_statement;

drop_network_interface_statement:
	K_NETWORK K_INTERFACE (K_IF K_EXISTS)? (schemaReference DOT)? identifier K_CASCADE?;

drop_notifier_statement:
	K_NETWORK K_NOTIFIER (K_IF K_EXISTS)? identifier;

drop_procedure_statement:
	K_DROP K_PROCEDURE (K_IF K_EXISTS)? (schemaReference DOT)? identifier arglist;

drop_profile_statement:
	K_DROP K_PROFILE (K_IF K_EXISTS)? entities (K_CASCADE)?;

drop_projection_statement:
	K_DROP K_PROJECTION (K_IF K_EXISTS)? (schemaReference DOT)? entities (
		K_CASCADE
		| K_RESTRICT
	)?;

drop_resource_pool_statement:
	K_DROP K_RESOURCE K_POOL identifier;

drop_role_statement:
	K_DROP K_ROLE (K_IF K_EXISTS)? entities K_CASCADE?;

drop_routing_rule_statement: todo_statement;

drop_schema_statement:
	K_DROP K_SCHEMA (K_IF K_EXISTS)? (dbname DOT)? entities K_CASCADE?;

drop_sequence_statement:
	K_DROP K_SEQUENCE (K_IF K_EXISTS)? (schemaReference DOT)? entities (
		K_CASCADE
		| K_RESTRICT
	)?;

drop_subnet_statement:
	K_DROP K_SUBNET (K_IF K_EXISTS)? (schemaReference DOT)? entities K_CASCADE?;

drop_table_statement:
	K_DROP K_TABLE (K_IF K_EXISTS)? tableReference (COMMA table)* K_CASCADE?;

drop_text_index_statement:
	K_DROP K_TEXT K_INDEX (K_IF K_EXISTS)? (schemaReference DOT)? identifier;

drop_transform_function_statement:
	K_DROP K_TRANSFORM K_FUNCTION (K_IF K_EXISTS)? functionReference arglist;

drop_user_statement:
	K_DROP K_USER (K_IF K_EXISTS)? entities K_CASCADE?;

drop_view_statement:
	K_DROP K_VIEW (K_IF K_EXISTS)? (schemaReference DOT)? entities;

end_statement: K_END ( K_WORK | K_TRANSACTION)?;

explain_statement:
	K_EXPLAIN hints? (K_LOCAL | K_VERBOSE | K_JSON | K_ANNOTATED)? (
		statement
	);

export_to_parquet_statement: todo_statement;

export_to_vertica_statement:
	K_EXPORT K_TO K_VERTICA tableReference (
		OPEN_PAREN column (COMMA column)* CLOSE_PAREN
	)? (
		( K_AS select_query)
		| (
			K_FROM tableReference (
				OPEN_PAREN column (COMMA column)* CLOSE_PAREN
			)?
		)
	);
//todo

grant_statements_statement: todo_statement;

grant_authentication_statement:
	K_GRANT K_AUTHENTICATION identifier K_TO entities;

insert_statement:
	K_INSERT hints? K_INTO tableReference (
		OPEN_PAREN column (COMMA column)* CLOSE_PAREN
	)? (
		( K_DEFAULT K_VALUES)
		| ( K_VALUES OPEN_PAREN entities CLOSE_PAREN)
		| select_statement
	);

merge_statement:
	K_MERGE hints? K_INTO tableReference alias? K_USING (
		tableReference
		| select_statement
	) alias? joinPredicate matchingClause+;

matchingClause:
	(
		K_WHEN K_MATCHED K_THEN K_UPDATE (K_AND predicates)? K_THEN K_UPDATE K_SET (
			column EQUAL identifier
		) (column EQUAL identifier)* (where_clause)?
	)
	| (
		K_WHEN K_NOT K_MATCHED (K_AND predicates)? K_THEN K_INSERT OPEN_PAREN column (
			COMMA column
		)* CLOSE_PAREN K_VALUES OPEN_PAREN entities CLOSE_PAREN
	);

profile_statement: K_PROFILE statement;

release_savepoint_statement:
	K_RELEASE (K_SAVEPOINT)? identifier;

revoke_statements_statement: todo_statement;

rollback_statement: K_ROLLBACK ( K_WORK | K_TRANSACTION)?;

rollback_to_savepoint_statement:
	K_ROLLBACK K_TO (K_SAVEPOINT)? identifier;

savepoint_statement: K_SAVEPOINT identifier;

select_statement:
	(( K_AT K_EPOCH ( K_LATEST | DECIMAL)) | ( K_AT K_TIME string))? select_query (
		(K_UNION ( K_ALL | K_DISTINCT)? select_query)
	)*;

set_datestyle_statement:
	K_SET K_DATESTYLE K_TO (
		K_ISO
		| K_GERMAN
		| ( K_SQL ( COMMA ( K_DMY | K_MDY))?)
		| ( K_POSTGRES ( COMMA ( K_MDY | K_DMY))?)
	);

set_escape_string_warning_statement:
	K_SET K_ESCAPE_STRING_WARNING K_TO (K_ON | K_OFF);

set_intervalstyle_statement:
	K_SET K_INTERVALSTYLE K_TO (K_PLAIN | K_UNITS);

set_locale_statement: K_SET K_LOCALE K_TO identifier;

set_role_statement:
	K_SET K_ROLE (
		entities
		| K_NONE
		| K_ALL
		| ( K_ALL K_EXCEPT entities)
		| K_DEFAULT
	);

set_search_path_statement:
	K_SET K_SEARCH_PATH (K_TO | EQUAL) (
		( schema ( COMMA schema)*)
		| K_DEFAULT
	);

set_session_autocommit_statement:
	K_SET K_SESSION K_AUTOCOMMIT K_TO (K_ON | K_OFF);

set_session_characteristics_as_transaction_statement:
	K_SET K_SESSION K_CHARACTERISTICS K_AS K_TRANSACTION (
		COMMA? isolationLevel
		| COMMA? transactionMode
	)+;

set_session_graceperiod_statement:
	K_SET K_SESSION K_GRACEPERIOD (
		identifier
		| K_NONE
		| ( EQUAL K_DEFAULT)
	);

set_session_idlesessiontimeout_statement:
	K_SET K_SESSION K_IDLESESSIONTIMEOUT (
		identifier
		| K_NONE
		| ( EQUAL K_DEFAULT)
	);

set_session_memorycap_statement:
	K_SET K_SESSION K_MEMORYCAP (
		identifier
		| K_NONE
		| ( EQUAL K_DEFAULT)
	);

set_session_multipleactiveresultsets_statement:
	K_SET K_SESSION K_MULTIPLEACTIVERESULTSETS K_TO (
		K_ON
		| K_OFF
	);

set_session_resource_pool_statement:
	K_SET K_SESSION K_RESOURCE_POOL EQUAL (
		identifier
		| ( K_DEFAULT)
	);

set_session_runtimecap_statement:
	K_SET K_SESSION K_RUNTIMECAP (
		identifier
		| K_NONE
		| ( EQUAL K_DEFAULT)
	);

set_session_tempspacecap_statement:
	K_SET K_SESSION K_TEMPSPACECAP (identifier | K_NONE);

set_standard_conforming_strings_statement:
	K_SET K_STANDARD_CONFORMING_STRINGS K_TO (K_ON | K_OFF);

set_time_zone_statement:
	K_SET (( K_TIME K_ZONE) | K_TIMEZONE) K_TO K_INTERVAL? identifier;

//todo update parameters

show_statement: K_SHOW ( K_ALL | identifier);

show_current_statement: K_SHOW K_CURRENT ( K_ALL | identifier);

show_database_statement:
	K_SHOW K_DATABASE dbname (K_ALL | entities);

show_node_statement:
	K_SHOW K_NODE identifier (K_ALL | entities);

show_session_statement:
	K_SHOW K_SESSION (K_ALL | ( K_UDPARAMETERS K_ALL) | entities);

start_transaction_statement:
	K_START K_TRANSACTION K_ISOLATION K_LEVEL isolationLevel transactionMode;

truncate_table_statement: K_TRUNCATE K_TABLE tableReference;

update_statement:
	K_UPDATE hints? tableReference alias? K_SET expressions from_clause? where_clause?;

select_query:
	select_clause into_clause? from_clause? where_clause? timeseries_clause? groupBy_clause?
		having_clause? match_clause? (
		K_UNION ( K_ALL | K_DISTINCT)?
	)? except_clause? intersect_clause? orderby_clause? (
		K_LIMIT ( DECIMAL | K_ALL)
	)? (K_OFFSET DECIMAL)? (
		K_FOR K_UPDATE (
			K_OF tableReference (COMMA tableReference)*
		)?
	)?;

select_clause: K_SELECT hints? ( K_ALL | K_DISTINCT)? elements;

intersect_clause: K_INTERSECT select_query;

except_clause: K_EXCEPT select_query;

from_clause: K_FROM ( dataset ( COMMA? dataset)*) tableSample?;

into_clause:
	(K_INTO K_TABLE? tableReference alias?)
	| K_INTO (K_GLOBAL | K_LOCAL)? (K_TEMP | K_TEMPORARY) K_TABLE? tableReference (
		K_ON K_COMMIT (K_PRESERVE | K_DELETE) K_ROWS
	)?;

timeseries_clause:
	K_TIMESERIES columnReference alias over_clause K_ORDER K_BY columnReference (
		COMMA columnReference
	)*;

over_clause:
	K_OVER OPEN_PAREN (
		K_PARTITION K_BY columnReference (COMMA columnReference)*
	)? K_ORDER K_BY columnReference CLOSE_PAREN;

groupBy_clause: K_GROUP K_BY hints? expressions;

having_clause: K_HAVING condition ( COMMA condition)*;

where_clause: K_WHERE predicates;

orderby_clause: K_ORDER K_BY orderbyItem ( COMMA orderbyItem)*;

match_clause:
	K_MATCH OPEN_PAREN (
		K_PARTITION K_BY columnReference (COMMA columnReference)*
	)? K_ORDER K_BY columnReference (COMMA columnReference)* K_DEFINE (
		identifier K_AS ( exp | predicates)
	) (COMMA ( identifier K_AS ( exp | predicates)))* K_PATTERN identifier K_AS OPEN_PAREN
		identifier CLOSE_PAREN (
		(K_ROWS K_MATCH) (( K_ALL K_EVENTS) | ( K_FIRST K_EVENT))
	)? CLOSE_PAREN;

orderbyItem: exp ( K_ASC | K_DESC)?;

predicates: predicate ( ( K_AND | K_OR) predicate)*;

tableSample: K_TABLESAMPLE OPEN_PAREN FLOAT CLOSE_PAREN;

dataset: ( tableReference | select_clause | joinedTable) alias?;

joinedTable:
	tableReference (
		K_INNER
		| ( K_LEFT K_OUTER?)
		| ( K_RIGHT K_OUTER?)
		| ( K_FULL K_OUTER?)
		| K_NATURAL
		| K_CROSS
	)? K_JOIN hints? tableSample? joinPredicate?;

elements: element ( COMMA element)*;

element:
	(( exp | OPEN_PAREN select_query CLOSE_PAREN) alias?)
	| asteriskExp;

expressions: condition ( COMMA condition)*;

exp:
	(
		OPEN_PAREN (
			number
			| functionCall
			| columnReference
			| caseExp
		) CLOSE_PAREN
	)
	| (( number | functionCall | columnReference | caseExp));

predicate:
	betweenPredicate
	| booleanPredicate
	| columnValuePredicate
	| inPredicate
	| interpolatePredicate
	| likePredicate
	| nullPredicate;

nullPredicate:
	(columnReference | functionCall) K_IS (K_NOT)? K_NULL;

likePredicate:
	columnReference K_NOT? (
		K_LIKE
		| K_ILIKE
		| K_LIKEB
		| K_ILIKEB
	) identifier (K_ESCAPE identifier)?;

joinPredicate:
	K_ON columnReference comparisonOperator columnReference (
		(K_AND | K_OR | K_NOT) columnReference comparisonOperator columnReference
	)*;

interpolatePredicate:
	columnReference K_PREVIOUS K_VALUE columnReference;

columnValuePredicate:
	columnReference operator (columnReference | constantExp);

inPredicate:
	columnReference (COMMA columnReference)* K_IN K_NOT? inPredicateValues (
		COMMA inPredicateValues
	)*;

inPredicateValues:
	OPEN_PAREN (constantExp | inPredicateValues) CLOSE_PAREN;

constantExp: number | string ( K_IS K_NOT? K_NULL);

betweenPredicate: exp K_BETWEEN? exp K_AND exp;

booleanPredicate: exp K_IS K_NOT? ( bool_expression | K_UNKNOWN);

caseExp:
	K_CASE K_WHEN exp K_THEN exp (K_WHEN exp K_THEN exp)* (
		K_ELSE exp
	)? K_END;

condition: exp | predicate;

alias: ( K_AS? identifier);

functionCall:
	function OPEN_PAREN (( K_ALL | K_DISTINCT)? elements?)? CLOSE_PAREN;

notifierParam:
	K_NO K_CHECK K_COMMITTED (K_ENABLE | K_DISABLE) K_IDENTIFIED K_BY identifier K_MAXMEMORYSIZE
		identifier K_MAXPAYLOAD identifier K_PARAMETERS identifier;

keyValuePairs: keyValuePair ( COMMA keyValuePair)*;

keyValuePair: identifier operator identifier;

hints: OPEN_HINT hint ( COMMA hint)* CLOSE_HINT;

hint:
	(K_ALLNODES)
	| ( K_GBYTYPE ( K_HASH | K_PIPE))
	| ( K_ENABLE_WITH_CLAUSE_MATERIALIZATION)
	| K_EARLY_MATERIALIZATION
	| K_DIRECT
	| (K_LABEL OPEN_PAREN identifier CLOSE_PAREN) K_SYN_JOIN
	| K_SYNTACTIC_JOIN
	| (
		K_DISTRIB OPEN_PAREN (identifier) (COMMA ( identifier))* CLOSE_PAREN
	)
	| ( K_JTYPE OPEN_PAREN ( identifier) CLOSE_PAREN)
	| ( K_UTYPE OPEN_PAREN ( identifier) CLOSE_PAREN)
	| (
		K_PROJS OPEN_PAREN (
			(( schemaReference DOT)? identifier) (
				COMMA (( schemaReference DOT)? identifier)
			)
		) CLOSE_PAREN
	)
	| (
		K_SKIP_PROJS OPEN_PAREN (
			(( schemaReference DOT)? identifier) (
				COMMA (( schemaReference DOT)? identifier)
			)
		) CLOSE_PAREN
	)
	| ( K_IGNORECONST OPEN_PAREN ( DECIMAL) CLOSE_PAREN)
	| K_VERBATIM;

columnReference:
	(( ( ( dbname DOT)? ( schema DOT))? ( table DOT)))? column;

tableReference: ( ( dbname DOT)? ( schema DOT))? table;

projectionReference:
	(( ( dbname DOT)? ( schema DOT))? table DOT)? projection;
functionReference: ( ( dbname DOT)? ( schema DOT))? function;

schemaReference: ( dbname DOT)? schema;

dbname: identifier;

schema: identifier;
table: identifier;

projection: identifier;

function: identifier | aggregateFunction;

column: identifier;
entities: identifier ( COMMA identifier)*;
string: DOUBLE_QUOTE_STRING | SINGLE_QUOTE_STRING;

number: DECIMAL | FLOAT | REAL;
asteriskExp: STAR;
identifier: WORD | DOUBLE_QUOTE_STRING | SINGLE_QUOTE_STRING;

password_parameter:
	(
		K_PASSWORD_LIFE_TIME
		| K_PASSWORD_GRACE_TIME
		| K_FAILED_LOGIN_ATTEMPTS
		| K_PASSWORD_LOCK_TIME
		| K_PASSWORD_REUSE_MAX
		| K_PASSWORD_REUSE_TIME
		| K_PASSWORD_MAX_LENGTH
		| K_PASSWORD_MIN_LENGTH
		| K_PASSWORD_MIN_LETTERS
		| K_PASSWORD_MIN_UPPERCASE_LETTERS
		| K_PASSWORD_MIN_LOWERCASE_LETTERS
		| K_PASSWORD_MIN_DIGITS
		| K_PASSWORD_MIN_SYMBOLS
	);

operator: comparisonOperator;

comparisonOperator:
	EQUAL
	| EQUAL_GT
	| GT
	| LT
	| LTE
	| GTE
	| LT_GT
	| BANG_EQUAL
	| EQUAL2;

aggregateFunction:
	K_ROLLUP
	| ( K_GROUPING K_SETS?)
	| K_APPROXIMATE_COUNT_DISTINCT
	| K_APPROXIMATE_COUNT_DISTINCT_SYNOPSIS
	| K_APPROXIMATE_COUNT_DISTINCT_OF_SYNOPSIS
	| K_APPROXIMATE_MEDIAN
	| K_APPROXIMATE_PERCENTILE
	| K_AVG
	| K_BIT_AND
	| K_BIT_OR
	| K_BIT_XOR
	| K_BOOL_AND
	| K_BOOL_OR
	| K_BOOL_XOR
	| K_CORR
	| K_COUNT
	| K_COVAR_POP
	| K_COVAR_SAMP
	| K_GROUP_ID
	| K_GROUPING
	| K_GROUPING_ID
	| K_LISTAGG
	| K_MAX
	| K_MIN
	| K_REGR_AVGX
	| K_REGR_AVGY
	| K_REGR_COUNT
	| K_REGR_INTERCEPT
	| K_REGR_R2
	| K_REGR_SLOPE
	| K_REGR_SXX
	| K_REGR_SXY
	| K_REGR_SYY
	| K_STDDEV
	| K_STDDEV_POP
	| K_STDDEV_SAMP
	| K_SUM
	| K_SUM_FLOAT
	| K_VAR_POP
	| K_VAR_SAMP
	| K_VARIANCE;

isolationLevel:
	(K_READ K_COMMITTED)
	| ( K_SERIALIZABLE)
	| ( K_REPEATABLE K_READ)
	| ( K_READ K_UNCOMMITTED);

transactionMode: K_READ ( K_ONLY | K_WRITE)?;
reservedWords:
	K_ALL
	| K_AND
	| K_ANY
	| K_ARRAY
	| K_AS
	| K_ASC
	| K_AUTHORIZATION
	| K_BETWEEN
	| K_BIGINT
	| K_BINARY
	| K_BIT
	| K_BOOLEAN
	| K_BOTH
	| K_CASE
	| K_CAST
	| K_CHAR
	| K_CHAR_LENGTH
	| K_CHARACTER_LENGTH
	| K_CHECK
	| K_COLLATE
	| K_COLUMN
	| K_CONSTRAINT
	| K_CORRELATION
	| K_CREATE
	| K_CROSS
	| K_CURRENT_DATABASE
	| K_CURRENT_DATE
	| K_CURRENT_SCHEMA
	| K_CURRENT_TIME
	| K_CURRENT_TIMESTAMP
	| K_CURRENT_USER
	| K_DATEDIFF
	| K_DATETIME
	| K_DECIMAL
	| K_DECODE
	| K_DEFAULT
	| K_DEFERRABLE
	| K_DESC
	| K_DISTINCT
	| K_ELSE
	| K_ENCODED
	| K_END
	| K_EXCEPT
	| K_EXISTS
	| K_EXTRACT
	| K_FALSE
	| K_FLOAT
	| K_FOR
	| K_FOREIGN
	| K_FROM
	| K_FULL
	| K_GRANT
	| K_GROUP
	| K_HAVING
	| K_ILIKE
	| K_ILIKEB
	| K_IN
	| K_INITIALLY
	| K_INNER
	| K_INOUT
	| K_INT
	| K_INTEGER
	| K_INTERSECT
	| K_INTERVAL
	| K_INTERVALYM
	| K_INTO
	| K_IS
	| K_ISNULL
	| K_JOIN
	| K_KSAFE
	| K_LEADING
	| K_LEFT
	| K_LIKE
	| K_LIKEB
	| K_LIMIT
	| K_LOCALTIME
	| K_LOCALTIMESTAMP
	| K_MATCH
	| K_MINUS
	| K_MONEY
	| K_NATURAL
	| K_NCHAR
	| K_NEW
	| K_NONE
	| K_NOT
	| K_NOTNULL
	| K_NULL
	| K_NULLSEQUAL
	| K_NUMBER
	| K_NUMERIC
	| K_OFFSET
	| K_OLD
	| K_ON
	| K_ONLY
	| K_OR
	| K_ORDER
	| K_OUT
	| K_OUTER
	| K_OVER
	| K_OVERLAPS
	| K_OVERLAY
	| K_PINNED
	| K_POSITION
	| K_PRECISION
	| K_PRIMARY
	| K_REAL
	| K_REFERENCES
	| K_RIGHT
	| K_ROW
	| K_SCHEMA
	| K_SELECT
	| K_SESSION_USER
	| K_SIMILAR
	| K_SMALLDATETIME
	| K_SMALLINT
	| K_SOME
	| K_SUBSTRING
	| K_SYSDATE
	| K_TABLE
	| K_TEXT
	| K_THEN
	| K_TIME
	| K_TIMESERIES
	| K_TIMESTAMP
	| K_TIMESTAMPADD
	| K_TIMESTAMPDIFF
	| K_TIMESTAMPTZ
	| K_TIMETZ
	| K_TIMEZONE
	| K_TINYINT
	| K_TO
	| K_TRAILING
	| K_TREAT
	| K_TRIM
	| K_TRUE
	| K_UNBOUNDED
	| K_UNION
	| K_UNIQUE
	| K_USER
	| K_USING
	| K_UUID
	| K_VARBINARY
	| K_VARCHAR
	| K_VARCHAR2
	| K_WHEN
	| K_WHERE
	| K_WINDOW
	| K_WITH
	| K_WITHIN;
bool_expression: K_TRUE | K_FALSE;

arglist: OPEN_PAREN ( dataTypes ( COMMA dataTypes)*)? CLOSE_PAREN;

dataTypes:
	binaryTypes
	| booleanTypes
	| charTypes
	| dateTypes
	| apNumericTypes
	| eNumericTypes
	| spatialTypes
	| uuidTypes;

binaryTypes:
	K_BINARY
	| ( K_LONG K_VARBINARY)
	| K_VARBINARY
	| K_BYTEA
	| K_RAW;

booleanTypes: K_BOOLEAN;

charTypes: ( K_LONG K_VARCHAR) | K_CHAR | K_VARCHAR;

dateTypes:
	(K_TIME K_WITH K_TIMEZONE)
	| K_DATE
	| K_TIME
	| K_SMALLDATETIME
	| ( K_TIMESTAMP K_WITH K_TIMEZONE)
	| ( K_INTERVAL K_DAY K_TO K_SECOND)
	| ( K_INTERVAL K_YEAR K_TO K_MONTH)
	| K_TIMESTAMP
	| K_INTERVAL;

apNumericTypes:
	(K_DOUBLE K_PRECISION)
	| ( K_FLOAT OPEN_PAREN DECIMAL CLOSE_PAREN)
	| ( K_FLOAT8)
	| K_FLOAT
	| ( K_REAL);

eNumericTypes:
	K_BIGINT
	| K_INT8
	| K_SMALLINT
	| K_TINYINT
	| K_DECIMAL
	| K_NUMERIC
	| K_NUMBER
	| K_MONEY
	| K_INTEGER
	| K_INT;

spatialTypes: K_GEOMETRY | K_GEOGRAPHY;

uuidTypes: K_UUID;