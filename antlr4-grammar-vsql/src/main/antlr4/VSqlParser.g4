parser grammar VSqlParser;

@header {
  package org.antlr4.vsql;
}

options {
	tokenVocab = VSqlLexer;
	
}


root: ( statement SEMI)* EOF?;

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
		| alter_resource_pool_statement
		| alter_role_rename_statement
		| alter_schema_statement
		| alter_sequence_statement
		| alter_session_statement
		| alter_subnet_statement
		| alter_table_rename_statement
		| alter_table_general_statment 
		| alter_user_statement 
		| alter_view_statement 
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


empty_statement: SEMI;

alter_access_policy_statement:
	K_ALTER K_ACCESS K_POLICY K_ON tableReference (
		( K_FOR K_COLUMN columnReference predicates)
		| ( K_FOR K_ROWS where_clause?)
	) (enableOrDisable | ( K_COPY K_TO K_TABLE tableReference));


alter_authentication_statement:
	K_ALTER K_AUTHENTICATION auth_method_name (
		enableOrDisable
		| (K_LOCAL | ( K_HOST ( K_NO? K_TLS)?  address))
		| rename_clause
		| ( K_METHOD method)
		| ( K_SET commaSeparatedKeyValuePairs)
		| ( K_PRIORITY integerNumber)
	);

alter_database_drop_statement:
	K_ALTER K_DATABASE dbname (
		( K_DROP K_ALL K_FAULT K_GROUP)
		| ( K_EXPORT K_ON subnet)
		| ( K_RESET K_STANDBY)
		| ( K_SET  K_PARAMETER? commaSeparatedKeyValuePairs)
		| ( K_CLEAR  K_PARAMETER? params)
	);

alter_fault_group_statement:
	K_ALTER K_FAULT K_GROUP faultGroup (
		( K_ADD K_NODE node)
		| ( K_DROP K_NODE node)
		| ( K_ADD K_FAULT K_GROUP value)
		| ( K_DROP K_FAULT K_GROUP value)
		| rename_clause
	);

alter_function_statement:
	K_ALTER K_FUNCTION functionReference argument_list? (
		owner_clause
		| rename_clause
		|  set_schema_clause
		| ( K_SET K_FENCED bool_expression)
	);

alter_hcatalog_schema_statement:
	K_ALTER K_HCATALOG K_SCHEMA schema K_SET hcatalog_schema_param+;

alter_library_statement:
	K_ALTER K_LIBRARY libraryReference (
		K_DEPENDS depends = value (K_LANGUAGE lang)?
	)? alias;

alter_model_statement:
	K_ALTER K_MODEL modelReference (
		owner_clause
		| rename_clause
		| set_schema_clause
	);
	
alter_network_interface_statement:
	K_ALTER K_NETWORK K_INTERFACE network_interface rename_clause;

alter_node_statement:
	K_ALTER K_NODE node (
		( K_EXPORT K_ON exportOn=node)
		| ( ( K_IS)? nodeType = value)
		| ( K_REPLACE ( K_WITH standByNode = value)?)
		| K_RESET
		| (K_SET  K_PARAMETER? commaSeparatedKeyValuePairs)
		| (K_CLEAR  K_PARAMETER? params)
	);

alter_notfifier_statement:
	K_ALTER K_NOTIFIER notifier (notifier_params)*;

notifier_params:
	(K_NO? K_CHECK K_COMMITTED)
	| enableOrDisable
	| ( K_IDENTIFIED K_BY value)
	| ( K_MAXMEMORYSIZE value)
	| ( K_MAXPAYLOAD value)
	| ( K_PARAMETERS value);

alter_projection_statement:
	K_ALTER K_PROJECTION projectionReference  rename_clause;

alter_profile_statement:
	K_ALTER K_PROFILE profile K_LIMIT (password_parameter)+;

alter_profile_rename_statement:
	K_ALTER K_PROFILE profile rename_clause;

alter_resource_pool_statement:
	K_ALTER K_RESOURCE K_POOL resourcePool resource_pool_param+;

resource_pool_param:
	(K_CASCADE K_TO value)
	| (K_CPUAFFINITYMODE ( K_SHARED | K_EXCLUSIVE | K_ANY))
	| (
		K_CPUAFFINITYSET (
			K_NONE
			| ( value COMMA value)
			| ( value MINUS value)
			| number
		)
	)
	| ( K_EXECUTIONPARALLELISM ( number | K_AUTO))
	| ( K_MAXCONCURRENCY ( number | K_NONE))
	| ( K_MAXMEMORYSIZE ( number | K_NONE))
	| ( K_MAXQUERYMEMORYSIZE ( number | K_NONE))
	| ( K_MEMORYSIZE number)
	| ( K_PLANNEDCONCURRENCY ( number | K_AUTO))
	| ( K_PRIORITY ( integerNumber | K_HOLD))
	| ( K_QUEUETIMEOUT ( number | K_NONE))
	| ( K_RUNTIMECAP ( value | K_NONE))
	| ( K_RUNTIMEPRIORITY ( K_HIGH | K_MEDIUM | K_LOW))
	| ( K_RUNTIMEPRIORITYTHRESHOLD number)
	| ( K_SINGLEINITIATOR);

alter_role_rename_statement:
	K_ALTER K_ROLE role rename_clause;

alter_schema_statement:
	K_ALTER K_SCHEMA (
		(
			schemaReference (
				(K_DEFAULT schema_privileges_clause)
				| ( K_OWNER K_TO owner K_CASCADE?)
			)
		)
		| (
			schemaReference (COMMA schemaReference)* rename_clause
		)
	);

alter_sequence_statement:
	K_ALTER K_SEQUENCE sequenceReference (
		(
			sequence_params
			| (
				rename_clause
				| set_schema_clause
				| owner_clause
			)
		)
	);

sequence_params:
	(K_INCREMENT K_BY DECIMAL)? (
		( K_MINVALUE DECIMAL)
		| ( K_NO K_MINVALUE)
	)? (( K_MAXVALUE DECIMAL) | ( K_NO K_MAXVALUE))? (
		K_RESTART K_WITH DECIMAL
	)? (
		( K_CACHE DECIMAL)
		| ( K_NO K_CACHE) ( K_CYCLE | K_NO K_CYCLE)
	)?;

alter_session_statement:
	K_ALTER K_SESSION (
		(K_SET K_PARAMETER? commaSeparatedKeyValuePairs)
		| ( K_CLEAR K_PARAMETER? params)
		| (
			K_SET K_UDPARAMETER (K_FOR library)? commaSeparatedKeyValuePairs
		)
		| ( K_CLEAR K_UDPARAMETER ( K_FOR library)? params)
	);

alter_subnet_statement:
	K_ALTER K_SUBNET subnet rename_clause;

alter_table_rename_statement:
	K_ALTER K_TABLE tableReference (COMMA tableReference)* rename_clause ;

alter_table_general_statment:
	K_ALTER K_TABLE tableReference alter_table_item alter_table_item*;

alter_table_item:
	(
		K_ADD K_COLUMN ifNotExistsClause? columnReference dataTypes (
			((K_CONSTRAINT id? (nullOrNotNull)?)
			| ( K_DEFAULT expression)
		)? encoding_clause? (
			K_PROJECTIONS OPEN_PAREN projectionReference (
				COMMA projectionReference
			)* CLOSE_PAREN
		)?
	))
	| ( K_ADD table_constraint)
	| (
		K_ALTER K_COLUMN columnReference (
			( K_SET K_DEFAULT expression)
			| ( K_DROP K_DEFAULT)
			| ( K_SET K_USING expression)
			| ( K_DROP K_SET K_USING)
			| ( K_SET K_DEFAULT K_USING expression)
			| ( K_DROP K_DEFAULT K_USING expression)
			| ( K_SET nullOrNotNull)
			| ( K_SET K_DATATYPE dataTypes)
		)
	)
	| ( K_ALTER K_CONSTRAINT constraint enableOrDisable)
	| (K_DROP K_CONSTRAINT constraint ( K_CASCADE | K_RESTRICT)?)
	| (
		K_DROP K_COLUMN? (K_IF K_EXISTS)? columnReference (
			K_CASCADE
			| K_RESTRICT
		)?
	)
	| ( K_FORCE K_OUTER number)
	| ( schema_privileges_clause)
	| ( K_OWNER K_TO owner)
	| ( partition_clause K_REORGANIZE?)
	| ( K_REMOVE K_PARTITIONING)
	| ( K_RENAME K_COLUMN? column K_TO column)
	| ( K_REORGANIZE)
	| ( K_SET K_ACTIVEPARTITIONCOUNT expression)
	| ( K_SET K_SCHEMA schema)
	| ( K_SET K_STORAGE load_method);

alter_user_statement: K_ALTER K_USER user user_params+;

user_params:
	(
		(
			K_DEFAULT K_ROLE (
				K_NONE
				| role (COMMA role)*
				| K_ALL
				| ( K_ALL K_EXCEPT role (COMMA role)*)
			)
		)
		| ( K_RENAME K_TO value)
	)
	| (
		( K_ACCOUNT ( K_LOCK | K_UNLOCK))
		| ( K_GRACEPERIOD ( K_NONE | value))
		| ( K_IDENTIFIED K_BY string ( K_REPLACE string)?)
		| ( K_IDLESESSIONTIMEOUT ( K_NONE | value))
		| (
			K_MAXCONNECTIONS (
				K_NONE
				| ( number K_ON ( K_DATABASE | K_NODE))
			)
		)
		| ( K_MEMORYCAP ( K_NONE | string))
		| ( K_PASSWORD K_EXPIRE)
		| ( K_PROFILE ( K_DEFAULT | string))
		| ( K_RESOURCE K_POOL string)
		| ( K_RUNTIMECAP ( K_NONE | string))
		| (K_SEARCH_PATH ( K_DEFAULT | ( schema ( COMMA schema)*)))
		| ( K_SECURITY_ALGORITHM string)
		| ( K_TEMPSPACECAP ( K_NONE | value))
	);

alter_view_statement:
	K_ALTER K_VIEW viewReference 
		 (
			(K_OWNER K_TO owner)
			|( K_SET K_SCHEMA schema)
			| schema_privileges_clause
		)
		| ((COMMA viewReference)* K_RENAME K_TO values)
	;

todo_statement: id+;

begin_transaction_statement:
	K_BEGIN (K_WORK | K_TRANSACTION) K_ISOLATION K_LEVEL isolationLevel transactionMode;

comment_on_statement:
	comment_on_column_statement
	| comment_on_constraint_statement
	| comment_on_function_statement
	| comment_on_transform_function_statement
	| comment_on_library_statement
	| comment_on_node_statement
	| comment_on_schema_statement
	| comment_on_sequence_statement
	| comment_on_table_statement
	| comment_on_view_statement
	| comment_on_projection_statement;

comment_on_column_statement:
	K_COMMENT K_ON K_COLUMN projectionReference DOT column comment_value;

comment_on_constraint_statement:
	K_COMMENT K_ON K_CONSTRAINT constraint K_ON tableReference comment_value;

comment_on_function_statement:
	K_COMMENT K_ON K_FUNCTION functionReference argument_list comment_value;

comment_on_transform_function_statement:
	K_COMMENT K_ON K_TRANSFORM K_FUNCTION functionReference argument_list comment_value;

comment_on_library_statement:
	K_COMMENT K_ON K_FUNCTION libraryReference comment_value;

comment_on_node_statement:
	K_COMMENT K_ON K_NODE node comment_value;

comment_on_schema_statement:
	K_COMMENT K_ON K_SCHEMA schemaReference comment_value;

comment_on_sequence_statement:
	K_COMMENT K_ON K_SEQUENCE sequenceReference comment_value;

comment_on_table_statement:
	K_COMMENT K_ON K_TABLE tableReference comment_value;

comment_on_view_statement:
	K_COMMENT K_ON K_VIEW viewReference comment_value;

comment_on_projection_statement:
	K_COMMENT K_ON K_PROJECTION projectionReference comment_value;

comment_value: K_IS ( value | K_NULL);

commit_statement: K_COMMIT ( K_WORK | K_TRANSACTION)?;

connect_statement:
	K_CONNECT K_TO K_VERTICA dbname K_USER user K_PASSWORD value K_ON host COMMA
		port (K_TLSMODE K_PREFER)?;


copy_column:
	(column ( K_AS expression)?) (K_DELIMITER K_AS? value)? (
		K_ENCLOSED K_BY? value
	)? K_ENFORCELENGTH? (
		( K_ESCAPE K_AS? value)
		| ( K_NO K_ESCAPE)
	)? (K_FILLER dataTypes)? (K_FORMAT value)? (
		K_NULL K_AS? value
	)? (K_TRIM value)?;

column_option:
	column (K_DELIMITER K_AS? value)? (K_ENCLOSED K_BY? value)? K_ENFORCELENGTH? (
		( K_ESCAPE K_AS? value)
		| ( K_NO K_ESCAPE)
	)? (K_FILLER dataTypes)? (K_FORMAT value)? (
		K_NULL K_AS? value
	)? (K_TRIM value)?;

path:
	(
		string (COMMA string)* (
			K_ON (
				node
				| ( OPEN_PAREN node ( COMMA node)* CLOSE_PAREN)
				| ( K_ANY K_NODE)
			)
		)? inputFormat?
	);

local_path: K_LOCAL ( K_STDIN | string) inputFormat?;

inputFormat: K_UNCOMPRESSED | K_BZIP | K_GZIP | K_LZO | K_ZSTD;

vertica_source:
	K_VERTICA tableReference columns;

udl_clause:
	(
		K_SOURCE source commaSeparatedKeyValuePairs?
	)
	| (
		K_FILTER filter commaSeparatedKeyValuePairs?
	)
	| (
		K_PARSER parserName commaSeparatedKeyValuePairs?
	);

copy_statement:
	K_COPY tableReference (
		OPEN_PAREN copy_column (COMMA copy_column)* CLOSE_PAREN
	)? (
		K_COLUMN K_OPTION (
			OPEN_PAREN column_option (COMMA column_option)* CLOSE_PAREN
		)
	)? (
		K_FROM (
			( K_STDIN value?)
			| ( path ( COMMA path)*)
			| ( local_path ( COMMA local_path)*)
			| vertica_source
		)
	)? (
		K_WITH? K_PARSER value (
			OPEN_PAREN commaSeparatedKeyValuePairs CLOSE_PAREN
		)?
	)? (K_WITH? K_UDL = udl_clause+)? (K_DELIMITER K_AS? string)? (
		K_TRAILING K_NULLCOLS
	)? (K_NULL K_AS? string)? (
		( K_ESCAPE K_AS string)
		| ( K_NO K_ESCAPE)
	)? (K_ENCLOSED K_BY? string)? (K_RECORD K_TERMINATOR string)? (
		K_SKIP number
	)? (K_SKIP K_BYTES number)? (K_TRIM value)? (
		K_REJECTMAX number
	)? (
		K_REJECTED K_DATA (
			( string ( K_ON node)*)
			| ( K_AS K_TABLE id)
		)
	)? (K_EXCEPTIONS string ( K_ON node)*)? (K_ENFORCELENGTH)? (
		K_ERROR K_TOLERANCE
	)? (K_ABORT K_ON K_ERROR)? (K_STORAGE? load_method)? (
		K_STREAM K_NAME value
	)? (K_NO K_COMMIT)?;

copy_local_statement: copy_statement;

copy_from_vertica_statement:
	K_COPY tableReference columns? K_FROM K_VERTICA tableReference 
	columns? load_method? (K_STREAM K_NAME id)? (K_NO K_COMMIT)?;

create_access_policy_statement:
	K_CREATE K_ACCESS K_POLICY K_ON tableReference (
		( K_FOR K_COLUMN column expressions)
		| ( K_FOR K_ROWS K_WHERE expressions)
	) (K_ENABLE | K_DISABLE);

create_authentication_statement:
	K_CREATE K_AUTHENTICATION auth_method_name K_METHOD auth_method_name (
		 K_LOCAL
		| (
			K_HOST (K_NO? K_TLS)? 
				address
			)
		
	);

create_branch_statement:
	K_CREATE K_DATA K_IMMUTABLE K_BRANCH (branch_identifier) (
		COMMA branch_identifier
	)* (K_LIKE value)?;


create_external_table_as_copy_statement:
	K_CREATE K_EXTERNAL K_TABLE (K_IF K_NOT K_EXISTS)? tableReference OPEN_PAREN
		column_definition_list CLOSE_PAREN schema_privileges_clause? K_AS K_COPY (
		OPEN_PAREN copy_column (COMMA copy_column)* CLOSE_PAREN
	)? (
		K_COLUMN K_OPTION (
			OPEN_PAREN column_option (COMMA column_option)* CLOSE_PAREN
		)
	)? K_FROM (
		path
		|
		| (
			K_WITH? K_SOURCE source (
				OPEN_PAREN commaSeparatedKeyValuePairs CLOSE_PAREN
			)?
		)
	) inputFormat? (
		K_NATIVE
		| (
			K_FIXEDWIDTH K_COLSIZES OPEN_PAREN integerNumber CLOSE_PAREN (
				COMMA OPEN_PAREN integerNumber CLOSE_PAREN
			)*
		)
		| ( K_NATIVE K_VARCHAR)
		| K_ORC
		| K_PARQUET
	)? (K_ABORT K_ON K_ERROR)? (K_DELIMITER K_AS? singleChar) (
		K_ENCLOSED K_BY singleChar (K_AND singleChar)
	)? (K_ENFORCELENGTH)? (K_ERROR K_TOLERANCE)? (
		( K_ESCAPE K_AS singleChar)
		| ( K_NO K_ESCAPE)
	)? (K_EXCEPTIONS path ( K_ON node)? ( COMMA ( K_ON node))*)? (
		K_WITH? K_FILTER filter (
			OPEN_PAREN commaSeparatedKeyValuePairs? CLOSE_PAREN
		)
	)? (K_NULL K_AS? string)? (
		K_WITH? K_PARSER parserName (
			OPEN_PAREN commaSeparatedKeyValuePairs? CLOSE_PAREN
		)
	)? (K_RECORD K_TERMINATOR string)? (
		K_REJECTED K_DATA path (K_ON node)? (COMMA ( K_ON node))*
	)? (K_REJECTMAX integerNumber)? (K_SKIP integerNumber)? (
		K_SKIP K_BYTES integerNumber
	)? (K_TRAILING K_NULLCOLS)? (K_TRIM singleChar)?;

create_fault_group_statement:
	K_CREATE K_FAULT K_GROUP id;

create_flex_table_statement:
	K_CREATE (K_FLEX | K_FLEXIBLE) K_TABLE (K_IF K_NOT K_EXISTS)? tableReference (
		(OPEN_PAREN column_definition_list CLOSE_PAREN)
		| column_name_list
	) schema_privileges_clause? orderby_clause? encodedBy_clause? segmentation_clause? ksafe_clause?
		partition_clause? (K_AS select_statement)?;


create_flex_external_table_as_copy_statement:
	K_CREATE (K_FLEX | K_FLEXIBLE) K_EXTERNAL K_TABLE ifNotExistsClause? tableReference OPEN_PAREN
		column_definition_list CLOSE_PAREN schema_privileges_clause? K_AS K_COPY (
		OPEN_PAREN copy_column (COMMA copy_column)* CLOSE_PAREN
	)? (
		K_FROM path (compressionType ( COMMA compressionType)*)? K_WITH? (
			K_SOURCE source OPEN_PAREN commaSeparatedKeyValuePairs CLOSE_PAREN
		)? (
			K_FILTER filter OPEN_PAREN commaSeparatedKeyValuePairs CLOSE_PAREN
		)? (
			K_PARSER parserName commaSeparatedKeyValuePairs 
		)? (K_DELIMITER K_AS? singleChar)? (
			K_TRAILING K_NULLCOLS
		)? (K_NULL K_AS? string)? (
			( K_ESCAPE K_AS? singleChar)
			| ( K_NO K_ESCAPE)
		)? (K_ENCLOSED K_BY? singleChar)? (
			K_RECORD K_TERMINATOR string
		)? (K_SKIP integerNumber)? (K_SKIP K_BYTES integerNumber)? (
			K_TRIM singleChar
		)? (K_REJECTMAX integerNumber)? (
			K_EXCEPTIONS string (K_ON node) (
				COMMA (K_EXCEPTIONS string ( K_ON node))*
			)
		)? (
			K_REJECTED K_DATA string (K_ON node) (
				COMMA (K_REJECTED K_DATA string ( K_ON node))*
			)
		)? (K_ENFORCELENGTH)? (K_ABORT K_ON K_ERROR)?
	)?;

create_function_statements_statement:
	create_or_replace_aggregate_function_statement
	| create_or_replace_analytic_function_statement
	| create_or_replace_filter_statement
	| create_or_replace_sql_function_statement
	| create_or_replace_udf_function_statement
	| create_or_replace_parser_function_statement
	| create_or_replace_source_function_statement
	| create_or_replace_transform_function_statement;



create_or_replace_transform_function_statement:
	K_CREATE (K_OR K_REPLACE)? K_TRANSFORM K_FUNCTION function K_AS (
		K_LANGUAGE lang
	)? K_NAME id K_LIBRARY library (K_FENCED | K_NOT K_FENCED)?;

create_or_replace_source_function_statement:
	K_CREATE (K_OR K_REPLACE)? K_SOURCE functionReference K_AS K_LANGUAGE lang K_NAME id K_LIBRARY
		library (K_FENCED | K_NOT K_FENCED)?;

create_or_replace_parser_function_statement:
	K_CREATE (K_OR K_REPLACE)? K_PARSER functionReference K_AS (
		K_LANGUAGE lang
	)? K_NAME id K_LIBRARY library (K_FENCED | K_NOT K_FENCED)?;

create_or_replace_udf_function_statement:
	K_CREATE (K_OR K_REPLACE)? K_FUNCTION functionReference K_AS (
		K_LANGUAGE lang
	)? K_NAME id K_LIBRARY library (K_FENCED | K_NOT K_FENCED)?;

create_or_replace_sql_function_statement:
	K_CREATE (K_OR K_REPLACE)? K_FUNCTION functionReference argument_list K_RETURN dataTypes K_AS
		K_BEGIN K_RETURN expression K_END;

create_or_replace_filter_statement:
	K_CREATE (K_OR K_REPLACE)? K_FILTER functionReference K_AS (
		K_LANGUAGE lang
	)? K_NAME id K_LIBRARY library (K_NOT? K_FENCED)?;

create_or_replace_analytic_function_statement:
	K_CREATE (K_OR K_REPLACE)? K_ANALYTIC K_FUNCTION function K_AS (
		K_LANGUAGE lang
	)? K_NAME id K_LIBRARY library (K_FENCED | K_NOT K_FENCED)?;

create_or_replace_aggregate_function_statement:
	K_CREATE (K_OR K_REPLACE)? K_AGGREGATE K_FUNCTION functionReference K_AS (
		K_LANGUAGE lang
	)? K_NAME id K_LIBRARY library;

create_hcatalog_schema_statement:
	K_CREATE K_HCATALOG K_SCHEMA ifNotExistsClause? schema (
		K_AUTHORIZATION id
	)? (K_WITH ( hcatalog_schema_param)+)?;

hcatalog_schema_param:
	key = (
		K_HOSTNAME
		| K_PORT
		| K_HIVESERVER2_HOSTNAME
		| K_WEBSERVICE_HOSTNAME
		| K_WEBSERVICE_PORT
		| K_WEBHDFS_ADDRESS
		| K_HCATALOG_SCHEMA
		| K_CUSTOM_PARTITIONS
		| K_HCATALOG_USER
		| K_HCATALOG_CONNECTION_TIMEOUT
		| K_HCATALOG_SLOW_TRANSFER_LIMIT
		| K_HCATALOG_SLOW_TRANSFER_TIME
		| K_SSL_CONFIG
	) EQUAL value;

create_library_statement:
	K_CREATE (K_OR K_REPLACE)? K_LIBRARY libraryReference alias (
		K_DEPENDS id
	)? (K_LANGUAGE lang)?;

create_load_balance_group_statement:
	K_CREATE K_LOAD K_BALANCE K_GROUP lb_group K_WITH (
		( K_ADDRESS network_address ( COMMA network_address)*)
		| (
			K_FAULT K_GROUP faultGroup (COMMA faultGroup)* K_FILTER address
		)
	) (K_POLICY value)?;

create_local_temporary_view_statement:
	K_CREATE (K_OR K_REPLACE) K_LOCAL (K_TEMP | K_TEMPORARY) 
	K_VIEW viewReference columns? K_AS select_query;

create_location_statement:
	K_CREATE K_LOCATION string (( K_NODE node) | ( K_ALL K_NODES))? K_SHARED? (
		K_USAGE string
	)? (K_LABEL string)? (K_LIMIT string)?;

create_network_address_statement:
	K_CREATE K_NETWORK K_ADDRESS network_address K_ON node K_WITH address;

create_network_interface_statement:
	K_CREATE K_NETWORK K_INTERFACE network_interface K_ON node K_WITH address;

create_notifier_statement:
	K_CREATE K_NOTIFIER notifier K_ACTION value notifier_params*;

create_procedure_statement:
	K_CREATE K_PROCEDURE procedureReference argument_list K_AS executable = value K_LANGUAGE lang
		K_USER user;

argument_list:
	OPEN_PAREN argument_item? (COMMA argument_item)* CLOSE_PAREN;

argument_item: id? dataTypes;

create_profile_statement:
	K_CREATE K_PROFILE profile K_LIMIT password_parameter+;

projection_clause_item:
	(columnReference | grouped_clause) encoding_clause? access_rank?;

ksafe_clause: K_KSAFE integerNumber?;

ifNotExistsClause: K_IF K_NOT? K_EXISTS;

create_projection_statement:
	K_CREATE K_PROJECTION ifNotExistsClause? projectionReference (
		OPEN_PAREN projection_clause_item (
			COMMA projection_clause_item
		)* CLOSE_PAREN
	)? K_AS simple_select_query_clause alias? orderby_clause? segmentation_clause? ksafe_clause?;

create_projection_live_aggregate_projections_statement:
	create_projection_live_aggregate_projections_gr_statement
	| create_projection_live_aggregate_projections_topk_statement;

create_projection_live_aggregate_projections_gr_statement:
	K_CREATE K_PROJECTION ifNotExistsClause? projectionReference (
		OPEN_PAREN projection_clause_item (
			COMMA projection_clause_item
		)* CLOSE_PAREN
	)? K_AS simple_select_query_clause alias? groupBy_clause ksafe_clause?;

create_projection_live_aggregate_projections_topk_statement:
	K_CREATE K_PROJECTION ifNotExistsClause? projectionReference (
		OPEN_PAREN projection_clause_item (
			COMMA projection_clause_item
		)* CLOSE_PAREN
	)? K_AS simple_select_query_clause alias? limit_clause over_clause ksafe_clause?;

create_projection_udtfs_statement:
	K_CREATE K_PROJECTION ifNotExistsClause? projectionReference (
		OPEN_PAREN projection_clause_item (
			COMMA projection_clause_item
		)* CLOSE_PAREN
	)? K_AS (
		(
			batch_query K_FROM (
				prepass_query
				| ( tableReference alias?)
			)
		)
		| prepass_query
	);

columns:
	(OPEN_PAREN columnReference? ( COMMA columnReference)* CLOSE_PAREN)
	| ( columnReference ( COMMA columnReference)*);

batch_query:
	K_SELECT elements COMMA functionCall K_OVER OPEN_PAREN K_PARTITION K_BATCH K_BY elements
		CLOSE_PAREN (K_AS columns)?;

prepass_query:
	K_SELECT elements COMMA functionCall K_OVER OPEN_PAREN K_PARTITION K_BATCH K_BY elements
		CLOSE_PAREN (K_AS columns)? K_FROM tableReference;

create_resource_pool_statement:
	K_CREATE K_RESOURCE K_POOL resourcePool resource_pool_param+;

create_role_statement: K_CREATE K_ROLE role;

create_routing_rule_statement:
	K_CREATE K_ROUTING K_RULE routingRule K_ROUTE address K_TO value;

create_schema_statement:
	K_CREATE K_SCHEMA ifNotExistsClause? schemaReference (
		K_AUTHORIZATION string
	)? (K_DEFAULT schema_privileges_clause)?;

create_sequence_statement:
	K_CREATE K_SEQUENCE (
		ifNotExistsClause? sequenceReference (
			K_INCREMENT K_BY DECIMAL
		)? (( K_MINVALUE DECIMAL) | ( K_NO K_MINVALUE))? (
			( K_MAXVALUE DECIMAL)
			| ( K_NO K_MAXVALUE)
		)? (K_RESTART K_WITH DECIMAL)? (
			( K_CACHE DECIMAL)
			| ( K_NO K_CACHE) ( K_CYCLE | K_NO K_CYCLE)
		)?
	);

create_subnet_statement:
	K_CREATE K_SUBNET subnet K_WITH string;

create_table_statement:
	create_table_default_statement
	| create_table_as_statement
	| create_table_like_statement;

schema_privileges_clause:
	(K_INCLUDE | K_EXCLUDE | K_MATERIALIZE | K_ALL) K_SCHEMA? K_NOT? K_PRIVILEGES;

create_table_as_statement:
	K_CREATE K_TABLE ifNotExistsClause? tableReference column_name_list? schema_privileges_clause
		? K_AS hints? at_epoch_clause? select_query encodedBy_clause?;

column_name_list:
	OPEN_PAREN column_name_list_item (
		COMMA column_name_list_item
	)* CLOSE_PAREN;

column_name_list_item:
	column encoding_clause? access_rank? grouped_clause?;

access_rank: K_ACCESSRANK number;

grouped_clause:
	K_GROUPED columns;

create_table_like_statement:
	K_CREATE K_TABLE ifNotExistsClause? tableReference K_LIKE tableReference
		schema_privileges_clause? load_method? schema_privileges_clause??;

create_table_default_statement:
	K_CREATE K_TABLE ifNotExistsClause? tableReference OPEN_PAREN column_definition_list (
		COMMA table_constraint (COMMA table_constraint)*
	)? CLOSE_PAREN load_method? orderby_clause? segmentation_clause? ksafe_clause? partition_clause?
		schema_privileges_clause?;

table_constraint:
	K_CONSTRAINT constraint (
		(
			K_PRIMARY K_KEY columns enableOrDisable?
		)
		| (
			(
				K_FOREIGN K_KEY columns K_REFERENCES
					tableReference (
					columns
				)?
			)
		)
		| (
			K_UNIQUE columns  enableOrDisable?
		)
		| (
			K_CHECK OPEN_PAREN expression CLOSE_PAREN enableOrDisable?
		)
	);

column_definition_list:
	column_definition (COMMA column_definition)*;

column_definition:
	column dataTypes  column_constraint* encoding_clause? access_rank?;

column_constraint:
	(
		(K_AUTO_INCREMENT | K_IDENTITY) (
			OPEN_PAREN value (COMMA value)* CLOSE_PAREN
		)?
	)
	| ( K_CONSTRAINT id)
	| (
		K_CHECK OPEN_PAREN expression CLOSE_PAREN enableOrDisable?
	)
	| (
		( K_DEFAULT K_USING expression)
		| ( K_SET K_USING expression)
		| ( K_DEFAULT K_USING expression)
	)
	| ( nullOrNotNull)
	| (
		( K_PRIMARY K_KEY enableOrDisable?)
		| (
			K_REFERENCES tableReference columns
		)
	)
	| ( K_UNIQUE enableOrDisable?)
	| ( K_DEFAULT expression)
	
	;

load_method: K_AUTO | K_DIRECT | K_TRICKLE;

segmentation_clause:
	(K_UNSEGMENTED ( (K_NODE node) | (K_ALL K_NODES)))
	| (K_SEGMENTED K_BY expression (
		( K_ALL K_NODES offset_clause?)
		| ( K_NODES node ( COMMA node)*))
	);

create_temporary_table_statement:
	create_temporary_table_with_def_statement
	| create_temporary_table_from_table_statement;

create_temporary_table_with_def_statement:
	K_CREATE (K_GLOBAL | K_LOCAL)? (K_TEMP | K_TEMPORARY) K_TABLE ifNotExistsClause? 
	tableReference OPEN_PAREN column_definition_list CLOSE_PAREN table_constraint? (
		K_ON K_COMMIT (K_DELETE | K_PRESERVE) K_ROWS
	)? load_method? (K_NO K_PROJECTION)? orderby_clause? segmentation_clause? ksafe_clause?
		schema_privileges_clause?;

create_temporary_table_from_table_statement:
	K_CREATE (K_TEMP | K_TEMPORARY) K_TABLE ifNotExistsClause? tableReference column_name_list?
		(
		K_ON K_COMMIT (K_DELETE | K_PRESERVE) K_ROWS
	)? load_method? K_AS hints? at_epoch_clause? select_query encodedBy_clause?;

encodedBy_clause: K_ENCODED K_BY column_ref ( COMMA column_ref)*;

column_ref: ( columnReference access_rank? encoding_clause?);

create_text_index_statement:
	K_CREATE K_TEXT K_INDEX txtIndexReference
	 K_ON tableReference OPEN_PAREN id COMMA dataTypes (COMMA columns)? CLOSE_PAREN (
		K_STEMMER (
			id (OPEN_PAREN dataTypes CLOSE_PAREN)
			| K_NONE
		)
	)? (
		K_TOKENIZER id (OPEN_PAREN dataTypes CLOSE_PAREN)
	)?;

create_user_statement: K_CREATE K_USER user user_params*;

create_view_statement:
	K_CREATE (K_OR K_REPLACE)? K_VIEW viewReference columns
	 schema_privileges_clause? K_AS select_statement;

delete_statement:
	K_DELETE hints? K_FROM tableReference where_clause?;

directed_query_statements_statement:
	activate_directed_query_statement
	| activate_directed_query_statement
	| deactivate_directed_query_statement
	| drop_directed_query_statement
	| get_directed_query_statement
	| save_query;

activate_directed_query_statement:
	K_ACTIVATE K_DIRECTED K_QUERY id;

create_directed_query_statement:
	K_CREATE K_DIRECTED K_QUERY (K_OPT | K_OPTIMIZER | K_CUSTOM) id (
		K_COMMENT string
	)? statement;

deactivate_directed_query_statement:
	K_DEACTIVATE K_DIRECTED K_QUERY (id | statement);

drop_directed_query_statement:
	K_DROP K_DIRECTED K_QUERY id;

get_directed_query_statement:
	K_GET K_DIRECTED K_QUERY statement;

save_query: K_SAVE K_QUERY statement;

disconnect_statement: K_DISCONNECT dbname;

drop_access_policy_statement:
	K_DROP K_ACCESS K_POLICY K_ON tableReference K_FOR (
		K_COLUMN column
		| K_ROWS
	);

drop_aggregate_function_statement:
	K_DROP K_AGGREGATE K_FUNCTION ifNotExistsClause? functionReference argument_list;

drop_authentication_statement:
	K_DROP K_AUTHENTICATION ifNotExistsClause? auth_method_name K_CASCADE?;

drop_branch_statement:
	K_DROP K_BRANCH ifNotExistsClause? (branch_identifier) (
		COMMA branch_identifier
	)* K_CASCADE?;

drop_fault_group_statement:
	K_DROP K_FAULT K_GROUP ifNotExistsClause? faultGroup;

drop_function_statement:
	K_DROP K_FUNCTION ifNotExistsClause? functionReference argument_list;

drop_source_statement:
	K_DROP K_SOURCE sourceReference OPEN_PAREN CLOSE_PAREN;

drop_filter_statement:
	K_DROP K_FILTER filterReference OPEN_PAREN CLOSE_PAREN;

drop_parser_statement:
	K_DROP K_PARSER parserReference OPEN_PAREN CLOSE_PAREN;

drop_model_statement:
	K_DROP K_MODEL ifNotExistsClause? modelReference (COMMA modelReference)*
	;

drop_library_statement:
	K_DROP K_LIBRARY ifNotExistsClause?  libraryReference K_CASCADE?;

drop_load_balance_group_statement:
	K_DROP K_LOAD K_BALANCE K_GROUP lb_group K_CASCADE?;

drop_network_address_statement:
	K_DROP K_LOAD K_NETWORK K_ADDRESS network_address K_CASCADE?;

drop_network_interface_statement:
	K_DROP K_NETWORK K_INTERFACE ifNotExistsClause? network_interface K_CASCADE?;

drop_notifier_statement:
	K_DROP  K_NOTIFIER ifNotExistsClause? notifier;

drop_procedure_statement:
	K_DROP K_PROCEDURE ifNotExistsClause? procedureReference argument_list;

drop_profile_statement:
	K_DROP K_PROFILE ifNotExistsClause? profile (COMMA profile)* (K_CASCADE)?;

drop_projection_statement:
	K_DROP K_PROJECTION ifNotExistsClause? projectionReference (COMMA projectionReference)* (
		K_CASCADE
		| K_RESTRICT
	)?;

drop_resource_pool_statement:
	K_DROP K_RESOURCE K_POOL resourcePool;

drop_role_statement:
	K_DROP K_ROLE ifNotExistsClause? role (COMMA role)* K_CASCADE?;

drop_routing_rule_statement: K_DROP K_ROUTING K_RULE routingRule;

drop_schema_statement:
	K_DROP K_SCHEMA ifNotExistsClause? schemaReference (COMMA schemaReference)* K_CASCADE?;

drop_sequence_statement:
	K_DROP K_SEQUENCE ifNotExistsClause? sequenceReference (COMMA sequenceReference)* (
		K_CASCADE
		| K_RESTRICT
	)?;

drop_subnet_statement:
	K_DROP K_SUBNET ifNotExistsClause? subnet K_CASCADE?;

drop_table_statement:
	K_DROP K_TABLE ifNotExistsClause? tableReference (COMMA tableReference)* K_CASCADE?;

drop_text_index_statement:
	K_DROP K_TEXT K_INDEX ifNotExistsClause? txtIndexReference;

drop_transform_function_statement:
	K_DROP K_TRANSFORM K_FUNCTION ifNotExistsClause? functionReference argument_list;

drop_user_statement:
	K_DROP K_USER ifNotExistsClause? user (COMMA user)* K_CASCADE?;

drop_view_statement:
	K_DROP K_VIEW ifNotExistsClause? viewReference (COMMA viewReference);

end_statement: K_END ( K_WORK | K_TRANSACTION)?;

explain_statement:
	K_EXPLAIN hints? (K_LOCAL | K_VERBOSE | K_JSON | K_ANNOTATED)? 
		statement
	;

export_to_parquet_statement:
	K_EXPORT K_TO K_PARQUET OPEN_PAREN K_DIRECTORY EQUAL path (
		COMMA K_COMPRESSION EQUAL string
	)? (COMMA K_ROWGROUPSIZEMB EQUAL string)? (
		COMMA K_FILESIZEMB EQUAL string
	)? (COMMA K_FILEMODE EQUAL string)? (
		COMMA K_DIRMODE EQUAL string
	)? CLOSE_PAREN over_clause? K_AS select_statement;

export_to_vertica_statement:
	K_EXPORT K_TO K_VERTICA tableReference columns? (
		( K_AS select_statement)
		| (
			K_FROM tableReference columns?
		)
	);
//todo

grant_statements_statement:
	grant_authentication_to_statement
	| grant_privileges_on_database_statement
	| grant_on_library_statement
	| grant_on_model_statement
	| grant_on_procedure_statement
	| grant_on_resourcepool_statement
	| grant_on_role_statement
	| grant_on_schema_statement
	| grant_on_sequence_statement
	| grant_on_location_statement
	| grant_on_table_statement
	| grant_on_ude_statement
	| grant_on_view_statement;

grant_on_view_statement:
	K_GRANT (K_SELECT | schema_privileges_clause) K_ON tableReference (
		COMMA tableReference
	)* K_TO grantees withGrantOption?;

grant_on_ude_statement:
	K_GRANT (K_EXECUTE | ( K_ALL K_PRIVILEGES?)) (
		(
			K_ON (
				K_FUNCTION
				| ( K_AGGREGATE K_FUNCTION)
				| ( K_ANALYTIC K_FUNCTION)
				| ( K_TRANSFORM K_FUNCTION)
				| K_FILTER
				| K_PARSER
				| K_SOURCE
			) functionReference argument_list (
				COMMA functionReference argument_list
			)*
		)
		| (
			K_ALL K_FUNCTIONS K_IN K_SCHEMA schemaReference (
				COMMA schemaReference
			)*
		)
	) K_TO grantees withGrantOption?;

grant_on_table_statement:
	K_GRANT (
		(schema_privilege ( COMMA schema_privilege)*)
		| ( K_ALL K_PRIVILEGES?)
	) K_ON (
		(K_TABLE tableReference ( COMMA tableReference)*)
		| (
			K_ALL K_TABLES K_IN K_SCHEMA schemaReference (
				COMMA schemaReference
			)*
		)
	) K_TO grantees withGrantOption?;

grant_on_location_statement:
	K_GRANT (
		(( K_READ | K_WRITE) ( COMMA ( K_READ | K_WRITE))*)
		| ( K_ALL K_PRIVILEGES?)
	) K_ON K_LOCATION path K_TO grantees withGrantOption?;

grant_on_sequence_statement:
	K_GRANT (K_SELECT | ( K_ALL K_PRIVILEGES?)) K_ON (
		(K_SEQUENCE sequenceReference ( COMMA sequenceReference)*)
		| (
			K_ALL K_SEQUENCES K_IN K_SCHEMA schemaReference (
				COMMA schemaReference
			)*
		)
	) K_TO grantees withGrantOption?;

grant_on_schema_statement:
	K_GRANT (
		(schema_privilege ( COMMA schema_privilege)*)
		| ( K_ALL K_PRIVILEGES?)
	) K_ON K_SCHEMA schemaReference (COMMA schemaReference)* K_TO grantees withGrantOption?;

schema_privilege:
	K_USAGE
	| K_CREATE
	| K_SELECT
	| K_INSERT
	| K_DELETE
	| K_REFERENCES
	| K_TRUNCATE;

grant_on_role_statement:
	K_GRANT role (COMMA role)* K_TO grantees withGrantOption?;

grant_on_resourcepool_statement:
	K_GRANT (K_USAGE | ( K_ALL K_PRIVILEGES?)) K_ON K_RESOURCE K_POOL resourcePool (
		COMMA resourcePool
	)* K_TO grantees withGrantOption?;

grant_on_procedure_statement:
	K_GRANT (K_EXECUTE | ( K_ALL K_PRIVILEGES?)) K_ON K_PROCEDURE procedureReference argument_list (
		COMMA procedureReference argument_list
	)* K_TO grantees withGrantOption?;

grant_on_model_statement:
	K_GRANT (K_USAGE | ( K_ALL K_PRIVILEGES?)) K_ON K_MODEL modelReference (
		COMMA modelReference
	)* K_TO grantees withGrantOption?;

grant_on_library_statement:
	K_GRANT (K_USAGE | ( K_ALL K_PRIVILEGES?)) K_ON K_LIBRARY libraryReference (
		COMMA libraryReference
	)* K_TO grantees withGrantOption?;

grant_privileges_on_database_statement:
	K_GRANT (K_CREATE | K_TEMP | ( K_ALL K_PRIVILEGES?)) K_ON K_DATABASE dbname K_TO grantees
		withGrantOption?;

grant_authentication_to_statement:
	K_GRANT K_AUTHENTICATION method K_TO grantees;

withGrantOption: ( K_WITH K_GRANT K_OPTION);

grantees: grantee ( COMMA grantee)*;

grantee: user | K_PUBLIC;

grant_authentication_statement:
	K_GRANT K_AUTHENTICATION auth_method_name K_TO grantees;

insert_statement:
	K_INSERT hints? K_INTO tableReference columns? (
		( K_DEFAULT K_VALUES)
		| ( K_VALUES OPEN_PAREN values CLOSE_PAREN)
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
			column EQUAL value
		) (column EQUAL value)* (where_clause)?
	)
	| (
		K_WHEN K_NOT K_MATCHED (K_AND predicates)? K_THEN K_INSERT columns 
		 K_VALUES OPEN_PAREN values CLOSE_PAREN
	);

profile_statement: K_PROFILE statement;

release_savepoint_statement:
	K_RELEASE (K_SAVEPOINT)? id;

revoke_statements_statement:
	revoke_authentication_statement
	| revoke_on_database_statement
	| revoke_on_library_statement
	| revoke_on_model_statement
	| revoke_on_prodecure_statement
	| revoke_on_resource_pool_statement
	| revoke_on_role_statement
	| revoke_on_schema_statement
	| revoke_on_sequence_statement
	| revoke_on_location_statement
	| revoke_on_table_statement
	| revoke_on_function_statement
	| revoke_on_view_statement;

revoke_on_view_statement:
	K_REVOKE (K_GRANT K_OPTION K_FOR)? (
		K_SELECT
		| ( K_ALL K_PRIVILEGES?)
	) K_ON tableReference (COMMA tableReference)* K_FROM grantees K_CASCADE?;

revoke_on_function_statement:
	K_REVOKE (K_GRANT K_OPTION K_FOR)? (
		K_EXECUTE
		| ( K_ALL K_PRIVILEGES?)
	) (
		(
			K_ON (
				K_FUNCTION
				| ( K_AGGREGATE K_FUNCTION)
				| ( K_ANALYTIC K_FUNCTION)
				| ( K_TRANSFORM K_FUNCTION)
				| K_FILTER
				| K_PARSER
				| K_SOURCE
			) functionReference argument_list (
				COMMA functionReference argument_list
			)*
		)
		| (
			K_ALL K_FUNCTIONS K_IN K_SCHEMA schemaReference (
				COMMA schemaReference
			)*
		)
	) K_FROM grantees K_CASCADE?;

revoke_on_table_statement:
	K_REVOKE (K_GRANT K_OPTION K_FOR)? (
		(
			(
				K_SELECT
				| K_INSERT
				| K_UPDATE
				| K_DELETE
				| K_REFERENCES
				| K_TRUNCATE
			) (
				COMMA (
					K_SELECT
					| K_INSERT
					| K_UPDATE
					| K_DELETE
					| K_REFERENCES
					| K_TRUNCATE
				)
			)*
		)
		| ( K_ALL K_PRIVILEGES?)
	) K_ON (
		(K_TABLE? tableReference ( COMMA tableReference)*)
		| (
			K_ALL K_TABLES K_IN K_SCHEMA schemaReference (
				COMMA schemaReference
			)*
		)
	) K_FROM grantees K_CASCADE?;

revoke_on_location_statement:
	K_REVOKE (K_GRANT K_OPTION K_FOR)? (
		(( K_READ | K_WRITE) ( COMMA ( K_READ | K_WRITE))*)
		| ( K_ALL K_PRIVILEGES?)
	) K_ON K_LOCATION path K_FROM grantees K_CASCADE?;

revoke_on_sequence_statement:
	K_REVOKE (K_GRANT K_OPTION K_FOR)? (
		K_SELECT
		| ( K_ALL K_PRIVILEGES?)
	) K_ON (
		(K_SEQUENCE sequenceReference ( COMMA sequenceReference)*)
		| (
			K_ALL K_SEQUENCES K_IN K_SCHEMA schemaReference (
				COMMA schemaReference
			)*
		)
	) K_FROM grantees K_CASCADE?;

revoke_on_schema_statement:
	K_REVOKE (K_GRANT K_OPTION K_FOR)? (
		(schema_privilege ( COMMA schema_privilege)*)
		| ( K_ALL K_PRIVILEGES?)
	) K_ON K_SCHEMA schemaReference (COMMA schemaReference)* K_FROM grantees K_CASCADE?;

revoke_on_role_statement:
	K_REVOKE (K_ADMIN K_OPTION K_FOR)? role (COMMA role)* K_FROM grantees K_CASCADE?;

revoke_on_resource_pool_statement:
	K_REVOKE (K_GRANT K_OPTION K_FOR)? (
		K_USAGE
		| ( K_ALL K_PRIVILEGES?)
	) K_ON K_RESOURCE K_POOL resourcePool (COMMA resourcePool)* K_FROM grantees K_CASCADE?;

revoke_on_prodecure_statement:
	K_REVOKE (K_GRANT K_OPTION K_FOR)? (
		K_EXECUTE
		| ( K_ALL K_PRIVILEGES?)
	) K_ON K_PROCEDURE procedureReference argument_list (
		COMMA ( procedureReference argument_list)
	)* K_FROM grantees K_CASCADE?;

revoke_on_model_statement:
	K_REVOKE (K_GRANT K_OPTION K_FOR)? (
		K_USAGE
		| ( K_ALL K_PRIVILEGES?)
	) K_ON K_MODEL modelReference (COMMA modelReference)* K_FROM grantees K_CASCADE?;

revoke_on_library_statement:
	K_REVOKE (K_GRANT K_OPTION K_FOR)? (
		K_USAGE
		| ( K_ALL K_PRIVILEGES?)
	) K_ON K_LIBRARY libraryReference (COMMA libraryReference)* K_FROM grantees K_CASCADE?;

revoke_on_database_statement:
	K_REVOKE (K_GRANT K_OPTION K_FOR)? (
		(( K_CREATE | K_TEMP) ( COMMA ( K_CREATE | K_TEMP))*)
		| ( K_ALL K_PRIVILEGES?)
	) K_ON K_DATABASE dbname K_FROM grantees K_CASCADE?;

revoke_authentication_statement:
	K_REVOKE K_AUTHENTICATION auth_method_name K_FROM grantees;

rollback_statement: K_ROLLBACK ( K_WORK | K_TRANSACTION)?;

rollback_to_savepoint_statement:
	K_ROLLBACK K_TO (K_SAVEPOINT)? id;

savepoint_statement: K_SAVEPOINT id;

at_epoch_clause:
	(( K_AT K_EPOCH ( K_LATEST | DECIMAL)) | ( K_AT K_TIME string));

select_statement:
	at_epoch_clause? select_query (
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

set_locale_statement: K_SET K_LOCALE K_TO value;

set_role_statement:
	K_SET K_ROLE (
		(role (COMMA role)*)
		| K_NONE
		| K_ALL
		| ( K_ALL K_EXCEPT (role (COMMA role)*))
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
		value
		| K_NONE
		| ( EQUAL K_DEFAULT)
	);

set_session_idlesessiontimeout_statement:
	K_SET K_SESSION K_IDLESESSIONTIMEOUT (
		value
		| K_NONE
		| ( EQUAL K_DEFAULT)
	);

set_session_memorycap_statement:
	K_SET K_SESSION K_MEMORYCAP (
		value
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
		value
		| ( K_DEFAULT)
	);

set_session_runtimecap_statement:
	K_SET K_SESSION K_RUNTIMECAP (
		value
		| K_NONE
		| ( EQUAL K_DEFAULT)
	);

set_session_tempspacecap_statement:
	K_SET K_SESSION K_TEMPSPACECAP (value | K_NONE);

set_standard_conforming_strings_statement:
	K_SET K_STANDARD_CONFORMING_STRINGS K_TO (K_ON | K_OFF);

set_time_zone_statement:
	K_SET (( K_TIME K_ZONE) | K_TIMEZONE) K_TO K_INTERVAL? value;

//todo update parameters

show_statement: K_SHOW ( K_ALL | param);

show_current_statement: K_SHOW K_CURRENT ( K_ALL | params);

show_database_statement:
	K_SHOW K_DATABASE dbname (K_ALL | params);

show_node_statement:
	K_SHOW K_NODE node (K_ALL | params);

show_session_statement:
	K_SHOW K_SESSION (K_ALL | ( K_UDPARAMETERS K_ALL) | params);

start_transaction_statement:
	K_START K_TRANSACTION K_ISOLATION K_LEVEL isolationLevel transactionMode;

truncate_table_statement: K_TRUNCATE K_TABLE tableReference;

update_statement:
	K_UPDATE hints? tableReference alias? K_SET expressions from_clause? where_clause?;

simple_select_query_clause: select_clause from_clause;

select_query:
	select_clause into_clause? from_clause? where_clause? timeseries_clause? groupBy_clause?
		having_clause? match_clause? (
		K_UNION ( K_ALL | K_DISTINCT)?
	)? except_clause? intersect_clause? orderby_clause? limit_clause?offset_clause? (
		K_FOR K_UPDATE (
			K_OF tableReference (COMMA tableReference)*
		)?
	)?;
offset_clause: 
K_OFFSET integerNumber
;
limit_clause: K_LIMIT ( integerNumber | K_ALL);

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
	K_TIMESERIES columnReference alias over_clause K_ORDER K_BY columns;

over_clause:
	K_OVER OPEN_PAREN (
		K_PARTITION K_BY columns)? orderby_clause? CLOSE_PAREN;

groupBy_clause: K_GROUP K_BY hints? expressions;

having_clause: K_HAVING expressions;

where_clause: K_WHERE predicates;

orderby_clause: K_ORDER K_BY orderbyItem ( COMMA orderbyItem)*;

match_clause:
	K_MATCH OPEN_PAREN (
		K_PARTITION K_BY columnReference (COMMA columnReference)*
	)? K_ORDER K_BY columnReference (COMMA columnReference)* K_DEFINE (
		id K_AS ( expression | predicates)
	) (COMMA ( id K_AS ( expression | predicates)))* K_PATTERN id K_AS OPEN_PAREN
		id CLOSE_PAREN (
		(K_ROWS K_MATCH) (( K_ALL K_EVENTS) | ( K_FIRST K_EVENT))
	)? CLOSE_PAREN;

partition_clause:
	K_PARTITION K_BY expression groupBy_clause? (
		K_ACTIVEPARTITIONCOUNT number
	)?;

encoding_clause:
	K_ENCODING (
		K_AUTO
		| K_BLOCK_DICT
		| K_BLOCKDICT_COMP
		| K_BZIP_COMP
		| K_COMMONDELTA_COMP
		| K_DELTARANGE_COMP
		| K_DELTAVAL
		| K_GCDDELTA
		| K_GZIP_COMP
		| K_RLE
	);

owner_clause:
K_OWNER K_TO owner
	;
rename_clause:
K_RENAME K_TO values
;
set_schema_clause:
K_SET K_SCHEMA schema
;
orderbyItem: expression ( K_ASC | K_DESC)?;

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

element: ( expression alias?) | asteriskExp;

expressions: (expression) ( COMMA (expression))*;
castExpr: DCOLON dataTypes ;
expression:
	(
		OPEN_PAREN 
			(expression (operator expression)* )
		 CLOSE_PAREN  castExpr?
	)
	| (
		(
			
			 functionCall
			| columnReference
			| caseExp
			| select_query
			| value
		
		) (operator expression)* castExpr?
	);

predicate:
	betweenPredicate
	| booleanPredicate
	| columnValuePredicate
	| inPredicate
	| interpolatePredicate
	| likePredicate
	| nullPredicate;

nullPredicate:
	expression K_IS nullOrNotNull;

likePredicate:
	expression K_NOT? (
		K_LIKE
		| K_ILIKE
		| K_LIKEB
		| K_ILIKEB
	) expression (K_ESCAPE value)?;

joinPredicate:
	K_ON columnReference comparisonOperator expression (
		(K_AND | K_OR | K_NOT) columnReference comparisonOperator expression
	)*;

interpolatePredicate:
	columnReference K_PREVIOUS K_VALUE columnReference;

columnValuePredicate:
	expression operator expression;

inPredicate:
	columns K_IN K_NOT? OPEN_PAREN expressions CLOSE_PAREN;

constantExp: number | string ( K_IS nullOrNotNull);

betweenPredicate:
	expression K_BETWEEN? expression K_AND expression;

booleanPredicate:
	expression K_IS K_NOT? (bool_expression | K_UNKNOWN);

caseExp:
	K_CASE K_WHEN expression K_THEN expression (
		K_WHEN expression K_THEN expression
	)* (K_ELSE expression)? K_END;

alias: ( K_AS? id);

functionCall:
	function OPEN_PAREN (( K_ALL | K_DISTINCT)? elements)? CLOSE_PAREN;

commaSeparatedKeyValuePairs: (keyValuePair ( COMMA keyValuePair)*) 
| (

	OPEN_PAREN keyValuePair? ( COMMA keyValuePair)* CLOSE_PAREN
)
;
// todo
values:

(value (
		COMMA value
	)*) | (

		OPEN_PAREN (value? (
		COMMA value
	)*) CLOSE_PAREN
	)
;
keyValuePair: param operator value;

hints: OPEN_HINT hint ( COMMA hint)* CLOSE_HINT;

hint:
	(K_ALLNODES)
	 | ( K_GBYTYPE ( K_HASH | K_PIPE))
	| ( K_ENABLE_WITH_CLAUSE_MATERIALIZATION)
	| K_EARLY_MATERIALIZATION
	| K_DIRECT
	| (K_LABEL OPEN_PAREN value CLOSE_PAREN) K_SYN_JOIN
	| K_SYNTACTIC_JOIN
	| (
		K_DISTRIB OPEN_PAREN (value) (COMMA ( value))* CLOSE_PAREN
	)
	| ( K_JTYPE OPEN_PAREN ( value) CLOSE_PAREN)
	| ( K_UTYPE OPEN_PAREN ( value) CLOSE_PAREN)
	| (
		K_PROJS OPEN_PAREN (
			projectionReference (COMMA projectionReference)*
		) CLOSE_PAREN
	)
	| (
		K_SKIP_PROJS OPEN_PAREN (
			projectionReference (COMMA projectionReference)*
		) CLOSE_PAREN
	)
	| ( K_IGNORECONST OPEN_PAREN integerNumber CLOSE_PAREN)
	| K_VERBATIM;

columnReference:
	(( ( ( dbname DOT)? ( schema DOT))? ( table DOT)))? column;

tableReference: ( ( dbname DOT)? ( schema DOT))? table;
viewReference: ( ( dbname DOT)? ( schema DOT))? view;

sourceReference: ( ( dbname DOT)? ( schema DOT))? source;
filterReference: ( ( dbname DOT)? ( schema DOT))? filter;
parserReference: ( ( dbname DOT)? ( schema DOT))? parserName;

projectionReference:
	(( ( dbname DOT)? ( schema DOT))? table DOT)? projection;

procedureReference:
	(( ( dbname DOT)? ( schema DOT))? table DOT)? procedure;

procedure: id;

functionReference: ( ( dbname DOT)? ( schema DOT))? function;


libraryReference: ( ( dbname DOT)? ( schema DOT))? library;

sequenceReference: ( ( dbname DOT)? ( schema DOT))? sequence;

modelReference: ( ( dbname DOT)? ( schema DOT))? model;

txtIndexReference: ( ( dbname DOT)? ( schema DOT))? txtIndex;

schemaReference: ( dbname DOT)? schema;

dbname: id;

txtIndex: id;
host: id;
port: DECIMAL;
source: id;
notifier: id;
model: id;
filter: id;
parserName: id;
view: id;
lb_group: id;
network_address: id;
routingRule: id;
branch_identifier: id number?;

role: id;

lang: string;

resourcePool: id;

schema: id;

table: id;
params: param ( COMMA param)*;
projection: id;
library: id;
function: (id)+ | K_HASH; 
param: id;

node: id;
sequence: id;
column: id;
string: DOUBLE_QUOTE_STRING | SINGLE_QUOTE_STRING;
singleChar: SINGLE_QUOTE_STRING;
number: DECIMAL | FLOAT | REAL;
integerNumber: DECIMAL;
asteriskExp: STAR;
subnet: id;
user: id;
owner: id;
method: id;
faultGroup: id;
auth_method_name: id;
constraint: id;
network_interface: id;
profile: id;
id:
	WORD
	| DOUBLE_QUOTE_STRING
	| SINGLE_QUOTE_STRING
	| K_DEFAULT;

value:
	WORD
	| DOUBLE_QUOTE_STRING
	| SINGLE_QUOTE_STRING
	| DECIMAL
	| FLOAT
	| REAL
	| ANY
	;

enableOrDisable: ( K_ENABLE | K_DISABLE);

nullOrNotNull: K_NOT? K_NULL;



address: IPV4_ADDR | IPV6_ADDR;

compressionType: K_BZIP | K_GZIP | K_LZO | K_UNCOMPRESSED;

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
	) value;

operator: comparisonOperator;

comparisonOperator:
	EQUAL
	| EQUAL_GT
	| GT
	| LT
	| PLUS
	| MINUS
	| LTE
	| GTE
	| LT_GT
	| BANG_EQUAL
	| EQUAL2
	| DIV
	|STAR
	;

isolationLevel:
	(K_READ K_COMMITTED)
	| ( K_SERIALIZABLE)
	| ( K_REPEATABLE K_READ)
	| ( K_READ K_UNCOMMITTED);

transactionMode: K_READ ( K_ONLY | K_WRITE)?;
bool_expression: K_TRUE | K_FALSE;


dataTypes:
	(binaryTypes
	| booleanTypes
	| charTypes
	| dateTypes
	| apNumericTypes
	| eNumericTypes
	| spatialTypes
	| uuidTypes ) (OPEN_PAREN value CLOSE_PAREN)?;

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

