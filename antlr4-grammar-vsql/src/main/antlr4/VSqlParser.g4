parser grammar VSqlParser;

@header {
  package org.antlr4.vsql;
}

options {
	tokenVocab = VSqlLexer;
}

root
:
	(
		statement SEMI?
	)* EOF?
;

statement
:
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
		|drop_source_statement
|drop_filter_statement
|drop_parser_statement
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
	)
;

dml_statement
:
	select_statement
	| insert_statement
	| update_statement
	| merge_statement
	| delete_statement
;

ddl_statement
:
;

dcl_statement
:
;

tcl_statement
:
;

other_statement
:
;

empty_statement
:
	SEMI
;

alter_access_policy_statement
:
	K_ALTER K_ACCESS K_POLICY K_ON tableReference
	(
		(
			K_FOR K_COLUMN column expressions?
		)
		|
		(
			K_FOR K_ROWS
			(
				K_WHERE expressions
			)?
		)
		(
			K_ENABLE
			| K_DISABLE
		)
	)
	|
	(
		(
			K_FOR K_COLUMN column
		)
		|
		(
			K_FOR K_ROWS
		) K_COPY K_TO K_TABLE table
	)
;

alter_authentication_statement
:
	K_ALTER K_AUTHENTICATION entity
	(
		(
			K_ENABLE
			| K_DISABLE
		)
		|
		(
			K_LOCAL
			|
			(
				K_HOST
				(
					K_TLS
					| K_NO K_TLS
				) host_ip_address
			)
		)
		|
		(
			K_RENAME K_TO item
		)
		|
		(
			K_METHOD item
		)
		|
		(
			K_SET keyValuePairs
		)
		|
		(
			K_PRIORITY item //int

		)
	)
;

alter_database_drop_statement
:
	K_ALTER K_DATABASE dbname
	(
		(
			K_DROP K_ALL K_FAULT K_GROUP
		)
		|
		(
			K_EXPORT K_ON
			(
				item
				| K_DEFAULT
			)
		)
		|
		(
			K_RESET K_STANDBY
		)
		|
		(
			K_SET
			(
				K_PARAMETER
			)? keyValuePairs
		)
		|
		(
			K_CLEAR
			(
				K_PARAMETER
			)? items
		)
	)
;

alter_fault_group_statement
:
	K_ALTER K_FAULT K_GROUP entity
	(
		(
			K_ADD K_NODE item
		)
		|
		(
			K_DROP K_NODE item
		)
		|
		(
			K_ADD K_FAULT K_GROUP item
		)
		|
		(
			K_DROP K_FAULT K_GROUP item
		)
		|
		(
			K_RENAME K_TO item
		)
	)
;

alter_function_statement
:
	K_ALTER K_FUNCTION
	(
		schemaReference DOT
	)? funcName arglist? CLOSE_PAREN
	(
		(
			K_OWNER K_TO item
		)
		|
		(
			K_RENAME K_TO item
		)
		|
		(
			K_SET K_SCHEMA item
		)
		|
		(
			K_SET K_FENCED bool_expression
		)
	)
;

alter_hcatalog_schema_statement
:
	K_ALTER K_HCATALOG K_SCHEMA schema K_SET keyValuePairs
;

alter_library_statement
:
	K_ALTER K_LIBRARY
	(
		schemaReference DOT
	)? entity
	(
		K_DEPENDS item
		(
			K_LANGUAGE item
		)?
	)? K_AS item
;

alter_model_statement
:
	K_ALTER K_MODEL
	(
		schemaReference DOT
	)? entity
	(
		(
			K_OWNER K_TO item
		)
		|
		(
			K_RENAME K_TO item
		)
		|
		(
			K_SET K_SCHEMA item
		)
	)
;

alter_network_interface_statement
:
	K_ALTER K_NETWORK K_INTERFACE entity K_RENAME K_TO item
;

alter_node_statement
:
	K_ALTER K_NODE entity
	(
		(
			K_EXPORT K_ON
			(
				item
				| K_DEFAULT
			)
		)
		|
		(
			K_IS
		) item
		| K_REPLACE
		(
			K_WITH item
		)
		| K_RESET
		| K_SET
		(
			K_PARAMETER
		)? keyValuePairs
		| K_CLEAR
		(
			K_PARAMETER
		)? items
	)
;

alter_notfifier_statement
:
	K_ALTER K_NOTIFIER name notifierParam
	(
		COMMA notifierParam
	)*
;

alter_projection_statement
:
	K_ALTER K_PROJECTION
	(
		schemaReference DOT
	)? entity K_RENAME K_TO item
;

alter_profile_statement
:
	K_ALTER K_PROFILE
	(
		entity
	) K_LIMIT password_parameter item
;

alter_profile_rename_statement
:
	K_ALTER K_PROFILE entity K_RENAME K_TO item
;

alter_resource_pool_statement
:
	K_ALTER K_RESOURCE K_POOL entity item
;

alter_role_rename_statement
:
	K_ALTER K_ROLE entity K_RENAME K_TO item
;

alter_schema_statement
:
	K_ALTER K_SCHEMA
	(
		(
			schemaReference
			(
				(
					K_DEFAULT
					(
						K_INCLUDE
						| K_EXCLUDE
					) K_SCHEMA K_PRIVILEGES
				)
				|
				(
					K_OWNER K_TO item
					(
						K_CASCADE
					)?
				)
			)
		)
		|
		(
			schemaReference
			(
				COMMA schema
			)*
			(
				K_RENAME K_TO items
			)
		)
	)
;

alter_sequence_statement
:
	K_ALTER K_SEQUENCE
	(
		(
			(
				schemaReference DOT
			)? entity
			(
				K_INCREMENT K_BY DECIMAL
			)?
			(
				(
					K_MINVALUE DECIMAL
				)
				|
				(
					K_NO K_MINVALUE
				)
			)?
			(
				(
					K_MAXVALUE DECIMAL
				)
				|
				(
					K_NO K_MAXVALUE
				)
			)?
			(
				K_RESTART K_WITH DECIMAL
			)?
			(
				(
					K_CACHE DECIMAL
				)
				|
				(
					K_NO K_CACHE
				)
				(
					K_CYCLE
					| K_NO K_CYCLE
				)
			)?
		)
		|
		(
			(
				schemaReference DOT
			)? entity
			(
				(
					K_RENAME K_TO item
				)
				|
				(
					K_SET K_SCHEMA item
				)
				|
				(
					K_OWNER K_TO item
				)
			)
		)
	)
;

alter_session_statement
:
	K_ALTER K_SESSION
	(
		(
			K_SET K_PARAMETER? keyValuePairs
		)
		|
		(
			K_CLEAR K_PARAMETER? items?
		)
		|
		(
			K_SET K_UDPARAMETER
			(
				K_FOR libName
			)? keyValuePairs
		)
		|
		(
			K_CLEAR K_UDPARAMETER
			(
				K_FOR libName
			)? items?
		)
	)
;

alter_subnet_statement
:
	K_ALTER K_SUBNET entity K_RENAME K_TO item
;

alter_table_rename_statement
:
	K_ALTER K_TABLE tableReference
	(
		COMMA table
	)* K_RENAME K_TO items
;
// todo

alter_table_general_statment
:
	K_ALTER K_TABLE tableReference
	(
		alter_table_item
		(
			COMMA alter_table_item
		)*
	)
;

alter_table_item
:
	(
		K_ADD K_COLUMN
		(
			K_IF K_NOT K_EXISTS
		)? column dataTypes
	)
;

alter_user_statement
:
	todo_statement
;

alter_view_statement
:
	K_ALTER K_VIEW
	(
		schemaReference DOT
	)?
	(
		entities
		(
			K_OWNER K_TO item
			| K_SET K_SCHEMA item
			|
			(
				K_INCLUDE
				| K_EXCLUDE
				| K_MATERIALIZE
			)
			(
				K_SCHEMA
			)? K_PRIVILEGES
		)
		| K_RENAME K_TO items
	)
;

todo_statement
:
	WORD
;

begin_transaction_statement
:
	K_BEGIN
	(
		K_WORK
		| K_TRANSACTION
	) K_ISOLATION K_LEVEL isolationLevel transactionMode
;

comment_on_statement
:
	comment_on_column_statement
;

comment_on_column_statement
:
	K_COMMENT K_ON K_COLUMN
	(
		dbname DOT
	)?
	(
		schema DOT
	)? projection DOT column K_IS
	(
		item
		| K_NULL
	)
;

commit_statement
:
	K_COMMIT
	(
		K_WORK
		| K_TRANSACTION
	)?
;

connect_statement
:
	K_CONNECT K_TO K_VERTICA dbname K_USER entity K_PASSWORD item K_ON item COMMA
	DECIMAL
	(
		K_TLSMODE K_PREFER
	)?
;

copy_statement
:
	todo_statement
;

copy_local_statement
:
	todo_statement
;

copy_from_vertica_statement
:
	K_COPY tableReference
	(
		column
		(
			COMMA column
		)*
	)? K_FROM K_VERTICA tableReference
	(
		column
		(
			COMMA column
		)*
	)?
	(
		K_AUTO
		| K_DIRECT
		| K_TRICKLE
	)?
	(
		K_STREAM K_NAME item
	)?
	(
		K_NO K_COMMIT
	)?
;

create_access_policy_statement
:
	K_CREATE K_ACCESS K_POLICY K_ON tableReference
	(
		(
			K_FOR K_COLUMN column expressions
		)
		|
		(
			K_FOR K_ROWS K_WHERE expressions
		)
	)
	(
		K_ENABLE
		| K_DISABLE
	)
;

create_authentication_statement
:
	todo_statement
;

create_branch_statement
:
	todo_statement
;

create_external_table_as_copy_statement
:
	todo_statement
;

create_fault_group_statement
:
	todo_statement
;

create_flex_table_statement
:
	todo_statement
;

create_flex_external_table_as_copy_statement
:
	todo_statement
;

create_function_statements_statement
:
	todo_statement
;

create_hcatalog_schema_statement
:
	todo_statement
;

create_library_statement
:
	todo_statement
;

create_load_balance_group_statement
:
	todo_statement
;

create_local_temporary_view_statement
:
	todo_statement
;

create_location_statement
:
	todo_statement
;

create_network_address_statement
:
	todo_statement
;

create_network_interface_statement
:
	todo_statement
;

create_notifier_statement
:
	todo_statement
;

create_procedure_statement
:
	todo_statement
;

create_profile_statement
:
	todo_statement
;

create_projection_statement
:
	todo_statement
;

create_projection_live_aggregate_projections_statement
:
	todo_statement
;

create_projection_udtfs_statement
:
	todo_statement
;

create_resource_pool_statement
:
	todo_statement
;

create_role_statement
:
	todo_statement
;

create_routing_rule_statement
:
	todo_statement
;

create_schema_statement
:
	todo_statement
;

create_sequence_statement
:
	todo_statement
;

create_subnet_statement
:
	todo_statement
;

create_table_statement
:
	todo_statement
;

create_temporary_table_statement
:
	todo_statement
;

create_text_index_statement
:
	todo_statement
;

create_user_statement
:
	todo_statement
;

create_view_statement
:
	todo_statement
;

delete_statement
:
	K_DELETE hints? K_FROM tableReference where_clause
;

directed_query_statements_statement
:
	todo_statement
;

disconnect_statement
:
	K_DISCONNECT dbname
;

drop_access_policy_statement
:
	K_DROP K_ACCESS K_POLICY K_ON table K_FOR
	(
		K_COLUMN column
		| K_ROWS
	)
;

drop_aggregate_function_statement
:
	K_DROP K_AGGREGATE K_FUNCTION
	(
		K_IF K_EXISTS
	)? functionReference arglist
;

drop_authentication_statement
:
	K_DROP K_AUTHENTICATION
	(
		K_IF K_EXISTS
	)? entity
	(
		K_CASCADE
	)?
;

drop_branch_statement
:
	todo_statement
;

drop_fault_group_statement
:
	K_DROP K_FAULT K_GROUP
	(
		K_IF K_EXISTS
	) faultgroup
;

drop_function_statement
:
	K_DROP K_FUNCTION
	(
		K_IF K_EXISTS
	)? functionReference arglist
;

drop_source_statement
:
	K_DROP K_SOURCE
	(
		schemaReference DOT
	)? entity OPEN_PAREN CLOSE_PAREN
;

drop_filter_statement
:
	K_DROP K_FILTER
	(
		schemaReference DOT
	)? entity OPEN_PAREN CLOSE_PAREN
;

drop_parser_statement
:
	K_DROP K_PARSER
	(
		schemaReference DOT
	)? entity OPEN_PAREN CLOSE_PAREN
;

drop_model_statement
:
	K_DROP K_MODEL
	(
		K_IF K_EXISTS
	)?
	(
		schemaReference DOT
	)? entity
	(
		COMMA entity
	)*
;

drop_library_statement
:
	K_DROP K_LIBRARY
	(
		K_IF K_EXISTS
	)?
	(
		schemaReference DOT
	)? entity K_CASCADE?
;

drop_load_balance_group_statement
:
	todo_statement
;

drop_network_address_statement
:
	todo_statement
;

drop_network_interface_statement
:
	K_NETWORK K_INTERFACE
	(
		K_IF K_EXISTS
	)?
	(
		schemaReference DOT
	)? entity K_CASCADE?
;

drop_notifier_statement
:
	K_NETWORK K_NOTIFIER
	(
		K_IF K_EXISTS
	)? entity
;

drop_procedure_statement
:
	K_DROP K_PROCEDURE
	(
		K_IF K_EXISTS
	)?
	(
		schemaReference DOT
	)? entity arglist
;

drop_profile_statement
:
	K_DROP K_PROFILE
	(
		K_IF K_EXISTS
	)? entities
	(
		K_CASCADE
	)?
;

drop_projection_statement
:
	K_DROP K_PROJECTION
	(
		K_IF K_EXISTS
	)?
	(
		schemaReference DOT
	)? entities
	(
		K_CASCADE
		| K_RESTRICT
	)?
;

drop_resource_pool_statement
:
	K_DROP K_RESOURCE K_POOL entity
;

drop_role_statement
:
	K_DROP K_ROLE
	(
		K_IF K_EXISTS
	)? entities K_CASCADE?
;

drop_routing_rule_statement
:
	todo_statement
;

drop_schema_statement
:
	K_DROP K_SCHEMA
	(
		K_IF K_EXISTS
	)?
	(
		dbname DOT
	)? entities K_CASCADE?
;

drop_sequence_statement
:
	K_DROP K_SEQUENCE
	(
		K_IF K_EXISTS
	)?
	(
		schemaReference DOT
	)? entities
	(
		K_CASCADE
		| K_RESTRICT
	)?
;

drop_subnet_statement
:
	K_DROP K_SUBNET
	(
		K_IF K_EXISTS
	)?
	(
		schemaReference DOT
	)? entities K_CASCADE?
;

drop_table_statement
:
	K_DROP K_TABLE
	(
		K_IF K_EXISTS
	)? tableReference
	(
		COMMA table
	)* K_CASCADE?
;

drop_text_index_statement
:
	K_DROP K_TEXT K_INDEX
	(
		K_IF K_EXISTS
	)?
	(
		schemaReference DOT
	)? entity
;

drop_transform_function_statement
:
	K_DROP K_TRANSFORM K_FUNCTION
	(
		K_IF K_EXISTS
	)? functionReference arglist
;

drop_user_statement
:
	K_DROP K_USER
	(
		K_IF K_EXISTS
	)? entities K_CASCADE?
;

drop_view_statement
:
	K_DROP K_VIEW
	(
		K_IF K_EXISTS
	)?
	(
		schemaReference DOT
	)? entities
;

end_statement
:
	K_END
	(
		K_WORK
		| K_TRANSACTION
	)?
;

explain_statement
:
	K_EXPLAIN hints?
	(
		K_LOCAL
		| K_VERBOSE
		| K_JSON
		| K_ANNOTATED
	)?
	(
		statement
	)
;

export_to_parquet_statement
:
	todo_statement
;

export_to_vertica_statement
:
	K_EXPORT K_TO K_VERTICA tableReference
	(
		OPEN_PAREN column
		(
			COMMA column
		)* CLOSE_PAREN
	)?
	(
		(
			K_AS select_query
		)
		|
		(
			K_FROM tableReference
			(
				OPEN_PAREN column
				(
					COMMA column
				)* CLOSE_PAREN
			)?
		)
	)
;
//todo
grant_statements_statement
:
	todo_statement
;

grant_authentication_statement:
K_GRANT K_AUTHENTICATION item K_TO entities 
;
insert_statement
:
	K_INSERT hints? K_INTO tableReference
	(
		OPEN_PAREN column
		(
			COMMA column
		)* CLOSE_PAREN
	)?
	(
		(
			K_DEFAULT K_VALUES
		)
		|
		(
			K_VALUES OPEN_PAREN items CLOSE_PAREN
		)
		| select_statement
	)
;

merge_statement
:
	K_MERGE hints? K_INTO tableReference alias? K_USING
	(
		tableReference
		| select_statement
	) alias? joinPredicate matchingClause+
;

matchingClause
:
	(
		K_WHEN K_MATCHED K_THEN K_UPDATE
		(
			K_AND predicates
		)? K_THEN K_UPDATE K_SET
		(
			column EQUAL item
		)
		(
			column EQUAL item
		)*
		(
			where_clause
		)?
	)
	|
	(
		K_WHEN K_NOT K_MATCHED
		(
			K_AND predicates
		)? K_THEN K_INSERT OPEN_PAREN column
		(
			COMMA column
		)* CLOSE_PAREN K_VALUES OPEN_PAREN items CLOSE_PAREN
	)
;

profile_statement
:
	K_PROFILE statement
;

release_savepoint_statement
:
	K_RELEASE (K_SAVEPOINT)? item
;

revoke_statements_statement
:
	todo_statement
;

rollback_statement
:
	K_ROLLBACK (K_WORK |K_TRANSACTION )?
;

rollback_to_savepoint_statement
:
	K_ROLLBACK K_TO (K_SAVEPOINT )? item
;

savepoint_statement
:
	K_SAVEPOINT item
;

select_statement
:
	(
		(
			K_AT K_EPOCH
			(
				K_LATEST
				| DECIMAL
			)
		)
		|
		(
			K_AT K_TIME STRING
		)
	)? select_query
;

set_datestyle_statement
:
	K_SET K_DATESTYLE K_TO (K_ISO | K_GERMAN | (K_SQL (COMMA (K_DMY | K_MDY ))?) | ( K_POSTGRES (COMMA (K_MDY | K_DMY ))?))
;

set_escape_string_warning_statement
:
	K_SET K_ESCAPE_STRING_WARNING K_TO
	(
		K_ON
		| K_OFF
	)
;

set_intervalstyle_statement
:
	K_SET K_INTERVALSTYLE K_TO
	(
		K_PLAIN
		| K_UNITS
	)
;

set_locale_statement
:
	K_SET K_LOCALE K_TO item
;

set_role_statement
:
	K_SET K_ROLE
	(
		names
		| K_NONE
		| K_ALL
		|
		(
			K_ALL K_EXCEPT names
		)
		| K_DEFAULT
	)
;

set_search_path_statement
:
	K_SET K_SEARCH_PATH
	(
		K_TO
		| EQUAL
	)
	(
		(
			schema
			(
				COMMA schema
			)*
		)
		| K_DEFAULT
	)
;

set_session_autocommit_statement
:
	K_SET K_SESSION K_AUTOCOMMIT K_TO
	(
		K_ON
		| K_OFF
	)
;

set_session_characteristics_as_transaction_statement
:
	K_SET K_SESSION K_CHARACTERISTICS K_AS K_TRANSACTION
	(
		COMMA? isolationLevel
		| COMMA? transactionMode
	)+
;

set_session_graceperiod_statement
:
	K_SET K_SESSION K_GRACEPERIOD
	(
		item
		| K_NONE
		|
		(
			EQUAL K_DEFAULT
		)
	)
;

set_session_idlesessiontimeout_statement
:
	K_SET K_SESSION K_IDLESESSIONTIMEOUT
	(
		item
		| K_NONE
		|
		(
			EQUAL K_DEFAULT
		)
	)
;

set_session_memorycap_statement
:
	K_SET K_SESSION K_MEMORYCAP
	(
		item
		| K_NONE
		|
		(
			EQUAL K_DEFAULT
		)
	)
;

set_session_multipleactiveresultsets_statement
:
	K_SET K_SESSION K_MULTIPLEACTIVERESULTSETS K_TO
	(
		K_ON
		| K_OFF
	)
;

set_session_resource_pool_statement
:
	K_SET K_SESSION K_RESOURCE_POOL EQUAL
	(
		item
		|
		(
			K_DEFAULT
		)
	)
;

set_session_runtimecap_statement
:
	K_SET K_SESSION K_RUNTIMECAP
	(
		item
		| K_NONE
		|
		(
			EQUAL K_DEFAULT
		)
	)
;

set_session_tempspacecap_statement
:
	K_SET K_SESSION K_TEMPSPACECAP
	(
		item
		| K_NONE
	)
;

set_standard_conforming_strings_statement
:
	K_SET K_STANDARD_CONFORMING_STRINGS K_TO
	(
		K_ON
		| K_OFF
	)
;

set_time_zone_statement
:
	K_SET
	(
		(
			K_TIME K_ZONE
		)
		| K_TIMEZONE
	) K_TO K_INTERVAL? item
;

//todo update parameters

show_statement
:
	K_SHOW
	(
		K_ALL
		| entity
	)
;

show_current_statement
:
	K_SHOW K_CURRENT
	(
		K_ALL
		| entity
	)
;

show_database_statement
:
	K_SHOW K_DATABASE dbname
	(
		K_ALL
		| entities
	)
;

show_node_statement
:
	K_SHOW K_NODE name
	(
		K_ALL
		| entities
	)
;

show_session_statement
:
	K_SHOW K_SESSION
	(
		K_ALL
		|
		(
			K_UDPARAMETERS K_ALL
		)
		| entities
	)
;

start_transaction_statement
:
	K_START K_TRANSACTION K_ISOLATION K_LEVEL isolationLevel transactionMode
;

truncate_table_statement
:
	K_TRUNCATE K_TABLE
	tableReference
;

update_statement
:
	K_UPDATE hints? tableReference alias? K_SET expressions
from_clause?
where_clause?
;

select_query
:
	select_clause into_clause? from_clause? where_clause? timeseries_clause?
	groupBy_clause? having_clause? match_clause?
	(
		K_UNION
		(
			K_ALL
			| K_DISTINCT
		)?
	)? except_clause? intersect_clause? orderby_clause?
	(
		K_LIMIT
		(
			DECIMAL
			| K_ALL
		)
	)?
	(
		K_OFFSET DECIMAL
	)?
	(
		K_FOR K_UPDATE
		(
			K_OF tableReference
			(
				COMMA tableReference
			)*
		)?
	)?
;

select_clause
:
	K_SELECT hints?
	(
		K_ALL
		| K_DISTINCT
	)? elements
;

intersect_clause
:
	K_INTERSECT select_query
;

except_clause
:
	K_EXCEPT select_query
;

from_clause
:
	K_FROM
	(
		dataset
		(
			COMMA? dataset
		)*
	) tableSample?
;

into_clause
:
	(
		K_INTO K_TABLE? tableReference alias?
	)
	| K_INTO
	(
		K_GLOBAL
		| K_LOCAL
	)?
	(
		K_TEMP
		| K_TEMPORARY
	) K_TABLE? tableReference
	(
		K_ON K_COMMIT
		(
			K_PRESERVE
			| K_DELETE
		) K_ROWS
	)?
;

timeseries_clause
:
	K_TIMESERIES columnReference K_AS SINGLE_QUOTE over_clause K_ORDER K_BY
	columnReference
	(
		COMMA columnReference
	)*
;

over_clause
:
	K_OVER OPEN_PAREN
	(
		K_PARTITION K_BY columnReference
		(
			COMMA columnReference
		)*
	)? K_ORDER K_BY columnReference CLOSE_PAREN
;

groupBy_clause
:
	K_GROUP K_BY hints? expressions
;

having_clause
:
	K_HAVING condition
	(
		COMMA condition
	)*
;

where_clause
:
	K_WHERE predicates
;

orderby_clause
:
	K_ORDER K_BY orderbyItem
	(
		COMMA orderbyItem
	)*
;

match_clause
:
	K_MATCH OPEN_PAREN
	(
		K_PARTITION K_BY columnReference
		(
			COMMA columnReference
		)*
	)? K_ORDER K_BY columnReference
	(
		COMMA columnReference
	)* K_DEFINE
	(
		item K_AS
		(
			exp
			| predicates
		)
	)
	(
		COMMA
		(
			item K_AS
			(
				exp
				| predicates
			)
		)
	)* K_PATTERN item K_AS OPEN_PAREN regex CLOSE_PAREN
	(
		(
			K_ROWS K_MATCH
		)
		(
			(
				K_ALL K_EVENTS
			)
			|
			(
				K_FIRST K_EVENT
			)
		)
	)? CLOSE_PAREN
;

regex
:
	item
;

orderbyItem
:
	exp
	(
		K_ASC
		| K_DESC
	)?
;

predicates
:
	predicate
	(
		(
			K_AND
			| K_OR
		) predicate
	)*
;

tableSample
:
	K_TABLESAMPLE OPEN_PAREN FLOAT CLOSE_PAREN
;

dataset
:
	(
		tableReference
		| select_clause
		| joinedTable
	) alias?
;

joinedTable
:
	tableReference
	(
		K_INNER
		|
		(
			K_LEFT K_OUTER?
		)
		|
		(
			K_RIGHT K_OUTER?
		)
		|
		(
			K_FULL K_OUTER?
		)
		| K_NATURAL
		| K_CROSS
	)? K_JOIN tableSample? joinPredicate?
;

elements
:
	element
	(
		COMMA element
	)*
;

element
:
	(
		STAR
		| exp
		| OPEN_PAREN select_query CLOSE_PAREN
	) alias?
;

expressions
:
	condition
	(
		COMMA condition
	)*
;

exp
:
	OPEN_PAREN?
	(
		columnReference
		| func_call
		| caseExp
	) CLOSE_PAREN?
;

predicate
:
	betweenPredicate
	| booleanPredicate
	| columnValuePredicate
	| inPredicate
	| interpolatePredicate
	| likePredicate
	| nullPredicate
;

nullPredicate
:
	(
		columnReference
		| func_call
	) K_IS
	(
		K_NOT
	)? K_NULL
;

likePredicate
:
	columnReference K_NOT?
	(
		K_LIKE
		| K_ILIKE
		| K_LIKEB
		| K_ILIKEB
	) item
	(
		K_ESCAPE item
	)?
;

joinPredicate
:
	K_ON columnReference comparisonOperator columnReference
	(
		(
			K_AND
			| K_OR
			| K_NOT
		) columnReference comparisonOperator columnReference
	)*
;

interpolatePredicate
:
	columnReference K_PREVIOUS K_VALUE columnReference
;

columnValuePredicate
:
	columnReference operator
	(
		columnReference
		| constantExp
	)
;

inPredicate
:
	columnReference
	(
		COMMA columnReference
	)* K_IN K_NOT? inPredicateValues
	(
		COMMA inPredicateValues
	)*
;

inPredicateValues
:
	OPEN_PAREN
	(
		constantExp
		| inPredicateValues
	) CLOSE_PAREN
;

constantExp
:
	DECIMAL
	| STRING
	|
	(
		K_IS K_NOT? K_NULL
	)
;

betweenPredicate
:
	exp K_BETWEEN? exp K_AND exp
;

booleanPredicate
:
	exp K_IS K_NOT?
	(
		bool_expression
		| K_UNKNOWN
	)
;

caseExp
:
	K_CASE K_WHEN exp K_THEN result
	(
		K_WHEN exp K_THEN result
	)*
	(
		K_ELSE result
	)? K_END
;

result
:
	item
;

condition
:
	exp
	| predicate
;

alias
:
	(
		K_AS? item
	)
;

arglist
:
	OPEN_PAREN
	(
		dataTypes
		(
			COMMA dataTypes
		)*
	)? CLOSE_PAREN
;

func_call
:
	funcName OPEN_PAREN
	(
		STAR
		|
		(
			(
				K_ALL
				| K_DISTINCT
			)? exp_args
		)
	)? CLOSE_PAREN
;

exp_args
:
	(
		(
			OPEN_PAREN exp_args CLOSE_PAREN
		)
		| item
	)
	(
		COMMA
		(
			(
				OPEN_PAREN exp_args CLOSE_PAREN
			)
			| item
		)
	)*
;

funcName
:
	aggregateFunction
	| entity
;

aggregateFunction
:
	K_ROLLUP
	|
	(
		K_GROUPING K_SETS?
	)
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
	| K_VARIANCE
;

isolationLevel
:
	(
		K_READ K_COMMITTED
	)
	|
	(
		K_SERIALIZABLE
	)
	|
	(
		K_REPEATABLE K_READ
	)
	|
	(
		K_READ K_UNCOMMITTED
	)
;

transactionMode
:
	K_READ
	(
		K_ONLY
		| K_WRITE
	)?
;

libName
:
	name
;

password_parameter
:
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
	)
;

notifierParam
:
	K_NO K_CHECK K_COMMITTED
	(
		K_ENABLE
		| K_DISABLE
	) K_IDENTIFIED K_BY name K_MAXMEMORYSIZE item K_MAXPAYLOAD item K_PARAMETERS
	name
;

keyValuePairs
:
	keyValuePair
	(
		COMMA keyValuePair
	)*
;

keyValuePair
:
	item operator item
;

names
:
	name
	(
		COMMA name
	)*
;

hints
:
	OPEN_HINT hint
	(
		COMMA hint
	)* CLOSE_HINT
;

hint
:
	gbHint
;

gbHint
:
	K_GBYTYPE
	(
		K_HASH
		| K_PIPE
	)
;

columnReference
:
	(
		(
			(
				(
					dbname DOT
				)?
				(
					schema DOT
				)
			)?
			(
				table DOT
			)
		)
	)? column
;

tableReference
:
	(
		(
			dbname DOT
		)?
		(
			schema DOT
		)
	)? table
;

functionReference
:
	(
		(
			dbname DOT
		)?
		(
			schema DOT
		)
	)? function
;

function
:
	entity
;

faultgroup
:
	entity
;

schemaReference
:
	(
		dbname DOT
	)? schema
;

name
:
	K_HOSTNAME
	| WORD
	| STRING
	| SINGLE_QUOTE
;

newName
:
	K_HOSTNAME
	| WORD
	| STRING
	| SINGLE_QUOTE
;

operator
:
	comparisonOperator
;

comparisonOperator
:
	EQUAL
	| EQUAL_GT
	| GT
	| LT
	| LTE
	| GTE
	| LT_GT
	| BANG_EQUAL
	| EQUAL2
;

dbname
:
	entity
;

entities
:
	entity
	(
		COMMA entity
	)*
;

entity
:
	WORD
	| STRING
	| K_DEFAULT
;

table
:
	WORD
	| STRING
;

schema
:
	WORD
;

column
:
	WORD
	| STRING
	| DECIMAL
;

projection
:
	WORD
;

items
:
	item
	(
		COMMA item
	)*
;

item
:
	K_INT
	| WORD
	| STRING
	| SINGLE_QUOTE
	| STAR+
	| DECIMAL
;

nonReservedWords
:
	K_ABORT
	| K_ABSOLUTE
	| K_ACCESS
	| K_ACCESSRANK
	| K_ACCOUNT
	| K_ACTION
	| K_ACTIVATE
	| K_ACTIVEPARTITIONCOUNT
	| K_ADD
	| K_ADMIN
	| K_AFTER
	| K_AGGREGATE
	| K_ALSO
	| K_ALTER
	| K_ANALYSE
	| K_ANALYTIC
	| K_ANALYZE
	| K_ANNOTATED
	| K_ANTI
	| K_ASSERTION
	| K_ASSIGNMENT
	| K_AT
	| K_AUTHENTICATION
	| K_AUTO
	| K_AUTO_INCREMENT
	| K_AVAILABLE
	| K_BACKWARD
	| K_BASENAME
	| K_BATCH
	| K_BEFORE
	| K_BEGIN
	| K_BEST
	| K_BLOCK
	| K_BLOCK_DICT
	| K_BLOCKDICT_COMP
	| K_BROADCAST
	| K_BY
	| K_BYTEA
	| K_BYTES
	| K_BZIP
	| K_BZIP_COMP
	| K_CACHE
	| K_CALLED
	| K_CASCADE
	| K_CATALOGPATH
	| K_CHAIN
	| K_CHARACTER
	| K_CHARACTERISTICS
	| K_CHARACTERS
	| K_CHECKPOINT
	| K_CLASS
	| K_CLEAR
	| K_CLOSE
	| K_CLUSTER
	| K_COLSIZES
	| K_COLUMNS_COUNT
	| K_COMMENT
	| K_COMMIT
	| K_COMMITTED
	| K_COMMONDELTA_COMP
	| K_COMMUNAL
	| K_COMPLEX
	| K_CONNECT
	| K_CONSTRAINTS
	| K_CONTROL
	| K_COPY
	| K_CPUAFFINITYMODE
	| K_CPUAFFINITYSET
	| K_CREATEDB
	| K_CREATEUSER
	| K_CSV
	| K_CUBE
	| K_CURRENT
	| K_CURSOR
	| K_CUSTOM
	| K_CUSTOM_PARTITIONS
	| K_CYCLE
	| K_DATA
	| K_DATABASE
	| K_DATAPATH
	| K_DAY
	| K_DEACTIVATE
	| K_DEALLOCATE
	| K_DEC
	| K_DECLARE
	| K_DEFAULTS
	| K_DEFERRED
	| K_DEFINE
	| K_DEFINER
	| K_DELETE
	| K_DELIMITER
	| K_DELIMITERS
	| K_DELTARANGE_COMP
	| K_DELTARANGE_COMP_SP
	| K_DELTAVAL
	| K_DEPENDS
	| K_DETERMINES
	| K_DIRECT
	| K_DIRECTCOLS
	| K_DIRECTED
	| K_DIRECTGROUPED
	| K_DIRECTPROJ
	| K_DISABLE
	| K_DISABLED
	| K_DISCONNECT
	| K_DISTVALINDEX
	| K_DO
	| K_DOMAIN
	| K_DOUBLE
	| K_DROP
	| K_DURABLE
	| K_EACH
	| K_ENABLE
	| K_ENABLED
	| K_ENCLOSED
	| K_ENCODING
	| K_ENCRYPTED
	| K_ENFORCELENGTH
	| K_EPHEMERAL
	| K_EPOCH
	| K_ERROR
	| K_ESCAPE
	| K_EVENT
	| K_EVENTS
	| K_EXCEPTION
	| K_EXCEPTIONS
	| K_EXCLUDE
	| K_EXCLUDING
	| K_EXCLUSIVE
	| K_EXECUTE
	| K_EXECUTIONPARALLELISM
	| K_EXPIRE
	| K_EXPLAIN
	| K_EXPORT
	| K_EXTERNAL
	| K_FAILED_LOGIN_ATTEMPTS
	| K_FAULT
	| K_FENCED
	| K_FETCH
	| K_FILESYSTEM
	| K_FILLER
	| K_FILTER
	| K_FIRST
	| K_FIXEDWIDTH
	| K_FLEX
	| K_FLEXIBLE
	| K_FOLLOWING
	| K_FORCE
	| K_FORMAT
	| K_FORWARD
	| K_FREEZE
	| K_FUNCTION
	| K_FUNCTIONS
	| K_GCDDELTA
	| K_GET
	| K_GLOBAL
	| K_GRACEPERIOD
	| K_GROUPED
	| K_GROUPING
	| K_GZIP
	| K_GZIP_COMP
	| K_HANDLER
	| K_HCATALOG
	| K_HCATALOG_CONNECTION_TIMEOUT
	| K_HCATALOG_DB
	| K_HCATALOG_SCHEMA
	| K_HCATALOG_SLOW_TRANSFER_LIMIT
	| K_HCATALOG_SLOW_TRANSFER_TIME
	| K_HCATALOG_USER
	| K_HIGH
	| K_HIVE_PARTITION_COLS
	| K_HIVESERVER2_HOSTNAME
	| K_HOLD
	| K_HOST
	| K_HOSTNAME
	| K_HOUR
	| K_HOURS
	| K_IDENTIFIED
	| K_IDENTITY
	| K_IDLESESSIONTIMEOUT
	| K_IF
	| K_IGNORE
	| K_IMMEDIATE
	| K_IMMUTABLE
	| K_IMPLICIT
	| K_INCLUDE
	| K_INCLUDING
	| K_INCREMENT
	| K_INDEX
	| K_INHERITS
	| K_INPUT
	| K_INSENSITIVE
	| K_INSERT
	| K_INSTEAD
	| K_INTERFACE
	| K_INTERPOLATE
	| K_INVOKER
	| K_ISOLATION
	| K_JSON
	| K_KEY
	| K_LABEL
	| K_LANCOMPILER
	| K_LANGUAGE
	| K_LARGE
	| K_LAST
	| K_LATEST
	| K_LESS
	| K_LEVEL
	| K_LIBRARY
	| K_LISTEN
	| K_LOAD
	| K_LOCAL
	| K_LOCATION
	| K_LOCK
	| K_LONG
	| K_LOW
	| K_LZO
	| K_MANAGED
	| K_MASK
	| K_MATCHED
	| K_MATERIALIZE
	| K_MAXCONCURRENCY
	| K_MAXCONCURRENCYGRACE
	| K_MAXCONNECTIONS
	| K_MAXMEMORYSIZE
	| K_MAXPAYLOAD
	| K_MAXQUERYMEMORYSIZE
	| K_MAXVALUE
	| K_MEDIUM
	| K_MEMORYCAP
	| K_MEMORYSIZE
	| K_MERGE
	| K_MERGEOUT
	| K_METHOD
	| K_MICROSECONDS
	| K_MILLISECONDS
	| K_MINUTE
	| K_MINUTES
	| K_MINVALUE
	| K_MODE
	| K_MODEL
	| K_MONTH
	| K_MOVE
	| K_MOVEOUT
	| K_NAME
	| K_NATIONAL
	| K_NATIVE
	| K_NETWORK
	| K_NEXT
	| K_NO
	| K_NOCREATEDB
	| K_NOCREATEUSER
	| K_NODE
	| K_NODES
	| K_NOTHING
	| K_NOTIFIER
	| K_NOTIFY
	| K_NOWAIT
	| K_NULLAWARE
	| K_NULLCOLS
	| K_NULLS
	| K_OBJECT
	| K_OCTETS
	| K_OF
	| K_OFF
	| K_OIDS
	| K_OPERATOR
	| K_OPT
	| K_OPTIMIZER
	| K_OPTION
	| K_OPTVER
	| K_ORC
	| K_OTHERS
	| K_OWNER
	| K_PARAMETER
	| K_PARAMETERS
	| K_PARQUET
	| K_PARSER
	| K_PARTIAL
	| K_PARTITION
	| K_PARTITIONING
	| K_PASSWORD
	| K_PASSWORD_GRACE_TIME
	| K_PASSWORD_LIFE_TIME
	| K_PASSWORD_LOCK_TIME
	| K_PASSWORD_MAX_LENGTH
	| K_PASSWORD_MIN_DIGITS
	| K_PASSWORD_MIN_LENGTH
	| K_PASSWORD_MIN_LETTERS
	| K_PASSWORD_MIN_LOWERCASE_LETTERS
	| K_PASSWORD_MIN_SYMBOLS
	| K_PASSWORD_MIN_UPPERCASE_LETTERS
	| K_PASSWORD_REUSE_MAX
	| K_PASSWORD_REUSE_TIME
	| K_PATTERN
	| K_PERCENT
	| K_PERMANENT
	| K_PLACING
	| K_PLANNEDCONCURRENCY
	| K_POLICY
	| K_POOL
	| K_PORT
	| K_PRECEDING
	| K_PREPARE
	| K_PREPASS
	| K_PRESERVE
	| K_PREVIOUS
	| K_PRIOR
	| K_PRIORITY
	| K_PRIVILEGES
	| K_PROCEDURAL
	| K_PROCEDURE
	| K_PROFILE
	| K_PROJECTION
	| K_PROJECTIONS
	| K_PSDATE
	| K_QUERY
	| K_QUEUETIMEOUT
	| K_QUOTE
	| K_RANGE
	| K_RAW
	| K_READ
	| K_RECHECK
	| K_RECORD
	| K_RECOVER
	| K_RECURSIVE
	| K_REFRESH
	| K_REINDEX
	| K_REJECTED
	| K_REJECTMAX
	| K_RELATIVE
	| K_RELEASE
	| K_REMOVE
	| K_RENAME
	| K_REORGANIZE
	| K_REPEATABLE
	| K_REPLACE
	| K_RESET
	| K_RESOURCE
	| K_RESTART
	| K_RESTRICT
	| K_RESULTS
	| K_RETURN
	| K_RETURNREJECTED
	| K_REVOKE
	| K_RLE
	| K_ROLE
	| K_ROLES
	| K_ROLLBACK
	| K_ROLLUP
	| K_ROWS
	| K_RULE
	| K_RUNTIMECAP
	| K_RUNTIMEPRIORITY
	| K_RUNTIMEPRIORITYTHRESHOLD
	| K_SAVE
	| K_SAVEPOINT
	| K_SCROLL
	| K_SEARCH_PATH
	| K_SECOND
	| K_SECONDS
	| K_SECURITY
	| K_SECURITY_ALGORITHM
	| K_SEGMENTED
	| K_SEMI
	| K_SEMIALL
	| K_SEQUENCE
	| K_SEQUENCES
	| K_SERIALIZABLE
	| K_SESSION
	| K_SET
	| K_SETOF
	| K_SETS
	| K_SHARE
	| K_SHARED
	| K_SHOW
	| K_SIMPLE
	| K_SINGLEINITIATOR
	| K_SITE
	| K_SITES
	| K_SKIP
	| K_SOURCE
	| K_SPLIT
	| K_SSL_CONFIG
	| K_STABLE
	| K_STANDBY
	| K_START
	| K_STATEMENT
	| K_STATISTICS
	| K_STDIN
	| K_STDOUT
	| K_STEMMER
	| K_STORAGE
	| K_STREAM
	| K_STRENGTH
	| K_STRICT
	| K_SUBNET
	| K_SYSID
	| K_SYSTEM
	| K_TABLES
	| K_TABLESAMPLE
	| K_TABLESPACE
	| K_TEMP
	| K_TEMPLATE
	| K_TEMPORARY
	| K_TEMPSPACECAP
	| K_TERMINATOR
	| K_THAN
	| K_TIES
	| K_TLS
	| K_TOAST
	| K_TOKENIZER
	| K_TOLERANCE
	| K_TRANSACTION
	| K_TRANSFORM
	| K_TRICKLE
	| K_TRIGGER
	| K_TRUNCATE
	| K_TRUSTED
	| K_TUNING
	| K_TYPE
	| K_UDPARAMETER
	| K_UNCOMMITTED
	| K_UNCOMPRESSED
	| K_UNI
	| K_UNINDEXED
	| K_UNKNOWN
	| K_UNLIMITED
	| K_UNLISTEN
	| K_UNLOCK
	| K_UNPACKER
	| K_UNSEGMENTED
	| K_UPDATE
	| K_USAGE
	| K_VACUUM
	| K_VALIDATE
	| K_VALIDATOR
	| K_VALINDEX
	| K_VALUE
	| K_VALUES
	| K_VARYING
	| K_VERBOSE
	| K_VERTICA
	| K_VIEW
	| K_VOLATILE
	| K_WAIT
	| K_WEBHDFS_ADDRESS
	| K_WEBSERVICE_HOSTNAME
	| K_WEBSERVICE_PORT
	| K_WITHOUT
	| K_WORK
	| K_WRITE
	| K_YEAR
	| K_ZONE
;

bool_expression
:
	K_TRUE
	| K_FALSE
;

host_ip_address
:
	IPV4_ADDR
	| IPV6_ADDR
;

dataTypes
:
	binaryTypes
	| booleanTypes
	| charTypes
	| dateTypes
	| apNumericTypes
	| eNumericTypes
	| spatialTypes
	| uuidTypes
;

binaryTypes
:
	K_BINARY
	|
	(
		K_LONG K_VARBINARY
	)
	| K_VARBINARY
	| K_BYTEA
	| K_RAW
;

booleanTypes
:
	K_BOOLEAN
;

charTypes
:
	(
		K_LONG K_VARCHAR
	)
	| K_CHAR
	| K_VARCHAR
;

dateTypes
:
	(
		K_TIME K_WITH K_TIMEZONE
	)
	| K_DATE
	| K_TIME
	| K_SMALLDATETIME
	|
	(
		K_TIMESTAMP K_WITH K_TIMEZONE
	)
	|
	(
		K_INTERVAL K_DAY K_TO K_SECOND
	)
	|
	(
		K_INTERVAL K_YEAR K_TO K_MONTH
	)
	| K_TIMESTAMP
	| K_INTERVAL
;

apNumericTypes
:
	(
		K_DOUBLE K_PRECISION
	)
	|
	(
		K_FLOAT OPEN_PAREN DECIMAL CLOSE_PAREN
	)
	|
	(
		K_FLOAT8
	)
	| K_FLOAT
	|
	(
		K_REAL
	)
;

eNumericTypes
:
	K_BIGINT
	| K_INT8
	| K_SMALLINT
	| K_TINYINT
	| K_DECIMAL
	| K_NUMERIC
	| K_NUMBER
	| K_MONEY
	| K_INTEGER
	| K_INT
;

spatialTypes
:
	K_GEOMETRY
	| K_GEOGRAPHY
;

uuidTypes
:
	K_UUID
;