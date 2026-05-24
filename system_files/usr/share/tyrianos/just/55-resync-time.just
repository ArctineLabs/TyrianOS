# Force time resynchronisation
resync-time +METHOD:
    #!/usr/bin/bash
    METHOD="{{ METHOD }}"
    echo "TyrianOS Developer Tools: Forcing synchronisation..."
    case $METHOD in
      chronyd)
        echo "Restarting chronyd..."
        sudo systemctl restart chronyd || echo "FAIL"
      ;;
      *)
        sudo systemctl restart systemd-timesyncd.service || echo "FAIL"
      ;;
    esac
