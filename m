Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5DD2564
	for <loongarch@lists.linux.dev>; Sun,  5 Mar 2023 20:56:56 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id cy23so30647588edb.12
        for <loongarch@lists.linux.dev>; Sun, 05 Mar 2023 12:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678049814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVG2kgy9F760CmPn8vSVrkbNIw0KpbygTeYMJL/3wHc=;
        b=asi5utLdWW1N1er0bksuBA8v5b1amWbTv0KOBvgiy8Iq2U+koWsRhR6IqIsB96ZzFo
         RMdO6VENOxHuzI8q6i57ivzsrmds+Qydp0zIcueL5R8/WPuPDj9jwqzGDYz4blWiwMSf
         /W0Z5E6D9C9cNRhuSPhtp98V3I7py6Lt7d3OmAEFtC0xVTDC5m4jYRUFC88j+LQU2U/b
         /rY2VlSnb0DKov6ld71YIylJ++dgLrjqmYWE382OJOZPVSfs/nR5zWbNwRgfUBiF/lnX
         uTxnaw9+jBV/4QcQgK2Dgh2w2pTgCVdFrY9WfPDrzRcXWeoA8lOM2hU2keXlcv7RSB4Q
         ijnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678049814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVG2kgy9F760CmPn8vSVrkbNIw0KpbygTeYMJL/3wHc=;
        b=6STReDwJE49+n6Q3WEfF4/70X84qlpBFtYa13s1B9AqU6MHBP5NXa5IVWUR7lJjlx/
         GB0w4BXSyxHSWtHk0F+L5xJU1Jc26DhkrcrMpRwNlAAlgIi23O/m5u73qaG3SPDGQwNE
         Zab8zZTPwErcFzMRRPj7/SH6YB6W0oaVIasyDw9+zG81NtYKk3ZhrE1IjXJVwGDcp//Q
         Yv8G0LcN1qpRPWg5nE+GCOttFtweVs7C1t5sfZd/3JEADwmLj3CYs11CMGoFb1ATMBo6
         eiYBJI2EjWRsLjLckFpaXa0aZTRwt7NmYZYa0+UqP7lWq/7L1dDviLXEpOlqF0KJmkCj
         2DAA==
X-Gm-Message-State: AO0yUKUTdqqOSl46Hc8hln+L1rmXTBXjAkJ9wja0w6cspH3e1keh43ZR
	VvFkzVXfugT22DL0dzr5ONE=
X-Google-Smtp-Source: AK7set+RJQKs9QlFP/fuW0+0r4cthBgsbcujjamf/UFg8WkoC4IrOQHMZQcJaAn7QEfYYDX6cVoXeg==
X-Received: by 2002:a17:907:3f18:b0:8f6:5a70:cccc with SMTP id hq24-20020a1709073f1800b008f65a70ccccmr11620167ejc.66.1678049814399;
        Sun, 05 Mar 2023 12:56:54 -0800 (PST)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id ay24-20020a170906d29800b0090953b9da51sm3615436ejb.194.2023.03.05.12.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 12:56:54 -0800 (PST)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 01/10] locking/atomic: Add missing cast to try_cmpxchg() fallbacks
Date: Sun,  5 Mar 2023 21:56:19 +0100
Message-Id: <20230305205628.27385-2-ubizjak@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230305205628.27385-1-ubizjak@gmail.com>
References: <20230305205628.27385-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cast _oldp to the type of _ptr to avoid incompatible-pointer-types warning.

Fixes: 29f006fdefe6 ("asm-generic/atomic: Add try_cmpxchg() fallbacks")
Cc: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 include/linux/atomic/atomic-arch-fallback.h | 18 +++++++++---------
 scripts/atomic/gen-atomic-fallback.sh       |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/linux/atomic/atomic-arch-fallback.h b/include/linux/atomic/atomic-arch-fallback.h
index 77bc5522e61c..19debd501ee7 100644
--- a/include/linux/atomic/atomic-arch-fallback.h
+++ b/include/linux/atomic/atomic-arch-fallback.h
@@ -87,7 +87,7 @@
 #ifndef arch_try_cmpxchg
 #define arch_try_cmpxchg(_ptr, _oldp, _new) \
 ({ \
-	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
 	___r = arch_cmpxchg((_ptr), ___o, (_new)); \
 	if (unlikely(___r != ___o)) \
 		*___op = ___r; \
@@ -98,7 +98,7 @@
 #ifndef arch_try_cmpxchg_acquire
 #define arch_try_cmpxchg_acquire(_ptr, _oldp, _new) \
 ({ \
-	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
 	___r = arch_cmpxchg_acquire((_ptr), ___o, (_new)); \
 	if (unlikely(___r != ___o)) \
 		*___op = ___r; \
@@ -109,7 +109,7 @@
 #ifndef arch_try_cmpxchg_release
 #define arch_try_cmpxchg_release(_ptr, _oldp, _new) \
 ({ \
-	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
 	___r = arch_cmpxchg_release((_ptr), ___o, (_new)); \
 	if (unlikely(___r != ___o)) \
 		*___op = ___r; \
@@ -120,7 +120,7 @@
 #ifndef arch_try_cmpxchg_relaxed
 #define arch_try_cmpxchg_relaxed(_ptr, _oldp, _new) \
 ({ \
-	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
 	___r = arch_cmpxchg_relaxed((_ptr), ___o, (_new)); \
 	if (unlikely(___r != ___o)) \
 		*___op = ___r; \
@@ -157,7 +157,7 @@
 #ifndef arch_try_cmpxchg64
 #define arch_try_cmpxchg64(_ptr, _oldp, _new) \
 ({ \
-	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
 	___r = arch_cmpxchg64((_ptr), ___o, (_new)); \
 	if (unlikely(___r != ___o)) \
 		*___op = ___r; \
@@ -168,7 +168,7 @@
 #ifndef arch_try_cmpxchg64_acquire
 #define arch_try_cmpxchg64_acquire(_ptr, _oldp, _new) \
 ({ \
-	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
 	___r = arch_cmpxchg64_acquire((_ptr), ___o, (_new)); \
 	if (unlikely(___r != ___o)) \
 		*___op = ___r; \
@@ -179,7 +179,7 @@
 #ifndef arch_try_cmpxchg64_release
 #define arch_try_cmpxchg64_release(_ptr, _oldp, _new) \
 ({ \
-	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
 	___r = arch_cmpxchg64_release((_ptr), ___o, (_new)); \
 	if (unlikely(___r != ___o)) \
 		*___op = ___r; \
@@ -190,7 +190,7 @@
 #ifndef arch_try_cmpxchg64_relaxed
 #define arch_try_cmpxchg64_relaxed(_ptr, _oldp, _new) \
 ({ \
-	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
 	___r = arch_cmpxchg64_relaxed((_ptr), ___o, (_new)); \
 	if (unlikely(___r != ___o)) \
 		*___op = ___r; \
@@ -2456,4 +2456,4 @@ arch_atomic64_dec_if_positive(atomic64_t *v)
 #endif
 
 #endif /* _LINUX_ATOMIC_FALLBACK_H */
-// b5e87bdd5ede61470c29f7a7e4de781af3770f09
+// 1b4d4c82ae653389cd1538d5b07170267d9b3837
diff --git a/scripts/atomic/gen-atomic-fallback.sh b/scripts/atomic/gen-atomic-fallback.sh
index 3a07695e3c89..39f447161108 100755
--- a/scripts/atomic/gen-atomic-fallback.sh
+++ b/scripts/atomic/gen-atomic-fallback.sh
@@ -171,7 +171,7 @@ cat <<EOF
 #ifndef arch_try_${cmpxchg}${order}
 #define arch_try_${cmpxchg}${order}(_ptr, _oldp, _new) \\
 ({ \\
-	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \\
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \\
 	___r = arch_${cmpxchg}${order}((_ptr), ___o, (_new)); \\
 	if (unlikely(___r != ___o)) \\
 		*___op = ___r; \\
-- 
2.39.2

