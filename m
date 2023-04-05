Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D313C0F
	for <loongarch@lists.linux.dev>; Wed,  5 Apr 2023 14:17:51 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id r11so141500279edd.5
        for <loongarch@lists.linux.dev>; Wed, 05 Apr 2023 07:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680704270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Aezn9KwOiaMHT8QBIvXqxw3/7pRoTbwoU4+L6kaZfo=;
        b=h6B0D1guAAz/+Fh3o2MFRuBp2njF7Fye/Xxf2r9nX8V7xNi91MOio5aDjUQBXijRT0
         75EwXqWNYR/1gi60t0DEKttu9WLaqB3/MY8gXnTwiu4Oz4MkVmFrs2JDhb+L8fnPcptQ
         7nrJoQYBcxE0Ipea11+gFcYnJH92f8uuVoDqyuTltBWba1oiCcF6uWTEYtwCT5xdTLlI
         qcI67O3MKKtm2Ll2/izFTSnFMbusRse/8HmyoHl63V/KzowbwYrV1X/+8pt5J0I287/X
         g/ngG/l9UiDfge5nIclREoyJnIxf0VVxBnBlDK8hGh94SIMNrCXES8Wpb/gmo+IR/6pP
         21wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680704270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Aezn9KwOiaMHT8QBIvXqxw3/7pRoTbwoU4+L6kaZfo=;
        b=oN65DR09Qwe17EPKTpl0pnqcLrMJCj1ahbpIXR3AjpBWt5wSoptp5Z3f9bFtZob1a3
         Zs3OBcCm0ndN0GqpCtZJSYjDarT89QdRDkxsxrQEF77eekqU1njQvZpa1AFLFJOQRUR+
         uoEPl1GYkEAEaaOzrSzC2GGx530hlo5JZKhkvfSU6BYUYo1h1mpk+nCmpwOzhDCJ9yhM
         jM1GZPlOXGD1a33ARbTVbK1BWRAkBUrHip+j247/CDoEB1ljMUEIvxudxaEY0Zhlqx/t
         22I1sdr/j3UIJXdcMdIDDGAZl7twiVocqvO/luJYIZPcV1I1Ar+ztRTC1lVCYm7jYvN/
         OFbg==
X-Gm-Message-State: AAQBX9f1AMp1g/BqPdkALtj96/taXF6+nS6vhscbz4LQjhbzwklLtN8Q
	bmEuhadYG97Ky5RmPB8marg=
X-Google-Smtp-Source: AKy350Z/3xgh/xSykpZuUX3JQoJOOenna0pCFqtY30j4WZoVD6fIcb1JmDg2U9Ji+C4VhgW2S0ytyw==
X-Received: by 2002:a17:906:d977:b0:8b0:f277:5cde with SMTP id rp23-20020a170906d97700b008b0f2775cdemr3133825ejb.32.1680704270128;
        Wed, 05 Apr 2023 07:17:50 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id g6-20020a170906348600b009334219656dsm7381246ejb.56.2023.04.05.07.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 07:17:49 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-alpha@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 2/5] locking/generic: Wire up local{,64}_try_cmpxchg
Date: Wed,  5 Apr 2023 16:17:07 +0200
Message-Id: <20230405141710.3551-3-ubizjak@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405141710.3551-1-ubizjak@gmail.com>
References: <20230405141710.3551-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement generic support for local{,64}_try_cmpxchg.

Redirect to the atomic_ family of functions when the target
does not provide its own local.h definitions.

For 64-bit targets, implement local64_try_cmpxchg and
local64_cmpxchg using typed C wrappers that call local_
family of functions and provide additional checking
of their input arguments.

Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 include/asm-generic/local.h   |  1 +
 include/asm-generic/local64.h | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/asm-generic/local.h b/include/asm-generic/local.h
index fca7f1d84818..7f97018df66f 100644
--- a/include/asm-generic/local.h
+++ b/include/asm-generic/local.h
@@ -42,6 +42,7 @@ typedef struct
 #define local_inc_return(l) atomic_long_inc_return(&(l)->a)
 
 #define local_cmpxchg(l, o, n) atomic_long_cmpxchg((&(l)->a), (o), (n))
+#define local_try_cmpxchg(l, po, n) atomic_long_try_cmpxchg((&(l)->a), (po), (n))
 #define local_xchg(l, n) atomic_long_xchg((&(l)->a), (n))
 #define local_add_unless(l, _a, u) atomic_long_add_unless((&(l)->a), (_a), (u))
 #define local_inc_not_zero(l) atomic_long_inc_not_zero(&(l)->a)
diff --git a/include/asm-generic/local64.h b/include/asm-generic/local64.h
index 765be0b7d883..14963a7a6253 100644
--- a/include/asm-generic/local64.h
+++ b/include/asm-generic/local64.h
@@ -42,7 +42,16 @@ typedef struct {
 #define local64_sub_return(i, l) local_sub_return((i), (&(l)->a))
 #define local64_inc_return(l)	local_inc_return(&(l)->a)
 
-#define local64_cmpxchg(l, o, n) local_cmpxchg((&(l)->a), (o), (n))
+static inline s64 local64_cmpxchg(local64_t *l, s64 old, s64 new)
+{
+	return local_cmpxchg(&l->a, old, new);
+}
+
+static inline bool local64_try_cmpxchg(local64_t *l, s64 *old, s64 new)
+{
+	return local_try_cmpxchg(&l->a, (long *)old, new);
+}
+
 #define local64_xchg(l, n)	local_xchg((&(l)->a), (n))
 #define local64_add_unless(l, _a, u) local_add_unless((&(l)->a), (_a), (u))
 #define local64_inc_not_zero(l)	local_inc_not_zero(&(l)->a)
@@ -81,6 +90,7 @@ typedef struct {
 #define local64_inc_return(l)	atomic64_inc_return(&(l)->a)
 
 #define local64_cmpxchg(l, o, n) atomic64_cmpxchg((&(l)->a), (o), (n))
+#define local64_try_cmpxchg(l, po, n) atomic64_try_cmpxchg((&(l)->a), (po), (n))
 #define local64_xchg(l, n)	atomic64_xchg((&(l)->a), (n))
 #define local64_add_unless(l, _a, u) atomic64_add_unless((&(l)->a), (_a), (u))
 #define local64_inc_not_zero(l)	atomic64_inc_not_zero(&(l)->a)
-- 
2.39.2

