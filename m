Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E214D3FDB
	for <loongarch@lists.linux.dev>; Sat,  8 Jul 2023 09:01:12 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-99384a80af7so307819766b.2
        for <loongarch@lists.linux.dev>; Sat, 08 Jul 2023 02:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688806870; x=1691398870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LsGY/iGtzaIgMwA9b3Ok3/pViuvT9eB2lCiEe6DAXmw=;
        b=ZC9DXKQ4BCjmzF3p8pBZiMSzsDXlNUajNpgzbgfdEtdK3LaC1ilz7ERZEOO3wEXYtO
         nedwYopczXsFZFxEDFH56U4HhmY5nnWxnzRiWbwLKPslIkGvcrut7zp8pUyBFf1lId5n
         t+Sy72MHM4qeyZXeDmnZQiqzMVSqYXjlzIHl1tha3BDw4CVjC4BknFu1dC03RFTVkiTs
         KqunWm00CvMHfOH655Q3VrboGu0bCWdEfUt4tqQ7Mlrf8rdHcpA+7iVyQv+orO/BOef6
         ZFNyvFHHjxsMWN6gG5EXxKEDP4L3QsRDvTWrnbUSFuGPHmIuWV1piHPT+lOx9nbeoLla
         d20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688806870; x=1691398870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LsGY/iGtzaIgMwA9b3Ok3/pViuvT9eB2lCiEe6DAXmw=;
        b=kFdsvscjmRBYDRPlMBOrGqaM/lA5xVqY6kSbuY5XG3WuIzKsSoHjuzhYW1T42ebgZz
         GIgqBKCq6D+LAA4gREa8b2n/uNtkDGLOm6yMXEwaEtHHTD79w1FdzSmumW5dpkR69Yfg
         yoRG2v1PtpESJeo4sZ6S6Q94q7gEXgfePCBKFwOmzldletHyecibFUjyCow5ChT/HtwL
         NM13bSN0dBHiliztyma/2nlY4nc6fu7GbI/ZU1pLOmSRgd+YXpSgpBHHLPkFCG+s53QA
         6A7S/5jvPRy5qFCpxOcWOtcA0gWzU5nCHkOptRf49R5lQ2Y0cWjJjEkeLBAQvSn9ljI5
         PRAw==
X-Gm-Message-State: ABy/qLYAjN+6KAaVJacRwzbNrvXgE5Pl093gyxcAuKwH1xOZ8I9Y1PYt
	FA+OFS1ZRN5zCPgL9JmF9eAMc/qjyx6Xftf5
X-Google-Smtp-Source: APBJJlGWA9cXPwJQzLfRKpd7yjMu6208psGsPf4ABVaoF4bcrbXZqLcg/CAKOOeOxS8x9SRa1CJCVQ==
X-Received: by 2002:a17:906:3c46:b0:98d:d6b2:3377 with SMTP id i6-20020a1709063c4600b0098dd6b23377mr5344497ejg.30.1688806870400;
        Sat, 08 Jul 2023 02:01:10 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id g10-20020a17090613ca00b00992ae4cf3c1sm3204313ejc.186.2023.07.08.02.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 02:01:09 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Charlemagne Lasse <charlemagnelasse@gmail.com>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Jun Yi <yijun@loongson.cn>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 1/2] locking/arch: Avoid variable shadowing in local_try_cmpxchg()
Date: Sat,  8 Jul 2023 11:00:36 +0200
Message-ID: <20230708090048.63046-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several architectures define arch_try_local_cmpxchg macro using
internal temporary variables named ___old, __old or _old. Remove
temporary varible in local_try_cmpxchg to avoid variable shadowing.

No functional change intended.

Fixes: d994f2c8e241 ("locking/arch: Wire up local_try_cmpxchg()")
Reported-by: Charlemagne Lasse <charlemagnelasse@gmail.com>
Closes: https://lore.kernel.org/lkml/CAFGhKbyxtuk=LoW-E3yLXgcmR93m+Dfo5-u9oQA_YC5Fcy_t9g@mail.gmail.com/
Cc: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Jun Yi <yijun@loongson.cn>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/loongarch/include/asm/local.h | 4 ++--
 arch/mips/include/asm/local.h      | 4 ++--
 arch/x86/include/asm/local.h       | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/loongarch/include/asm/local.h b/arch/loongarch/include/asm/local.h
index 83e995b30e47..c49675852bdc 100644
--- a/arch/loongarch/include/asm/local.h
+++ b/arch/loongarch/include/asm/local.h
@@ -63,8 +63,8 @@ static inline long local_cmpxchg(local_t *l, long old, long new)
 
 static inline bool local_try_cmpxchg(local_t *l, long *old, long new)
 {
-	typeof(l->a.counter) *__old = (typeof(l->a.counter) *) old;
-	return try_cmpxchg_local(&l->a.counter, __old, new);
+	return try_cmpxchg_local(&l->a.counter,
+				 (typeof(l->a.counter) *) old, new);
 }
 
 #define local_xchg(l, n) (atomic_long_xchg((&(l)->a), (n)))
diff --git a/arch/mips/include/asm/local.h b/arch/mips/include/asm/local.h
index 5daf6fe8e3e9..e6ae3df0349d 100644
--- a/arch/mips/include/asm/local.h
+++ b/arch/mips/include/asm/local.h
@@ -101,8 +101,8 @@ static __inline__ long local_cmpxchg(local_t *l, long old, long new)
 
 static __inline__ bool local_try_cmpxchg(local_t *l, long *old, long new)
 {
-	typeof(l->a.counter) *__old = (typeof(l->a.counter) *) old;
-	return try_cmpxchg_local(&l->a.counter, __old, new);
+	return try_cmpxchg_local(&l->a.counter,
+				 (typeof(l->a.counter) *) old, new);
 }
 
 #define local_xchg(l, n) (atomic_long_xchg((&(l)->a), (n)))
diff --git a/arch/x86/include/asm/local.h b/arch/x86/include/asm/local.h
index 56d4ef604b91..635132a12778 100644
--- a/arch/x86/include/asm/local.h
+++ b/arch/x86/include/asm/local.h
@@ -127,8 +127,8 @@ static inline long local_cmpxchg(local_t *l, long old, long new)
 
 static inline bool local_try_cmpxchg(local_t *l, long *old, long new)
 {
-	typeof(l->a.counter) *__old = (typeof(l->a.counter) *) old;
-	return try_cmpxchg_local(&l->a.counter, __old, new);
+	return try_cmpxchg_local(&l->a.counter,
+				 (typeof(l->a.counter) *) old, new);
 }
 
 /* Always has a lock prefix */
-- 
2.41.0

