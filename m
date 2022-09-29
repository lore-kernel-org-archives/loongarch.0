Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F29C1116
	for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 11:23:38 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id v10-20020a17090a634a00b00205e48cf845so5621292pjs.4
        for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 04:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=JV29A8S7H9nk8Y3ndCLgLNPfcLB/Fva66Tots67JJ10=;
        b=WZaIjGyMqadKRxBxDIX3xg5seZAzi2+eG7ff8NVX4HSQpWLaw7qaTpLYv/YzsmJZ78
         0NnMOP48NS2eZC/w3a+/Kp++v4n9iZh0e+KrLtb4TdUstzr1aoK25e4/VGuLE8P7JdzK
         1suBosGhTDhXAu4NhobZ89FaAuUVv/HxBFU66GPu6JRmMUWn9U5w/bmIC6Pd0IdxLIUz
         WBDvOvS4A2HpiV0Fh5DMIyi01dV9qwRu46qIq0FpWgrvfDltU6lBc1xSpgDbXd5Ebooa
         QbTwdU6ICfpqp0gtUx3HBoUF5EFzn3XbeDnFZSckv5p6dpnSL2Qn0DDszzZ1qcEtHrD+
         m7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=JV29A8S7H9nk8Y3ndCLgLNPfcLB/Fva66Tots67JJ10=;
        b=cpxAGLTmFeAuuDyKOJ3iBzZo9J08o1tpncSIKuGykxytaMKj0lCqwBL4zclooHH1tb
         bA9z1n3fQb9aPW9G+mQRV3STXfzFBFb2I4KVBqsoJxfASkjxNrL410T9jztE8FlnNAIt
         RZccL1SjKwSZti/DLqWkUgAg0bJcO7+SunNrwVQoWb8KwhubwLhgLEb6QrV/C/z1GMUP
         wivlCAEarYN3Ae6QT4idUIAFd8TqC5QzyeOFPnhAqbSwUqT5Lhod5m06lihcpEmtM8Az
         RW1UzpiGL9q6+M0bU+qbyLlW9c2hq+fY73X6Ag7zY8lAEaEBEzROocfCXag15vYJ1PVx
         ZZEA==
X-Gm-Message-State: ACrzQf0MH4VFRyZPt3vXlNoonP5G/2SI+WxmDrpootc790P8MynN4Jo+
	d7a9fdT5oMjNlb6PXYh0KuajWA==
X-Google-Smtp-Source: AMsMyM4p8HFIjEO65m+ZzDQ2AJS0niFAGYsHTpyebBpnN8u0Uaq8ynnczc/Wl9uJ3y/8nm7ojyMTdQ==
X-Received: by 2002:a17:902:efc2:b0:179:fe90:55d3 with SMTP id ja2-20020a170902efc200b00179fe9055d3mr3032982plb.116.1664450618598;
        Thu, 29 Sep 2022 04:23:38 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id i8-20020a655b88000000b00434651f9a96sm5225401pgr.15.2022.09.29.04.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 04:23:38 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org,
	maobibo@loongson.cn,
	chenhuacai@loongson.cn,
	songmuchun@bytedance.com,
	david@redhat.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	loongarch@lists.linux.dev,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v3 2/2] LoongArch: update local TLB if PTE entry exists
Date: Thu, 29 Sep 2022 19:23:18 +0800
Message-Id: <20220929112318.32393-3-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20220929112318.32393-1-zhengqi.arch@bytedance.com>
References: <20220929112318.32393-1-zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the implementation of update_mmu_tlb() is empty if
__HAVE_ARCH_UPDATE_MMU_TLB is not defined. Then if two threads
concurrently fault at the same page, the second thread that did
not win the race will give up and do nothing. In the LoongArch
architecture, this second thread will trigger another fault,
and only updates its local TLB.

Instead of triggering another fault, it's better to implement
update_mmu_tlb() to directly update the local TLB of the second
thread. Just do it.

Suggested-by: Bibo Mao <maobibo@loongson.cn>
Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/loongarch/include/asm/pgtable.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index 8ea57e2f0e04..946704bee599 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -412,6 +412,9 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
 	__update_tlb(vma, address, ptep);
 }
 
+#define __HAVE_ARCH_UPDATE_MMU_TLB
+#define update_mmu_tlb	update_mmu_cache
+
 static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
 			unsigned long address, pmd_t *pmdp)
 {
-- 
2.20.1

