package com.sixliu.creditloan.workflow.service;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.validation.annotation.Validated;

/**
*@author:MG01867
*@date:2018年9月6日
*@E-mail:359852326@qq.com
*@version:
*@describe 流程配置服务
*/
@FeignClient("workflow-manager")
@Validated
public interface WorkflowConfigService {

}