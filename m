Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB411A254C
	for <loongarch@lists.linux.dev>; Mon, 30 Dec 2024 09:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735549786; cv=none; b=Kug52DRw5Mmimv9+zYp+5N/oCjMDouzJOa62hNiHGHoRevIB2pW7VvEAkYQqwDkh2l/XbEeGjSPfOdJLv2k8DbpiJ+POuJzBM3BM0Gyn21JQtK52q5ZELacHj9qXgd2WJHtHGkkiyKh6Q67zBfVHbp+S7V//Kpg6ioHnG/kQJSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735549786; c=relaxed/simple;
	bh=jiyynG1cSpqMCUPKcTsBXQhnImP0khzMQlCaAfJaSPQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FGEs/Y4v2V6PaCP+3qzmng5hRYJ3ezksQ7HN/CkwupTjQoK4Qj2FyXFOXGrXo9we+2d5kUdqKq8oe01h9SnW6ntzmUv5gyjXjEmxr93uqtSZVTdoDuaCg2fOez+62XcZsAfeP/KU/lcF3wMxOqL7OteGwDM7dPSCFJJmUgluwQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=IjuzfaEU; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="IjuzfaEU"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2167141dfa1so112898295ad.1
        for <loongarch@lists.linux.dev>; Mon, 30 Dec 2024 01:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549783; x=1736154583; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYmLHVK0AtU6ilI7ucnXt5jLNeYE7S1uMrvnVL/VK/o=;
        b=IjuzfaEUyaXPsElr/lueuLS1ntIDutByokOhmGCcVxU8MMpYqNoED+AP/Bz1aoQG8K
         3uteUBOQPvxrZAiH1q6ejMfxFcLS3E2c73oxFmEePG5le3ptXb7vQ7Tm34gZ3ZSRleld
         J04j0ylD91tGG6kGJe5DcXUdqmXFzacYshS4WjQIyA8V/q8JsH3xUowUb2tqT6GhpjAZ
         q/nxvMmCCFibGUcNUTWd4sk9fvUU2IFWeKQEzAMbE91Qb/JeEo7yYwIglFsHa0RcLptW
         r/5cw3IaU5QOmWOSkmKi4A6rSj0rzoRVNHyIfqTzJagapzVxVk+pujLhwrL/L2pjz+aR
         Rigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549783; x=1736154583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYmLHVK0AtU6ilI7ucnXt5jLNeYE7S1uMrvnVL/VK/o=;
        b=SWjqA9B5QEaWmc/JoMUIdsi7a+nCHd072CRZloRfG8sLG0ATwRSqKu91c6gKFofthA
         XNmcZDtfu88QP6YBInO1Y7MGSC9iLgh0TtUJkv1PsOO5tCEf4euZ2LMnzLNMt3egeppf
         8D37wmYixwlGepFvePrK9w0bknnssa14d08mBd5XNuO4o5OAEyo9fRE6aVLs6u3ObDVf
         jnTuku9De7IRxD357E1FssTUhdUWlpCEG1tep50+1GwtyDUk0A+mKeFODP6wgntnS3DH
         pHbAes8/YpSyk4S3byHLgg180VaT4/aSNMVoRJHTwpT4RS4EHd81jNGMr84kORC/jTJs
         dOmA==
X-Forwarded-Encrypted: i=1; AJvYcCUXePf2V4l0/XHRQ7BzX+WFd9wt2rAO9Qk9Rtr2F2shYfN7tZmOEZkYI4ZK2aCB+uGf4cCspLzc8lU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTVHaHWS/V5q8r+fjMgjP/KngtIxljqtShTS2htrW43/M/wuHW
	LdqetO6TRCvoZEA7wTO8XkgCcOLY8rD5vbZIUocKm8G6WkmZ/qycqn08LQjo50U=
X-Gm-Gg: ASbGncvXAgUNucZU3AUf4wY3dlRJV/Yt90GYJ/COxvq3HUjlNQIqRbHM9W1iABN0O/v
	gbxDws+Z7PRS+PnZqCA7I5hRRjse1HtoTTqisKz5iFiP+a3ehr3I+Fa/CJCwOIgHdZlDLrktqzK
	fNSDTNY63m7KmWxh4ZbC2Z764ptOADZAFPJIl41JK66Y93aGmyOaHKtdGSPc3egBt9FYtk+6yFY
	F78xUN9txemmOmPZz/ZDVUih+sMoLnEUUm+kifTIuOj6646STGetR3YDBPk24Kf5xUNIGWs2XnJ
	kDZ2Ds9nKPRscxlclM0ppw==
X-Google-Smtp-Source: AGHT+IFA+DEWtAOVikEXL1Ne96u+hKYy4bbBxlgPSiON1NV20vNo54NDlhKj2iEhoHPJgNNx6Etn8w==
X-Received: by 2002:a17:903:2a87:b0:216:3f6e:fabd with SMTP id d9443c01a7336-219da5cc2d0mr588821545ad.7.1735549782882;
        Mon, 30 Dec 2024 01:09:42 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:09:42 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
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
Subject: [PATCH v4 05/15] arm64: pgtable: use mmu gather to free p4d level page table
Date: Mon, 30 Dec 2024 17:07:40 +0800
Message-Id: <7c12112047ac230809aacd0379259414b9b0d3a3.1735549103.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1735549103.git.zhengqi.arch@bytedance.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Like other levels of page tables, also use mmu gather mechanism to free
p4d level page table.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/include/asm/pgalloc.h |  1 -
 arch/arm64/include/asm/tlb.h     | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
index 2965f5a7e39e3..1b4509d3382c6 100644
--- a/arch/arm64/include/asm/pgalloc.h
+++ b/arch/arm64/include/asm/pgalloc.h
@@ -85,7 +85,6 @@ static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgdp, p4d_t *p4dp)
 	__pgd_populate(pgdp, __pa(p4dp), pgdval);
 }
 
-#define __p4d_free_tlb(tlb, p4d, addr)  p4d_free((tlb)->mm, p4d)
 #else
 static inline void __pgd_populate(pgd_t *pgdp, phys_addr_t p4dp, pgdval_t prot)
 {
diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index a947c6e784ed2..445282cde9afb 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -111,4 +111,18 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
 }
 #endif
 
+#if CONFIG_PGTABLE_LEVELS > 4
+static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4dp,
+				  unsigned long addr)
+{
+	struct ptdesc *ptdesc = virt_to_ptdesc(p4dp);
+
+	if (!pgtable_l5_enabled())
+		return;
+
+	pagetable_p4d_dtor(ptdesc);
+	tlb_remove_ptdesc(tlb, ptdesc);
+}
+#endif
+
 #endif
-- 
2.20.1

