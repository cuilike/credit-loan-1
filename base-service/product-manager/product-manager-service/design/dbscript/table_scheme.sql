CREATE TABLE product_manager.`product_type_config` (
  `id` varchar(36) NOT NULL COMMENT '数据id:业务无关性',
  `parent_id` varchar(36) DEFAULT NULL COMMENT '产品父类型数据id',
  `name` varchar(20) NOT NULL COMMENT '产品类型名称',
  `depth` int(11) NOT NULL COMMENT '产品类型深度',
  `remarks` varchar(100) DEFAULT NULL COMMENT '数据备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '数据版本',
  `update_user_id` varchar(36) NOT NULL COMMENT '数据更新用户id',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新日期id',
  `create_user_id` varchar(36) NOT NULL COMMENT '数据创建用户id',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COMMENT='产品类型表';

CREATE TABLE product_manager.`product_config` (
  `id` varchar(36) NOT NULL COMMENT '数据id:业务无关性',
  `code` varchar(10) NOT NULL COMMENT '产品编码',
  `name` varchar(20) NOT NULL COMMENT '产品名称',
  `type_id` varchar(36) NOT NULL COMMENT '产品类型id',
  `priority` int(4) NOT NULL COMMENT '产品优先级',
  `creditlimit_id` varchar(36) NOT NULL COMMENT '产品额度id',
  `effective` int(1) NOT NULL,
  `effective_date` datetime NOT NULL COMMENT '有效开始日期',
  `expire_date` varchar(45) NOT NULL,
  `remarks` varchar(100) DEFAULT NULL COMMENT '数据备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '数据版本',
  `update_user_id` varchar(36) NOT NULL COMMENT '数据更新用户id',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新日期id',
  `create_user_id` varchar(36) NOT NULL COMMENT '数据创建用户id',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_name_UNIQUE` (`code`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COMMENT='产品基础配置表';

CREATE TABLE product_manager.`product_config_change` (
  `id` varchar(36) NOT NULL COMMENT '数据id:业务无关性',
  `original_id` varchar(36) NOT NULL COMMENT '数据id:业务无关性',
  `code` varchar(10) NOT NULL COMMENT '产品编码',
  `name` varchar(20) NOT NULL COMMENT '产品名称',
  `type_id` varchar(36) NOT NULL COMMENT '产品类型id',
  `creditlimit_id` varchar(36) NOT NULL COMMENT '产品额度id',
  `priority` int(4) NOT NULL COMMENT '产品优先级',
  `effective` int(1) NOT NULL,
  `effective_date` datetime NOT NULL COMMENT '有效开始日期',
  `expire_date` varchar(45) NOT NULL,
  `remarks` varchar(100) DEFAULT NULL COMMENT '数据备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '数据版本',
  `update_user_id` varchar(36) NOT NULL COMMENT '数据更新用户id',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新日期id',
  `create_user_id` varchar(36) NOT NULL COMMENT '数据创建用户id',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_name_UNIQUE` (`code`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COMMENT='产品基础配置调整表';

CREATE TABLE product_manager.`product_config_snapshot` (
  `id` varchar(36) NOT NULL COMMENT '数据id:业务无关性',
  `original_id` varchar(36) NOT NULL COMMENT '数据id:业务无关性',
  `code` varchar(10) NOT NULL COMMENT '产品编码',
  `name` varchar(20) NOT NULL COMMENT '产品名称',
  `type_id` varchar(36) NOT NULL COMMENT '产品类型id',
  `creditlimit_id` varchar(36) NOT NULL COMMENT '产品额度id',
  `priority` int(4) NOT NULL COMMENT '产品优先级',
  `effective` int(1) NOT NULL,
  `effective_date` datetime NOT NULL COMMENT '有效开始日期',
  `expire_date` varchar(45) NOT NULL,
  `remarks` varchar(100) DEFAULT NULL COMMENT '数据备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '数据版本',
  `update_user_id` varchar(36) NOT NULL COMMENT '数据更新用户id',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新日期id',
  `create_user_id` varchar(36) NOT NULL COMMENT '数据创建用户id',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_name_UNIQUE` (`code`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COMMENT='产品基础配置快照表';

CREATE TABLE product_manager.`product_attribute_config` (
  `id` varchar(36) NOT NULL COMMENT '数据id:业务无关性',
  `product_id` varchar(36) NOT NULL COMMENT '产品id',
  `group` varchar(20) NOT NULL DEFAULT '1' COMMENT '扩展属性组',
  `index` int(11) NOT NULL COMMENT '扩展属性组索引',
  `name` varchar(20) NOT NULL COMMENT '产品扩展属性名称',
  `value` varchar(200) NOT NULL COMMENT '产品扩展属性值',
  `remarks` varchar(100) DEFAULT NULL COMMENT '数据备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '数据版本',
  `update_user_id` varchar(36) NOT NULL COMMENT '数据更新用户id',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新日期id',
  `create_user_id` varchar(36) NOT NULL COMMENT '数据创建用户id',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COMMENT='产品配置扩展属性表';

CREATE TABLE `creditlimit_config` (
  `id` varchar(36) NOT NULL,
  `product_id` varchar(36) NOT NULL COMMENT '产品id',
  `product_creditlimit_id` varchar(36) NOT NULL COMMENT '产品额度id',
  `loop_creditlimit` int(1) NOT NULL COMMENT '是否循环额度',
  `increase_creditlimit` int(1) NOT NULL COMMENT '是否可以提额',
  `decrease_creditlimit` int(1) NOT NULL COMMENT '是否可以降额',
  `min_creditlimit` decimal(24,2) NOT NULL COMMENT '最小额度',
  `max_creditlimit` decimal(24,2) NOT NULL COMMENT '最大额度',
  `effective_months` int(11) NOT NULL COMMENT '额度有效月数',
  `remarks` varchar(100) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '数据版本',
  `update_user_id` varchar(36) NOT NULL COMMENT '数据更新用户id',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新日期',
  `create_user_id` varchar(36) NOT NULL COMMENT '数据创建用户id',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品额度配置';


CREATE TABLE `creditlimit_class_config` (
  `id` varchar(36) NOT NULL COMMENT '数据id',
  `product_id` varchar(36) NOT NULL COMMENT '产品id',
  `type` int(11) NOT NULL COMMENT '额度类型',
  `ratio` decimal(3,2) NOT NULL COMMENT '占用总额度比例',
  `risk_level` int(11) NOT NULL COMMENT '额度风险级别',
  `remarks` varchar(100) DEFAULT NULL COMMENT '数据备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '数据版本',
  `update_user_id` varchar(36) NOT NULL COMMENT '数据更新用户id',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新日期',
  `create_user_id` varchar(36) NOT NULL COMMENT '数据创建用户id',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品额度类别配置';



CREATE TABLE `product_credit_config` (
  `id` varchar(36) NOT NULL COMMENT '数据id:业务无关性',
  `product_id` varchar(36) NOT NULL COMMENT '产品id',
  `apply_mutex_type` VARCHAR(20) NOT NULL DEFAULT '1' COMMENT '授信申请互斥类型',
  `use_blacklist_group_id` varchar(36) NOT NULL COMMENT '使用黑名单组id',
  `apply_max_day_duration` int(11) NOT NULL COMMENT '授信申请最大持续月数',
  `apply_flow_job_modle_id` varchar(36) NOT NULL COMMENT '授信申请流程模型',
  `interfere_days_after_reject` int(11) NOT NULL COMMENT '授信申请拒绝影响天数',
  `remarks` varchar(100) DEFAULT NULL COMMENT '数据备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '数据版本',
  `update_user_id` varchar(36) NOT NULL COMMENT '数据更新用户id',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新日期id',
  `create_user_id` varchar(36) NOT NULL COMMENT '数据创建用户id',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `un_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COMMENT='产品授信配置表';

CREATE TABLE `credit_apply_form_config` (
  `id` varchar(36) NOT NULL COMMENT '数据id',
  `product_id` varchar(36) NOT NULL COMMENT '产品id',
  `group` varchar(20) NOT NULL COMMENT '属性组',
  `index` varchar(20) NOT NULL COMMENT '属性组索引',
  `name` varchar(20) NOT NULL COMMENT '属性名称',
  `value` varchar(200) NOT NULL DEFAULT '0' COMMENT '属性值',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本',
  `update_user_id` varchar(36) NOT NULL COMMENT '数据更新用户id',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新日期',
  `create_user_id` varchar(36) NOT NULL COMMENT '创建数据用户id',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品授信申请表单配置';

CREATE TABLE `product_loan_config` (
  `id` varchar(36) NOT NULL COMMENT '数据id',
  `product_id` varchar(36) NOT NULL COMMENT '产品id',
  `flow_job_modle_id` varchar(36) NOT NULL COMMENT '贷款申请流程模型id',
  `min_single_loan_amount` decimal(24,2) NOT NULL COMMENT '最小单笔贷款金额',
  `max_single_loan_amount` decimal(24,2) NOT NULL COMMENT '最大单笔贷款金额',
  `loan_term_type` varchar(20) NOT NULL COMMENT '贷款期限类型',
  `min_single_loan_term` int(11) NOT NULL COMMENT '最小单笔贷款期限',
  `max_single_loan_term` int(11) NOT NULL COMMENT '最大单笔贷款期限',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本',
  `update_user_id` varchar(36) NOT NULL COMMENT '数据更新用户id',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新日期',
  `create_user_id` varchar(36) NOT NULL COMMENT '创建数据用户id',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品贷款配置';

CREATE TABLE `loan_price_config` (
  `id` varchar(36) NOT NULL COMMENT '数据id',
  `name` varchar(36) NOT NULL COMMENT '贷款定价名称',
  `product_id` varchar(36) NOT NULL COMMENT '产品id',
  `repayment_strategy` varchar(20) NOT NULL COMMENT '还款策略类型',
  `min_single_loan_amount` decimal(24,2) NOT NULL COMMENT '最小单笔贷款金额',
  `max_single_loan_amount` decimal(24,2) NOT NULL COMMENT '最大单笔贷款金额',
  `loan_term_type` varchar(20) NOT NULL COMMENT '贷款期限类型',
  `min_single_loan_term` int(11) NOT NULL COMMENT '最小单笔贷款期限',
  `max_single_loan_term` int(11) NOT NULL COMMENT '最大单笔贷款期限',
  `poundage_rate` decimal(7,5) NOT NULL COMMENT '手续费率',
  `interest_rate` decimal(7,5) NOT NULL,
  `partner_enable` tinyint(1) NOT NULL DEFAULT '0',
  `partner_id` varchar(36) DEFAULT NULL,
  `partner_discount_charges_rate` decimal(7,5) DEFAULT NULL,
  `loan_extension_enable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启展期',
  `loan_extension_max_count` int(11) NOT NULL COMMENT '最大展期次数',
  `loan_extension_max_total_term` int(11) NOT NULL COMMENT '最大展期累计期数',
  `loan_extension_max_term` int(11) NOT NULL COMMENT '最大展期期数',
  `loan_extension_interest_rate` decimal(7,5) NOT NULL COMMENT '展期利率',
  `loan_overdue_enable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启逾期',
  `loan_overdue_max_count` int(11) NOT NULL COMMENT '最大逾期次数',
  `loan_overdue_max_total_term` int(11) NOT NULL COMMENT '最大逾期累计期数',
  `loan_overdue_max_term` int(11) NOT NULL COMMENT '最大逾期期数',
  `loan_overdue_interest_rate` decimal(7,5) NOT NULL COMMENT '逾期利率',
  `early_repayment_enable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '提前还款配置',
  `early_repayment_interest_rate` decimal(7,5) NOT NULL COMMENT '提前还款利率期限',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本',
  `update_user_id` varchar(36) NOT NULL COMMENT '数据更新用户id',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新日期',
  `create_user_id` varchar(36) NOT NULL COMMENT '创建数据用户id',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品贷款定价配置';

