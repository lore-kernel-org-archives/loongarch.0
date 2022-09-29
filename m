Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528411116
	for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 11:23:34 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id l9-20020a17090a4d4900b00205e295400eso1018461pjh.4
        for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 04:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=xxtjUzETZH9DEkady7grPZMHSOc1w1fLwuVdzuJOa7k=;
        b=F0vnTbakLMMLXNr4+EoGBwJ7euaiMM3zQ1iPMnIFzbzTDT+UedxfCF+nzZ8Pu1dxgo
         jFnRRQ87mG9ETqHrCRPJ8tYtFphSYYI02spSlat9EK0B813gSaIgau9lC8HO2TnfioyA
         U5z6aLF8grpUiBTUr+XtFfpPaJYP9p4wA8DQKcjo3sr2dGe0NeM6Fxc/VWkqDOtlnnzg
         pSkuwm2hb2k8o1a08Un+gZ94hmONuRKnxJltHdPaQsfHBaJZptn+qowTGYNvF6D/Q9Zt
         8uDtYYjW2vdcVCbGIPWPG9Hu3SNsD27KC0RvbFFKymk5xhXut/fT0TtX9i9M5v8aewJA
         XeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=xxtjUzETZH9DEkady7grPZMHSOc1w1fLwuVdzuJOa7k=;
        b=TlrY8NgI12wJsC7sayfTzpCDPJusppqGoOvv9xxVqkGJFrkaEOcOKneq1LGRfncd1y
         E0dhxI0CdMo6HtBOUv3wukxn3FsH3TK5dEoC5/WpcOTkeoLjG9IOEDEXZeul2qa+qh5t
         7fsuRoB7ybxrwRtAbOPEtTVPQvHhMVD0rDxl2de3X83W+0eMal3JOzu92MmjLpURXsJ6
         cTxXjZJHniX5y1n8Lz3jTKq7aVfVzl1X7uPOUzLQlVmoyuOntftvo8NWAA1L/2NEu06E
         dO9iryGXbSxs96SfI8r6pb39Z0F1dGoxnrm+NVnWVqh3btfZYxILIkjFpGE8Ag8+OKR9
         X9zw==
X-Gm-Message-State: ACrzQf2GYGWzJha7rBnMqYXQsaBcYsv0bA+Z8AdYF3HmPmh3TkN66xoe
	CaaDuhTG9TEJzNotk6HjbkjOkHSlysivZTQu
X-Google-Smtp-Source: AMsMyM53p08RePYQc/tpM4G6W0IClpl/1lZvEDpnTKE1I+fFxmkZIodX6//T3hVBYwLf82XMjWa5Lw==
X-Received: by 2002:a17:90b:180e:b0:202:e725:19e2 with SMTP id lw14-20020a17090b180e00b00202e72519e2mr15923391pjb.163.1664450613800;
        Thu, 29 Sep 2022 04:23:33 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id i8-20020a655b88000000b00434651f9a96sm5225401pgr.15.2022.09.29.04.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 04:23:33 -0700 (PDT)
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
Subject: [PATCH v3 1/2] mm: use update_mmu_tlb() on the second thread
Date: Thu, 29 Sep 2022 19:23:17 +0800
Message-Id: <20220929112318.32393-2-zhengqi.arch@bytedance.com>
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

As message in commit 7df676974359 ("mm/memory.c: Update local TLB
if PTE entry exists") said, we should update local TLB only on the
second thread. So in the do_anonymous_page() here, we should use
update_mmu_tlb() instead of update_mmu_cache() on the second thread.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index 118e5f023597..9e11c783ba0e 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4122,7 +4122,7 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 	vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, vmf->address,
 			&vmf->ptl);
 	if (!pte_none(*vmf->pte)) {
-		update_mmu_cache(vma, vmf->address, vmf->pte);
+		update_mmu_tlb(vma, vmf->address, vmf->pte);
 		goto release;
 	}
 
-- 
2.20.1

