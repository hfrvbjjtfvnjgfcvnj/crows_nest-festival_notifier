import os

class NotifierFunctor:
  def __init__(self):
    pass
  
  def __call__(self,config,title,msg_text,priority,sound,url):
    festival_notifier_alert_on=config.get("festival_notifier_alert_on",[]);
    if "*" is in festival_notifier_alert_on or sound is in festival_notifier_alert_on:
        cmd="/opt/crows_nest/festival_alert/falert.sh '%s' '%s' '%d' '%s' '%s' " %(title,msg_text,priority,sound,url);
        os.system(cmd);
    

