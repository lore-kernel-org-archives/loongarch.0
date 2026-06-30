Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B263E3151
	for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 07:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805736; cv=none; b=iBb+NyuVNsdKGoCa7Zea0f45l+VCvO/c7giub6Xz8QA/9mwoecb1S/FvzD3WPKE2LwvpnFFBZ7nXm6myD9Urv/2D6xegFlw0aK5AkRRuFZDQwUu4en8UMbOHC7xS7tGCITw8ODG9QlgMKa18BXI49RZBvOtppF2A7LGZJjeBL3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805736; c=relaxed/simple;
	bh=no62Ldx/VYtMusTTq5JG8f1ZzMtpg2aqQYYLKUw/J80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZM+bDSwS2wo0H4vV6HBkkfb94aLep+hOJ6kdW49w2CKD8pM0mtG3E+Y0B+kTtwao3iDvZwOkp1nMu9Yr/LqTUPcecl66h4BYes5K5Urd85twbLOxMBG7SKsFN5IdOAgguM19zaIlZCMKNaP1Ju1Ca1fRsxwTqc5E/00afrnviz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKv6Sze9; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKv6Sze9"
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2c825308c4cso1970005ad.1
        for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 00:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805731; x=1783410531; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kilHQAUiYtCIXGoXTLzkG+QFNETPWES64QJavnYCw8Q=;
        b=fKv6Sze91HBjtfo/RsM4YmVPY40vhB66QVFYqihyRa7KHI55umN562yzAqg6R1O1DN
         YE0QYbcWBJbPn57tAPFkzT7KxF5GN5/PhunKu2CL7O8RM1SIuoCYWz70IHkBy12OtggY
         Wc3kHi1lhklf56q6FH4c3RLIqtxXSL0r1HCq1fNq9pb1b9zw/M8JYTDACJErHwJyAQPd
         FRsBFn8rIkEaZXGumFZnH4WJEfxbejLI6Uxp6b/reRbNDP9VoW5L1nL0efFtcHieUCEv
         8L+TVhesVJp5FrN/DFKKjXbObIjDiqaLMAu/a/a1jT8Y/KIpstckbmyw5fbVTs+QMtEI
         bXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805731; x=1783410531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kilHQAUiYtCIXGoXTLzkG+QFNETPWES64QJavnYCw8Q=;
        b=efKccA7VRuxKHga2zrUq5xzSNqC46Y8OSaAYbe9r7zF+15fryRYdsaDTXU+ujC097S
         UhjttTr26BUJ5a3J4+WpoT+22gE+NxpC7g9bBHV1OiuI351aC0wwHjFOR1r1e+sXnHvv
         ADKDfKYFVfaBhKEvKdn1obOHcC/gxgHYmJwII4FywgGsiWPUKLZPOVcN+XlAA46cQUcS
         OC8eXEPe1zTOnasQngRuSuxPgRxdqRhvyDX9O0eUwFJd70DeOwObVrGGzzRIMBdD6pCy
         hI1LH76zSxCzOFHxiGqf08rQvQMHBOs9W+jyQfdD60snYahIJIEhjqDpiB7YljjyDJEz
         IWBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqz9vasPmn8V+hyWx2utndjTKBuZDP5YLTfIUx77YFAxz+vtI6xAGYDRqy6m1OQ5AgNXE77RYQVjV0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVJiHp0wLTHX2X+xefNXYYfxBtShDY151SUfnbybBcMUvRnG+2
	s6T3KTCD+rJ42PTFf3uVc2auP/Ni5Ul5htvRLnc3Rpzy56a2UlofdGQ5
X-Gm-Gg: AfdE7cngBHQEXqfu8dnsQJOuB4BHtkHhP806tCMfMNuNo56m2VjoEh+obI0M5cLLUM6
	Cx2ttS+VVsEAAo35bSvZgJpHQufBf70G8wOcVO2o6IvDQfywh8q5qlIBktveB7vuxvZKw1SIpH2
	fCQtvooV01PrJS8eJJzut4aDu/LJGCAQ8gQ7nuzfanXlMy3bSMl8C1wdee0d0QcHq8WukK8O33/
	PEqZXNuVj4GQ5OGZLv6D20zEjE85GIm8yRE3jADfC9Me6mLBQutNfiNevlRYHH2HKS1/Hdiq8KZ
	nTfQSWgDoQmm6UQ8FnqEb77uY96yne2kOvzw2D3cMC3XkR0JF4xrwN73topSDAJp02H+mZu4u0E
	Cy5a2H6qRXJNPESAWAPaI/ahtF6+KcKRnFMiv/xtpeF+9EGD94IIwpXUvNZWjlEAzbvL5JvI/TM
	vIMF7cvUk3k/FFkwILou5NYJJlJA==
X-Received: by 2002:a17:902:dad1:b0:2c9:d55d:2d3 with SMTP id d9443c01a7336-2ca2d55dedbmr19212325ad.15.1782805731371;
        Tue, 30 Jun 2026 00:48:51 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:48:50 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	bhe@redhat.com,
	rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Subject: [PATCH v4 08/10] arm64: kdump: exclude non-dumpable reserved memory regions from vmcore
Date: Tue, 30 Jun 2026 15:47:12 +0800
Message-ID: <20260630074715.4126796-9-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630074715.4126796-1-chenwandun1@gmail.com>
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Reserved memory regions are excluded from vmcore by default unless
marked dumpable. Honor the dumpable flag to filter out device firmware
regions (e.g., GPU, DSP, modem) reserved via device tree, since they
typically contain data not useful for kernel crash analysis and can
significantly increase vmcore size.

Use of_reserved_mem_kdump_exclude() to perform the exclusion, and
pre-size the crash_mem array via of_reserved_mem_kdump_nr_ranges().

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/machine_kexec_file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index e31fabed378a..1d65320c6ba4 100644
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
+	nr_ranges += of_reserved_mem_kdump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -75,6 +77,10 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 			goto out;
 	}
 
+	ret = of_reserved_mem_kdump_exclude(cmem);
+	if (ret)
+		goto out;
+
 	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
 out:
-- 
2.43.0

