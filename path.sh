# Load Composer tools
export PATH=$PATH:$HOME/.composer/vendor/bin

# Load Node global installed binaries
export PATH=$PATH:$HOME/.node/bin

# Use project specific binaries before global ones
export PATH=$PATH:node_modules/.bin:vendor/bin

export PATH=$PATH:/opt/homebrew/opt/mysql-client/bin

# Android
export ANDROID_HOME=~/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools
