Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB2031F98B
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 07:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777446019; cv=none; b=unIu14yOTPCDF1q4xz4VyJAhHYqSEybuawAySvqc6J+3NblRtdAuzxiqB55+eLoYLC4gocvG3QSCMnDnpzViJbxoGZlvbafKDFGsoWcfbolndvetc94rsTVP+QkPrD74pOkI2DI6BFkdRztFmxRjBmq1VQfb6XZs6X6NXr778J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777446019; c=relaxed/simple;
	bh=MCjZ4wIsMlFVxfNUvNxM58nyFA/FtDG5OZK4rUoOlR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lf/xsmf4vzNSnwY8Z3sLs2Y1pqMEFWTarA70bmMgA6urWEM5PDedj15hw5/zM3Jedoj2vdj4dqUTXPJa4tlS1hJuzWdjsTFIxVTzvkoAD/Om6FnepcVIxfpX/LPLe4rMd1ZzQ7zo8PDxkf6XbTFovQUeLQXfvPrZPagazra+4Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SllIIKND; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SllIIKND"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-82fa8d6425bso4822430b3a.0
        for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 00:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777446013; x=1778050813; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+aKzcozrfPvAHDOI307L3sGfueBolTmIlF5K5tQEKM=;
        b=SllIIKNDaUKqk9QCUO9fn4ipeRySNMnq4wS4r5CuBvEZhgmZWGdCkMv33m8nkaU25/
         UxJy81qQiotWMaVy4c/HRuxmeuoiJvFOOfdMoubQt2f23oG7gy5PrKUXF++bMoTue/sI
         0xuOuM1SWRW8besi9DOFhI2dIVchG2dbYw1+JB6CHfb+z2oOci4fkbZzu+DwxTsctaZ7
         7H18FwjXlgUt6m70hEcfEOqkWLpxDn6IKAqZSnD6+Fwn6B3EJuLeeoKlusNxvMgRo1y9
         DDM4+BQeI6zelswfKP8ZGOByymQjN+sXUhcbr3uDAtEhdJ8kFGsqpl4ZNmB4iUHCkHlL
         mc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446013; x=1778050813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2+aKzcozrfPvAHDOI307L3sGfueBolTmIlF5K5tQEKM=;
        b=a/Tb03K+FDiuPDNurRjElZmligOqdKJeQ1iOxsTrZE/21cKjFp/jcjgiUA1HEp+gbS
         uGN4Gz/0ZjT+ezdGoaK87pNWDfafco7KaZ4K+oTWBeFJ0R+2q0Bb3NTSLX1d8ox/5eP7
         Oe0PuGC90Fppf8Tl5Kr8/PoRtoJ20C0CYuS5Gdv66YsovNEnKfAYJKbqYX+cSIiky3rR
         RccpS1B/J0mjP0PSpUPQspZhNgvAJ7Jhl4BmliR/ZTKaQGbnXVO7KBCy+EPHLSMGmEMZ
         uC9UzTxHYLdxlX2zNkILlr/uJUDvzz5BzmpGUqiiHNopmXp8WVCTbPU9lek+jZrB4VOL
         /cPg==
X-Forwarded-Encrypted: i=1; AFNElJ/mybdVwggjR0HNaDqg8t67Vbt2mdrrPDZP+5tA8juiryjM7uZ8wDP9aAQtIAnK3LL5gGH+67d4cjo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPYzt/CtPwwyy/7u8JU3+rSV5NNOeBwJfy4M+wrWzX9cIHxt3U
	0WCl8+0bgnv+NSqHC6hjcv2d8+Pqqy/m+CnJW4DvM2RN/x+LK2t+vjDF
X-Gm-Gg: AeBDieuDajpc3J3Y8KsI2tizUEVjl/3hpcQ4COq+DQsZZf9CgrxM4iR0g2llhBOUg9b
	62aFIEXXu1B7rouNjiqBaVTgHa5Zbd8KtBVHhbLL0ohrPDOlzmX4J8kVCYDjg77XDY0ZAhCaSgQ
	TMH4NUfTK6qbH4NJ17NtrlsibpexzRgMb/TFU3mxieUWUfmvVs6rvI8PtOfNrwfpNhUOGaPix1V
	PHL3yj40zN5SDFeTXwbSuxKIKKbJ6ScmiW2h6hq54DaOawFhYQV1huage2lmzWw9SES0CHBnkbh
	u5vENuGHtIjPO6Dohi+H9NdXDBCQotoP4MAUKURrAfH1+QTMIEC1+PAbqz9QJD7C4LstfSFx16T
	PKK4iaUUWHc5l2jxIo7qOnrTeiTwrNmaWvG4unOSkk2wtpyMJVZ1alLlebmlfUkqAmg7vTyfxH6
	0/y+XWTPt0+56wqM9esWJANSF1Bti7ck7rbbvNVnfG9xstSpZ+
X-Received: by 2002:a05:6a00:995:b0:82c:9fe1:aa4d with SMTP id d2e1a72fcca58-834ddb2d0d8mr6649550b3a.13.1777446012829;
        Wed, 29 Apr 2026 00:00:12 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.29.00.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:00:12 -0700 (PDT)
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
Subject: [PATCH 09/11] riscv: kdump: exclude no-dump reserved memory regions from vmcore
Date: Wed, 29 Apr 2026 14:58:29 +0800
Message-ID: <20260429065831.1510858-10-chenwandun@lixiang.com>
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

Apply the same no-dump reserved memory filtering to RISC-V kdump as was
done for arm64. Use of_reserved_mem_exclude_no_dump() to drop flagged
regions from the elfcorehdr PT_LOAD segments, and
of_reserved_mem_no_dump_nr_ranges() to pre-size the crash_mem array.

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
---
 arch/riscv/kernel/machine_kexec_file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 54e2d9552e93..012885ac9b79 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -10,6 +10,7 @@
 #include <linux/elf.h>
 #include <linux/slab.h>
 #include <linux/of.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/libfdt.h>
 #include <linux/types.h>
 #include <linux/memblock.h>
@@ -63,6 +64,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 
 	nr_ranges = 1; /* For exclusion of crashkernel region */
 	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
+	nr_ranges += of_reserved_mem_no_dump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -76,6 +78,8 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 
 	/* Exclude crashkernel region */
 	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
+	if (!ret)
+		ret = of_reserved_mem_exclude_no_dump(cmem);
 	if (!ret)
 		ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
-- 
2.43.0

