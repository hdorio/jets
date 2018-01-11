class Jets::Cfn::TemplateMappers
  class ConfigRuleMapper
    # task is a Jets::Job::Task
    def initialize(task)
      @task = task
    end

    # Example: "ConfigRuleSecurityRuleProtect"
    def logical_id
      "#{full_task_name}ConfigRule"
    end

    # Example: "SecurityRuleProtectLambdaFunction"
    def lambda_function_logical_id
      "#{full_task_name}LambdaFunction"
    end

    # Example: SecurityRuleProtectConfigRulePermission
    def permission_logical_id
      "#{full_task_name}ConfigRulePermission"
    end

  private
    # Full camelized task name including the class
    # Example: SecurityRuleProtect
    def full_task_name
      class_name = @task.class_name
      task_name = @task.meth.to_s.camelize
      "#{class_name}#{task_name}"
    end
  end
end

