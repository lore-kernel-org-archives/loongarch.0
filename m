Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770566;
	b=47SrDRQT4p3ynxex1NlKPfQk27rBS+4yFvSRs5TG7ZPM0oBdT0PjgNvIXVZS2XRjyZkh
	 njIMqf1WnHQRtC0inZrBj5k4R4c2QVbtp4oQj514XMFPulRKcD1cDCdot1WMqysJCd01a
	 3EpYf2xEan4cGx9wBqqjZV4BD9EfHZ4r16wkBVc2lNxJJ8sw7TdH590WS1OVPEuRPwpG+
	 xaAjOFRszlwarznuY6iPjcXJ0P2Shpz5lsCswqrOvJIr1Jy98+oy1CzcwZF95WQf4ibMe
	 eEufEwAQxJkjXKiv/dhJnNIT+o+ghJxRU2rVXXjTzG0zJLYqm8yA+K9p1yEpTElHFVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=;
	b=RwcQPtQZspH282jG47gU4/dS7adXNkp26JL4UV6Fg45N73BAeVkTGwvck+PkDDqezDyl
	 OsAwp2SBIlk21W4CdKZ0BAebZoUMInBOFGZY36a0/JQv1RKVf8viRAe7NNRqQ/A4SzfyE
	 SDhuZrWlyamZBrPBqSMlEaeUVv6cLlpSw4kXlOpjbv/j/vW4Cxfr9e+YUdKbYfrASSaqF
	 5VeDEckeTtGPaHsFBduS3+IaRJ9Ku67mDKoRj+qn1sR0KovVX3krSPkeA8kytT8fZOO7+
	 MCURibUdr3vsxKxSMaWZhIp9RboX9SJIZQObkP9qGEbtSyWqlP7H8N0WJnLZ6genlkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zq8B7A97;
	arc=none smtp.remote-ip=74.125.227.196
Received: from mail-pi2-f4.google.com (mail-pi2-f4.google.com [74.125.227.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C66606A321
	for <loongarch@lists.linux.dev>; Fri, 27 Nov 2026 09:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2C66606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zq8B7A97
Received: by mail-pi2-f4.google.com with SMTP id 41be03b00d2f7-cdd8c1fdf4aso1489707a12.1
        for <loongarch@lists.linux.dev>; Fri, 27 Nov 2026 01:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770565; x=1796375365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=;
        b=zq8B7A97b0nyxWsobt/ab4F8mOuPzTwVqK5oF0A6gYMBSLKMp3e8sYF9zVx4gOwl61
         22H9flDv+rGGnZ5QmIRYL4hozthtSrPSpIvwAJDi3DU4yogdAiOc/BOVYscYblq2sQSW
         kES/jWdgEse5N5F7SzlJCgMEWOjl3/x+YGMc2ZUkNAXA/XKD08lP/UpJ6KkM4fA4QMgN
         +dO2ObZyGKeyBUL0xmEkN80JFx0RHP2bVTRsN+6dZByo90ShMQhR+lWJq2kSkOGhBKaH
         4qgU5YS1JIMH+YrHjJePY/wbgkVKsazFFB/aXEigc5IK5fcQ2dAKUQd4FnE8Awf2f/6C
         J/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770565; x=1796375365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=;
        b=f+tqBEnL2icEdLYfy2DtWbRzFBCSdDBtbhIDWmvEHaN7rG8MTi69KDTyXXWnquOnlO
         WAcRDQnqTF4guxIOJDoUG8cqk+kJfOWUtWsXNXK8BswKwC9QcITQAy+JFmSWVRmj/Zpz
         gfAWZHC8jbvtIi+jToGjflJKw2RAAnb7pP2QwOZJq4EecNceTqpq5mG/GCFnaFT7acHY
         2ZWxhS4YGY3rKZ3YZLZnmbalDRgPs7pGwt2QUHUfoVwwaBPSjN/lWPeXWWsWdv9PJp08
         wQHT/eFA4TOcc1GwldB6BqiEq/wecH0mMyMY/vtn6gz16Wm4kbmvl8hr0imcUOA+LMoS
         LuQg==
X-Forwarded-Encrypted: i=1; AL+hErGnetR6icpcECRfptj7HSLtZ14KL7SoAW6CFJwCebGRmOy2MJDgHlnwOdYEEzwFZ3Q0mdQcvIfk9wU=@lists.linux.dev
X-Gm-Message-State: APuU4Z8yM/1ae9uyNKnbCQUKnI0XJllkCCrzayZe8yj9nVc/xWpEc0og
	0qle6Iva5r/x2FwYnNDewl1GYdoK2Kyifdbtp4mcItpyWeYrs22cfRYE
X-Gm-Gg: AZFdTZe/8LTF3SfXFoEwBuKGpws699H2aBkZoJlwhnSdTtMOCoYQ5yRL95znmubqBZs
	2iX5ORHJ2CdFJcyrkr+YivcnZN8npqMqEaMsvwoXZM8N0dCe5T6E3sT8Fwfjslq+cMAeNgJ8QCV
	T97xiNsDpM7adWW3rZBeSmYij4hArhcZDENSZlgz6CSq/NQAXh94q2kpVG3FitsTVoWzPFSi7Ds
	kNXxZVJiNJYsnAYumIFgPEk5AUlV174efiqUFKb0kwyf8R+s7750kuONbuk0DIgQMSa7vr1jd24
	dOcDE7BF//I4P308EgrtJSSwg97npe4qGVfLrB8y5FW9YSyTuKTVGi4xC4jgQIYD7puus7hyg5a
	bGR/g/vAidJ2ODLQJznujsQb0zZiSt3hXibv0x0IWYOALdKI2dTbCqHYg3hClSUToNYVPfkPVw/
	Hcj5dn3R56PMBGojJJLe/USTGB7mkA5X//n+FlVfVEvu/30xH5mGqT7+S1TP0WQcBWMvlfJUS5s
	X7qGZUw6W2cOo2nLm5NJmbnnK+zzcCVlV1u0LVYoUkovsf4uHLQSSdRTChpHvT4sL8Pd+ZzQVup
	GH0P6mjTJCNnkPAj5j0XewaKdoidygZdttL1GMavrw==
X-Received: by 2002:a05:6a21:3a41:b0:3e2:30c1:fdf6 with SMTP id adf61e73a8af0-4014e5562aamr21306213637.89.1795770564971;
        Fri, 27 Nov 2026 01:09:24 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:09:24 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
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
	ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v10 8/8] crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF header
Date: Fri, 27 Nov 2026 17:07:23 +0800
Message-ID: <20261127090723.741253-9-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127090723.741253-1-chenwandun1@gmail.com>
References: <20261127090723.741253-1-chenwandun1@gmail.com>
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

Reserve regions (for GPU, DSP, ...) carry no data useful for crash
analysis. Exclude MEMBLOCK_NODUMP regions from the vmcore ELF header to
reduce vmcore size and capture time. crash_should_skip_region() now also
returns true for MEMBLOCK_NODUMP.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 kernel/crash_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index e161c8b65e00..0e2ddc933b22 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -283,10 +283,10 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 }
 
 #ifdef CONFIG_ARCH_KEEP_MEMBLOCK
-/* Exclude NOMAP regions from the vmcore. */
+/* Exclude NOMAP and NODUMP regions from the vmcore. */
 static bool crash_should_skip_region(struct memblock_region *reg)
 {
-	return memblock_is_nomap(reg);
+	return memblock_is_nomap(reg) || memblock_is_nodump(reg);
 }
 
 unsigned int __weak arch_get_system_nr_ranges(void)
-- 
2.43.0

