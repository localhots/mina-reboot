require 'rake'

namespace :reboot do
  task :save_startup_script do
    unless settings.on_reboot?
      queue %| echo "-----> No reboot commands given" |
      next
    end

    script_path = "#{deploy_to}/#{shared_path}/startup.sh"
    log_path = "#{deploy_to}/#{shared_path}/startup.log"

    script = "#!/bin/bash\n"
    crontab_task = "@reboot #{script_path} > #{log_path} #minareboot"

    isolate do
      fetch(:on_reboot).call
      script << commands.join(" && \\\n")
    end

    queue  %| echo "-----> Updating startup script" |
    queue! %| echo '#{script}' > #{script_path} |
    queue! %| chmod +x #{script_path} |

    queue  %| echo "-----> Updating @reboot cron task" |
    queue! %| [[ $(crontab -l) != *minareboot* ]] && cat <(crontab -l) <(echo "#{crontab_task}") \| crontab - \|\| true |
  end
end
