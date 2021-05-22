#cloud-config
  
runcmd:
  - su opc
  - cd /home/opc/
  - export LOG=/home/opc/boot.log
  - export APPDIR=/home/opc/usage_reports_to_adw
  - export CRED=$APPDIR/config.user
  - export WALLET=/home/opc/wallet.zip
  - chown opc:opc $LOG
  - echo "Start process at `date`" > $LOG

  # Setup Packages from GitHub if image is oracle
  - if [ "${image_option}" = "oracle" ]; 
  - then
  -    su - opc -c 'bash -c "$(curl -L https://github.com/oracle/oci-python-sdk/blob/master/examples/usage_reports_to_adw/setup/setup_packages.sh?raw=true)"' >>$LOG
  -    if [ $? -eq 0 ]; then
  -       echo "   Download and Executed setup_packages.sh" | tee -a $LOG
  -    else
  -       echo "   Cannot download and execute setup_packages.sh" | tee -a $LOG
  -       exit 1
  -    fi
  - fi

  # Create the adw properties file
  - echo "Post variables into config.user file." >> $LOG
  - echo "DATABASE_USER=USAGE" > $CRED   
  - echo "DATABASE_NAME=${db_db_name}_low" >> $CRED
  - echo "DATABASE_PASS=${db_app_password}" >> $CRED 
  - echo "DATABASE_ADMIN=${db_admin_password}" >> $CRED
  - echo "EXTRACT_DATE=${extract_from_date}" >> $CRED
  - echo "TAG_SPECIAL=${extract_tag_special_key}" >> $CRED
  - chwon opc:opc $CRED

  # Save wallet to file
  - curl -L http://169.254.169.254/opc/v1/instance/metadata | jq --raw-output '.wallet_file' > wallet_file
  - base64 --decode wallet_file > $WALLET
  - chown opc:opc $WALLET
  - rm -f wallet_File

  # Sleep 60 seconds to wait for the policy to be created 
  - echo "Waiting 60 seconds before execution" >> $LOG
  - sleep 60

  # Continue Setup using setup_usage2adw.sh
  - echo "Executing setup_usage2adw.sh" >> $LOG
  - su - opc -c '/home/opc/usage_reports_to_adw/setup/setup_usage2adw.sh' >>$LOG

final_message: "The system is finally up, after $UPTIME seconds"
  

