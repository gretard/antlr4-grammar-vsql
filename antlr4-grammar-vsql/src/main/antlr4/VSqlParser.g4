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
		( K_FOR K_COLUMN column predicates)
		| ( K_FOR K_ROWS where_clause?)
	) (enableOrDisable | ( K_COPY K_TO K_TABLE table));

alter_authentication_statement:
	K_ALTER K_AUTHENTICATION auth_method_name = identifier (
		enableOrDisable
		| (K_LOCAL | ( K_HOST ( K_TLS | K_NO K_TLS)? ( address)))
		| ( K_RENAME K_TO value)
		| ( K_METHOD method)
		| ( K_SET commaSeparatedKeyValuePairs)
		| ( K_PRIORITY priority = value)
	);

alter_database_drop_statement:
	K_ALTER K_DATABASE dbname (
		( K_DROP K_ALL K_FAULT K_GROUP)
		| ( K_EXPORT K_ON subnet = identifier)
		| ( K_RESET K_STANDBY)
		| ( K_SET ( K_PARAMETER)? commaSeparatedKeyValuePairs)
		| ( K_CLEAR ( K_PARAMETER)? params)
	);

alter_fault_group_statement:
	K_ALTER K_FAULT K_GROUP faultGroup (
		( K_ADD K_NODE node)
		| ( K_DROP K_NODE node)
		| ( K_ADD K_FAULT K_GROUP value)
		| ( K_DROP K_FAULT K_GROUP value)
		| ( K_RENAME K_TO value)
	);

alter_function_statement:
	K_ALTER K_FUNCTION functionReference arglist? CLOSE_PAREN (
		( K_OWNER K_TO owner)
		| ( K_RENAME K_TO value)
		| ( K_SET K_SCHEMA schema)
		| ( K_SET K_FENCED bool_expression)
	);

alter_hcatalog_schema_statement:
	K_ALTER K_HCATALOG K_SCHEMA schema K_SET hcatalog_schema_param+;

alter_library_statement:
	K_ALTER K_LIBRARY libraryReference (
		K_DEPENDS depends = value (K_LANGUAGE lang = value)?
	)? alias;

alter_model_statement:
	K_ALTER K_MODEL modelReference (
		( K_OWNER K_TO owner)
		| ( K_RENAME K_TO value)
		| ( K_SET K_SCHEMA schema)
	);

alter_network_interface_statement:
	K_ALTER K_NETWORK K_INTERFACE identifier K_RENAME K_TO value;

alter_node_statement:
	K_ALTER K_NODE node (
		( K_EXPORT K_ON identifier)
		| ( ( K_IS)? nodeType = value)
		| ( K_REPLACE ( K_WITH standByNode = value)?)
		| K_RESET
		| K_SET ( K_PARAMETER)? commaSeparatedKeyValuePairs
		| K_CLEAR ( K_PARAMETER)? params
	);

alter_notfifier_statement:
	K_ALTER K_NOTIFIER identifier (notifier_params)*;

notifier_params:
	(K_NO? K_CHECK K_COMMITTED)
	| enableOrDisable
	| ( K_IDENTIFIED K_BY identifier)
	| ( K_MAXMEMORYSIZE value)
	| ( K_MAXPAYLOAD value)
	| ( K_PARAMETERS value);

alter_projection_statement:
	K_ALTER K_PROJECTION projectionReference K_RENAME K_TO value;

alter_profile_statement:
	K_ALTER K_PROFILE identifier K_LIMIT (password_parameter)+;

alter_profile_rename_statement:
	K_ALTER K_PROFILE identifier K_RENAME K_TO value;

alter_resource_pool_statement:
	K_ALTER K_RESOURCE K_POOL identifier resource_pool_param+;

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
	| ( K_PRIORITY ( number | K_HOLD))
	| ( K_QUEUETIMEOUT ( number | K_NONE))
	| ( K_RUNTIMECAP ( interval | K_NONE))
	| ( K_RUNTIMEPRIORITY ( K_HIGH | K_MEDIUM | K_LOW))
	| ( K_RUNTIMEPRIORITYTHRESHOLD number)
	| ( K_SINGLEINITIATOR);

alter_role_rename_statement:
	K_ALTER K_ROLE identifier K_RENAME K_TO value;

alter_schema_statement:
	K_ALTER K_SCHEMA (
		(
			schemaReference (
				(
					K_DEFAULT (K_INCLUDE | K_EXCLUDE) K_SCHEMA K_PRIVILEGES
				)
				| ( K_OWNER K_TO owner ( K_CASCADE)?)
			)
		)
		| (
			schemaReference (COMMA schema)* (
				K_RENAME K_TO value ( COMMA value)*
			)
		)
	);

alter_sequence_statement:
	K_ALTER K_SEQUENCE sequenceReference (
		(
			sequence_params
			| (
				( K_RENAME K_TO value)
				| ( K_SET K_SCHEMA schema)
				| ( K_OWNER K_TO owner)
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
	K_ALTER K_SUBNET identifier K_RENAME K_TO value;

alter_table_rename_statement:
	K_ALTER K_TABLE tableReference (COMMA table)* K_RENAME K_TO value (
		COMMA value
	)*;
// todo

alter_table_general_statment:
	K_ALTER K_TABLE tableReference alter_table_item alter_table_item*;

alter_table_item:
	(
		K_ADD K_COLUMN (K_IF K_NOT K_EXISTS)? column dataTypes (
			(K_CONSTRAINT identifier)? (K_NOT? K_NULL)
			| ( K_DEFAULT expression)
		)? encoding_clause? (
			K_PROJECTIONS OPEN_PAREN projectionReference (
				COMMA projectionReference
			)* CLOSE_PAREN
		)?
	)
	| ( K_ADD table_constraint)
	| (
		K_ALTER K_COLUMN column (
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
	| ( K_ALTER K_CONSTRAINT identifier enableOrDisable)
	| (K_DROP K_CONSTRAINT identifier ( K_CASCADE | K_RESTRICT)?)
	| (
		K_DROP K_COLUMN? (K_IF K_EXISTS)? column (
			K_CASCADE
			| K_RESTRICT
		)?
	)
	| ( K_FORCE K_OUTER number)
	| (
		(K_INCLUDE | K_EXCLUDE | K_MATERIALIZE) K_SCHEMA? K_PRIVILEGES
	)
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
				| entities
				| K_ALL
				| ( K_ALL K_EXCEPT entities)
			)
		)
		| ( K_RENAME K_TO string)
	)
	| (
		( K_ACCOUNT ( K_LOCK | K_UNLOCK))
		| ( K_GRACEPERIOD ( K_NONE | interval))
		| ( K_IDENTIFIED K_BY string ( K_REPLACE string)?)
		| ( K_IDLESESSIONTIMEOUT ( K_NONE | interval))
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
		| ( K_TEMPSPACECAP ( K_NONE | interval))
	);
alter_view_statement:
	K_ALTER K_VIEW (schemaReference DOT)? (
		entities (
			K_OWNER K_TO owner
			| K_SET K_SCHEMA identifier
			| (K_INCLUDE | K_EXCLUDE | K_MATERIALIZE) (K_SCHEMA)? K_PRIVILEGES
		)
		| K_RENAME K_TO entities
	);

todo_statement: identifier+;

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
	K_COMMENT K_ON K_CONSTRAINT identifier K_ON tableReference comment_value;

comment_on_function_statement:
	K_COMMENT K_ON K_FUNCTION functionReference arglist comment_value;

comment_on_transform_function_statement:
	K_COMMENT K_ON K_TRANSFORM K_FUNCTION functionReference OPEN_PAREN (
		identifier dataTypes (COMMA identifier dataTypes)*
	)? CLOSE_PAREN comment_value;

comment_on_library_statement:
	K_COMMENT K_ON K_FUNCTION libraryReference comment_value;

comment_on_node_statement:
	K_COMMENT K_ON K_NODE node comment_value;

comment_on_schema_statement:
	K_COMMENT K_ON K_SCHEMA schema comment_value;

comment_on_sequence_statement:
	K_COMMENT K_ON K_SEQUENCE sequenceReference comment_value;

comment_on_table_statement:
	K_COMMENT K_ON K_TABLE tableReference comment_value;

comment_on_view_statement:
	K_COMMENT K_ON K_VIEW tableReference comment_value;

comment_on_projection_statement:
	K_COMMENT K_ON K_PROJECTION projectionReference comment_value;

comment_value: K_IS ( identifier | K_NULL);

commit_statement: K_COMMIT ( K_WORK | K_TRANSACTION)?;

connect_statement:
	K_CONNECT K_TO K_VERTICA dbname K_USER identifier K_PASSWORD identifier K_ON identifier COMMA
		DECIMAL (K_TLSMODE K_PREFER)?;

copy_statement: todo_statement;

copy_local_statement: todo_statement;

copy_from_vertica_statement:
	K_COPY tableReference (column ( COMMA column)*)? K_FROM K_VERTICA tableReference (
		column ( COMMA column)*
	)? load_method? (K_STREAM K_NAME identifier)? (K_NO K_COMMIT)?;

create_access_policy_statement:
	K_CREATE K_ACCESS K_POLICY K_ON tableReference (
		( K_FOR K_COLUMN column expressions)
		| ( K_FOR K_ROWS K_WHERE expressions)
	) (K_ENABLE | K_DISABLE);

create_authentication_statement:
	K_CREATE K_AUTHENTICATION identifier K_METHOD identifier (
		( K_LOCAL)
		| (
			K_HOST (K_TLS | ( K_NO K_TLS))? (
				IPV4_ADDR
				| IPV6_ADDR
			)
		)
	);

create_branch_statement:
	K_CREATE K_DATA K_IMMUTABLE K_BRANCH (branch_identifier) (
		COMMA branch_identifier
	)* (K_LIKE value)?;

branch_identifier: identifier number?;

create_external_table_as_copy_statement: todo_statement;

create_fault_group_statement:
	K_CREATE K_FAULT K_GROUP identifier;

create_flex_table_statement: todo_statement;

create_flex_external_table_as_copy_statement: todo_statement;

create_function_statements_statement: todo_statement;

create_hcatalog_schema_statement:
	K_CREATE K_HCATALOG K_SCHEMA (K_IF K_NOT K_EXISTS)? schema (
		K_AUTHORIZATION identifier
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
		K_DEPENDS identifier
	)? (K_LANGUAGE string)?;

create_load_balance_group_statement:
	K_CREATE K_LOAD K_BALANCE K_GROUP identifier K_WITH (
		( K_ADDRESS identifier ( COMMA identifier)*)
		| (
			K_FAULT K_GROUP identifier (COMMA identifier)* K_FILTER value
		)
	) (K_POLICY value)?;

create_local_temporary_view_statement: todo_statement;

create_location_statement:
	K_CREATE K_LOCATION string (( K_NODE node) | ( K_ALL K_NODES))? K_SHARED? (
		K_USAGE string
	)? (K_LABEL string)? (K_LIMIT string)?;

create_network_address_statement:
	K_CREATE K_NETWORK K_ADDRESS identifier K_ON node K_WITH address;

create_network_interface_statement:
	K_CREATE K_NETWORK K_INTERFACE identifier K_ON node K_WITH address;

create_notifier_statement:
	K_CREATE K_NOTIFIER identifier K_ACTION value notifier_params*;

create_procedure_statement:
	K_CREATE K_PROCEDURE procedureReference OPEN_PAREN argument_item (
		COMMA argument_item
	)* CLOSE_PAREN K_AS executable = value K_LANGUAGE lang = value K_USER user;

argument_item: identifier? dataTypes;

create_profile_statement:
	K_CREATE K_PROFILE name = identifier K_LIMIT password_parameter+;

create_projection_statement: todo_statement;

create_projection_live_aggregate_projections_statement:
	todo_statement;

create_projection_udtfs_statement: todo_statement;

create_resource_pool_statement:
	K_CREATE K_RESOURCE K_POOL identifier resource_pool_param+;

create_role_statement: K_CREATE K_ROLE identifier;

create_routing_rule_statement:
	K_CREATE K_ROUTING K_RULE identifier K_ROUTE address K_TO value;

create_schema_statement:
	K_CREATE K_SCHEMA (K_IF K_NOT K_EXISTS)? schemaReference (
		K_AUTHORIZATION string
	)? (K_DEFAULT ( K_INCLUDE | K_EXCLUDE) K_SCHEMA? K_PRIVILEGES)?;

create_sequence_statement:
	K_CREATE K_SEQUENCE (
		(K_IF K_NOT K_EXISTS)? sequenceReference (
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
	K_CREATE K_SUBNET identifier K_WITH string;

create_table_statement:
	create_table_default_statement
	| create_table_as_statement
	| create_table_like_statement;

schema_privileges_clause:
	(( K_INCLUDE | K_EXCLUDE) K_SCHEMA? K_PRIVILEGES);

create_table_as_statement:
	K_CREATE K_TABLE (K_IF K_NOT K_EXISTS) tableReference column_name_list? schema_privileges_clause
		? K_AS hints? at_epoch_clause? select_query encodedBy_clause?;

column_name_list:
	OPEN_PAREN column_name_list_item (
		COMMA column_name_list_item
	)* CLOSE_PAREN;

column_name_list_item:
	column encoding_clause? access_rank? grouped_clause?;

access_rank: K_ACCESSRANK number;

grouped_clause:
	K_GROUPED OPEN_PAREN columnReference (COMMA columnReference)* CLOSE_PAREN;

create_table_like_statement:
	K_CREATE K_TABLE (K_IF K_NOT K_EXISTS) tableReference K_LIKE tableReference
		schema_privileges_clause? load_method? schema_privileges_clause??;

create_table_default_statement:
	K_CREATE K_TABLE (K_IF K_NOT K_EXISTS) tableReference OPEN_PAREN column_definition_list (
		COMMA table_constraint (COMMA table_constraint)*
	)? CLOSE_PAREN load_method? orderby_clause? segmentation_clause? (
		K_KSAFE number
	)? partition_clause? schema_privileges_clause?;

table_constraint:
	K_CONSTRAINT identifier (
		(
			K_PRIMARY K_KEY OPEN_PAREN column (COMMA column)* CLOSE_PAREN enableOrDisable?
		)
		| (
			(
				K_FOREIGN K_KEY OPEN_PAREN column (COMMA column)* CLOSE_PAREN K_REFERENCES
					tableReference (
					OPEN_PAREN column (COMMA column)* CLOSE_PAREN
				)?
			)
		)
		| (
			K_UNIQUE OPEN_PAREN column (COMMA column)* CLOSE_PAREN enableOrDisable?
		)
		| (
			K_CHECK OPEN_PAREN expression CLOSE_PAREN enableOrDisable?
		)
	);

column_definition_list:
	column_definition (COMMA column_definition)*;

column_definition:
	column dataTypes column_constraint* encoding_clause? access_rank?;

column_constraint:
	(
		(K_AUTO_INCREMENT | K_IDENTITY) (
			OPEN_PAREN value (COMMA value)* CLOSE_PAREN
		)?
	)
	| ( K_CONSTRAINT identifier)
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
			K_REFERENCES tableReference OPEN_PAREN column (
				COMMA column
			)* CLOSE_PAREN
		)
	)
	| ( K_UNIQUE enableOrDisable?);

load_method: K_AUTO | K_DIRECT | K_TRICKLE;

segmentation_clause: todo_statement;

create_temporary_table_statement:
	create_temporary_table_with_def_statement
	| create_temporary_table_from_table_statement;

create_temporary_table_with_def_statement:
	K_CREATE (K_GLOBAL | K_LOCAL)? (K_TEMP | K_TEMPORARY) K_TABLE (
		K_IF K_NOT K_EXISTS
	)? tableReference OPEN_PAREN column_definition_list CLOSE_PAREN table_constraint? (
		K_ON K_COMMIT (K_DELETE | K_PRESERVE) K_ROWS
	)? load_method? (K_NO K_PROJECTION)? orderby_clause? segmentation_clause? (
		K_KSAFE number
	)? (( K_INCLUDE | K_EXCLUDE) K_SCHEMA? K_PRIVILEGES)?;

create_temporary_table_from_table_statement:
	K_CREATE (K_TEMP | K_TEMPORARY) K_TABLE (K_IF K_NOT K_EXISTS)? tableReference column_name_list?
		(
		K_ON K_COMMIT (K_DELETE | K_PRESERVE) K_ROWS
	)? load_method? K_AS hints? at_epoch_clause? select_query encodedBy_clause?;

encodedBy_clause: K_ENCODED K_BY column_ref ( COMMA column_ref)*;

column_ref: ( column access_rank? encoding_clause?);

create_text_index_statement:
	K_CREATE K_TEXT K_INDEX txtIndex K_ON tableReference OPEN_PAREN identifier COMMA dataTypes (
		COMMA column (COMMA column)*
	)? CLOSE_PAREN (
		K_STEMMER (
			identifier (OPEN_PAREN dataTypes CLOSE_PAREN)
			| K_NONE
		)
	)? (
		K_TOKENIZER identifier (OPEN_PAREN dataTypes CLOSE_PAREN)
	)?;

create_user_statement: K_CREATE K_USER user user_params*;

create_view_statement:
	K_CREATE (K_OR K_REPLACE)? K_VIEW identifier (
		OPEN_PAREN columnReference (COMMA columnReference)* CLOSE_PAREN
	)? (( K_INCLUDE | K_EXCLUDE) K_SCHEMA? K_PRIVILEGES)? K_AS select_statement;

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

drop_branch_statement: 
K_DROP K_BRANCH (K_IF K_EXISTS)? (branch_identifier) (
		COMMA branch_identifier
	)* K_CASCADE?

;

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

drop_load_balance_group_statement: K_DROP K_LOAD K_BALANCE K_GROUP identifier K_CASCADE?
;

drop_network_address_statement: K_DROP K_LOAD K_NETWORK K_ADDRESS identifier K_CASCADE?
;

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

drop_routing_rule_statement: K_DROP K_ROUTING K_RULE identifier
;

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
		identifier K_AS ( expression | predicates)
	) (COMMA ( identifier K_AS ( expression | predicates)))* K_PATTERN identifier K_AS OPEN_PAREN
		identifier CLOSE_PAREN (
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

expressions: condition ( COMMA condition)*;

expression:
	(
		OPEN_PAREN (
			number
			| functionCall
			| columnReference
			| caseExp
			| select_query
		) CLOSE_PAREN
	)
	| (
		(
			number
			| functionCall
			| columnReference
			| caseExp
			| select_query
		)
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

betweenPredicate:
	expression K_BETWEEN? expression K_AND expression;

booleanPredicate:
	expression K_IS K_NOT? (bool_expression | K_UNKNOWN);

caseExp:
	K_CASE K_WHEN expression K_THEN expression (
		K_WHEN expression K_THEN expression
	)* (K_ELSE expression)? K_END;

condition: expression | predicate;

alias: ( K_AS? identifier);

functionCall:
	function OPEN_PAREN (( K_ALL | K_DISTINCT)? elements?)? CLOSE_PAREN;

notifierParam:
	K_NO K_CHECK K_COMMITTED (K_ENABLE | K_DISABLE) K_IDENTIFIED K_BY identifier K_MAXMEMORYSIZE
		identifier K_MAXPAYLOAD identifier K_PARAMETERS identifier;

commaSeparatedKeyValuePairs: keyValuePair ( COMMA keyValuePair)*;

keyValuePair: param operator value;

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
			projectionReference (
				COMMA (( schemaReference DOT)? identifier)
			)
		) CLOSE_PAREN
	)
	| (
		K_SKIP_PROJS OPEN_PAREN (
			projectionReference (
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

procedureReference:
	(( ( dbname DOT)? ( schema DOT))? table DOT)? procedure;

procedure: identifier;

functionReference: ( ( dbname DOT)? ( schema DOT))? function;

libraryReference: ( ( dbname DOT)? ( schema DOT))? library;

sequenceReference: ( ( dbname DOT)? ( schema DOT))? sequence;

modelReference: ( ( dbname DOT)? ( schema DOT))? model;
txtIndexReference: ( ( dbname DOT)? ( schema DOT))? txtIndex;

schemaReference: ( dbname DOT)? schema;

dbname: identifier;
txtIndex: identifier;
model: identifier;

schema: identifier;

table: identifier;

params: param ( COMMA param)*;

projection: identifier;

library: identifier;

function: identifier | aggregateFunction;

node: identifier;

sequence: identifier;

column: identifier;

interval: string;

entities: identifier ( COMMA identifier)*;

string: DOUBLE_QUOTE_STRING | SINGLE_QUOTE_STRING;

param: WORD | DOUBLE_QUOTE_STRING | SINGLE_QUOTE_STRING;

number: DECIMAL | FLOAT | REAL;

asteriskExp: STAR;

user: WORD | DOUBLE_QUOTE_STRING | SINGLE_QUOTE_STRING;

owner: WORD | DOUBLE_QUOTE_STRING | SINGLE_QUOTE_STRING;

method: WORD | DOUBLE_QUOTE_STRING | SINGLE_QUOTE_STRING;

faultGroup: WORD | DOUBLE_QUOTE_STRING | SINGLE_QUOTE_STRING;

identifier:
	WORD
	| DOUBLE_QUOTE_STRING
	| SINGLE_QUOTE_STRING
	| K_DEFAULT;

enableOrDisable: ( K_ENABLE | K_DISABLE);

nullOrNotNull: K_NOT? K_NULL;

value:
	WORD
	| DOUBLE_QUOTE_STRING
	| SINGLE_QUOTE_STRING
	| DECIMAL
	| FLOAT
	| REAL;

address: IPV4_ADDR | IPV6_ADDR;

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

