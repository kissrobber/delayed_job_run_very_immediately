require "delayed_job_run_very_immediately/version"
require "delayed_job_active_record"

module DelayedJobRunVeryImmediately
  def self.included(base)
    base.class_eval do
      after_commit :after_commit_on_create_for_run_very_immediately, on: :create
    end
  end
  def after_commit_on_create_for_run_very_immediately
    obj = self.payload_object
    clazz = self.class
    if obj.respond_to?(:run_very_immediately?) && obj.run_very_immediately?
      now = clazz.db_time_now
      count = clazz.where(id: self.id).update_all(locked_at: now, locked_by: "run_very_immediately")
      if count == 1
        Delayed::Worker.new.run(clazz.find(self.id))
      end
    end
  end
end
::Delayed::Job.send(:include, DelayedJobRunVeryImmediately)
