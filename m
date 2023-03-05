Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8455D3C34
	for <loongarch@lists.linux.dev>; Sun,  5 Mar 2023 20:57:07 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id g3so30877636eda.1
        for <loongarch@lists.linux.dev>; Sun, 05 Mar 2023 12:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678049825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXoBl7+op9aWSq5Dkg0e/fVhHu4Qq2D4107mPK7NLLs=;
        b=NXbVUoifiR5f9wJbmip3eWTWXYXEwmyaIdEBNnfCyRdyAk7zaaXRY0sYnfJRGWuLAS
         g8x59fLsFLmo5M3Ik3s/tk1KKBZCczl1Fgw42WTZOWS04DzPYnwi4w55o7h+c+eVefjA
         yGaHfjFFSAxNqbiQZpqt3i+u6y2V2BkU7O67/5ecoxTFpwzclUj8SQCgKdL2w7dE53dA
         5xMBuutmSq1NOS9h1Fdt7g9A/4eDJZHogsS6RiAAuXcSEX6dnzhJIQ7F1HTmc/YOQoP6
         jsa1rwU2ODNFy+VyW2rjw0v/ilyUvuIGQPs1yrtAiQeKZDT2jOBr7m4vLNyVajzwbMKC
         dB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678049825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXoBl7+op9aWSq5Dkg0e/fVhHu4Qq2D4107mPK7NLLs=;
        b=0NQ0Px66PX0t5ZLoZnu7nBjg6cnJ5nx5uN0xYDuGJBwzLswZEXN217mgJtv4sAfLE4
         vvZNnO3B9Imk74RY+6LkfMTuq/L4he9fjLUbCcRzIcxqqbq5s7qycZhckYJE32z1ZKAv
         i2c5JvHMSL4vH2z4F7XLNaUsZXMhS3n7QpAgZg03mfgmY+B9OOeVoagUzRAEls0ii3l6
         Ntjn/EwGSRv5hbr/9u7MggAr0mEobv9BkswCjJ2m2HUYkJJ4thvRoIYf6+P6s/8och5R
         DpOLyRkFdWGXFyZgwFQLPOir/dRiQ4oq3kww9h+PemJm5fRV5mbqfb/XUuP+zKQj145L
         Pvew==
X-Gm-Message-State: AO0yUKXgwuw2DHOtpy4SLsfIy19GoLt+QWgQmwefB8AOgdn1LPAPFV9e
	r7FNNVOdc3reUy1AY9DqMSs=
X-Google-Smtp-Source: AK7set82bFu6nQYw7chShTqd/Oc7Lhw2Ixl//LUdtfoQSZu7/ZtYQcw9c6CERUPnPhuuiN2uS3xPww==
X-Received: by 2002:a17:907:8c8a:b0:8ee:babc:d2dd with SMTP id td10-20020a1709078c8a00b008eebabcd2ddmr7854988ejc.18.1678049825779;
        Sun, 05 Mar 2023 12:57:05 -0800 (PST)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id ay24-20020a170906d29800b0090953b9da51sm3615436ejb.194.2023.03.05.12.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 12:57:05 -0800 (PST)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 08/10] locking/generic: Wire up local{,64}_try_cmpxchg
Date: Sun,  5 Mar 2023 21:56:26 +0100
Message-Id: <20230305205628.27385-9-ubizjak@gmail.com>
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

Implement generic support for local{,64}_try_cmpxchg.

Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 include/asm-generic/local.h   | 1 +
 include/asm-generic/local64.h | 2 ++
 2 files changed, 3 insertions(+)

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
index 765be0b7d883..54b91e93ae76 100644
--- a/include/asm-generic/local64.h
+++ b/include/asm-generic/local64.h
@@ -43,6 +43,7 @@ typedef struct {
 #define local64_inc_return(l)	local_inc_return(&(l)->a)
 
 #define local64_cmpxchg(l, o, n) local_cmpxchg((&(l)->a), (o), (n))
+#define local64_try_cmpxchg(l, po, n) local_try_cmpxchg((&(l)->a), (po), (n))
 #define local64_xchg(l, n)	local_xchg((&(l)->a), (n))
 #define local64_add_unless(l, _a, u) local_add_unless((&(l)->a), (_a), (u))
 #define local64_inc_not_zero(l)	local_inc_not_zero(&(l)->a)
@@ -81,6 +82,7 @@ typedef struct {
 #define local64_inc_return(l)	atomic64_inc_return(&(l)->a)
 
 #define local64_cmpxchg(l, o, n) atomic64_cmpxchg((&(l)->a), (o), (n))
+#define local64_try_cmpxchg(l, po, n) atomic64_try_cmpxchg((&(l)->a), (po), (n))
 #define local64_xchg(l, n)	atomic64_xchg((&(l)->a), (n))
 #define local64_add_unless(l, _a, u) atomic64_add_unless((&(l)->a), (_a), (u))
 #define local64_inc_not_zero(l)	atomic64_inc_not_zero(&(l)->a)
-- 
2.39.2

