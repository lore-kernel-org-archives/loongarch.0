Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7453A3E85
	for <loongarch@lists.linux.dev>; Wed, 20 May 2026 09:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779268815; cv=none; b=B7RMX9DNb4mKT+18LXrRF8MN/qYDQ9tc7xdpJ7dg+otS5JihMmRQZXGesTLnlcCWsUsUCZYlLiOtZiqFLJG/SzLjHwRHjdnC2tMm8GUM4GiGzWX25+XMyW76kY0VZrF/1lOaNhMOJeKmZGTSm6omLwOeuzKt8T8UXtoMpKn5AkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779268815; c=relaxed/simple;
	bh=tykyc4F6DdCin3fut0O+1NMZ9opVL5h+xA3WkGtbPlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kpb2e70v5UQwtBFajHuHyxKpprBgsuoglYnm5x5cuH8WYs0mZAtRHgI2hkYD+0N6r+8DlfT/kKbciGtXCZn0H8tyJyU60plrTMu+2AbVryTkbYBkRJeDjAq5h6B4eJoHMfHGp8bQTddUJpzkWahIsQgHOLULASp4TEjl07wL0JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+r/wcK/; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+r/wcK/"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-836ebdeb969so2117492b3a.3
        for <loongarch@lists.linux.dev>; Wed, 20 May 2026 02:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268813; x=1779873613; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTVbMKm3/twtkQTkDovvFEvZk7HsMSG4qE1A6oaHTA8=;
        b=f+r/wcK/GMpn4fo+36MkmlFvSNlSocTFBMqCWAwCQR28ZNLENOLpQoxJe6MmhG8bI3
         ViT03lJGUQAKurmJ8QsPKVMI4DzK63pd5P0Di+uFyWnKu28kqC265WdUpv26EezAllTs
         gD5Gy2TlmIrktsM6Ot5mwAeBdFvp20l8LjTntR3XuTuHD2JjHpmdaltH5O6n4pkAWqgq
         MExO9WEby9NHZRUOHfCqahwHmgSB3ieaFvX8MlnnqQzE1yJEqCyrTpYvBNl1SIajpTu9
         K7tm0j3mBrxmQJAM8vbLv32u+TJLVmhHOKopcYdUoYjA+JHHf4xBKZYMXuNjPiWxXX7x
         wmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268813; x=1779873613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qTVbMKm3/twtkQTkDovvFEvZk7HsMSG4qE1A6oaHTA8=;
        b=rzhNAUkaaxZ11rAuTCVckwPn1tbAWtO8MmoijNDRdokeVCekQTZsTKlTGASdKa2WXJ
         RB1Lt0QfLcmVm/MwdbVQc8B3loLGYKjxbgSzMgY1eBA4CMPVjkSD3LT7byWBhoXFUaCT
         Ft0fJ/4WWMaW52jtD827bWNp5I4LeEaa/XZeCm01HDezUEynQWrD2t7H3NOzxFBwYZsm
         kdyipD5VHY/o1f2ISGKacD7KN4pestriWgLsBMrI0lr3y1ODkgFvcuoMdjkdXAisr2KN
         aIVZuV6u66o0DYFW/Ad37AoGyWhJ/QG+GMeK8wQwGhJajKslFQRIVuUygPFIkgmmMmb5
         SUjw==
X-Forwarded-Encrypted: i=1; AFNElJ/8tOssCilJe1qVCnlsQvzyO6OMsa00kVp/K3XW/5qilQA/0hX67YmRSGJ4Yn9PhN138eRzlXxV+eA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxmcbiprWmdpnTCAdAEBNk71Nl2SX1wLrXbMDuBiZVY2ovw+l5A
	BGlWtGAuk5nJfvbRe0ybGG/7Cju9uvGqsPGkPZklXw3bFq9nirCJqCLb
X-Gm-Gg: Acq92OFi+aQmojOZUqmcFEhcaNWY5JFbe8Zf1kkPD57KQSMQ++h5Mu3kGza+mCcbfU9
	CyGmP1IWnI7tr8oHL8PyJTD473mVp6Cpr5RMoNYMe0ffcZzvvyVODtPhYUoB+8jbDxYQvg5RTjx
	QQh0SkmMgAolv29gRFdwXz4y6xKWVBDrstMNrsseReWz5HtIRszq5ms6NLNBFztqyRZ10ztmhdr
	AqEs/oj1DcEwbX4bucZPsXmfPWtcUsEKkOEhawfF9vtwYSb/UQB67NYrou7PYyeijwNQ5JwnUul
	QBJ9hzZn04OvhfIhCijXzUCih6etAs2y1RWzvvakpen0nz5kMWcQ8uKDcwKXkXFslM54760lYOE
	+zYAwlHz5PGbV5bVSONL9JaSd/DbLXaGPCZdmfOkGP0V/fjEMBy2mR9wn06Ix8MUH6JUIPQXx/o
	gfTp0uQA00xrg/nHI9d1EnLSYUqMwKBzb+jXwIORRQm+bNQb0N
X-Received: by 2002:a05:6a00:2295:b0:82f:832a:75cd with SMTP id d2e1a72fcca58-83f33d547ccmr23996834b3a.39.1779268812696;
        Wed, 20 May 2026 02:20:12 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm10208967b3a.48.2026.05.20.02.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:20:12 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
X-Google-Original-From: Wandun Chen <chenwandun@lixiang.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	leitao@debian.org,
	kees@kernel.org,
	coxu@redhat.com,
	tangyouling@kylinos.cn,
	songshuaishuai@tinylab.org
Subject: [PATCH v2 7/8] riscv: kdump: exclude non-dumpable reserved memory regions from vmcore
Date: Wed, 20 May 2026 17:18:43 +0800
Message-ID: <20260520091844.592753-8-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520091844.592753-1-chenwandun@lixiang.com>
References: <20260520091844.592753-1-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun1@gmail.com>

From: Wandun Chen <chenwandun@lixiang.com>

Apply the same non-dumpable reserved memory filtering to RISC-V kdump
as was done for arm64. Use of_reserved_mem_kdump_exclude() to drop
flagged regions from the elfcorehdr PT_LOAD segments, and
of_reserved_mem_kdump_nr_ranges() to pre-size the crash_mem array.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 arch/riscv/kernel/machine_kexec_file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 54e2d9552e93..c359cf714c79 100644
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
+	nr_ranges += of_reserved_mem_kdump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -76,6 +78,8 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 
 	/* Exclude crashkernel region */
 	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
+	if (!ret)
+		ret = of_reserved_mem_kdump_exclude(cmem);
 	if (!ret)
 		ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
-- 
2.43.0

