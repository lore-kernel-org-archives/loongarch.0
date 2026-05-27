Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130C2382F31
	for <loongarch@lists.linux.dev>; Wed, 27 May 2026 03:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779852675; cv=none; b=X4ZwxVtgVk/g45ykbnzU4jmAu0E6MgTlIpPQZw8pRWJAQGtroCfTPXyvtJqLeVYUDqJy33WfH5hC/9Ck42W9lcb1/DraU7I4YOo/V6EvIaZuBE1KjOqHEi+FarQk8c9O50zb5h1zwZDPcvby8MwEswtOIZUTO1Y7a2EuVh8MF0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779852675; c=relaxed/simple;
	bh=xipAbO8sfslQYWwVMG934ZBmEibO5OVkHredeiTd4i0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SC+ooFAgTBHGtO49Vj7PEIjJ+xDp2lyybdHhyGNAq8HkMTVZ/yR5Pfn724A2F6VX2HXg+T9yJrwS/C76tFBvnDq3XzynrjkVAcwSq2tmE6aVM6TKjVWoq3FNlHLkh1nNRCTWcqfpOnxkLW8m/jfsKiUbzEaFNa6dr6gLeRPswa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+49AiQb; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+49AiQb"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-82f8b60e485so4778158b3a.0
        for <loongarch@lists.linux.dev>; Tue, 26 May 2026 20:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852673; x=1780457473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5OPTsG2OKxcjvVozOjImSDH+Fj8Htwruv9sukUXajw=;
        b=d+49AiQbg7YSqT3Jz4O1WEOukdDbmZS4xvjB6AJeS1UarHfRNkQMbW2xIEQonCTLLf
         9L9sgFWH0V3ZeiH4XSn6X3QXESG5bd05bDH6HYXiYEDtmzMqNjpviMRzzP2YOrS1Zb2o
         Nd9YbPUhhJ9y7WDgznBilR+GduluDX6Mjn2cZOI+rd14uLdYRd3OWgyA+bTFCSDP/KKV
         F0HP2mBsahxv7hLjiNr66j6EPvQZYhaA2w/M7Lvlx9AFEUq+oaSB9/Y4Ftla1ZC9f1Ut
         40l6mdSkzIuGNU+V6a86cwW8vvLgqpzKPYCYpjpVDgWMWHCs0rKVKal3jY19Xb+6Cxd2
         mihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852673; x=1780457473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e5OPTsG2OKxcjvVozOjImSDH+Fj8Htwruv9sukUXajw=;
        b=CzoSkdhb5o76LZiCseQsXmi0xdm04v2Yki8d5wL2Quq9Xpw8AVPcCyja2WTZuif0mz
         KkEPicGcn9pIX69t/XxLeJvlzu+2Q653wY4ZNt7+i8DkZKIzfKeJuLltH3jIWNJS0C7D
         0px6htdH6o6FMbuzoCRLvzq2FBb44sQlI7D9m2mxwRHdYxFgU5+ZrmibS5N14StVnGPO
         N0fTM0Vi6nx5ODdIUmR0TVqi6ZOSx/cTedUyq5dEy/y8WM70tdr75i0eTgsQXcJklSBr
         wXZs0l2alQTAf5h5WEnhwgOQB5LKLUsEE5o6wkgizvc0xTZdrqPQlkaQtsHFnqww6y7w
         VHog==
X-Forwarded-Encrypted: i=1; AFNElJ8jiuUzMYdGapCYojFn5PSOscR1BjNIjZw/DWJ5IXtAf71i+2AhjLV03E1bXh6hC+403y7nV3vygKs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNZfddqQX+Phfon3+rMx87GM0VGkTjQGi49MGD1oPx/leO27X6
	M6hh+CrSwNW8NpDEmGgITgQ5Vfb86oM9l7tTizKhZA6xMm9oUWctkASq
X-Gm-Gg: Acq92OF1l9MxOQFnkEUJcgqDJrwPIdI81KDShR0wd7Pag637vSDPj+4oZcSsftkQ+MV
	qr7KVtpAcYjKcxUZRG/5Pt1ZV6sD3uSm8W2JVHViT70K88A1KchwdfgkslVTPX7BoB9guU0aFsN
	qnw4rkC+7c22MY1idv2Vdk+dTy/lQMVAJNHDtUjozUYdMbVhbYFrZ7Q93aEotNY6UpqrGF0Khma
	FH5jAbpUf09m6GtZvMfo+GIpOxx59btBTow6mSs9zwz9bgT0qcnkCYzuBpCVKkq7xd7DKWm+5fL
	kQFt8wr9mp9Y+TPdj31LdyjC9VMV+tU98HqePvRNiwRgaJrMHCTvkw/L0lAQnOmEwi6XLcwW5Qi
	LwTZhGVxad7NpfzsGiSeQdapc4hF16i8vQTLqui+0Bs7aPO3hUh0lcKq6cyQFeSM+p3438fTeB2
	huJHZW0TSLSp2zFNlhAbJiynd0qa0Pmtw/6gl5OpiABPDzXGg=
X-Received: by 2002:a05:6a00:2ea7:b0:835:4291:6975 with SMTP id d2e1a72fcca58-8415f363b30mr20565995b3a.39.1779852673468;
        Tue, 26 May 2026 20:31:13 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:31:13 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
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
	quic_obabatun@quicinc.com
Subject: [PATCH v3 09/11] arm64: kdump: exclude non-dumpable reserved memory regions from vmcore
Date: Wed, 27 May 2026 11:29:15 +0800
Message-ID: <20260527032917.3385849-10-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527032917.3385849-1-chenwandun1@gmail.com>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
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

