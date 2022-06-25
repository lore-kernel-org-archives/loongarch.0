Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10777A
	for <loongarch@lists.linux.dev>; Sat, 25 Jun 2022 08:04:36 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id 68so4420289pgb.10
        for <loongarch@lists.linux.dev>; Sat, 25 Jun 2022 01:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BfzrLrWFlU3AsBKqqcHgoNoL2/cAeQlLWsne6vZJpyA=;
        b=gSnHhutlBGP0Zc+ke5/gSYv2nW8AY/IpA/SwV+4+7wiGESDHAf8BgjxZZ3EFN+DdEH
         f+/9k4M2yvJV9hw9JWBknq1f3ZsTTg/f4CDLrJ2r2vGBjh/ZFtxYSXEG6C475B5rWxN1
         5gbKYQovNRteKDG0Ga5xz93ysmM+5W5c26mza0Fa0afXMoKGjCa1NwE98/77WJ6QVqUG
         4pY0+HiRTkRUuZaA38bFeOr4AyrAB40vHsat5xjbHADCw7QBVYi2Ci/eQpcuFMLTzzMg
         nn/fa+LiUBnTFAV0Ptcnx6VrYISzLutBG98U6zRPzeUasA1ULuM7/O6vbVf1OX4eBL7m
         en4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BfzrLrWFlU3AsBKqqcHgoNoL2/cAeQlLWsne6vZJpyA=;
        b=wvROEt1rcgrXh88ti8nsnw1DoH8HXJqkZ/ANDxTo+iBnrdw4Gv/ozOZCsE7eGLpRmJ
         3jdubWY/U47W80cRgFWhnNN97oJEHKKvLkMAGsrdUUWeGVTqF83hJ79WgLmWFs/rcK4B
         QXdN+w+DnvnrZsjvFnTkLWEX0qkscEZ98uIA0YtCPRQbjbKOhR348NVCr8hKxbZNdPCh
         KXy0qHMsRJ7cwAIM9qHRjk/N/nXfptYZl6qG5R/2lQrnNiuKCQP1T3TLxw/rOj0KBkGJ
         CNkPmZlutmIzuq8bHGGpKzD3+jgqg6KuuPvUB6f6pXGtrPJGwzn7vPI9By2AuU/aEKek
         guOQ==
X-Gm-Message-State: AJIora8WfVPWBA/n2fv18Gu33ndru65zr41fRUda1Vm1qwtwKlxHlR61
	esJp/iNrZGaHc8IFc4qVUEc=
X-Google-Smtp-Source: AGRyM1sxtS9VevqvfBbYWfIogi3zIDyhDpdZQ4zG+5Ws8pWwVgzyfWnuLDMmesowsg6pj5ia02Qpuw==
X-Received: by 2002:a05:6a00:2292:b0:525:6c57:8dd5 with SMTP id f18-20020a056a00229200b005256c578dd5mr3131042pfe.17.1656144276147;
        Sat, 25 Jun 2022 01:04:36 -0700 (PDT)
Received: from localhost.localdomain ([112.20.112.134])
        by smtp.gmail.com with ESMTPSA id s9-20020a170902a50900b001690ca017fasm3056609plq.38.2022.06.25.01.04.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 25 Jun 2022 01:04:35 -0700 (PDT)
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
X-Google-Original-From: Feiyang Chen <chenfeiyang@loongson.cn>
To: akpm@linux-foundation.org,
	willy@infradead.org,
	vbabka@suse.cz,
	songmuchun@bytedance.com
Cc: Feiyang Chen <chenfeiyang@loongson.cn>,
	chenhuacai@kernel.org,
	chris.chenfeiyang@gmail.com,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] page-flags.h: Fix a missing header include of static_keys.h
Date: Sat, 25 Jun 2022 16:04:23 +0800
Message-Id: <20220625080423.2797-1-chenfeiyang@loongson.cn>
X-Mailer: git-send-email 2.36.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The page-flags.h header relies on static keys since commit
a6b40850c442bf ("mm: hugetlb: replace hugetlb_free_vmemmap_enabled
with a static_key"), so make sure to include the header to avoid
compilation errors.

Fixes: a6b40850c442bf ("mm: hugetlb: replace hugetlb_free_vmemmap_enabled with a static_key")
Cc: stable@vger.kernel.org
Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
---
 include/linux/page-flags.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index e66f7aa3191d..147b336c7a35 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -11,6 +11,7 @@
 #include <linux/mmdebug.h>
 #ifndef __GENERATING_BOUNDS_H
 #include <linux/mm_types.h>
+#include <linux/static_key.h>
 #include <generated/bounds.h>
 #endif /* !__GENERATING_BOUNDS_H */
 
-- 
2.27.0

