Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7495C1116
	for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 11:23:29 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id c198so1148279pfc.13
        for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 04:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=r/PBU5z71sX2zMZDTYPxe8Ov6/ObpI5wnc7fTRzYGJI=;
        b=nlAR3UGxJw8mM7U3ZP49KQZwp09SWSS7FhW6dBf4HidEuZsgQ/Qe95WCto0YTVWbHQ
         dh1g4q76lhuUSj/AwWyDqQXV1amXnFPSrR+FtGamyDYNbcxTeYHOW/wPfeFmAZ1MmFrL
         eUJjxWKYo2hCWHd6pATT+pHMHcgk4m6lexrZwqlsM1exSExC9K3yByiAPu2ec8swX0w1
         PS8NM1/BOUWB+5JOs8U6LsLtgmjm7F1yxrr4DT11ZB0ZxXv5mAbKHyZMSsGquEUR1XEe
         YGvDxd/6vct0eSWdw4BlaP0Kji/fn5FoRlFuO/6coi0aq6S5eEmhXvlCNyWb+HdY0xi1
         f1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=r/PBU5z71sX2zMZDTYPxe8Ov6/ObpI5wnc7fTRzYGJI=;
        b=FCYGS/rXHJHkd3hIe7vUDzvLnKgz7jGhD2gMS8+zOl4fWHXIqwUK2zfc5t4iu0BYMu
         xXGxF8CgSABo6prvWkmMvfsZy4i2PetAtf9gp5p9iBsV86/Ym0E52akpgajTeQ1uxfK9
         YTYIrFtQypwOuDvxxa6ADSDFwenJeu4WwjMPD44NY5CNp1dgr5kwAucYNJsIIUoZFw9X
         w4kx9CuGRshjcXWFqlLOMZ0dUx06VA+E6vMTHbLLFmwB3Z1X4hxcwAjARhrPF4sRrcSB
         owMKJ1F8OuOuwjxjMiezLlA2hhHj0spLzePkUO0Fpq+uAw+6DdgWXziztCFtleqOjoER
         YdXg==
X-Gm-Message-State: ACrzQf0WBDerdleV6MVuy38sTiNAt/O6nTfArlHkUt0umPrErl8Qr3SR
	nv91V2HR7c2cf97xzqixoxYmDw==
X-Google-Smtp-Source: AMsMyM4RKSiRyMbM0mV2FWs/Ku8dZ2NIcUEldNW0Z34ls1vE3MwhIWVSxdglMPZl2347wi/OIzIbBw==
X-Received: by 2002:a63:fc5b:0:b0:43c:3f90:ca07 with SMTP id r27-20020a63fc5b000000b0043c3f90ca07mr2576383pgk.110.1664450608825;
        Thu, 29 Sep 2022 04:23:28 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id i8-20020a655b88000000b00434651f9a96sm5225401pgr.15.2022.09.29.04.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 04:23:28 -0700 (PDT)
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
Subject: [PATCH v3 0/2] use update_mmu_tlb() on the second thread
Date: Thu, 29 Sep 2022 19:23:16 +0800
Message-Id: <20220929112318.32393-1-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1: https://lore.kernel.org/lkml/20220924053239.91661-1-zhengqi.arch@bytedance.com/
v2: https://lore.kernel.org/linux-mm/20220926115621.13849-1-zhengqi.arch@bytedance.com/

Changelog in v2 -> v3:
 - implement update_mmu_tlb() for LoongArch (suggested by Bibo)

Changelog in v1 -> v2:
 - change the subject and commit message (David)

Qi Zheng (2):
  mm: use update_mmu_tlb() on the second thread
  LoongArch: update local TLB if PTE entry exists

 arch/loongarch/include/asm/pgtable.h | 3 +++
 mm/memory.c                          | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.20.1

