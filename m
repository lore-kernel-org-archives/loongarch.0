Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571540;
	b=t3gvAKu3Xgj3c9qzNr6eCoEFC+WlA3RgRd498bS/GILfihkZQyJkq+tgsZdwshYR8kZ8
	 M0lUpuWOe75UFt4aXd92WH86R3vKVkOKaTLslhqcFnoVrTcau843V7ymmA2UItQPQTlZs
	 LM0XxG/n2gwe3jrWAK1DNurdVBrEpXxCMieEA3t/2Bw1niCN38j/Mb65w6QdY90UDfLbZ
	 jMiv1hz3nxs2QnZeyqUaFNiYWmyT29AZfiIc31TwrH8PajsbrD0DpZQGtFYWnPjVbgRr6
	 wfuMLJgPgNCVY7izyHUHhqZ+jgughxJ+kAnE9YVIMzCVpvk2PnyBuvqzuymtI6WI98g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gUG85+B7KqrDZpPXGb0QyiCfKe+tueHmqLD38rgeJ0Q=;
	b=E2LN62XuAu0VwUdXl/+WLazw8bjJ3d/h3RlGBvlkkSSZUbQqONmmHAw7TMS+pHhpt2cW
	 jGW/5+hsSCXbBq1WOmqXJoi/xFx9xM2dEq1oN3nHpDaa5lhUy5rW1zkCyy7w/KKvYIKvF
	 ZsLHCJjyl9o2aITN8xJFtvvzag0AxPupvLZHprsc7zbXiegPae5dz7j1YhhtGmI4nY8K8
	 GOJPhNbo34QobkXtOBShOXwcE6HRulY8sUxsgjUYxMj3OzSnzPToSkME7893m7MEojPQ8
	 5LGyEhPKoa/45Gabvz5CyeDD/BmEUyYE2T5UZe/idHnur18p0rk2RGT7ETBJyPEaXzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="T47/BA6R";
	arc=none smtp.remote-ip=74.125.228.9
Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F2860A2622
	for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 08:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1F2860A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T47/BA6R
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cd65a511e43so163627a12.1
        for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 01:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571539; x=1793176339; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUG85+B7KqrDZpPXGb0QyiCfKe+tueHmqLD38rgeJ0Q=;
        b=T47/BA6RJTv6FAoYGWFHyD0w6lg8ssVuZ0N7eEGs7p3Fr1BrSGldoQer3A6noo33/F
         xc094IAp6N+IAzyIluabI6h1HCN2HqWwazmhHdltqq0ZhEM7fJLnw1uGq+OEcVcE7E4T
         ibYclpo2J9jY7F/WEs+QyGkhrfHqSvbeDH4BwSr66S486+16DgquZxdQgFL+XUpDMLAN
         PfF2qPpObMi2hBgaToG9ycqe5ZYedPzx7tLhpfmKw6XW+ENibJlh6P8LfMBCoe8G0nYq
         9MiG4GUPwD4rZyc0SK40wz5zH1P0AJuXiiwTnO64uioF/rHoMfQwMwV7afz9H0+R19vl
         zOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571539; x=1793176339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gUG85+B7KqrDZpPXGb0QyiCfKe+tueHmqLD38rgeJ0Q=;
        b=ed9MZJwT2a3GeTKDDwmVU9otuit29EnX7f9Rdq/LF594O/k9TQXDY5RJUBkx4hRsnk
         LAdMOnHrHF+drMLzjO5ajj9zf1N0TurXF7w3VCOJQIcDqZH4+CzuEtwF6kjTClpX8sOT
         FZyRXzPdI/wbKCYg0Wm0oxFeIdtu5a7cxGidbAcx/PrN60dTpgCnncGEFfqOQUhQy8zV
         Z/yL519eEvLy6y8xX47mqfuhcAOTPwOwdHoNjVMfL0MlQN1EbBY6fmlACTtDhv90TS7J
         R6HYs69eDosRIjhVT/HnepE/YpZ5wIuLJ3MqqdZ/E0uZqz+GwIkJQDihI3erGrtxBO4f
         dROA==
X-Forwarded-Encrypted: i=1; AKwUvBz8E89PJER3174tJp55ogTY3EnBqc8zA/fUaYxMWtp2AF7GuBc5Q6U8p5DR3jDH9EjsR1F+YiabqrE=@lists.linux.dev
X-Gm-Message-State: AFq9FYKPqTZKbhd7IRZDKD6TC1JBsOJfPumNnWH14jMia0K3i4bPIyoX
	wOaRtzcLp4GM4tbgCFsgYaVvH8QiseS2chRM48J5tShTNCRTYXB2hGcY
X-Gm-Gg: AYBFou3sPiMeGCRtcTQ8lB3h+Z+a3Szq2NgWKRHO+oO+BRDAnIYFp/9ulPQDsjW5JBR
	RQ9/4L0x9+JfpmUUmc9hmoJGSYgTVlAGR14L2vUDz8DMEIrbuG5dOdONWUMDrb0hpL/z9RK6f5f
	WcYZRxEx6yW6dQ98KYBqfGBKlgNdSEgt9h2cVZRhWVLdzSV0srJkKrFcbsEKgsErxKqUv/DpmDq
	lHnKrwV+/tK1vxhbfd9mdhbZJWojMOztfgNMuqfD5oNkJEm3GkqNzq7MNFuPxPPOWbZ+AmWvwVP
	8vJItZ/KApwkYIbXeD+u/IwFBn45GLZEu/0HmTxlGXMr8XC8q1Pxy70ygrDIHbY3H5IJLgwKeRg
	mbNX/Hf21YlE3Jh2T6ORNYx0DwH5YPOQJaH6sQuNE/zf6r+zOZz/TZeGAswHWRiyFb1Efqawfhd
	h9EVejLFiF7lioeEhOyBV8H0ULMdXeHl4ZQsy2fVSkMl9n99xehqFp9gGpdN8u0f2/bDACI3/Gw
	RyxBFWwzsu8H6TVn+Lmen8bupJ9hK78nZzK9qkUKk6RPNpKvsg9hXbssBCHwbjsxvQL
X-Received: by 2002:a05:6a00:a0e:b0:8a0:1435:fda0 with SMTP id d2e1a72fcca58-8a089d4702cmr1201474b3a.51.1792571538862;
        Wed, 21 Oct 2026 01:32:18 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:32:09 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v9 7/8] of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
Date: Wed, 21 Oct 2026 16:30:10 +0800
Message-ID: <20261021083011.2170525-8-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021083011.2170525-1-chenwandun1@gmail.com>
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Mark non-dumpable reserved-memory regions with MEMBLOCK_NODUMP so
kdump can omit them from the vmcore.

The marking is guarded by CONFIG_CRASH_DUMP and either CONFIG_KEXEC_FILE
or CONFIG_CRASH_HOTPLUG, so kernels that do not build or update crash
ELF headers do not pay the cost of splitting memblock.memory entries
at NODUMP boundaries.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/of/fdt.c             |  1 +
 drivers/of/of_private.h      |  1 +
 drivers/of/of_reserved_mem.c | 18 ++++++++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index ecc923102622..a5f223a74b7e 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1285,6 +1285,7 @@ void __init unflatten_device_tree(void)
 
 	/* Save the statically-placed regions in the reserved_mem array */
 	fdt_scan_reserved_mem_late();
+	fdt_mark_reserve_mem_nodump();
 
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 0ae16da066e2..505735732c13 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -187,6 +187,7 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
+void __init fdt_mark_reserve_mem_nodump(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 8c9d6395d6a3..db2bf76000d2 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -677,6 +677,24 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 	reserved_mem_count++;
 }
 
+void __init fdt_mark_reserve_mem_nodump(void)
+{
+	struct reserved_mem *rmem;
+	int i;
+
+	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
+		return;
+
+	if (!IS_ENABLED(CONFIG_KEXEC_FILE) && !IS_ENABLED(CONFIG_CRASH_HOTPLUG))
+		return;
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		rmem = &reserved_mem[i];
+		if (rmem->size && !rmem->dumpable)
+			memblock_mark_nodump(rmem->base, rmem->size);
+	}
+}
+
 struct rmem_assigned_device {
 	struct device *dev;
 	struct reserved_mem *rmem;
-- 
2.43.0

