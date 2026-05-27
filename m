Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483E5383C97
	for <loongarch@lists.linux.dev>; Wed, 27 May 2026 03:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779852687; cv=none; b=LZn/IAhTev+5nUwQLQL+3iwHYllUYxgMhsVPFOvJgjXFXchJBZ3+ProeM2H6PL6pQ9oD4FOHurz535S7SSycwU2dtGPZ7p5yoC+H9KTRG4pYmlUPykKflvRFfgwIxgvUbt2fEcZzLvNd+L98QKBFz48oq1upseZ0f6aKO2JNzhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779852687; c=relaxed/simple;
	bh=vTTeU4c33nu817Ph5CKnJ38o2dSdPMYsQQMx+YVGt6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TJJFVIv6Qcu1Dja5o6Bd8wz1NaGxwBuIhiYvqNhzxVzyGfwpFWkfA78bKDjII2UjpXFVgt2YltGtHfTNaDQkeJceBZmtiK4GKqbl6xYNvwEw9nQ+M6e6L8VDZ/ZmreAPl2U/XZ1e1rLyuCkVNLAFl8Ba5okIKQfBkdvHOk2JDqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NVjo9g4X; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NVjo9g4X"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-836ed29d1e5so4988283b3a.2
        for <loongarch@lists.linux.dev>; Tue, 26 May 2026 20:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852686; x=1780457486; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8s9mNy4kJhUtRbiL4bvIShEI3qrMLQ/X11k1pNjAUs=;
        b=NVjo9g4XvMQ4gSgpyfpOg9dLf1GRFAjMOPwjYdJpo2H3Pd3sZOwg4ZhTM2Bwp/mqCW
         /648y/VpxMVHBRFkwOLkdhxABXCvqA2iitkT0eai09nW/ZYeSNLs2EfTxFk9zeBNhyMX
         EFMayql2MJAEPEn/UA+j7kl9SfgkDw0lSGBJzf/t83FRXr/dqRq0FTwqCnzpTPv/qP1b
         qk5e+kZLAMiwepVh2nE/PvQVguayDW7HGXi49tqLkpDunVRQiGORmkOSm546yubd8NFh
         25DRPjdBrrh6dAGhyhH8sZujAyvp1OanH8c+l32X/ZeJbus1+TZagMQU+ILIF9Mesu0I
         BEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852686; x=1780457486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k8s9mNy4kJhUtRbiL4bvIShEI3qrMLQ/X11k1pNjAUs=;
        b=Xm2aMkKmNZq9x4kU8r2ZYyFO63v3zPEYc+jlzqLMWWjig4Ue+BnoMpAe/nNwmFy/pr
         0z4Qf6ljNSukCTlyADxCILMaCU8p0rnye3dVEgSmdONJkQKycWJMBg3vFUlsXM4qxgX+
         smfS0sGk01ag4yHtdrSNPW3SpheT9htnSVwbRwfPTJDgMz9P92EvV3SbFFUbNRkW/oBA
         iPxN5ehpQuDNcv9oUcUZuY73hp3m0m/U8369gXF12t0cQAcWtrk43eUfrKNNBlwxYKDd
         p5XidgD6MrLMltbZ6MoTbgMEq5OzAVW3iZM+Jtz12WLKRJ5N3ib7yybcfpuBDyNZjRDT
         WB7A==
X-Forwarded-Encrypted: i=1; AFNElJ8wi4p0F+J5TglkN62CuEF9It23ABK5rYHN4uCyBsM7FlTVz1iiLhbUuzkKP+d3lNjTlA2jNnXuU8o=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQXa0hn3hl2aDMJwCkakQBlf3UCdCIxN71/sdrh88/UarbvBu7
	5oOhyxXQTNbGAXo/Wp8Is1XjiNA64JM60bgNruhUKEwhymySXnlnRrBc
X-Gm-Gg: Acq92OFTGD0QZHxyUGQfBvgaNLHQx5UYN4jrNdEScI8cpJ+bp3fKrkF+WnuTtUzlK0j
	FweAubyI1e9hjK634jqVAHqaEzpdo4p1nkkntFwp3GeA9mDTeKq1LlIFKNwY2/eUCEiAm2WwLYP
	HyZ3kRd+u9uTUJaACIOrzrBewdTgWuJERdsxZtZdToSH0yc6y/zIpFn3AYE/ic89gngSlXIIK2u
	lzSPa8REvglStqlMtURK/uwU3t1AvBRCReI2ZSpUIDSE7kfPmXyR1tnWk8aql6mYArXzrcChmbB
	1H+606T7y2r/Z0G2/OOcLvVMW6ygiKj91BaPvSBv99Xhcx54rFIJIRQqlMd3G+J6KG4yjBF+QKk
	cKUZeqQr6gn9JMgJQOooFYvCYPFB92V5FGsLEhme+WoNGjlvwXLpN+v1m2rOUphrkHAZCeWC39Q
	+8X2DZWc7Tn27EVbw3jSDv8Q8oMLdmtiI9mD0Y
X-Received: by 2002:a05:6a00:8c6:b0:83e:d957:e5b6 with SMTP id d2e1a72fcca58-8415f544641mr20524215b3a.36.1779852685640;
        Tue, 26 May 2026 20:31:25 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:31:25 -0700 (PDT)
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
Subject: [PATCH v3 10/11] riscv: kdump: exclude non-dumpable reserved memory regions from vmcore
Date: Wed, 27 May 2026 11:29:16 +0800
Message-ID: <20260527032917.3385849-11-chenwandun1@gmail.com>
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

