Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE977380FC1
	for <loongarch@lists.linux.dev>; Wed, 27 May 2026 03:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779852603; cv=none; b=MfICZ+UUlABnI5GlWb0t0sFhuSJC1G+fAW4FMi+PmAcJEXWlNvJODzyv08QqM4YWiZld0yXguemzehFZWbMmGWU4HjPOlgNhq5mni6ExSwNM0i7fEWczJRBmyrq114cvg2sprWj0+rcmRld4b9sI/URkKyInYuoHOBK7PZDAXhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779852603; c=relaxed/simple;
	bh=xH1JOzQprSl00bucZAjsEsVNgmNvdSYAgclnF834gwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nk7/z4mIc+7zOvPzhQRKgnk7EjqPeg8ElVRvYvmm7yWqQVYTHcMt3AG3Rn4uZI3wGBbleJLfj5529ydaOQXLsS1STpbXe9j0YLE92yYUqQEtfT1KgRZWkUTjm6I0WpNs9qf+1FMK5NuDM+dT+k8cEA02Z0SZuh/FcVRQ1wLxh9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WFlKSLQ0; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WFlKSLQ0"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-8353fd1cb5fso5643322b3a.0
        for <loongarch@lists.linux.dev>; Tue, 26 May 2026 20:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852600; x=1780457400; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nz17AGesBxrxvpMg+ldtjUwMkbrsU+FQ5Omh3mR+f58=;
        b=WFlKSLQ0/mdIBCds8B28tbjLmv44JApG34Jf46mUAENvxOJ4H24D3oIpuz9Lg1ngGx
         GFYBs6vLVAzccLk5bj5NevHK4Fk2LRyr+8dnO4OIPC8otMKkztE2Mk8xrZe4Lwjb6sWs
         nSSgJ/gS8OgO7MtWzw3YORozOfRZ44UvwIIApe22mfchNm4z1Hk7ekkSRTKPL5bbgCv2
         Fb1LTqDVoFieT03KMnqEXYXBi1Tj7oXWPYV6W9MhtQjVYF52TAot0Zy7eckQskmA/Dkz
         yhfbb91sT/JDvU/srDBVEXuOD8Lcvr2E4ZeAHZ/mEe9KF7krL6ijv1JjkPEGFh+b7Qzp
         ky/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852600; x=1780457400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nz17AGesBxrxvpMg+ldtjUwMkbrsU+FQ5Omh3mR+f58=;
        b=SC0pc8XkT0bsDVG/JV6taFVjUo3R19n2iQlFwxImQRWgtr7iuh/qoKxRgyAzr5NC9U
         LSl7HGo6r0SlDvcVm5muZMdf2GVpvhzgA3NSqI0DPEtydlrKhriHrtBHRffzK7ZBX0EN
         ZF28WFUfz3Wg+jaNcZXRkmOS2ya+sVo6bPAD0Y9rYePOtLLDx7XjTE7cj1IxtuYCu/Ek
         vFh+MoLzyK4WYPUFX9XOYkab5DMtgGmy179Ko5dRKVGIimedK+6Z3SIqGR2sKeRnlsRf
         PCPnfTo1g8ldu3rfaYGXZjwWKXHOKBrD/Dpoa+KZoJM9ZVDFk727fn2o+0SDM7MExaAi
         MdUw==
X-Forwarded-Encrypted: i=1; AFNElJ/Onn2pB1kqHnd0z8KWMovg+Bw5bPzYXdiG2ebifDr8h7MH4VC4s7ntDXbMx4S32AbXNWhDWH8R0nI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1bbCmEPjGOBanaLPxnLM/3+dnoIOwj1t7phXCwRgt4eAAjZ4t
	YfHtrPCa7TMl0Y4T7yJey6BMpwNalXVoNt01cpEGCC3XZPYq41XNIpKg
X-Gm-Gg: Acq92OHda58gZz9KpjG2Yk2qETo6luoMwYsvIl8wW+ye7y2DwVFg4nB5PoVd9RTQNoG
	7BDdCFo59/3wKown7hqZ9dUpTp/IjlEc0Fh+hp07U6CSdJc/sZpXOPGlsEBUGhNfrCwUD6nm0+x
	3+XO8wKJ6NV8mrDuyhgXQsbMz5Eb1b2SZ2+xUmLdy0upzkuGwFueX5TORKSdve10Y6gg8CXIrHW
	PCpNrrWfUsiM+bi8d/hqBd3wwFqFPub5fKlbVfGmKWbFDtUT49T8V32e1E2sV7K00WDclR+pYiG
	3uEb/mWSUTU2GaVRTMaMYrLBCtTUQFgpYUGyPLjhmO1DMzOuLlqij5vbECYuagyqAsG/Or5E6+g
	oKy7CQ3Ps/n74lJnEHXxkD/lulfsZX0FRcnw8vS8fCkRJxnix2lpPTi3VfSv40me5E4dhdx1ZAo
	AuKEwuEYo6iyYi/fkmMudUJKxBkp/Ea2eaPwf4WrDwhwc4neI=
X-Received: by 2002:a05:6a00:ab86:b0:82f:7cb7:63c7 with SMTP id d2e1a72fcca58-8414b427c3emr17125755b3a.11.1779852599870;
        Tue, 26 May 2026 20:29:59 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:29:59 -0700 (PDT)
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
Subject: [PATCH v3 03/11] of: reserved_mem: avoid post-init UAF when alloc_reserved_mem_array() fails
Date: Wed, 27 May 2026 11:29:09 +0800
Message-ID: <20260527032917.3385849-4-chenwandun1@gmail.com>
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

The global pointer 'reserved_mem' continues to reference the
reserved_mem_array which lives in __initdata if
alloc_reserved_mem_array() fails. of_reserved_mem_lookup() is
exported for post-init use, that would dereference freed memory
and trigger a use-after-free.

So reset reserved_mem_count to 0 when alloc_reserved_mem_array()
fails.

Fixes: 00c9a452a235 ("of: reserved_mem: Add code to dynamically allocate reserved_mem array")
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 313cbc57aa45..6d479381ff1f 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -69,29 +69,31 @@ static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
  * the initial static array is copied over to this new array and
  * the new array is used from this point on.
  */
-static void __init alloc_reserved_mem_array(void)
+static bool __init alloc_reserved_mem_array(void)
 {
 	struct reserved_mem *new_array;
 	size_t alloc_size, copy_size, memset_size;
 
+	if (!total_reserved_mem_cnt)
+		return true;
+
 	alloc_size = array_size(total_reserved_mem_cnt, sizeof(*new_array));
 	if (alloc_size == SIZE_MAX) {
 		pr_err("Failed to allocate memory for reserved_mem array with err: %d", -EOVERFLOW);
-		return;
+		goto fail;
 	}
 
 	new_array = memblock_alloc(alloc_size, SMP_CACHE_BYTES);
 	if (!new_array) {
 		pr_err("Failed to allocate memory for reserved_mem array with err: %d", -ENOMEM);
-		return;
+		goto fail;
 	}
 
 	copy_size = array_size(reserved_mem_count, sizeof(*new_array));
 	if (copy_size == SIZE_MAX) {
 		memblock_free(new_array, alloc_size);
-		total_reserved_mem_cnt = MAX_RESERVED_REGIONS;
 		pr_err("Failed to allocate memory for reserved_mem array with err: %d", -EOVERFLOW);
-		return;
+		goto fail;
 	}
 
 	memset_size = alloc_size - copy_size;
@@ -100,6 +102,11 @@ static void __init alloc_reserved_mem_array(void)
 	memset(new_array + reserved_mem_count, 0, memset_size);
 
 	reserved_mem = new_array;
+	return true;
+
+fail:
+	reserved_mem_count = 0;
+	return false;
 }
 
 static void fdt_init_reserved_mem_node(unsigned long node, const char *uname,
@@ -266,7 +273,8 @@ void __init fdt_scan_reserved_mem_late(void)
 	}
 
 	/* Attempt dynamic allocation of a new reserved_mem array */
-	alloc_reserved_mem_array();
+	if (!alloc_reserved_mem_array())
+		return;
 
 	if (__reserved_mem_check_root(node)) {
 		pr_err("Reserved memory: unsupported node format, ignoring\n");
-- 
2.43.0

