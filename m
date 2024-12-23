Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470F9192D8B
	for <loongarch@lists.linux.dev>; Mon, 23 Dec 2024 09:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734947049; cv=none; b=foB5h2afavn211/CmsPw+vKBMCY5q8BCqtxkyaPiRccaxixHu3nNruW0+iN/6TRqNsHqMarjC/3YqDX4A+ocn68ON5Rkp2L4EPbLtEukxaqMz9x4cg00aiNq7uXtbcYZuWCMehvdUvNAlJi+UNKK4QoqfRCLB2QES5tLAtFVzxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734947049; c=relaxed/simple;
	bh=jiyynG1cSpqMCUPKcTsBXQhnImP0khzMQlCaAfJaSPQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RIqTojqz1ppkSnE2Ol4TjAu4+kYF4g23u3Jq+UPACMrMZuQgW+rnYBqiONpszgQHXZYhhWNQXWQCspqh2fwOR0YCvjDLrYB+14CDFl/73KPvgG/NTyKx69ldpuKoERMv4MBmjUgH41Jf8HO/qJtR/WxEwX1ByZBHqhvpgrAc5po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=BaNHZzFK; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="BaNHZzFK"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7fbc65f6c72so3573559a12.1
        for <loongarch@lists.linux.dev>; Mon, 23 Dec 2024 01:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947047; x=1735551847; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYmLHVK0AtU6ilI7ucnXt5jLNeYE7S1uMrvnVL/VK/o=;
        b=BaNHZzFKCtonW9E7mEWsbg3RzfmthlG1JwiKVy8ZvkAbVx01aKLJnFXRX1KViu01oh
         UIan8zLvFR+gGQCseRg36ZVkXQ9RX/igvJ5EjEQ6MraHK9JO/+bBIdZC2BoTW47gY3cv
         E+i7Uqiye0aMmuAmFTYSsSG2+idbKXYqTO5EqxEJRz7v4Ww1ZLTUPa5gMJExOozExBvd
         Ck15MrXtcA+j0xFMeibJV2y6NkUOwAYD8Zz7+eANXeXhNaIDloSRwjsL9QWivr2OXZfD
         v6nYVMU9RrwzQ6ceRFRtX3PQ2skB5SEBrpMsgUb+pPiHCIEaEREmY8z0LdjA11r9ZUPH
         5t5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947047; x=1735551847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYmLHVK0AtU6ilI7ucnXt5jLNeYE7S1uMrvnVL/VK/o=;
        b=lyOiUa0PUSuR6QEkyDfW7j2Ulb6uaQehysDA8HGEhZ13kPpVADUW6IDx/9FuJxaxk0
         ySk+zgQlzMWuzjkvojqzUSkAjNhQ4FFgqkHjRAflETvxh1pBMrbiLOYlXPh4yJBNNp/N
         iq0hh3NgPHYuJNLzwEHsHJnFo9wtoyDtXysG1kc93sXUc/+Y5hTfNUW43paSSUjudhGZ
         w6fNOE29jIvhMjSuI+rqPzHwfnPzdPHJ6oNs2vpeiBOFA1V8wzlc4EanVngwBcaobB38
         cGR20E4KEmloUyTUrObEcjFTORAiXsqb59aucpeJWYMNCj8fsL5fjevvu8EsMtbMBX23
         YvnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCHzj5lUegjvP+sxhRdOhHq7X+fxJq8ZLx6iwqNCsk4wAabRV4DgiGUn8RIHzcsIGzKw9wEzTIa+A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1hUm2pG6LN/keZZkYtgEFObkwZk3XBR0Qoa49y3B02tBZwpHz
	99uJ4i4qaudnD2gLfThVVjjGiOZDsX1odA8944BhsKeSr7NF7TNqYAl8UR6OVJc=
X-Gm-Gg: ASbGncs24TFJWSV6KRhjWOUWy0yDN657ef2SjvvBSlWvUW+3g4MB7Piic/ge8fohYyq
	xsjNWd68L3d+4OKQ7F6L8nolboeB+tHD19HpBF4/7UoAaA8BtgdFv9sBEX+CEzkzXHuLztenHMv
	DGH2OpuHu0u7bxoWo1r9gLbNYL1wrnKg3bwJnYxE7KLKes0orQnwIgt/sr5x4mHYAwnDJ2OzNKc
	mVErCw/RKdIWYa/npMEaQGNUnjl78AyVBQwYqm9DyAq6tcIwDi2TcYuQJAHc3ADgYBfr+XIK6FC
	lhdMh9iKD1ab5ufUfmAO6Q==
X-Google-Smtp-Source: AGHT+IEE3DAo82DBKWUM6FD2Qxwd8GTGkBziQ/dfcNtaRbY+efEiB7FXaTM2aY8g2l19VVq60zkLag==
X-Received: by 2002:a05:6a20:7f82:b0:1e0:d575:8d4f with SMTP id adf61e73a8af0-1e5e081c5acmr19810935637.37.1734947046731;
        Mon, 23 Dec 2024 01:44:06 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:44:06 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
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
Subject: [PATCH v3 05/17] arm64: pgtable: use mmu gather to free p4d level page table
Date: Mon, 23 Dec 2024 17:40:51 +0800
Message-Id: <7c12112047ac230809aacd0379259414b9b0d3a3.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734945104.git.zhengqi.arch@bytedance.com>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
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

