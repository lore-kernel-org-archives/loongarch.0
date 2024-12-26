Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3554913E028
	for <loongarch@lists.linux.dev>; Thu, 26 Dec 2024 18:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237782; cv=none; b=e0XuhzU/JQcvzBa2H5nVFwBuyJ6BL1W3LY4xBwVmt//Clbna3ipOMuGGMguxFlTB6NFg92Lmst30ysYv5YK7teryD25zN7L9Qf11PkfkYVNOKyizzuyoObNTLUeCZJKI/nZBkUv4Iy1kPXU4Ilmi7ruNFgQB51RCW2UbPo75bFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237782; c=relaxed/simple;
	bh=WLctN9kaPb7/tmtQ6JvEuX8Oxyx3aY5Zprh2cytD4Q4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hqNJMG3Da2sP09XpahdJAusbgZ+mMaTDwMJUrY68PYUQrkxbw2kdvATdWdSzYzUGT4k0K5IMoNWbsMoojg52nB8GV3BbayYmo8IxWrD+Nm8/u/MsyfcUqdbEjNrlh+ZnqId4IeNUCWt6ahC5ndxs7B1OSe4EoW1tBLCctW4MY5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=TRjU1vt6; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="TRjU1vt6"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6dd1b895541so696826d6.0
        for <loongarch@lists.linux.dev>; Thu, 26 Dec 2024 10:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1735237779; x=1735842579; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ulc8YI8Od+RVUqdmJbEp8bNR29/8W69RWWEZTKBLmks=;
        b=TRjU1vt6FQZgak5H2JVu6jNmeNQYzft1tBESWA/QTCHhfDQvbsXwrkzghrZ+CzbtDU
         6eFA2AvIyDqdkSnQIc1RybNwGqGCqEReQXB/9HEEeYlrWjx4/JKCoLRzzvFy+pbLaofl
         VzzOLcQNaxPd1G9Lr2hYQwlONwOJQgqxynTwYMnm8O3uKsk5lnsLRc1ABvWdhoD5u6qT
         nh+g57LWePqXEoyBMevSegVXZYxvhLbLDyo5znqhBzb8hemBi5HzBbw87fvRCPpNVe5E
         rzIfXZiBhjRo9YLQPbtbGvMhcBeNu3rFUgUAwGu54lu+MBK6RMaeA2r18RhW+lP0l8KS
         jwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735237779; x=1735842579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ulc8YI8Od+RVUqdmJbEp8bNR29/8W69RWWEZTKBLmks=;
        b=nSaWaEFeocJ9ottqSxrRiWahSeAAPSF/YXI+DaMXMy4K63MB/sbN0v9mRFbvjB0Tm8
         8UubS50bX1bAKKp52avhji1l7dLTbh7+ZYFgVLT2x2LQz0C915vjx7cPEsGLQNDOHC85
         LaIzvN7ZMI1vYo+Pr8oRJ8qz3NBa5z+TXqwCgaHNkrcQbBz96ac8t/X+T437gNzXq7OJ
         N1vr5hKs31akWUblmPukDFHbsWTjtUlxD0c7YdqQ8HpTf2y5JrJQNFCdkTMNUMsr08Tc
         6fxc50bieDWubjGEu4hwTmKI6Jsut7J+F6KDHLCb/hoP0U+5J8CL1afrZ0S8+zYb/Kwj
         ge+g==
X-Forwarded-Encrypted: i=1; AJvYcCVpjeI4w1eJr4SAhhIXCmcAIn5UGhxu1gF5/fLTHz3jApdBm6Y+JaNb9Kpverltx/PchEQ+NM8kYs4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2yXIXCT64mKVr2nqeqDB1pr/BB2k9VLULIKudb22HKE2ov0T9
	JN5mjYgbvGG9sKv13x2rGT5URpp4rSCeJIM3+Vv7lChopzm3ScKNoW9i8yIiWMY=
X-Gm-Gg: ASbGncvKBnY78v7Bp/8ui1OzlS4V+iiENdDF/0vRyW6rb+gmvy+2O0EhH6Q5DuS+xzk
	Kv7LBahoZXO4TEzJJfZUGq/Isvu2n+Hrb58JvpVblavDSqn7kApz62cI3UJ3qWwixNmBDfbych2
	YeCIHkrLYgAzYXvP2/b0JepnIovQRJCETbcOoFsx+rG/lvWjf1WSIuB/TZ+FV6zJq2DedY3Ue7R
	f/GzXLCOpMb0HsVIoH4SxCXaWLluTou08+sCW+Y/V1Dim7kmcR+/oJAwx22Z+k=
X-Google-Smtp-Source: AGHT+IGunNgWGzawZSRYp426fRZ4HyEUdARE5RrkmmyWVpaqiWqMPRG0VVdcHlqGkSu5TnJeGImAmg==
X-Received: by 2002:a05:6214:250c:b0:6d8:8e0f:8c03 with SMTP id 6a1803df08f44-6dd2333737emr432315856d6.18.1735237779001;
        Thu, 26 Dec 2024 10:29:39 -0800 (PST)
Received: from localhost.localdomain ([184.169.45.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd181d52c2sm71619526d6.113.2024.12.26.10.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 10:29:38 -0800 (PST)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	kernel-team@meta.com,
	corbet@lwn.net,
	david@redhat.com,
	akpm@linux-foundation.org
Subject: [PATCH v4] mm: add build-time option for hotplug memory default online type
Date: Thu, 26 Dec 2024 11:29:18 -0700
Message-ID: <20241226182918.648799-1-gourry@gourry.net>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4: updated KConfig comments 

Memory hotplug presently auto-onlines memory into a zone the kernel
deems appropriate if CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=y.

The memhp_default_state boot param enables runtime config, but it's
not possible to do this at build-time.

Remove CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE, and replace it with
CONFIG_MHP_DEFAULT_ONLINE_TYPE_* choices that sync with the boot param.

Selections:
  CONFIG_MHP_DEFAULT_ONLINE_TYPE_OFFLINE
    => mhp_default_online_type = "offline"
       Memory will not be onlined automatically.

  CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_AUTO
    => mhp_default_online_type = "online"
       Memory will be onlined automatically in a zone deemed.
       appropriate by the kernel.

  CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_KERNEL
    => mhp_default_online_type = "online_kernel"
       Memory will be onlined automatically.
       The zone may allow kernel data (e.g. ZONE_NORMAL).

  CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_MOVABLE
    => mhp_default_online_type = "online_movable"
       Memory will be onlined automatically.
       The zone will be ZONE_MOVABLE.

Default to CONFIG_MHP_DEFAULT_ONLINE_TYPE_OFFLINE to match the
existing default CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=n behavior.

Existing users of CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=y should use
CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_AUTO.

Signed-off-by: Gregory Price <gourry@gourry.net>
Acked-by: David Hildenbrand <david@redhat.com>
---
 .../admin-guide/kernel-parameters.txt         |  4 +-
 .../admin-guide/mm/memory-hotplug.rst         |  4 +-
 arch/loongarch/configs/loongson3_defconfig    |  5 +-
 drivers/base/memory.c                         |  4 +-
 include/linux/memory_hotplug.h                |  5 +-
 mm/Kconfig                                    | 57 ++++++++++++++++---
 mm/memory_hotplug.c                           | 33 ++++++++---
 7 files changed, 89 insertions(+), 23 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c79691eee54f..9138fcd18260 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3351,8 +3351,8 @@
 			[KNL] Set the initial state for the memory hotplug
 			onlining policy. If not specified, the default value is
 			set according to the
-			CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE kernel config
-			option.
+			CONFIG_MHP_DEFAULT_ONLINE_TYPE kernel config
+			options.
 			See Documentation/admin-guide/mm/memory-hotplug.rst.
 
 	memmap=exactmap	[KNL,X86,EARLY] Enable setting of an exact
diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
index cb2c080f400c..33c886f3d198 100644
--- a/Documentation/admin-guide/mm/memory-hotplug.rst
+++ b/Documentation/admin-guide/mm/memory-hotplug.rst
@@ -280,8 +280,8 @@ The following files are currently defined:
 		       blocks; configure auto-onlining.
 
 		       The default value depends on the
-		       CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE kernel configuration
-		       option.
+		       CONFIG_MHP_DEFAULT_ONLINE_TYPE kernel configuration
+		       options.
 
 		       See the ``state`` property of memory blocks for details.
 ``block_size_bytes``   read-only: the size in bytes of a memory block.
diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index 4dffc90192f7..1cc6e8843680 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -113,7 +113,10 @@ CONFIG_ZBUD=y
 CONFIG_ZSMALLOC=m
 # CONFIG_COMPAT_BRK is not set
 CONFIG_MEMORY_HOTPLUG=y
-CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=y
+# CONFIG_MHP_DEFAULT_ONLINE_TYPE_OFFLINE is not set
+CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_AUTO=y
+# CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_KERNEL is not set
+# CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_MOVABLE is not set
 CONFIG_MEMORY_HOTREMOVE=y
 CONFIG_KSM=y
 CONFIG_TRANSPARENT_HUGEPAGE=y
diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index 67858eeb92ed..348c5dbbfa68 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -512,7 +512,7 @@ static ssize_t auto_online_blocks_show(struct device *dev,
 				       struct device_attribute *attr, char *buf)
 {
 	return sysfs_emit(buf, "%s\n",
-			  online_type_to_str[mhp_default_online_type]);
+			  online_type_to_str[mhp_get_default_online_type()]);
 }
 
 static ssize_t auto_online_blocks_store(struct device *dev,
@@ -524,7 +524,7 @@ static ssize_t auto_online_blocks_store(struct device *dev,
 	if (online_type < 0)
 		return -EINVAL;
 
-	mhp_default_online_type = online_type;
+	mhp_set_default_online_type(online_type);
 	return count;
 }
 
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index b27ddce5d324..eaac5ae8c05c 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -144,8 +144,6 @@ extern u64 max_mem_size;
 
 extern int mhp_online_type_from_str(const char *str);
 
-/* Default online_type (MMOP_*) when new memory blocks are added. */
-extern int mhp_default_online_type;
 /* If movable_node boot option specified */
 extern bool movable_node_enabled;
 static inline bool movable_node_is_enabled(void)
@@ -303,6 +301,9 @@ static inline void __remove_memory(u64 start, u64 size) {}
 #endif /* CONFIG_MEMORY_HOTREMOVE */
 
 #ifdef CONFIG_MEMORY_HOTPLUG
+/* Default online_type (MMOP_*) when new memory blocks are added. */
+extern int mhp_get_default_online_type(void);
+extern void mhp_set_default_online_type(int online_type);
 extern void __ref free_area_init_core_hotplug(struct pglist_data *pgdat);
 extern int __add_memory(int nid, u64 start, u64 size, mhp_t mhp_flags);
 extern int add_memory(int nid, u64 start, u64 size, mhp_t mhp_flags);
diff --git a/mm/Kconfig b/mm/Kconfig
index 7949ab121070..1b501db06417 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -550,20 +550,63 @@ menuconfig MEMORY_HOTPLUG
 
 if MEMORY_HOTPLUG
 
-config MEMORY_HOTPLUG_DEFAULT_ONLINE
-	bool "Online the newly added memory blocks by default"
-	depends on MEMORY_HOTPLUG
+choice
+	prompt "Memory Hotplug Default Online Type"
+	default MHP_DEFAULT_ONLINE_TYPE_OFFLINE
 	help
+	  Default memory type for hotplugged memory.
+
 	  This option sets the default policy setting for memory hotplug
 	  onlining policy (/sys/devices/system/memory/auto_online_blocks) which
 	  determines what happens to newly added memory regions. Policy setting
 	  can always be changed at runtime.
+
+	  The default is 'offline'.
+
+	  Select offline to defer onlining to drivers and user policy.
+	  Select auto to let the kernel choose what zones to utilize.
+	  Select online_kernel to generally allow kernel usage of this memory.
+	  Select online_movable to generally disallow kernel usage of this memory.
+
+	  Example kernel usage would be page structs and page tables.
+
 	  See Documentation/admin-guide/mm/memory-hotplug.rst for more information.
 
-	  Say Y here if you want all hot-plugged memory blocks to appear in
-	  'online' state by default.
-	  Say N here if you want the default policy to keep all hot-plugged
-	  memory blocks in 'offline' state.
+config MHP_DEFAULT_ONLINE_TYPE_OFFLINE
+	bool "offline"
+	help
+	  Hotplugged memory will not be onlined by default.
+	  Choose this for systems with drivers and user policy that
+	  handle onlining of hotplug memory policy.
+
+config MHP_DEFAULT_ONLINE_TYPE_ONLINE_AUTO
+	bool "auto"
+	help
+	  Select this if you want the kernel to automatically online
+	  hotplugged memory into the zone it thinks is reasonable.
+	  This memory may be utilized for kernel data.
+
+config MHP_DEFAULT_ONLINE_TYPE_ONLINE_KERNEL
+	bool "kernel"
+	help
+	  Select this if you want the kernel to automatically online
+	  hotplugged memory into a zone capable of being used for kernel
+	  data. This typically means ZONE_NORMAL.
+
+config MHP_DEFAULT_ONLINE_TYPE_ONLINE_MOVABLE
+	bool "movable"
+	help
+	  Select this if you want the kernel to automatically online
+	  hotplug memory into ZONE_MOVABLE. This memory will generally
+	  not be utilized for kernel data.
+
+	  This should only be used when the admin knows sufficient
+	  ZONE_NORMAL memory is available to describe hotplug memory,
+	  otherwise hotplug memory may fail to online. For example,
+	  sufficient kernel-capable memory (ZONE_NORMAL) must be
+	  available to allocate page structs to describe ZONE_MOVABLE.
+
+endchoice
 
 config MEMORY_HOTREMOVE
 	bool "Allow for memory hot remove"
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 3b6f93962481..e3655f07dd6e 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -219,11 +219,30 @@ void put_online_mems(void)
 
 bool movable_node_enabled = false;
 
-#ifndef CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE
-int mhp_default_online_type = MMOP_OFFLINE;
-#else
-int mhp_default_online_type = MMOP_ONLINE;
-#endif
+static int mhp_default_online_type = -1;
+int mhp_get_default_online_type(void)
+{
+	if (mhp_default_online_type >= 0)
+		return mhp_default_online_type;
+
+	if (IS_ENABLED(CONFIG_MHP_DEFAULT_ONLINE_TYPE_OFFLINE))
+		mhp_default_online_type = MMOP_OFFLINE;
+	else if (IS_ENABLED(CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_AUTO))
+		mhp_default_online_type = MMOP_ONLINE;
+	else if (IS_ENABLED(CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_KERNEL))
+		mhp_default_online_type = MMOP_ONLINE_KERNEL;
+	else if (IS_ENABLED(CONFIG_MHP_DEFAULT_ONLINE_TYPE_ONLINE_MOVABLE))
+		mhp_default_online_type = MMOP_ONLINE_MOVABLE;
+	else
+		mhp_default_online_type = MMOP_OFFLINE;
+
+	return mhp_default_online_type;
+}
+
+void mhp_set_default_online_type(int online_type)
+{
+	mhp_default_online_type = online_type;
+}
 
 static int __init setup_memhp_default_state(char *str)
 {
@@ -1328,7 +1347,7 @@ static int check_hotplug_memory_range(u64 start, u64 size)
 
 static int online_memory_block(struct memory_block *mem, void *arg)
 {
-	mem->online_type = mhp_default_online_type;
+	mem->online_type = mhp_get_default_online_type();
 	return device_online(&mem->dev);
 }
 
@@ -1575,7 +1594,7 @@ int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 		merge_system_ram_resource(res);
 
 	/* online pages if requested */
-	if (mhp_default_online_type != MMOP_OFFLINE)
+	if (mhp_get_default_online_type() != MMOP_OFFLINE)
 		walk_memory_blocks(start, size, NULL, online_memory_block);
 
 	return ret;
-- 
2.47.1

