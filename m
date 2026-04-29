Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7912939E6FE
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 07:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777446012; cv=none; b=NJCYVHaMNAyyq4/zRfm+cRyzXtA66gWQ09pn0pEl5ghCmd5jEoFhpRcobsQqtL03fovg1h84FyymwiEWYMWuxrsuUoQt9Jr0tFNsW6qQXa1sOmYD6wbV9FCk1iB/kYMbNBltXbMcSjlo1gEg1ePuZwsLblCtOVDOiFEKKp8BHjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777446012; c=relaxed/simple;
	bh=19ChOYuQhKdK9qw9JWxQ3u37AolQaWA1Yu0JwsfzieU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OosOhxFb7kXGGvPWKuXoYlW9WlBRthrpJikG3QzVXhVBIOWOsr6JHQqjjFXlKbXANtFx5rp+nLjPTqhuq+f1afGDP8EEIC5KSyy8J9aipc9ZtDYV79U/XTcgkZ8VSpxyroV7g0W+V2/gvL56YjQGm64g/tiF4s+Rb+pp+QbqOfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPjjE42H; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPjjE42H"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-82f8892d4d6so5369439b3a.0
        for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 00:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777446003; x=1778050803; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngtzchp/6x72pHggoOfcu8l1aVao/9O/WyChqA+UT9g=;
        b=TPjjE42HC2kgPh+5bNBQTcSGymC0Vmg8ArSHl25zN/Ypheyl2wUof2Ny+0ikT7tYjp
         kQ00EqxKQbZcvKVeUZqJptIt0F+PfaYXQ5Oi/GqeaZjLib9LjrBBMlGMcrWqPz58YCzn
         8JDW5zPVVo+pbRuvgDbOCrMTgo4c0OW17CpqCP4sZP8PPw0gqa/xLX7BK2QdkOnr5xjT
         +sVg/S3NB4+cAqrM9b63mtxfzg5KCorCOJIwPyEj4Xw+aOYCr0PqTTRMWjSzcwmuQWN0
         izTvPKLJiPNtbWazF+Dd4tn3l4Qxl9x11ImGZn5QxBKTrbNccrn+V2mQnZbN9IVWTSXD
         YhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446003; x=1778050803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ngtzchp/6x72pHggoOfcu8l1aVao/9O/WyChqA+UT9g=;
        b=HbZFQ7HNYU5G+uiZLEqp6dJRvwYrfms75AfMJpVsOkueZdA6/SawU+OvyA9XdmXv2v
         JTipjYSH7E7m2Gz+OzlY5b+5XHQqWfjJ3Ou3Wrmg9kvNG9CPR4LIlFhv893OBj8/HB01
         owEqJ5l3toch/ZtcLxt/5K2amqkjPja1LohuSkNpjT9EhOqd6NVx74TWBVkacC7cQvZz
         7s3OEJyLLin+WBOsPmPCmrAYFV14Mvx3Nsq11MtPqmR1t4vqa6c2EhwSxfMSsCJkk3O1
         /ktfapbLT89jFfzOv/xjryDrE+BZNZXEfRpKBZta3zgKIspQe1CASm6eTc8BGZ7qWIN0
         ZvUw==
X-Forwarded-Encrypted: i=1; AFNElJ+4br81zB4RBqMcmE8SAglDA1X09Kcvri+yEN6ggnVe01NOAmHKVAXXly0R+aL3q64W/rQi/Vx+JME=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx9AyAMDzOTit7E4ANBOT5I5sWQ09ZD6MkOcT0GxnRfiIk3rCj
	XjLQuUfJHBEyQCvxBxVFG/xncDJAjrw8bPkkSK4sxC8j9ip9oz6N8W89
X-Gm-Gg: AeBDiesigA625qHCBJ7ZdeSptoizY86N3c67pr8r3Q1+ExWaWdEA9NKgl+4fVdKHB/y
	ApfBlskRUux3tkjCK0HTzQIBd+w3/doXO8Zz2LnCR2MYnl3mdu+mJjJfpgPopV6+0tBCxV+uDU6
	Wmg1kE2xcE8k+a8bmhE/L3OHjCYFC9AgmoWEPilaMpy4oxQvvHTpKZ5hrTCtofdzSg5EJwRJTo1
	Gs2gQAcIfBP5w1aGnnfMtJM/xR7olULVhWL3QOxPavnH+G1BiwP7P9D6xNo3by+Y5sifoJrs3QX
	vJ/+ZRLvdd39504M5CGc1aufjq8F95zjkkgg5m7mlez51wG+o8k+Eu6iDg5Xior+SXmWXHZLRu9
	a+5/8dkqG0nJjGosJizizl+p+dz5YvDfNnmBp6tgcgvHqa5GjG0rXd6w4EGSsAZewR0p22HdoSq
	17li3HnTLX1lz8Mx0LjqF+lMdth8GhjMkK6PqYIQXFfAMI97jB2YKKsBkmdb0=
X-Received: by 2002:a05:6a00:338e:b0:82f:6e7:152d with SMTP id d2e1a72fcca58-834ea569f84mr2491372b3a.21.1777446002842;
        Wed, 29 Apr 2026 00:00:02 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:00:02 -0700 (PDT)
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
Subject: [PATCH 08/11] arm64: kdump: exclude no-dump reserved memory regions from vmcore
Date: Wed, 29 Apr 2026 14:58:28 +0800
Message-ID: <20260429065831.1510858-9-chenwandun@lixiang.com>
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

Exclude reserved memory regions marked with the linux,no-dump property
from the elfcorehdr PT_LOAD segments when preparing kdump vmcore.

Device firmware memory regions (e.g., GPU, DSP, modem) reserved via
the device tree typically contain data that is not useful for kernel
crash analysis and can significantly increase vmcore size. By honoring
the no_dump flag in the reserved_mem array, these regions are filtered
out from the crash dump, resulting in smaller and more focused vmcore
files.

Use the common of_reserved_mem_exclude_no_dump() helper to perform the
exclusion, and pre-size the crash_mem array via
of_reserved_mem_no_dump_nr_ranges().

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
---
 arch/arm64/kernel/machine_kexec_file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index e31fabed378a..7c9c38096c60 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -17,6 +17,7 @@
 #include <linux/memblock.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -51,6 +52,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	nr_ranges = 2; /* for exclusion of crashkernel region */
 	for_each_mem_range(i, &start, &end)
 		nr_ranges++;
+	nr_ranges += of_reserved_mem_no_dump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -75,6 +77,10 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 			goto out;
 	}
 
+	ret = of_reserved_mem_exclude_no_dump(cmem);
+	if (ret)
+		goto out;
+
 	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
 out:
-- 
2.43.0

