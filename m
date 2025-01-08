Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13421A9B2A
	for <loongarch@lists.linux.dev>; Wed,  8 Jan 2025 06:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736319574; cv=none; b=aCSWvwmef8JFolsswLYTPe5uZr5DLKlCRKUXckdUmrFNGRYSx3TOZSo31peDxdtYZMoUTXAJ6Ui4eA8r0IdbVcLIf/ktbc6iFiyq2v+Ec6ssNqGb/W2jUAUg/oMXM4mygPFt6Qkc7Uin3LkQpl6IkSKp3Zswu2k6QiMPuzRsat8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736319574; c=relaxed/simple;
	bh=AE6ZwrHtnhWSEtac69meSe/nEVBLF2lFdOsyctg6W6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iYv69vJBjG76Gwxes/eOtThbhqh9AJhYcRnJMt1GY/3hzHyao/VClwUfHPDWZe26ksv87XDoPGBvGd+6FjCJrRonL9CBm6anWStO+DDWXfzud1V5cXkHYkOU+A/n+H5MfCThjoBjC5Jjmp+fn+5bFxleIOKRg1zPtiq/PEYR210=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Rl6YFU2h; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Rl6YFU2h"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21a7ed0155cso22810375ad.3
        for <loongarch@lists.linux.dev>; Tue, 07 Jan 2025 22:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319571; x=1736924371; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qK7UmD8A9xmARwj2p/zsqM766rIMmkR9OD65YlbhPf0=;
        b=Rl6YFU2h7miLayv+ZWE9HNhYfNksbLTS0R9rVSoben3JZwRZr1Hej87fdmCha7c1Oz
         cqSrcR2uuUcD3xBQUHf0e31032yjUYJzQr/PfhN28gx/qDiAki3D5Zd7g6storD8TUjJ
         ZMNitVeVKecJNYVv0fQGhH831gnnQs1Cg/OqNwNXIdnU6qZoS+sfwpNFcglYljLqW0Lm
         5VuvrnRoUn6f3sQ+y9X//pJNthNF7FZ4Fh9Jm1V06a65uzkP2mpsK2fGaW3g2R8ozMj8
         am5/eYwc5UWLWEj64GZrSULjBMHB1sFBSNE7V3XERVbhUo/aITzGsbh3Bl06qtaCOcOm
         WlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319571; x=1736924371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qK7UmD8A9xmARwj2p/zsqM766rIMmkR9OD65YlbhPf0=;
        b=lO+b3IWNyMlPcaNqkckvchvVbnoqGV4xb5UURDG+vvDpZX43nzfEblNefxeuRu9MSl
         9t5utHpCWqTMlxFQvxDX7lug5rW1bZQ8dfBQfyeQvy5e3RFsHyVTOWLMOYmb1k06/PTu
         6CK9eIr3gCZpPP6UGF2RCqmgrcgd41vJoFcAV61LQkH0rJ4dh05/JxNtAqP1vsOpdwY5
         eIOMatvOVMJk8IRkMzJo0TacCjEZ+o3o1c3huPmIpBsysL5lnm7SKJ5G/cBE/Ez1SmlQ
         cga7xfUg1yPWqkkRLmzGXRsAQLJoF0ln444dsyeqdbYNGw9nLFr5dMyPU868R4tIh565
         m70w==
X-Forwarded-Encrypted: i=1; AJvYcCXj66ITX8kuZZXwXUPA2H1d+bJkdlOGh4h+3gnLpmlMe8Zf+M9lZDLLTvsQ5LOklAuCEc57KBI30EU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSGipkUDzDrMZKA3mMEwEGDSSqovh8MzRuxuv3bl+rpIpY+BI0
	WaWlSASYhLxY5ZAjXuE7KmDzUDUZyrXvcFDao+1C7apvf5wXPD3gIHlm7fJyXGA=
X-Gm-Gg: ASbGncsTWPti19MVe8Z22tn6G5pkIH5vyFnA9yK5jtZh46Wi/+x8XYsJWCd2Pfjxyrp
	K0bfZZvIiu2erDc6MVGtjpUXzNbYBte0tjJvn9qq/G1x+Z/n95H3C+zfewCjUWbdU/ubBuU0O/H
	mmihpoAYDVM2TKqkF/QP9S99O6J5bi/DV/hscOrxQvkEbrGy/ZzlVSv8v4BEgXQwU0GQ9MojByW
	XDxhj6+W2JUi6/38xIQJkxNjpmT5Mu4/TMcG2gSHmh5Uv+M0Vnpb4aKl8e0sMrrPVzPqqQD3SxD
	QUsQYhFWoKFEKr1zLihDyVl8Rcw=
X-Google-Smtp-Source: AGHT+IHPv/02/1SYwL+5wvpHkGRfZSWRMZ218tgsJxwry8Gh8x8rNq2cUbRiuSy0SgfT7Mb+CNVIfg==
X-Received: by 2002:a17:903:186:b0:216:34e5:6e49 with SMTP id d9443c01a7336-21a84001250mr22590365ad.57.1736319571238;
        Tue, 07 Jan 2025 22:59:31 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.22.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 22:59:30 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	alex@ghiti.fr,
	andreas@gaisler.com,
	palmer@dabbelt.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v5 01/17] Revert "mm: pgtable: make ptlock be freed by RCU"
Date: Wed,  8 Jan 2025 14:57:17 +0800
Message-Id: <366002e0af83f0d5cad3f356db036cb6447492f7.1736317725.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1736317725.git.zhengqi.arch@bytedance.com>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 2f3443770437e49abc39af26962d293851cbab6d.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 include/linux/mm.h       |  2 +-
 include/linux/mm_types.h |  9 +--------
 mm/memory.c              | 22 ++++++----------------
 3 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index d61b9c7a3a7b0..c49bc7b764535 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2925,7 +2925,7 @@ void ptlock_free(struct ptdesc *ptdesc);
 
 static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
-	return &(ptdesc->ptl->ptl);
+	return ptdesc->ptl;
 }
 #else /* ALLOC_SPLIT_PTLOCKS */
 static inline void ptlock_cache_init(void)
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 90ab8293d714a..6b27db7f94963 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -434,13 +434,6 @@ FOLIO_MATCH(flags, _flags_2a);
 FOLIO_MATCH(compound_head, _head_2a);
 #undef FOLIO_MATCH
 
-#if ALLOC_SPLIT_PTLOCKS
-struct pt_lock {
-	spinlock_t ptl;
-	struct rcu_head rcu;
-};
-#endif
-
 /**
  * struct ptdesc -    Memory descriptor for page tables.
  * @__page_flags:     Same as page flags. Powerpc only.
@@ -489,7 +482,7 @@ struct ptdesc {
 	union {
 		unsigned long _pt_pad_2;
 #if ALLOC_SPLIT_PTLOCKS
-		struct pt_lock *ptl;
+		spinlock_t *ptl;
 #else
 		spinlock_t ptl;
 #endif
diff --git a/mm/memory.c b/mm/memory.c
index b9b05c3f93f11..9423967b24180 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -7034,34 +7034,24 @@ static struct kmem_cache *page_ptl_cachep;
 
 void __init ptlock_cache_init(void)
 {
-	page_ptl_cachep = kmem_cache_create("page->ptl", sizeof(struct pt_lock), 0,
+	page_ptl_cachep = kmem_cache_create("page->ptl", sizeof(spinlock_t), 0,
 			SLAB_PANIC, NULL);
 }
 
 bool ptlock_alloc(struct ptdesc *ptdesc)
 {
-	struct pt_lock *pt_lock;
+	spinlock_t *ptl;
 
-	pt_lock = kmem_cache_alloc(page_ptl_cachep, GFP_KERNEL);
-	if (!pt_lock)
+	ptl = kmem_cache_alloc(page_ptl_cachep, GFP_KERNEL);
+	if (!ptl)
 		return false;
-	ptdesc->ptl = pt_lock;
+	ptdesc->ptl = ptl;
 	return true;
 }
 
-static void ptlock_free_rcu(struct rcu_head *head)
-{
-	struct pt_lock *pt_lock;
-
-	pt_lock = container_of(head, struct pt_lock, rcu);
-	kmem_cache_free(page_ptl_cachep, pt_lock);
-}
-
 void ptlock_free(struct ptdesc *ptdesc)
 {
-	struct pt_lock *pt_lock = ptdesc->ptl;
-
-	call_rcu(&pt_lock->rcu, ptlock_free_rcu);
+	kmem_cache_free(page_ptl_cachep, ptdesc->ptl);
 }
 #endif
 
-- 
2.20.1

