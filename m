Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403983C30
	for <loongarch@lists.linux.dev>; Sun,  5 Mar 2023 20:56:58 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id x3so30677515edb.10
        for <loongarch@lists.linux.dev>; Sun, 05 Mar 2023 12:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678049816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5L64cn4N5im8yY0TwbYjmzSAK85YWgvoCSgwS0+kQI=;
        b=M1J4iSE1LTjZo0wL7dnvoozjIop/c7/Wm7Sy2R0rykpZTL4R2U9Ovaq4UV0VD+Tl68
         2ieo/80t6fERaJmG61Y5km2+XyKTvshWzgdJXmXwqwSRgH1W/FaXNntYvL3YSLWf+tpd
         atfGLULItxgKaqw70SMnK2h46wzZJluQn8vT76C4f4P87qTRy9nkl1B7vedO8JnvZETI
         cl5Cbf7bwDNhMJBw+GJJSNug7QKSr6E6B7kI4AN0/pXjMGm532YlH/B/uqLreXkIojnp
         83UKSDgMra9C402YD/KVagHEs3zUIOemvFifTZvCLlIbHEJp+ZnyQhyUxOC+fQIH5mKr
         bWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678049816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e5L64cn4N5im8yY0TwbYjmzSAK85YWgvoCSgwS0+kQI=;
        b=hwvhzTSFz9AM4OpbS0vxBEroUhiHbgNXHxKFQtWXn7EFv0YPWg8Mq0bGnNvAM6U37h
         EZgWbHqjvgK+7PUDKwQR8TnIDTLQ7I+9yNMY+yIdanr2TYKh6GnEubUGIPj1lFnqarj+
         1SAeF+pKuf4kpFkBTIc2jj90g3Ara8OvC4Nt/36O3PvyAUdjVOnnYE7Aj7yFgCdt4oqE
         2iJ0UqY96+EaiXovSxBgD2aw+u9Vrcvra9E5N0211A/S8AdbiddOjvJH+P/GVhF47CRF
         /wVOe8TCeCKklWJgJSre/EDTCYb/d93FKEAgFvtkmKF8nxWBEizOTuAxsPS6Mo1annh3
         +lAg==
X-Gm-Message-State: AO0yUKW56WIEfh+UJxNVZ5X7jjPodtYixkHV9Vvs4quj9fpLuWsUXLrp
	5XIWHVDIDID+K4pyDvyCXWE=
X-Google-Smtp-Source: AK7set9j53Yr2uHehPIYWZJAaUm5Q60y2iFpzTKOj4cpczqv6y4wGpB3e2dy75oelVKAsoD3XZxluA==
X-Received: by 2002:a17:906:1410:b0:8f6:76da:90dd with SMTP id p16-20020a170906141000b008f676da90ddmr7875537ejc.64.1678049816257;
        Sun, 05 Mar 2023 12:56:56 -0800 (PST)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id ay24-20020a170906d29800b0090953b9da51sm3615436ejb.194.2023.03.05.12.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 12:56:55 -0800 (PST)
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
Subject: [PATCH 02/10] locking/atomic: Add generic try_cmpxchg{,64}_local support
Date: Sun,  5 Mar 2023 21:56:20 +0100
Message-Id: <20230305205628.27385-3-ubizjak@gmail.com>
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

Add generic support for try_cmpxchg{,64}_local and their falbacks.

Cc: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 include/linux/atomic/atomic-arch-fallback.h | 24 ++++++++++++++++++++-
 include/linux/atomic/atomic-instrumented.h  | 20 ++++++++++++++++-
 scripts/atomic/gen-atomic-fallback.sh       |  4 ++++
 scripts/atomic/gen-atomic-instrumented.sh   |  2 +-
 4 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/include/linux/atomic/atomic-arch-fallback.h b/include/linux/atomic/atomic-arch-fallback.h
index 19debd501ee7..a7d2e5f4e548 100644
--- a/include/linux/atomic/atomic-arch-fallback.h
+++ b/include/linux/atomic/atomic-arch-fallback.h
@@ -217,6 +217,28 @@
 
 #endif /* arch_try_cmpxchg64_relaxed */
 
+#ifndef arch_try_cmpxchg_local
+#define arch_try_cmpxchg_local(_ptr, _oldp, _new) \
+({ \
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
+	___r = arch_cmpxchg_local((_ptr), ___o, (_new)); \
+	if (unlikely(___r != ___o)) \
+		*___op = ___r; \
+	likely(___r == ___o); \
+})
+#endif /* arch_try_cmpxchg_local */
+
+#ifndef arch_try_cmpxchg64_local
+#define arch_try_cmpxchg64_local(_ptr, _oldp, _new) \
+({ \
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
+	___r = arch_cmpxchg64_local((_ptr), ___o, (_new)); \
+	if (unlikely(___r != ___o)) \
+		*___op = ___r; \
+	likely(___r == ___o); \
+})
+#endif /* arch_try_cmpxchg64_local */
+
 #ifndef arch_atomic_read_acquire
 static __always_inline int
 arch_atomic_read_acquire(const atomic_t *v)
@@ -2456,4 +2478,4 @@ arch_atomic64_dec_if_positive(atomic64_t *v)
 #endif
 
 #endif /* _LINUX_ATOMIC_FALLBACK_H */
-// 1b4d4c82ae653389cd1538d5b07170267d9b3837
+// 9bb8cca3d4cbc000e7068eb7cb4481cb3e48c45a
diff --git a/include/linux/atomic/atomic-instrumented.h b/include/linux/atomic/atomic-instrumented.h
index 7a139ec030b0..14a9212cc987 100644
--- a/include/linux/atomic/atomic-instrumented.h
+++ b/include/linux/atomic/atomic-instrumented.h
@@ -2066,6 +2066,24 @@ atomic_long_dec_if_positive(atomic_long_t *v)
 	arch_sync_cmpxchg(__ai_ptr, __VA_ARGS__); \
 })
 
+#define try_cmpxchg_local(ptr, oldp, ...) \
+({ \
+	typeof(ptr) __ai_ptr = (ptr); \
+	typeof(oldp) __ai_oldp = (oldp); \
+	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
+	instrument_atomic_write(__ai_oldp, sizeof(*__ai_oldp)); \
+	arch_try_cmpxchg_local(__ai_ptr, __ai_oldp, __VA_ARGS__); \
+})
+
+#define try_cmpxchg64_local(ptr, oldp, ...) \
+({ \
+	typeof(ptr) __ai_ptr = (ptr); \
+	typeof(oldp) __ai_oldp = (oldp); \
+	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
+	instrument_atomic_write(__ai_oldp, sizeof(*__ai_oldp)); \
+	arch_try_cmpxchg64_local(__ai_ptr, __ai_oldp, __VA_ARGS__); \
+})
+
 #define cmpxchg_double(ptr, ...) \
 ({ \
 	typeof(ptr) __ai_ptr = (ptr); \
@@ -2083,4 +2101,4 @@ atomic_long_dec_if_positive(atomic_long_t *v)
 })
 
 #endif /* _LINUX_ATOMIC_INSTRUMENTED_H */
-// 764f741eb77a7ad565dc8d99ce2837d5542e8aee
+// 456e206c7e4e681126c482e4edcc6f46921ac731
diff --git a/scripts/atomic/gen-atomic-fallback.sh b/scripts/atomic/gen-atomic-fallback.sh
index 39f447161108..26829a75b644 100755
--- a/scripts/atomic/gen-atomic-fallback.sh
+++ b/scripts/atomic/gen-atomic-fallback.sh
@@ -225,6 +225,10 @@ for cmpxchg in "cmpxchg" "cmpxchg64"; do
 	gen_try_cmpxchg_fallbacks "${cmpxchg}"
 done
 
+for cmpxchg in "cmpxchg_local" "cmpxchg64_local"; do
+	gen_try_cmpxchg_fallback "${cmpxchg}" ""
+done
+
 grep '^[a-z]' "$1" | while read name meta args; do
 	gen_proto "${meta}" "${name}" "atomic" "int" ${args}
 done
diff --git a/scripts/atomic/gen-atomic-instrumented.sh b/scripts/atomic/gen-atomic-instrumented.sh
index 77c06526a574..c8165e9431bf 100755
--- a/scripts/atomic/gen-atomic-instrumented.sh
+++ b/scripts/atomic/gen-atomic-instrumented.sh
@@ -173,7 +173,7 @@ for xchg in "xchg" "cmpxchg" "cmpxchg64" "try_cmpxchg" "try_cmpxchg64"; do
 	done
 done
 
-for xchg in "cmpxchg_local" "cmpxchg64_local" "sync_cmpxchg"; do
+for xchg in "cmpxchg_local" "cmpxchg64_local" "sync_cmpxchg" "try_cmpxchg_local" "try_cmpxchg64_local" ; do
 	gen_xchg "${xchg}" "" ""
 	printf "\n"
 done
-- 
2.39.2

