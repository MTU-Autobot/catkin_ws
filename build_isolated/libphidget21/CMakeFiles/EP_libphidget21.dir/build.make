# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ubuntu/catkin_ws/src/phidgets_drivers/libphidget21

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/catkin_ws/build_isolated/libphidget21

# Utility rule file for EP_libphidget21.

# Include the progress variables for this target.
include CMakeFiles/EP_libphidget21.dir/progress.make

CMakeFiles/EP_libphidget21: CMakeFiles/EP_libphidget21-complete


CMakeFiles/EP_libphidget21-complete: EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-install
CMakeFiles/EP_libphidget21-complete: EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-mkdir
CMakeFiles/EP_libphidget21-complete: EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-download
CMakeFiles/EP_libphidget21-complete: EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-update
CMakeFiles/EP_libphidget21-complete: EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-patch
CMakeFiles/EP_libphidget21-complete: EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-configure
CMakeFiles/EP_libphidget21-complete: EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-build
CMakeFiles/EP_libphidget21-complete: EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-install
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/catkin_ws/build_isolated/libphidget21/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'EP_libphidget21'"
	/usr/bin/cmake -E make_directory /home/ubuntu/catkin_ws/build_isolated/libphidget21/CMakeFiles
	/usr/bin/cmake -E touch /home/ubuntu/catkin_ws/build_isolated/libphidget21/CMakeFiles/EP_libphidget21-complete
	/usr/bin/cmake -E touch /home/ubuntu/catkin_ws/build_isolated/libphidget21/EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-done

EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-install: EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/catkin_ws/build_isolated/libphidget21/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "No install step for 'EP_libphidget21'"
	cd /home/ubuntu/catkin_ws/build_isolated/libphidget21/libphidget21-src && /usr/bin/cmake -E echo_append
	cd /home/ubuntu/catkin_ws/build_isolated/libphidget21/libphidget21-src && /usr/bin/cmake -E touch /home/ubuntu/catkin_ws/build_isolated/libphidget21/EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-install

EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/catkin_ws/build_isolated/libphidget21/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Creating directories for 'EP_libphidget21'"
	/usr/bin/cmake -E make_directory /home/ubuntu/catkin_ws/build_isolated/libphidget21/libphidget21-src
	/usr/bin/cmake -E make_directory /home/ubuntu/catkin_ws/build_isolated/libphidget21/libphidget21-src
	/usr/bin/cmake -E make_directory /home/ubuntu/catkin_ws/build_isolated/libphidget21/EP_libphidget21-prefix
	/usr/bin/cmake -E make_directory /home/ubuntu/catkin_ws/build_isolated/libphidget21/EP_libphidget21-prefix/tmp
	/usr/bin/cmake -E make_directory /home/ubuntu/catkin_ws/build_isolated/libphidget21/EP_libphidget21-prefix/src/EP_libphidget21-stamp
	/usr/bin/cmake -E make_directory /home/ubuntu/catkin_ws/build_isolated/libphidget21/EP_libphidget21-prefix/src
	/usr/bin/cmake -E touch /home/ubuntu/catkin_ws/build_isolated/libphidget21/EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-mkdir

EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-download: EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-urlinfo.txt
EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-download: EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/catkin_ws/build_isolated/libphidget21/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Performing download step (download, verify and extract) for 'EP_libphidget21'"
	/usr/bin/cmake -P /home/ubuntu/catkin_ws/build_isolated/libphidget21/EP_libphidget21-prefix/src/EP_libphidget21-stamp/download-EP_libphidget21.cmake
	/usr/bin/cmake -P /home/ubuntu/catkin_ws/build_isolated/libphidget21/EP_libphidget21-prefix/src/EP_libphidget21-stamp/verify-EP_libphidget21.cmake
	/usr/bin/cmake -P /home/ubuntu/catkin_ws/build_isolated/libphidget21/EP_libphidget21-prefix/src/EP_libphidget21-stamp/extract-EP_libphidget21.cmake
	/usr/bin/cmake -E touch /home/ubuntu/catkin_ws/build_isolated/libphidget21/EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-download

EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-update: EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/catkin_ws/build_isolated/libphidget21/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "No update step for 'EP_libphidget21'"
	/usr/bin/cmake -E echo_append
	/usr/bin/cmake -E touch /home/ubuntu/catkin_ws/build_isolated/libphidget21/EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-update

EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-patch: EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/catkin_ws/build_isolated/libphidget21/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "No patch step for 'EP_libphidget21'"
	/usr/bin/cmake -E echo_append
	/usr/bin/cmake -E touch /home/ubuntu/catkin_ws/build_isolated/libphidget21/EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-patch

EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-configure: EP_libphidget21-prefix/tmp/EP_libphidget21-cfgcmd.txt
EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-configure: EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-update
EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-configure: EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/catkin_ws/build_isolated/libphidget21/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Performing configure step for 'EP_libphidget21'"
	cd /home/ubuntu/catkin_ws/build_isolated/libphidget21/libphidget21-src && ./configure
	cd /home/ubuntu/catkin_ws/build_isolated/libphidget21/libphidget21-src && /usr/bin/cmake -E touch /home/ubuntu/catkin_ws/build_isolated/libphidget21/EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-configure

EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-build: EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/catkin_ws/build_isolated/libphidget21/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Performing build step for 'EP_libphidget21'"
	cd /home/ubuntu/catkin_ws/build_isolated/libphidget21/libphidget21-src && make "CFLAGS=-g -O2 -Wno-incompatible-pointer-types -Wno-deprecated-declarations"
	cd /home/ubuntu/catkin_ws/build_isolated/libphidget21/libphidget21-src && /usr/bin/cmake -E copy_if_different /home/ubuntu/catkin_ws/build_isolated/libphidget21/libphidget21-src/phidget21.h /home/ubuntu/catkin_ws/devel_isolated/libphidget21/include/libphidget21
	cd /home/ubuntu/catkin_ws/build_isolated/libphidget21/libphidget21-src && /usr/bin/cmake -E copy_if_different /home/ubuntu/catkin_ws/build_isolated/libphidget21/libphidget21-src/.libs/libphidget21.so.0.0.0 /home/ubuntu/catkin_ws/devel_isolated/libphidget21/lib
	cd /home/ubuntu/catkin_ws/build_isolated/libphidget21/libphidget21-src && /usr/bin/cmake -E create_symlink libphidget21.so.0 /home/ubuntu/catkin_ws/devel_isolated/libphidget21/lib/libphidget21.so
	cd /home/ubuntu/catkin_ws/build_isolated/libphidget21/libphidget21-src && /usr/bin/cmake -E create_symlink libphidget21.so.0.0.0 /home/ubuntu/catkin_ws/devel_isolated/libphidget21/lib/libphidget21.so.0
	cd /home/ubuntu/catkin_ws/build_isolated/libphidget21/libphidget21-src && /usr/bin/cmake -E touch /home/ubuntu/catkin_ws/build_isolated/libphidget21/EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-build

EP_libphidget21: CMakeFiles/EP_libphidget21
EP_libphidget21: CMakeFiles/EP_libphidget21-complete
EP_libphidget21: EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-install
EP_libphidget21: EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-mkdir
EP_libphidget21: EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-download
EP_libphidget21: EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-update
EP_libphidget21: EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-patch
EP_libphidget21: EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-configure
EP_libphidget21: EP_libphidget21-prefix/src/EP_libphidget21-stamp/EP_libphidget21-build
EP_libphidget21: CMakeFiles/EP_libphidget21.dir/build.make

.PHONY : EP_libphidget21

# Rule to build all files generated by this target.
CMakeFiles/EP_libphidget21.dir/build: EP_libphidget21

.PHONY : CMakeFiles/EP_libphidget21.dir/build

CMakeFiles/EP_libphidget21.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/EP_libphidget21.dir/cmake_clean.cmake
.PHONY : CMakeFiles/EP_libphidget21.dir/clean

CMakeFiles/EP_libphidget21.dir/depend:
	cd /home/ubuntu/catkin_ws/build_isolated/libphidget21 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/catkin_ws/src/phidgets_drivers/libphidget21 /home/ubuntu/catkin_ws/src/phidgets_drivers/libphidget21 /home/ubuntu/catkin_ws/build_isolated/libphidget21 /home/ubuntu/catkin_ws/build_isolated/libphidget21 /home/ubuntu/catkin_ws/build_isolated/libphidget21/CMakeFiles/EP_libphidget21.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/EP_libphidget21.dir/depend

