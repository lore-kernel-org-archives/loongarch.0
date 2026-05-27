Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7368382F17
	for <loongarch@lists.linux.dev>; Wed, 27 May 2026 03:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779852627; cv=none; b=Jwa5TRaKKgp0rPu6A/aEHyXy4IDw5Z5PJfasS5tEwOpAMznIlF4JczcsE8YaB05fJmCr19efauhOGom11ELCQTbTJnKcD+S9kN4zvATaTPJPs+xeJLQKE0bA7tl6qR38iQpQg/Ip3F/T+X3LwUZO/IofzWfGTCSWT3CXU4YbMAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779852627; c=relaxed/simple;
	bh=7kxqwwsFAI12NVUnaU7kq1LIiiUSTsB+7iEGWDm4OPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pTzZ8SmtqHON9iQdwVb1xeDkxYpRPhWsgZH/Q0ttM1iedVO0AEdbxmvOePBAEnLFmqp2lbEGEeBAQVXOiDra7SFFXinM0LrF/FIOxIBWTHHgLoFEd2WprJ1sA6vl8LHinG30VKekhbTiSfG+A0S09dLWSB5GBIOM3Uu1lmwzuC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D0q7L6VX; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D0q7L6VX"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c798fc1a28cso4790989a12.3
        for <loongarch@lists.linux.dev>; Tue, 26 May 2026 20:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852625; x=1780457425; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuujAuF8eXBWdShhG/kW229CX67XgkUB6V+YnX45VpI=;
        b=D0q7L6VXReTrcBEFxFJXq2jPxo6XfXdbXcP+Ep56CmhJzfw95JX16pVcxL232b63rU
         u5u3pw8SgLqSn2yTO7z8R6ZORz1Us0E1zjIHv6MquPPVOu3XkziklIYCuZ10CDm4XQ5D
         ynqnPj7QD6J3lTJl9quPc5kXdQ1Zm0XDIYai4GWL/bxuSC7wy+WDvkJlYzz84n7Jd3Pz
         S+clMeZSU1suerf+oTOAZZkKzVS0dax/bimNc2Bt+fTRJzN3xfTWGxTOx5fBt7AdamlG
         cf2YBaWdb3wsTN3G64DJA0vcBTP+VYVUlLdiRdBTAD3TWoc9lEtr/r/ptD+J0pdnXka3
         ngpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852625; x=1780457425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DuujAuF8eXBWdShhG/kW229CX67XgkUB6V+YnX45VpI=;
        b=UDhLZnRvoqFQsyYHN1dgaLZsPTa+XTZIc/tBfAyaYi1oRq/qE50ulFc3r5VylbaOCF
         4d+WPwaXBdULq4gB7CAnIFFA2cp+vUspKCKo4eiJxgDNlW27L4Co6d7CEaNkAsMKilyU
         Pbu9azZrslN2tE9H6Dz6E/q2BgyL4biTpgOssAsUVBzAr7wPHDO3JOWcQ41gBsnYNpsz
         caaAaFFlvCuo5e1spOxQyH/g8q2hjsDLrKqUEbZjrU7M1+tscXIozXuN0BS+rA7rDFfU
         BI4MIlDKUiNzY7wId+3g6ZL+OuwhLf4T5Tz19qpNVObRoAlYEzGLuwvom6xCVLv3lSNQ
         iwlQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5bEIENdvaweIwv8JGkIE2/zcAkdqFHChCovg7G/ZlFCAhlULZtc9Ww1lTHsT/cD3FGanc7wZwU3o=@lists.linux.dev
X-Gm-Message-State: AOJu0YwPw38xbg5gtPuQ5iodv3Pdyf5hFfr8GarqdksleT1Ex5M3WTvM
	iTPsQMxzhBLSOUk7MbJ7Vvv3h0OBAbrRE3IudOTwTl9awggpJaUdvibq
X-Gm-Gg: Acq92OF5rfuEnqrCpw8/LIiZBc5P0Fmw6chWsLq9KbJGk0kJS14NWlOmQWDhhV9KpZU
	K/Kqcrpgn+vKNgRAnG2YXISD3TLap2htkb5EfGHgvLjZQ6MQoGARuyuskhD7b52Jq2P8kJPYLDf
	2SQPpDzHvrd5ZQp+HHJ5ZiwWDGOpmLShDOm0BiFuHu0pPLl2xIZcSKP6TyUKdI9eOTpZXTZhSTm
	GLcICWAxM9BE7kXXf6fGUKPQtL0gi78hKUhseQIpspbJds9SYm1s3MLJSxedMPMkzmI2mzvHr2C
	LxUO0Cg1Hw1M9tipzl8RKbYinkZUEWqF5ldU7T4qzj3+8saBRAu3Dhk5mIR1kK27jw2XaN92ZHd
	SXRWb0aModUv0WU+G3LPFl83STexN15/4Gda3Ny4R9En8Glsin+Z7W6z8O504vaEygF+H1gunwJ
	5q1RoRoZURKtVixIUrGOTcmH9t+ge3jHJsX3hL
X-Received: by 2002:a05:6a21:6d81:b0:3a3:17f8:bedd with SMTP id adf61e73a8af0-3b328cc257bmr21442620637.17.1779852624627;
        Tue, 26 May 2026 20:30:24 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:30:24 -0700 (PDT)
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
Subject: [PATCH v3 05/11] of: reserved_mem: split alloc_reserved_mem_array() from fdt_scan_reserved_mem_late()
Date: Wed, 27 May 2026 11:29:11 +0800
Message-ID: <20260527032917.3385849-6-chenwandun1@gmail.com>
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

Prepare for storing /memreserve/ entries in the reserved_mem array.
alloc_reserved_mem_array is skipped if the device tree lacks a
/reserved-memory node, pointer 'reserved_mem' continues to reference
the reserved_mem_array which lives in __initdata, storing
/memreserve/ entries into reserved_mem_array would result in metadata
loss, and an out-of-bounds memory access will occur if the device
tree contains more than MAX_RESERVED_REGIONS /memreserve/ entries.

So split alloc_reserved_mem_array() from fdt_scan_reserved_mem_late(),
and call alloc_reserved_mem_array() whether or not there is a
/reserved-memory node.

No functional change.
The actual /memreserve/ population is added in a follow-up patch.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 drivers/of/fdt.c             | 7 +++++--
 drivers/of/of_private.h      | 1 +
 drivers/of/of_reserved_mem.c | 6 +-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 82f7327c59ea..83a2a474831e 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1284,8 +1284,11 @@ void __init unflatten_device_tree(void)
 {
 	void *fdt = initial_boot_params;
 
-	/* Save the statically-placed regions in the reserved_mem array */
-	fdt_scan_reserved_mem_late();
+	/* Attempt dynamic allocation of a new reserved_mem array */
+	if (fdt && alloc_reserved_mem_array()) {
+		/* Save the statically-placed regions in the reserved_mem array */
+		fdt_scan_reserved_mem_late();
+	}
 
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 0ae16da066e2..50e5a533e059 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -187,6 +187,7 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
+bool __init alloc_reserved_mem_array(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 05defc91e901..888dcb6bdce5 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -69,7 +69,7 @@ static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
  * the initial static array is copied over to this new array and
  * the new array is used from this point on.
  */
-static bool __init alloc_reserved_mem_array(void)
+bool __init alloc_reserved_mem_array(void)
 {
 	struct reserved_mem *new_array;
 	size_t alloc_size, copy_size, memset_size;
@@ -272,10 +272,6 @@ void __init fdt_scan_reserved_mem_late(void)
 		return;
 	}
 
-	/* Attempt dynamic allocation of a new reserved_mem array */
-	if (!alloc_reserved_mem_array())
-		return;
-
 	if (__reserved_mem_check_root(node)) {
 		pr_err("Reserved memory: unsupported node format, ignoring\n");
 		return;
-- 
2.43.0

