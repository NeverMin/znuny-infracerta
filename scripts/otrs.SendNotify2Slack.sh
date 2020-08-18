#!/bin/bash 
#
# - Send notifications to Slack
# - Created by Infracerta Consultoria
#
# Variables
#
export OTRSIP="YOUROTRSIP"
export APIURL="YOURSLACKAPI"
export OTRSURL="http://${OTRSIP}/otrs/index.pl?Action=AgentTicketZoom;TicketID="
export TICKETID=`mysql -N -h ${OTRSIP} -u root -pjacare1 -e "select id from otrs.ticket ORDER BY id DESC LIMIT 1;"| grep -v "+--"`

# Generate json data
cat >/tmp/slack.json<<EOF
{
    "text": "New ticket",
    "blocks": [
        {
            "type": "section",
            "text": {
                "type": "mrkdwn",
                "text": "You have a new ticket in OTRS"
            }
        },
        {
            "type": "section",
            "block_id": "ticketurl",
            "text": {
                "type": "mrkdwn",
                "text": "${OTRSURL}${TICKETID}"
            }
        },
    ]
}
EOF

# Send notification
curl -X POST -H 'Content-type: application/json' -d @/tmp/slack.json ${APIURL}
