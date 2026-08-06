Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DD94399D0
	for <loongarch@lists.linux.dev>; Thu,  6 Aug 2026 09:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008975; cv=none; b=i5agMATTM88Bww8JTWVq249+3d7dfQWb60VEwFad9VrYDpolGyjtsXXGhQYQTL5JRC2v2oeR5WvqN3FO+T41AcjC/zvO9SwgfWY62ZPM/XWBZVOENUlHJx6hKh/quEOXiTGAfiHuAGxbUcUgLruYlCvpilrWuosV/7apN6blZ1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008975; c=relaxed/simple;
	bh=/woMQBlsW3X8qxXLH9mBLMDq8jOPUBo5XVC406TKw0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KB7OfQFSjP/O8O58FqtsyzWVb/la0lwkdoILfpCF16/yWpfn38QsAMwLEd5MU6sEZuOBFtaEVunusxHU/HmvJAGofWM1l1X2Feo7WgoQYaNGx0d2JfOjOtZHCag6TdGCnlmY4+3R2ydHgjD8fEzPZe06Jpl+94SHddtSZPWgBhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QedUrxPB; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QedUrxPB"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-cbb818e57c9so1074146a12.0
        for <loongarch@lists.linux.dev>; Thu, 06 Aug 2026 02:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786008972; x=1786613772; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxssx1F9jirIGuLt/jYdKLTnwp1BKr8qLnqrQJiF24Q=;
        b=QedUrxPBxZK5v5B2yS+8g8vpRa6E+7tB8Aq4RKbSxJCk+EM932cGDvMSyEXc0ZKe/A
         6z3v3yuBo6q8EENZANViHpu5WGJ4IaqBblkqfvkoA3v/A9bKfn9BogZOhtchWXbu+43b
         OV9ywKUl9P0pVazj//ifH4bOdgGt7NOzgOm3cZP2IdlfMTL8RWSFrE+B86fZxR52yicI
         Wv0H4cpKYcYP4ueB6pghNAONB3YT6hjVgZK04rjdhddPtUiizbefoKsxmcxa1jrBtsKS
         /yFWVGEK9hyvmE21fb65rmMgbQQz1cgyYXgA/riJ7Cxs3OxyaESqFMklT4gpbDrEX1vD
         mQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786008972; x=1786613772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rxssx1F9jirIGuLt/jYdKLTnwp1BKr8qLnqrQJiF24Q=;
        b=VBzcyLWAuSC/Itd2cLQnPUUBbGv6KwgO4H8icbIoNhCpbvSVNqJhd5xoyOwYCGjhvn
         KPWZRLPqq0cq1bfoQxzXPAyBAIi+odLl2l6OKra7GgEQ5UHmjGBnFTBUp58/BgFYqZhU
         n0l0NmhEF8o7swjXzvwTyNUyfOywupBY2dvnUKqHItTPvPpFaGYpyQWhh8Oks3IZQbpu
         aatJZYkFwz+Yah6N1Lq2J0G8Vomj5FldXObEskp8JPsccSnwZdz8eR1b0xysFJnRmNZL
         mFlxbT6GerRh7Ei+IQ4z5mFFM0Yxut7Cay+IClfp6d6x+U4lVlhytv+S4AvxYr1db6II
         YzoQ==
X-Forwarded-Encrypted: i=1; AHgh+RrNQbX/Q6eskQ4x7KCKnNg0WlMvcmlYkvvJPN/QDBWgCxHH1VX0PcMBQeAQ46LcNr4OF84dRWI+Sjs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwgcHk5+Hq4eNvlQibu8N+2xBf4PLIAunWnXH4bj4FZSoZCRgaq
	N7zZ2dYOPTBB9wiIgTlwEjJEWJdTq6s21emvHRlC/eUAg4ObKTQGmVrx
X-Gm-Gg: AR+sD13kWy8wwr99x4g6EmS1luBbJEi4J85nvl7R5l15lumXeMyF2htyKeVDsc/El3F
	bQ42t17SchI/xy9XIQLwUGwn4KFn/mZt7RqI16NuVu1okIbKVO71PCA7s9yMgTrsS09Vzs0PI4F
	VmBHjKDWgI9xSrHhYRqF8bxr7h+aFhZ7/0gzoJc5xPKdV9CCPfLoFwUA5JWkU/pLkJzN6skzF0s
	uycPfey38pheWC7Fa9pxZwLenGLNWsyTa3tfvG1ifH+QVvo0aff82GC1YiwlInBobPp4vFCIp4N
	urQLjwHEMUJIajTFkwrcQnooEzlG74miCiXQsLyREQeHF/heqwi+NV+pnp3UT6eq5tZpdMrELTs
	AgEKYEfiQgfeMQ2PdEoD+1+8KTxnNjaF+1iwF0ev1mm5plxHAqKoRAjFGRGjcaVTaINwEGODuXs
	+V+PHn7lr/O9jX78V1wtoAOsb55ZcuvcecXALUOIcL257/X+w6/vEHWJ0T8M01/u2zp3qLnyZuL
	g==
X-Received: by 2002:a05:6a00:80e:b0:847:e791:d5c5 with SMTP id d2e1a72fcca58-84f2e0dc989mr14792962b3a.35.1786008972602;
        Thu, 06 Aug 2026 02:36:12 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0aeasm1043878b3a.13.2026.08.06.02.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:36:11 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	baoquan.he@linux.dev,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev
Cc: kernel@xen0n.name,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com
Subject: [PATCH v5 3/8] of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
Date: Thu,  6 Aug 2026 17:35:14 +0800
Message-ID: <20260806093519.2907771-4-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806093519.2907771-1-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Mark non-dumpable reserved-memory regions with MEMBLOCK_NODUMP so
kdump can omit them from the vmcore.

The marking is guarded by CONFIG_CRASH_DUMP so non-kdump kernels do not
pay the cost of splitting memblock.memory entries at NODUMP boundaries.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 7b1616b9c6c2..f38d11df6f15 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -674,6 +674,9 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 			rmem->name ? rmem->name : "unknown");
 	}
 
+	if (IS_ENABLED(CONFIG_CRASH_DUMP) && !rmem->dumpable)
+		memblock_mark_nodump(rmem->base, rmem->size);
+
 	reserved_mem_count++;
 }
 
-- 
2.43.0

