Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A6D39E194
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 06:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445995; cv=none; b=TLpE0FgH5asOS5cTnz+0VGzj3HTebqWgR8ABMIQWLSBur5BcKpHq0yODxB8mXo7Gv+WecXawS8rQR1mbVajJcwsT5kdGD9GfeoY30FZSOJgvazHJO931KVEemJwnByOgNzmzbuk3XY3jhJoM5M9WIoB83H/TH8wQFiYvVAZ3C/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445995; c=relaxed/simple;
	bh=18l+fhXsr0FIoD6ma0m0oV997W8UN5RJPyEXvUsYpxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OVoJJDmzU664u2nprIxDZiR9rkoyvkB+kmvlz0K3sZEtRlqHGypfQgm/yeIgGXQ8AW705O2sgJnINH1YSPipjv4S0Zl+owUwHnLfD2Fobf+qYh5+RVNmBPKKR+vcF3+bKGMb9EYJvFw1eOx7rhrL6Wmbu+siYmJLu+nRzTtUv5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EaoxOOUs; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EaoxOOUs"
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-c736261ee8dso4531581a12.1
        for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 23:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777445993; x=1778050793; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuWPT+XdRkD5quZoMJ/j/U0upX+W05bC344BAJoReBo=;
        b=EaoxOOUsKohUU/GLxbPbJ+eEhULcNEEDjWOcgMtW86viWwMSSFtyRJEFqWP7wjW4FG
         ICaFgj1a7jsNngddLAXCQ1nmvzfAklwvxyT7LO5lJlJM9BKU8MU/+e31XKm89W89Utmo
         vC4lgWEXyFQeETFemIoHQEO+pDt2AQnxC4aOPYI677us9bg6RDp0GB0krH5sG7gHzI2f
         CVVgBJ2qQn843xSDcY8LRSWiKmfCs2W+jrPwB64fs3Rn31btdPIrEi58OYjB1i8w6Ohy
         oQE8zg+yZ5g704PCrzG7t7r5yLlLgFRAWNnedOqVLqaf0BwpmOF9iMu7T3gSgpmSftUZ
         fSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445993; x=1778050793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nuWPT+XdRkD5quZoMJ/j/U0upX+W05bC344BAJoReBo=;
        b=bPW7+YtiG006m0zkTMApd4zl7L5zxI5HoMvfip5be8nDS6q+Pu3tb+cWdwk3wH1B+M
         6vlTTTZWGSONQZYQXCQmgHOTymerJWhunP7j52MHbS7USJsUAVmZ64B9Y6gVAR24yJIJ
         kapKUbnP9RM0NH3TfXITpK9ZMs5OT4iFt3oZ+MQqZpo0g8/1f/qVR1tHHrKZCS3pO8Yo
         RODOrZMmDLrVRAxpMJMxuzWWrqgEFMMzQ44IHWRAJ5fqimal3ETmuMJuh9gij3LuTsL5
         ZdpYvVxG55EfEpQNTGk2ZnC+zL1ZMTu0DSehXwJjh2+NjzQ2+83soHx4x4gPBbOjc3si
         NObA==
X-Forwarded-Encrypted: i=1; AFNElJ+5qkzdA1WZjBeU5OlCjwXNuTKtaUslR8dx4GJm7iOX0LsveP/ESA+OA57HwhEvZN3EJsG5bVkVnu4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwgA02RgyuBi1KOVxyUiWsOHaRFIc+QZBdIYOggJePtlWqqIvAd
	6CrtaI3ReE8JiVoSdyjv5CT9Ooy6PvhS9roggxMPtemlNHsQxTvYeLkV
X-Gm-Gg: AeBDievMmrB4KI9g9hX5hVk5DEwmQrHh5WbhhbVNg3CCOywykeSvISZ5i4Uho8Wf09S
	7HVorrXJUqMTs1cCk5HoWp/aHIH6DVnequcvLfbxpzIcZux4M+K34DkgkYuefY/X5E2AYaY7Qkm
	nxrI+8ZMwPScYRlmWUKlccJs51HqmH6fLVlmwomH7HCy7Ar26rJMnCjGeRnaQX9li+Hii8FJNAM
	okZol/B2D36eCV+wXpAiIbUioSOh//tCYVngYjv7/1SoXuuVkD/2gGzkDUA8dq9t8pjfMf99zV4
	kdUDZ8Ne2AO3cdY7ojiMhpTOFOsO2aqC3Y4EUlVBB9IpEGq8RkB2yReae9EnR1yTsrOZyz3M21C
	qnMvITkSUN1l6nFThW/sgVBmcszXawr+kABVIBBuBTLfTDV/N0B8627EJPFYwDzzIfCJ6Xo1gXb
	87rVOEF4diDfb6qfdUEUieegRDY8/ivkz8qVkzeaihIbcgvJ6MpaT+guL/vnk=
X-Received: by 2002:a05:6a21:33a7:b0:3a2:cc5f:2187 with SMTP id adf61e73a8af0-3a3af541a19mr3029899637.28.1777445993005;
        Tue, 28 Apr 2026 23:59:53 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:59:52 -0700 (PDT)
From: Chen Wandun <chenwandun1@gmail.com>
X-Google-Original-From: Chen Wandun <chenwandun@lixiang.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	chenwandun@lixiang.com,
	zhaomeijing@lixiang.com,
	everyzhao@126.com
Subject: [PATCH 07/11] of: reserved_mem: add no-dump crash_mem exclusion helpers
Date: Wed, 29 Apr 2026 14:58:27 +0800
Message-ID: <20260429065831.1510858-8-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429065831.1510858-1-chenwandun@lixiang.com>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide two kdump-oriented helpers so that arch kexec_file code does
not have to open-code the no-dump filtering loop:

 - of_reserved_mem_no_dump_nr_ranges() returns the number of reserved
   regions flagged with linux,no-dump. Each exclusion may split one
   existing crash_mem range into two, so callers use this count to
   pre-size their crash_mem allocation.

 - of_reserved_mem_exclude_no_dump() walks the reserved_mem[] array
   and calls crash_exclude_mem_range() for each no-dump region.

Both helpers are guarded by CONFIG_KEXEC_FILE; empty inline stubs are
provided for the !KEXEC_FILE case so architecture code can call them
unconditionally.

The consumers are added in the following arm64, riscv and loongarch
patches in this series.

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c    | 54 +++++++++++++++++++++++++++++++++
 include/linux/of_reserved_mem.h | 15 +++++++++
 2 files changed, 69 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 4b80420da2d2..038056a6408a 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -27,6 +27,10 @@
 
 #include "of_private.h"
 
+#ifdef CONFIG_KEXEC_FILE
+#include <linux/crash_core.h>
+#endif
+
 static struct reserved_mem reserved_mem_array[MAX_RESERVED_REGIONS] __initdata;
 static struct reserved_mem *reserved_mem __refdata = reserved_mem_array;
 static int total_reserved_mem_cnt = MAX_RESERVED_REGIONS;
@@ -916,6 +920,56 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(of_reserved_mem_lookup);
 
+#ifdef CONFIG_KEXEC_FILE
+/**
+ * of_reserved_mem_no_dump_nr_ranges() - count reserved regions flagged
+ * with the linux,no-dump property.
+ *
+ * Each such region may split an existing crash_mem range into two when
+ * it is excluded, so callers can use this count to pre-size their
+ * crash_mem allocation.
+ */
+unsigned int of_reserved_mem_no_dump_nr_ranges(void)
+{
+	unsigned int i, n = 0;
+
+	for (i = 0; i < reserved_mem_count; i++)
+		if (reserved_mem[i].no_dump)
+			n++;
+	return n;
+}
+
+/**
+ * of_reserved_mem_exclude_no_dump() - exclude no-dump reserved regions
+ * from a crash_mem list.
+ * @cmem: crash memory list to modify
+ *
+ * Walks the reserved_mem[] array and calls crash_exclude_mem_range() for
+ * every region with no_dump set. Intended to be called from arch kdump
+ * code when constructing the elfcorehdr.
+ *
+ * Returns 0 on success, or a negative error returned by
+ * crash_exclude_mem_range() on the first failure.
+ */
+int of_reserved_mem_exclude_no_dump(struct crash_mem *cmem)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		struct reserved_mem *r = &reserved_mem[i];
+
+		if (!r->no_dump || !r->size)
+			continue;
+		ret = crash_exclude_mem_range(cmem, r->base,
+					      r->base + r->size - 1);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+#endif /* CONFIG_KEXEC_FILE */
+
 /**
  * of_reserved_mem_region_to_resource() - Get a reserved memory region as a resource
  * @np:		node containing 'memory-region' property
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index 29674f572673..cd0f88f29579 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -8,6 +8,7 @@
 struct of_phandle_args;
 struct reserved_mem_ops;
 struct resource;
+struct crash_mem;
 
 struct reserved_mem {
 	const char			*name;
@@ -94,6 +95,20 @@ static inline int of_reserved_mem_region_count(const struct device_node *np)
 }
 #endif
 
+#if defined(CONFIG_OF_RESERVED_MEM) && defined(CONFIG_KEXEC_FILE)
+unsigned int of_reserved_mem_no_dump_nr_ranges(void);
+int of_reserved_mem_exclude_no_dump(struct crash_mem *cmem);
+#else
+static inline unsigned int of_reserved_mem_no_dump_nr_ranges(void)
+{
+	return 0;
+}
+static inline int of_reserved_mem_exclude_no_dump(struct crash_mem *cmem)
+{
+	return 0;
+}
+#endif
+
 /**
  * of_reserved_mem_device_init() - assign reserved memory region to given device
  * @dev:	Pointer to the device to configure
-- 
2.43.0

