LOCAL_PATH:= $(call my-dir)

common_cflags :=

common_src_files := \
  bio_ssl.c \
  d1_both.c \
  d1_enc.c \
  d1_lib.c \
  d1_pkt.c \
  d1_srtp.c \
  kssl.c \
  s23_clnt.c \
  s23_lib.c \
  s23_meth.c \
  s23_pkt.c \
  s23_srvr.c \
  s2_clnt.c \
  s2_enc.c \
  s2_lib.c \
  s2_meth.c \
  s2_pkt.c \
  s2_srvr.c \
  s3_both.c \
  s3_cbc.c \
  s3_clnt.c \
  s3_enc.c \
  s3_lib.c \
  s3_meth.c \
  s3_pkt.c \
  s3_srvr.c \
  ssl_algs.c \
  ssl_asn1.c \
  ssl_cert.c \
  ssl_ciph.c \
  ssl_err.c \
  ssl_err2.c \
  ssl_lib.c \
  ssl_rsa.c \
  ssl_sess.c \
  ssl_stat.c \
  ssl_txt.c \
  t1_clnt.c \
  t1_enc.c \
  t1_lib.c \
  t1_meth.c \
  t1_reneg.c \
  t1_srvr.c \
  tls_srp.c \

common_c_includes := \
  $(NDK_PROJECT_PATH) \
  $(NDK_PROJECT_PATH)/crypto \
  $(NDK_PROJECT_PATH)/include \

arm_clang_asflags :=

arm_cflags :=

arm_src_files :=

arm_exclude_files :=

arm64_clang_asflags :=

arm64_cflags :=

arm64_src_files :=

arm64_exclude_files :=

x86_clang_asflags :=

x86_cflags :=

x86_src_files :=

x86_exclude_files :=

# target
include $(CLEAR_VARS)
include $(LOCAL_PATH)/../clear_my_vars.mk
include $(LOCAL_PATH)/../android-config.mk

LOCAL_CFLAGS += $(common_cflags)
LOCAL_C_INCLUDES += $(common_c_includes)

LOCAL_SRC_FILES_arm += $(filter-out $(arm_exclude_files),$(common_src_files) $(arm_src_files))
LOCAL_CFLAGS_arm += $(arm_cflags)
LOCAL_CLANG_ASFLAGS_arm += $(arm_clang_asflags)

LOCAL_SRC_FILES_arm64 += $(filter-out $(arm64_exclude_files),$(common_src_files) $(arm64_src_files))
LOCAL_CFLAGS_arm64 += $(arm64_cflags)
LOCAL_CLANG_ASFLAGS_arm64 += $(arm64_clang_asflags)

LOCAL_SRC_FILES_x86 += $(filter-out $(x86_exclude_files),$(common_src_files) $(x86_src_files))
LOCAL_CFLAGS_x86 += $(x86_cflags)
LOCAL_CLANG_ASFLAGS_x86 += $(x86_clang_asflags)

ifeq ($(TARGET_ARCH),arm)
  LOCAL_SRC_FILES += $(LOCAL_SRC_FILES_arm)
  LOCAL_CFLAGS += $(LOCAL_CFLAGS_arm)
endif

ifeq ($(TARGET_ARCH_ABI),x86)
  LOCAL_SRC_FILES += $(LOCAL_SRC_FILES_x86)
  LOCAL_CFLAGS += $(LOCAL_CFLAGS_x86)
endif

LOCAL_SDK_VERSION := 9
LOCAL_SHARED_LIBRARIES += libcrypto
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libssl
include $(BUILD_SHARED_LIBRARY)

