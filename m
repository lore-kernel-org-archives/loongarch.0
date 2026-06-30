Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63823E3163
	for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 07:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805684; cv=none; b=IlHux/ukO9xQYqCqnXrdm/LCR6d1D3JFhQBjJ9TDiIwRcxxIwLa6kD25PqroYdYdwji+Ov3o5tMrKS8TQsty6iy7Bp2lrDAReC2ZwLYsCtWyqzLRNa0ji1fvWR6uu6tBcfeOXWHXVBRfWh76dXuTlMb63rPrtbCHC9fuxBZtlF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805684; c=relaxed/simple;
	bh=eRKNOIjCkiF2jF/wqDsLoKJFJ7gQkK71h6q8X23yaLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h/RIADQOlVY86dd7IPkGi4VIf40DCsBZ0V5Az+zG/8NashMQo4hI/F6r0j3hOk7g7zEmej25rKXAe1oBh1ukXgwFTuvnJt3pEg+bmtDcs25ieDSsZwIRsayKQDE91D6j62ykdFquQkzmCelrGajW6ErbfEscZkyBt/u4kyMMeBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFewLym6; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFewLym6"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-37e4098e920so1720573a91.3
        for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 00:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805680; x=1783410480; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Grclqvhv7nIlB4Htu6FP2QRzAU/Ix2vbgSwcdXfpMs=;
        b=QFewLym6Lx+VHqKHROkBXkZTpxoLGUQZCoxwT1CRWOKh0OllviiI//eY6XapBlBEjw
         v394C4HAiZS1Ml+ri84llMmWGkOOrH3AvmP4gRFzL14UUDai17pSRQfbQiBI0aIkt0FL
         DxvCDDhX7fZTccic+Pa7z1NEQNc+PCKOy/KNuQmWcfJ7/gqq3d4jUnHgnts4sERgHv5d
         VOwFD+LISNaMl/ZLXOvkG9RX2Zv4K0golprSnMezfHRBnmcxiCOu5Q8zIoEGNrCn1Crn
         AM/Q7m0bkKAscbHx9vJcUbasnIzYpHgJrLeJgEG4nd6Y/TTY/nf3PucKduNiMD+Govav
         E9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805680; x=1783410480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Grclqvhv7nIlB4Htu6FP2QRzAU/Ix2vbgSwcdXfpMs=;
        b=Sw6Oj+lHna8D1Gs+1OXZaXZex0g9y+cd4Ilf+rYwuVPyWKinJwx5FRnaevGMkYQzaP
         F/Clv09poZC287Jugo/8phP5lEFrL2dt5U8uX6VKfDnLyhbJpXgLPCrAh+FLU5YVU2Nx
         48JBUJ/EWBPmgW+J3unrtBjlwOEB9KWriVGTAKcRHNd7fHWFlL3Pe16SYdxolkt/R1WZ
         ox/20GW+yJk8DDVduvh8caBPJZ5hlTR5xQckFLrdEpEbY4VmIaGEc/iYsFC9bY2ZzQCH
         dDb3bgE8zGTyJnUzE4jyJdyMfNJtpBNI8UrkTm101CBYB45PMYNvQzZHR1s3Sh9tHks9
         7owQ==
X-Forwarded-Encrypted: i=1; AHgh+RpqfYAnc7+KRCMt4QWsaLujKQEJn/5A3tFUxddRy+uxobxt+hgK1XmODyfELMzW6rBT2TBVG8QCKVQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPPkIxfVtQskqXxs/bTwfMzdjm9KYAbmuAI6GYJgby0TfbSdYV
	SOHpISLlEji4I/bAxaxl0S+GRYZOFf1Z+r3yeCpGPRRjLL9Z82ktt+H175VHvWvosJw=
X-Gm-Gg: AfdE7cmOfumg+VYtNq4m6wdfVumws8/Wtw247yac9d47xbpG8OPPmUgm2bDg+qZAbvV
	MGgkl8P8oXWn1U5CWnr/Dzy1kTSsgeLgXZSsZADaVKJos0r7lfYKu3JIkA0AvWdVsnPfiLOmku3
	U4nhPPWd/3k2daPFKQ2rvt4PAZnok1WuYEzWbafsNLGy0LUfSHZkekul/+NKPX5kt+0enxo305K
	/5PlIk8eCz31rPVUP+T8cj5ZU7wM0+ZIwXunK/9Ty0pF1Oe8rjmiNSylKq4nQNp+t+hEqBPiYvE
	SoROKhxaNGnG11zu3yk/NjOp4P8KPH6KxqCog8U7mDBl9ITGPk1+s+aSvG77UlHVpiMreB5PZxc
	B6L/u91Tj5n9Llt37tIj0gCIboBJfZyF4c8w208XMtyV/UAFCz0U33xt7i/d+VGLkdaTlmYvi7H
	zXGKd9TNsbbsqKRZrQFSZdlnFaFQ==
X-Received: by 2002:a17:90b:3c8e:b0:37f:9ce0:af34 with SMTP id 98e67ed59e1d1-38052826ad9mr1631272a91.31.1782805679897;
        Tue, 30 Jun 2026 00:47:59 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:47:59 -0700 (PDT)
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
Subject: [PATCH v4 03/10] of: reserved_mem: skip late scan when no regions are reserved
Date: Tue, 30 Jun 2026 15:47:07 +0800
Message-ID: <20260630074715.4126796-4-chenwandun1@gmail.com>
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

When total_reserved_mem_cnt is 0, there is no /reserved-memory node
so fdt_scan_reserved_mem_late() have nothing to do, so return -ENODEV
directly from alloc_reserved_mem_array() in this case.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 42649dc3613f..e1bd35115cc1 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -76,7 +76,7 @@ static int __init alloc_reserved_mem_array(void)
 	int ret;
 
 	if (!total_reserved_mem_cnt)
-		return 0;
+		return -ENODEV;
 
 	alloc_size = array_size(total_reserved_mem_cnt, sizeof(*new_array));
 	if (alloc_size == SIZE_MAX) {
-- 
2.43.0

