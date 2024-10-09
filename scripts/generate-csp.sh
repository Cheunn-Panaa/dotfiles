#!/bin/bash

# Function to display usage/help
usage() {
    echo "Usage: $0 template_file --hosts=\"host1,host2,...\" --env=\"environment\""
    echo ""
    echo "Options:"
    echo "  template_file    The template file to use."
    echo "  --hosts           Comma-separated list of hostnames. (e.g, steeple.com, steeple.fr, steeple-rct.com)"
    echo "  --env            The environment (e.g., prd, rct)."
    exit 1
}
# Check if at least 3 arguments are provided (template file, --host, and --env)
if [ "$#" -lt 3 ]; then
    usage
fi

# The first argument is the template file
TEMPLATE_FILE=$1
shift

hosts=""
env=""

# Parse options
while [ "$#" -gt 0 ]; do
    case "$1" in
        --hosts=*)
            hosts="${1#*=}"
            ;;
        --env=*)
            env="${1#*=}"
            ;;
        *)
            echo "Unknown option: $1"
            usage
            ;;
    esac
    shift
done

# Check if template file exists
if [ ! -f "$TEMPLATE_FILE" ]; then
    echo "Error: Template file '$TEMPLATE_FILE' not found."
    exit 1
fi

# Validate that both --host and --env are provided
if [ -z "$hosts" ] || [ -z "$env" ]; then
    echo "Error: Both --hosts and --env options must be specified."
    usage
fi

# Read the CSP_TEMPLATE content from the file
CSP_TEMPLATE=$(cat "$TEMPLATE_FILE")

# Prepare the replacement string by concatenating all remaining arguments
REPLACEMENT=""
IFS=',' read -ra HOSTS <<< "$hosts"
for HOST in "${HOSTS[@]}"
do
    if [ -n "$REPLACEMENT" ]; then
        REPLACEMENT="$REPLACEMENT "
    fi
    REPLACEMENT="$REPLACEMENT*.${HOST}"
done

# Replace ${STEEPLE_HOST} with the provided hosts
CSP=$(echo "$CSP_TEMPLATE" | sed "s/\\\${STEEPLE_HOST}/$REPLACEMENT/g")
# Replace ${ENV} with the provided environment
CSP=$(echo "$CSP" | sed "s/\\\${ENV}/$env/g")

echo -e "Now you can copy and paste the following lines to your configmap:\n"
# Print the final CSP header
echo "$CSP"
