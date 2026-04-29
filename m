Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1B339EF34
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 07:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777446024; cv=none; b=H+aAN2ns7kpZSUw7SzcJlPiA6es2nZuNAbfY3WfFGcft2BmrGbA5/nTeNfNUXhO3/eX7thKl0xqr8W9GHSXRivTYF+CMWqHaSKVLQM4ezlWfyzvya81DUSFQheJF2kYHUClYWmaGqjpGKT0+DVrohQw7DvJi473gZ8aurnO/9SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777446024; c=relaxed/simple;
	bh=t/lgmsImXNg9vJwTMjsNuwxZoj6hoQlo/Fb9w/nVF60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=id98NwYvPY+aVuImDvbruNrvq874YKR+lyFZkIw+Da+uaybbX4ixBO1I/neMoVyj/J9EFuPjew3wrsNPV5V0Nxt42fpuKvtBZcn5cAbQsvr0/yJ8QCU/Iy6UlUPKz90dUYkAfmP1yolK34r6daYMa7U+mNVxRFl3YicM2f6bJM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWTKxFff; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWTKxFff"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-82f8893bff3so5739619b3a.2
        for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 00:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777446023; x=1778050823; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4Zhc8gGgRynhB3pjFfj0bHF1QgAjZt+4XAvOQyKioc=;
        b=dWTKxFffhuQZYVTMBJVyPHyE0o5HxeXp1PyfndcRz4eU9gxtnoCTLNs7lGqOiI7zt+
         pDZhoZzQ4z3Ok10QUmwEod10mxRQnG1c7AdZGLsgoCBnPpQ59hHkPNZtsbprzKJVD59l
         GFQ+BEji6f5I+ZebH2nrBE6e5Lyq1/jagONUvrnr5ABbjY4b2gLJNYfsyniWQfHwj9+O
         FROuv+PDAAzUymRmJdhVyZTeY2KWPpyFmjguA4oApA5R2ay4AgdNyzjVNd0iRxrXQ79p
         d4dOPuGloijIhqBT2Ix/qTVZKecZwioAE+GVThpnJNByL2Yg/FA3TDky9MTHQbtWtiQK
         3fvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446023; x=1778050823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R4Zhc8gGgRynhB3pjFfj0bHF1QgAjZt+4XAvOQyKioc=;
        b=SKGkrOqONpgey99GgxyowXKLJz/rNmccxChliu8EivbigF4B6EYWWQojwI/dwmyISJ
         c6A7SOdyZg77KfEpCKTWVjyIl/wXFofmWvfnqAOpnbh0xCDxzWJjkDgJq1zV5YV+6fGA
         q+E6f/MAtLFiUkeUd3VoMhtG5LBxOItD2Th8wgd+VYO0CZth0MVdLW39v7dNfLNWYVIr
         aoBWFgaNy2ECiGpAYvjhAXsiSUZFC1Zyu0gWVs+aKnnUoSn3B/UUzzP0/gqUIASWQWMi
         6khTLw4gGtn/j5R/7XazdpHp8l/liTKmxdcfLC1ubyjRmBvdZunygpTWDKWJ/rMtdFl2
         balA==
X-Forwarded-Encrypted: i=1; AFNElJ9GNqS0EF1LPUtawh9iPImQ8uNvXOzrUxSBdOavLitL2dRdnCSdmhe5KoFkze3LhOEczAzRFzbVR2I=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVOWXN6DgRbQcJi4VILIltWOUF2dBi1Zd7z5V1SbrcGRI8v8MS
	tpWlioqhpTLYlV+F7+iPF2GsKu+5xrJN45i4KUxCF/bVNQPfMKmvNmTH
X-Gm-Gg: AeBDietVA6Ie77c/v63cPWmWPjNrEWSFmloPIfr3h85O09VygF9iNIKwOZ/RHvQdY+E
	M2w9Zd9Xr5HFHZVlj+TSe//YreXrWbh99v3dPRU1v1qDn9gkORkqPpUz64r2L/o+KR2+ZVnth2k
	Z6P/TBS7vBNY7LJwZllyN+kUBMsdu3PRwjYKscCZhEZYXgskxMPKuGax7HHVtt8rUQQDsstTwuO
	coDhnI+7if3SDIXzafQ1HNUvgcWtJRHzeBY9V5T0N3g8sXOJ1mbXFnt1X6WDMuggbCRvZufS59Q
	9N75pALTx3DAXq/5Vz37xJzxIpLNhQVE/BANTooUFnv7bEGNfUknK6EjngMEvDg44yosHEaJmbK
	NY2DKk4A46Mr0ormBjrHldNgVb1FexoDVi882c0vfIFKmJQuA4SC1EJddTx1Zatm2EdXFObiK3V
	3daJHAwCeeI6DAnszJU4ysZe9suZ1vcoJqtvEv6jwm+DVGGB65
X-Received: by 2002:aa7:88c9:0:b0:82f:b519:a5cb with SMTP id d2e1a72fcca58-834ddc50c40mr6750211b3a.37.1777446022861;
        Wed, 29 Apr 2026 00:00:22 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.29.00.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:00:22 -0700 (PDT)
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
Subject: [PATCH 10/11] loongarch: kdump: exclude no-dump reserved memory regions from vmcore
Date: Wed, 29 Apr 2026 14:58:30 +0800
Message-ID: <20260429065831.1510858-11-chenwandun@lixiang.com>
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

Apply the same no-dump reserved memory filtering to LoongArch kdump as
was done for arm64. Use of_reserved_mem_exclude_no_dump() to drop
flagged regions from the elfcorehdr PT_LOAD segments, and
of_reserved_mem_no_dump_nr_ranges() to pre-size the crash_mem array.

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
---
 arch/loongarch/kernel/machine_kexec_file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 5584b798ba46..742fb9affcb9 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/kexec.h>
 #include <linux/memblock.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -67,6 +68,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	nr_ranges = 2; /* for exclusion of crashkernel region */
 	for_each_mem_range(i, &start, &end)
 		nr_ranges++;
+	nr_ranges += of_reserved_mem_no_dump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -91,6 +93,10 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 			goto out;
 	}
 
+	ret = of_reserved_mem_exclude_no_dump(cmem);
+	if (ret < 0)
+		goto out;
+
 	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
 out:
-- 
2.43.0

