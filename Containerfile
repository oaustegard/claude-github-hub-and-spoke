# GitHub CLI for Claude Code on the Web
# This gives your CCotw session `gh` — authenticated GitHub access to any repo
# your token can reach, enabling the hub/spoke working model.

# GitHub CLI — direct binary install (not in default apt repos)
RUN GH_VER=$(curl -sL https://api.github.com/repos/cli/cli/releases/latest | python3 -c "import sys,json; print(json.load(sys.stdin)['tag_name'].lstrip('v'))") && curl -fsSL "https://github.com/cli/cli/releases/download/v${GH_VER}/gh_${GH_VER}_linux_amd64.tar.gz" | tar -xz --strip-components=2 -C /usr/local/bin "gh_${GH_VER}_linux_amd64/bin/gh"

# Noop setup script to suppress "No setup script configured" message
RUN touch /home/user/setup.sh && chmod +x /home/user/setup.sh

SNAPSHOT /home/user/setup.sh
SNAPSHOT /usr/local/bin/gh
