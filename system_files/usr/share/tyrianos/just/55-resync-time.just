# Force time resynchronisation (add timesyncd or chronyd as argument)
resync-time +METHOD:
    #!/usr/bin/bash
    METHOD="{{ METHOD }}"
    echo "TyrianOS Developer Tools: Forcing synchronisation..."
    case $METHOD in
      chronyd)
        echo "Restarting chronyd..."
        sudo systemctl restart chronyd || echo "FAIL"
      ;;
      timesyncd)
        echo "Restarting timesyncd..."
        sudo systemctl restart systemd-timesyncd.service || echo "FAIL"
      ;;
      *)
        echo "Unknown method $METHOD. Specify either chronyd or timesyncd."
        exit 1
      ;;
    esac
