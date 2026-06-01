Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133993382C5
	for <loongarch@lists.linux.dev>; Mon,  1 Jun 2026 08:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303756; cv=none; b=Dh4AM0KbFee+UmhBJZZ7V30QMOvzZqXPd2BOWZslcwC88rQf2G7A1IZUbEhagQsisYpbosK6yGX/hxV65YMlN52prN8XlB5ynmghTbxp10hWvGuF3s2q3KQ1zNHmUIA4YrDvTloLAO253eGJnIqvStqVpYjfccWW4mhViRVmhjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303756; c=relaxed/simple;
	bh=90ZcI8WdDuxzGpB8f60twhO+4k8/kpTvbg92FgL7hmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RCh96KhT6+nZTowK6TO683emi7Krl7ui9eBR0snlcKdh43S3UxnUStPZsKsWkgSj1wYdJEtt5qkTRlrLJvFuess/Pq1/43HOKbuX4akSq1jyh8SD6f2TB2/ahYEEaJkBzaGhcy5eFLAE75rvmxwFTxDkabncXS/LrQhWBNRcs7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=lQqVbLqx; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="lQqVbLqx"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36da8439078so798977a91.2
        for <loongarch@lists.linux.dev>; Mon, 01 Jun 2026 01:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1780303754; x=1780908554; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8b/yYnv8ZH41kctmwMZLOttDvAzW7LNe3UEG0HH1sI=;
        b=lQqVbLqxY6we+MYN5Kz8xGX/1Y811E4CiUzi3HEx9Yoiz4X7ofAHCl0go0+KCla5y0
         E203+fR9MaxmfYYyanC6LLf6rszkkyKPtaY6f6VW45TznHd8D5oPRWtNskMltUFKIjS0
         TJoDdOSCqYyiq+53pRXFqqn7gnl7C/1ZJ4bASWKVpeEnlYdhlrws9WAKn/GeMLg8wJmW
         S/x9IQoMH+GhHOtXOggv3HOTEVd/YaMQYrELggI23jZD7sImGz9HRziBRT03XD1SClAk
         yFDg+6krZf9LTSmvSRcgGo6Y/EltM9QFgCnYuir/KjV9YqZY7Ct6rsjwWHd/hGaM2LRd
         lMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303754; x=1780908554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q8b/yYnv8ZH41kctmwMZLOttDvAzW7LNe3UEG0HH1sI=;
        b=JNvjRCWAinL8pJ2nh0d8QAKddqbK2muLDp0DbAtnmfPDoga8W4OXAx+Nj/nLD4oChi
         fPPadqUx8j2lAqbfrJStD32rrZLsra2viSwIfcZZuyYl7aC+q6KUu+Yb19M9h8xEfqrI
         qoI8+C7/7LAiOJlrXvbFy57gCKrKfDAkhPTz8jbsOfG7W4VLuxGCElP+MaFZmLOTiowf
         FljoHPkQ4H97hHLdKMnn8UycC/3wz8K6kDd0DGczR9HEx4McGIJpNJLq+fFjFvppL8xk
         h3QTzLuRLdQCcMuipWmPMg0KQfwAPrxpvymPxVu1qqq83ah+ySGEZ1Fq8nmb5/BViUqj
         1CmQ==
X-Forwarded-Encrypted: i=1; AFNElJ96Jt6sPAo5qy5VRenMF166zf0AhHQoyvYiNSwiUzwLrulKtN4xSzjfd8Y8tuo+o3tV4PCDlWOjn1E=@lists.linux.dev
X-Gm-Message-State: AOJu0YxW92lfdVwJrT7YmH9xI/F/sxwud4zTFGvwMUAzCoCERPsSJOXi
	bBestkZV57mSlRzZh52h1y85p3Jtum9PKaklQqZGeCHAlVvhOibJYhJHuqoxHAzvgeo=
X-Gm-Gg: Acq92OFmMgXb1ggVehx+myyYfm/BCFbK5l2v3w2W6kMR7L04+WUL9+FLo38WrodNmuH
	IqRaGeMP7N4MK2v1FOzw5WzC/srskefs0yloUHKPQ2GHkx8TL2Vc0qJAMsJG7dxMurQ5bcja9tu
	Kq0p3PDv76kktdG6IBiUdQCxDLZvNJeys0GXLDydc/GXrJOHQH6epc3XH+jBzUAOzBcbupRTCHb
	EMt4e8mx+7aLzB/MGBAu3WZ80cGCRPTbbiqFr4bt3DN7HqvxtHNJ6JDH/X6sQdRx2tMlgAmnqcK
	idPmPwkQl9zqneT0OgnP12183gcbZwSjBKz3ESkWsZyiOOKV/tkn55XTjEowDLXmk/a/0X6iY0Z
	oMwCT7fjv4N8QhtFqj6MYwB9079/r0Rvea4/MFPf3LYgetJClSCwCOWrUAwDtSxs/XdfhTdvIa/
	ez6sl52SzK++4pUKy/E/nZUYejQRJEA9pLXxk1viIB+bmZwUC7TgB8oA==
X-Received: by 2002:a05:6a21:8ccb:b0:38b:eadd:449a with SMTP id adf61e73a8af0-3b428242975mr12005378637.38.1780303754272;
        Mon, 01 Jun 2026 01:49:14 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84232ef8172sm6316230b3a.12.2026.06.01.01.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:49:13 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	"David S. Miller" <davem@davemloft.net>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	WANG Xuerui <kernel@xen0n.name>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v3 3/5] riscv/mm: drop vmemmap_pmd helpers and use generic code
Date: Mon,  1 Jun 2026 16:48:42 +0800
Message-ID: <20260601084845.3792171-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601084845.3792171-1-songmuchun@bytedance.com>
References: <20260601084845.3792171-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generic implementations now suffice; remove the riscv copies.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/riscv/mm/init.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 885f1db4e9bf..5f680eb83e86 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1359,19 +1359,6 @@ void __init misc_mem_init(void)
 }
 
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
-void __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
-			       unsigned long addr, unsigned long next)
-{
-	pmd_set_huge(pmd, virt_to_phys(p), PAGE_KERNEL);
-}
-
-int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
-				unsigned long addr, unsigned long next)
-{
-	vmemmap_verify((pte_t *)pmdp, node, addr, next);
-	return 1;
-}
-
 int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 			       struct vmem_altmap *altmap)
 {
-- 
2.54.0

