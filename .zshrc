export EDITOR='vim'
# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="~/android-sdk-macosx/tools:~/android-sdk-macosx/platforms:~/android-sdk-macosx/platform-tools:/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

NDK="/Users/johanneschristenson/android-ndk-r10d"
export NDK
ANDROID_NDK="/Users/johanneschristenson/android-ndk-r10d"
export ANDROID_NDK

QTDIR="/Users/johanneschristenson/Qt/5.7/clang_64"
export QTDIR

export PATH="/Users/johanneschristenson/Library/Python//3.6/bin:$PATH"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# Powerline
if [[ -r /Users/johanneschristenson/Library/Python/3.6/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source /Users/johanneschristenson/Library/Python/3.6/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh
fi
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
