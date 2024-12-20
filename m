Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD15721D5AA
	for <loongarch@lists.linux.dev>; Fri, 20 Dec 2024 21:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734728835; cv=none; b=JQuzr7x3l+8gvvr8+qRXbxwKCk8ngyVSvMzbmh/ulVyg0MCH0VJ/cfDao+Ton7aDFxDNM9jBnCUq8Ubl/7WSl1jTwZxz3sLhfYMewXKipuUs4ZWeiFhg93uQ8xbPCi6kLjoJtcCqA1h/O/TF4UBHrSnIuQ5ADUMuXcaI2wMy9p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734728835; c=relaxed/simple;
	bh=wNyI1pb9nzo4AeH2RPqwlbbYAKIClRVwcXnIMvHJlxY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UxfT83aWT/oNIJpdZT0GB7Aa+AdbGivfyZ+9KKjWkBvEbWXdmZCS0UTYbGv+cahD999RSwawrAGALJucSdYn24zTvEjkccwZXdvFTWA7al5RqiP6uZUPyL7m8L7ZoKPuE0bopdIbTgDgQV9I/4BL0JRMb4qyizTASdYac/VhZQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=cIdSnOL+; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="cIdSnOL+"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-46783d44db0so21624931cf.1
        for <loongarch@lists.linux.dev>; Fri, 20 Dec 2024 13:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1734728833; x=1735333633; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FBnwh1px/ppyY9TXnXI5D+rrc/T3rbUUoO/nhganj2U=;
        b=cIdSnOL+aAzvH0DWZTsReq1MdfAi64XYiZDh0+kuhAiJSlb4tIqCUiLRGbp3/n2Gpj
         cPq0/tN+q++1nFHM9B2oBIjy90m77qNSWYdhlP1tcyIipT9bTWrbVOKaitEO+DaBmCZg
         GaYyKPEsCNKtteZtevET13ok86bZZmdGi3DOkkQxYlAN9Bg2ToEhqT539BnjPeLqJedu
         ZTDbYj1tR9WBaCgM/8jPOcm9dXvz+DvzsC150z+QW/i5OgEHPXTonuBcBLU/y/iEB2qN
         31WNNbiKzGAnzZjROuYvZjJ0LCXeHkNc2V3NqoTNuMIVscq79qzX2k0pZ60vlFfbv/KB
         /gWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734728833; x=1735333633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FBnwh1px/ppyY9TXnXI5D+rrc/T3rbUUoO/nhganj2U=;
        b=UJx7/W+UV+cvZ819LgZUIzIMUuTULDiZeoMJuCyALmP5LWqi7eqq63dkaHzO6Jwyia
         tLmx7Syw1eC5Z+n/MLH9CyqqqII0gelk5hMwydu7XGtgFDvPn4tk1UELcFskJw30z0UX
         51jk8/B9oTHKHZ8YhQZenOm8PeJJEpuxSn8AiNQ0tLQot/OsP8jQCGvv71q2G8f18LpZ
         Tf3aRmStf57CKehqBfVvGdgA0OntSqsw6LcgLcP+WCDEGQ2YDgqQFMUf6RJykgC6dyTC
         OotAsJSMbV3ykz1Ok9POAjvCQMaN5KJDXV2kHmTWG6GF7ycu2w/Qiva8jUZ38mTFkKss
         duWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEyycvyDTK+eX0KAqglaNFVbdJotkISymajMQUPejOwJ14He1p55eb3RRqByTE6Lneuh6AbEw5SuU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8p1rjSj5luHPo1P8r725QYMcR7+AF675d+YZ7L+cFQzlrNxA0
	7mpB6Kcjn6Wv2++a/BlbowEhmcyV4XAtP5933hPZxe3ayH95VmX/lX5BvKLiA2o=
X-Gm-Gg: ASbGncsl8uOsOAUVi/tUX/402DOZhXN9SSFkAfGgZ12RzvKWAacBRrP2G92jp321Uvl
	Xqi+U5EhRtRAz+ANsbTrJwmwQSPj4fKQKkdwOqyw22XnjScMTIcwUfR0JYrnSq+cg8UCaQFAlB9
	z34nFIphGCL6nvrrJR0yhyWpQIAVJl0B35nUd5edkzs6acDEu3noFB7LvpvtnIBk34f25vDsMkt
	r0qTP1h1NSyRmxQMjIe1Rro0ih5tWrFobm7SllL5krSDpa0/GNUhPIZGY9V4Z3ZAG5+Hua66LFJ
	XsyNCx/lfDWpbWzQqxLs1oMN55sHZUsvWS3mmT2kUaNQ
X-Google-Smtp-Source: AGHT+IE0fytysCaD+QZqQMNx4pmUQoDDsSg7GEVZ/PqcYQhdzeLx+0aGMZuHIAdln0YzE4SsS6toFw==
X-Received: by 2002:a05:622a:cf:b0:467:b649:6a46 with SMTP id d75a77b69052e-46a4a96c043mr73079801cf.42.1734728832666;
        Fri, 20 Dec 2024 13:07:12 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3e653f2dsm20403971cf.4.2024.12.20.13.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 13:07:12 -0800 (PST)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	kernel-team@meta.com,
	corbet@lwn.net,
	david@redhat.com,
	osalvador@suse.de,
	akpm@linux-foundation.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	gregkh@linuxfoundation.org,
	rafael@kernel.org
Subject: [PATCH v3] mm: add build-time option for hotplug memory default online type
Date: Fri, 20 Dec 2024 16:07:09 -0500
Message-ID: <20241220210709.300066-1-gourry@gourry.net>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index 7949ab121070..af163dbbaab1 100644
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
+	  Default memory type for driver managed hotplug memory.
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
+	  Driver managed memory will not be onlined by default.
+	  Choose this for systems with drivers and user policy that
+	  handle onlining of hotplug memory policy.
+
+config MHP_DEFAULT_ONLINE_TYPE_ONLINE_AUTO
+	bool "auto"
+	help
+	  Select this if you want the kernel to automatically online
+	  memory into the zone it thinks is reasonable. This memory
+	  may be utilized for kernel data (e.g. page tables).
+
+config MHP_DEFAULT_ONLINE_TYPE_ONLINE_KERNEL
+	bool "kernel"
+	help
+	  Select this if you want the kernel to automatically online
+	  hotplug memory into a zone capable of being used for kernel
+	  data (e.g. page tables). This typically means ZONE_NORMAL.
+
+config MHP_DEFAULT_ONLINE_TYPE_ONLINE_MOVABLE
+	bool "movable"
+	help
+	  Select this if you want the kernel to automatically online
+	  hotplug memory into ZONE_MOVABLE. This memory will generally
+	  not be utilized for kernel data (e.g. page tables).
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

