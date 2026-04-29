Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F8E39DBDD
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 06:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445966; cv=none; b=ntoexmbUdIAq8Y/yfBv4J/notCGfDLAsD7Wi0/LYeFxnjykaCyrY99rxJI+r/8BFGbQcoUQSfIbHBNGN+O4UkhS+Zj6RcrBP9wqDKz0eN3JY4u+4p6Yj074/ZL8ak/3iLNzexBEqCiejYDhyvyDxMwK4GJbk8LzHWpqrj02RKCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445966; c=relaxed/simple;
	bh=AscXsVQdQtSzP4LlCGAz/Bs520rvB9Y/aAxkWx2lFak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kmFFZ4mPhapwfCoGhSsEoMGvy/GZ4HH2blXSHWYd1q5/zAOBniDX1O6pbUxupUxVrmLJIRtw4adhgVWqxplwhBkJEBxV/0VZOtjA795/OT0V3tYWKxlncd8Q1EB+U1B3XiEldqabl9W7DqzabRGG6y6PrtwdIgt1vRZ8yoAsF90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGog5i67; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGog5i67"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-82d0b68837aso7235094b3a.2
        for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 23:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777445964; x=1778050764; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzSUcXeQbcSyOJLVmBDEIvlXQPXERsU2BOZ+obvdQ0o=;
        b=jGog5i67X+IZoW7/cYgR13nHo5AsY/3xIF1e2LSZAxscQezGPwDYQR0r4Jr+qIIdfR
         H67aXOlBHlyy3Q38OMWx4ojKt52xhMn9yugYEvJSQsJo41xtac15JXlc2wokjo3Wbvw/
         bC8xmmJRvnWuvfl3nVQD+IjdvrltrvPt+dygUcEoBF2UwuNA+l/QiZd+gq3JPdyTjjqP
         /TQetuBOXVjNVCsgfTwKzaVZr3wLcO0VGzI1wEe24BkIv0tZmbPf2O5xoqEf2vM0aeIQ
         qMRQq1W20BsF1m9bconW1CqDpAq3LRiUHYLNcW4KLAvew2T0pVR8HlB2dPiquECrBWzW
         +n5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445964; x=1778050764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OzSUcXeQbcSyOJLVmBDEIvlXQPXERsU2BOZ+obvdQ0o=;
        b=RYWXe6K1hKW/rddUSgcX4JpVRAwA6re/6onVmRSl+XtInsfO0Azm+B5zY3Hfg3y8NT
         aYDTdvecmBEPtkfoV9oa7IqdfZTTLhIonnbyQ28QmnyRvdQCHXQwCPixGh9QW0NQZ30K
         9vWWQDcjPsP4XOq9jllYky2mu7kTo+Vb799jS7HG1lhMJaYI4fBG0JC5ajzcVOmyRy/N
         zyd7WztrnwhvOvHwu5FsOOTypDWTS/inErXuImtvjWcoGo6cwQw176oBXpDFixsTdTve
         TnmL8FaDojh71xKlKXskAxugDOZLt9LPQwIiKM2iaoqREX0F3xRbZZ4JV334tIUln1Rp
         Ne+w==
X-Forwarded-Encrypted: i=1; AFNElJ8OGxIM65wGET30SDEg5D9gDR4GeQYexIf46TUpTxRfCnIrqcOguLVokJI9jcaNZI0cxKZaDI9/pTw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHA7GlmignUYqQd1yRM7yU/T5n5Kwb1pTzAtqFUDQjTgiGMgHE
	FY3EFtV0eibMUHvBBagwh8aEJ6+jNuYnROScsLeMzWOkAe7eUnUS/ehO
X-Gm-Gg: AeBDievNrxVYRA3MMHiU4dpyF9croTjUT8zusYsf7nHK5T/AtBCt3odqwr4XPK4k75U
	rcOidc7G9OIbPNYX550wPlLxlQDuMVcZz/TcLhfFwJTv8H+1r4fZ8DzJoT1zum3uATk0ZziHzES
	Y6xPT7XVxWPkEACg9xt1XyMr4CjfDfktplGcAoj3SLQ7oZtI5Y5o8gD5OEjuqnu7e9xgKFWHPsb
	yuXpck3NJBCAC1fl5wEr2i4QXHgYm0vKjueL9FOXnMIGWOJX1wboTx5qhXcEBWI4SlIIgR7wm2Q
	+CgfhCSK0l3A/TPKfjHjAoDKfc93jVLOxJU/5v/IQvVmmWW06vVwp+7/TfRS2FRcviwKHh3I8Gi
	/QTxKDGR3NRx7ADY+zui95CxoC1VkQ5q60TSZUMm9uoPNOyzuiCd9xbLFkbPdEFmJpC8yleBCNT
	p20qi3pFHgB0oA/TGlZe+nQXKGrC/51JnhzYiykhZT37uVZTsH
X-Received: by 2002:a05:6a00:1c8f:b0:82f:29fe:7239 with SMTP id d2e1a72fcca58-834ddc4bf7fmr5980744b3a.50.1777445963631;
        Tue, 28 Apr 2026 23:59:23 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:59:23 -0700 (PDT)
From: Chen Wandun <chenwandun1@gmail.com>
X-Google-Original-From: Chen Wandun <chenwandun@lixiang.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	chenwandun@lixiang.com,
	zhaomeijing@lixiang.com,
	everyzhao@126.com
Subject: [PATCH 04/11] of: reserved_mem: skip reserved_mem array allocation when there is nothing to save
Date: Wed, 29 Apr 2026 14:58:24 +0800
Message-ID: <20260429065831.1510858-5-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429065831.1510858-1-chenwandun@lixiang.com>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fdt_scan_reserved_mem_late() unconditionally calls
alloc_reserved_mem_array() after confirming /reserved-memory exists.
Two issues with that:

 - When __reserved_mem_check_root() subsequently fails, the call
   returns right away, leaving the freshly allocated array unused.
 - When /reserved-memory exists but fdt_scan_reserved_mem() found no
   entries to save (total_reserved_mem_cnt stays at its freshly-set
   value of zero, e.g. empty node or all children disabled),
   alloc_reserved_mem_array() ends up calling memblock_alloc() with
   zero size, which returns NULL and logs an "Failed to allocate
   memory for reserved_mem array" error even though nothing was
   expected to be allocated.

Move alloc_reserved_mem_array() past the root-node check and gate it
on total_reserved_mem_cnt, so the array is only allocated when there
is at least one entry that needs a slot.

Fixes: 00c9a452a235 ("of: reserved_mem: Add code to dynamically allocate reserved_mem array")
Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 807b222fce5f..93585af9f8a3 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -276,14 +276,22 @@ void __init fdt_scan_reserved_mem_late(void)
 		return;
 	}
 
-	/* Attempt dynamic allocation of a new reserved_mem array */
-	alloc_reserved_mem_array();
-
 	if (__reserved_mem_check_root(node)) {
 		pr_err("Reserved memory: unsupported node format, ignoring\n");
 		return;
 	}
 
+	/*
+	 * fdt_scan_reserved_mem() sets total_reserved_mem_cnt to the
+	 * number of entries that need a slot in reserved_mem[]. If it is
+	 * zero there is nothing to allocate or save.
+	 */
+	if (!total_reserved_mem_cnt)
+		return;
+
+	/* Attempt dynamic allocation of a new reserved_mem array */
+	alloc_reserved_mem_array();
+
 	fdt_for_each_subnode(child, fdt, node) {
 		const char *uname;
 		int i, len;
-- 
2.43.0

