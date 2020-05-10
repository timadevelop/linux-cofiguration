eadback-display synchronization method
#0: no sync, 1: D lags behind one frame, 2: fully synced
# export PRIMUS_SYNC=${PRIMUS_SYNC:-0}

# Verbosity level
#0: only errors, 1: warnings (default), 2: profiling
#export PRIMUS_VERBOSE=${PRIMUS_VERBOSE:2}

# Secondary display
export PRIMUS_DISPLAY=${PRIMUS_DISPLAY:-:8}

# "Accelerating" libGL
# $LIB will be interpreted by the dynamic linker
# export PRIMUS_libGLa=${PRIMUS_libGLa:-'/usr/$LIB/libGL.so.1'}
export PRIMUS_libGLa=${PRIMUS_libGLa:-'/usr/lib/nvidia-bumblebee/libGL.so.1'}

# "Displaying" libGL
# export PRIMUS_libGLd=${PRIMUS_libGLd:-'/usr/$LIB/libGL.so.1'}
export PRIMUS_libGLd=${PRIMUS_libGLd:-'/usr/lib/nvidia-bumblebee/libGL.so.1'}

# Directory containing primus libGL
#PRIMUS_libGL='/usr/$LIB/nvidia-bumblebee/'
PRIMUS_libGL='/usr/$lib/nvidia-bumblebee/'

# On some distributions, e.g. on Gentoo, libnvidia-tls.so is not available
# in default search paths.  Add its path manually after the primus library
#PRIMUS_libGL=${PRIMUS_libGL}:/usr/$LIB/opengl/nvidia/lib

# Mesa drivers need a few symbols to be visible
export PRIMUS_LOAD_GLOBAL=${PRIMUS_LOAD_GLOBAL:-'libglapi.so.0'}

# Need functions from primus libGL to take precedence
export LD_LIBRARY_PATH=${PRIMUS_libGL}${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}

# And go!
exec "$@"
