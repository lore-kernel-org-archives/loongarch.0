Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D292113
	for <loongarch@lists.linux.dev>; Wed,  8 Feb 2023 10:18:10 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id g17so1225748ply.11
        for <loongarch@lists.linux.dev>; Wed, 08 Feb 2023 02:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFDa6RzFjbYJQKnaADEQ469/RoyljuIaxBNPhmYoeo0=;
        b=j8s42LpmW6Y2jpUh2/r/k420Dqx2Nj/DoQrajguzkxbPLNszzOy+J7zKfE+kAyeMMp
         PLJoSocqe/R/SI98XlpLBbbaF1A/1XGVCWnuP5e/k9jTNDxscp/ksIl0H8BwQl5Nxk1A
         g6qid9M60K8mNPYoqZmiFc9uAZFCJnxqksJM8rOCeKERTLgB8qvDO0U5F/llDF1lKew9
         MfDXFn7hcA1gdLNJz/plwyySU98VmpDC67pv4tEVkpa/war5rLiK77ydKPeYt2I+HyWq
         m71Ubk3u1uPECcqero5CwYuR72LNVM8mFHuIwOVnz2ENLwCHkUa5Ao3sTQLk9XJwa+sn
         zL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YFDa6RzFjbYJQKnaADEQ469/RoyljuIaxBNPhmYoeo0=;
        b=YgCVViUDMkb2QRMFrxPNKL1rAtnSuJUuQ1zsHswzYCdau0OF1pd1U/d9Man+YZntds
         v5FMHOsVhXciyhkZNGQlZV0qM7rnxAVvntrcQ1HVgJuXzsG6Wq2yMPUX6bFxORAJ6+t9
         +M+s0/xHDAbAGy/NaaXOxFvLqeJkhhTp/FeKs4qPpLW2p9oiuu7YEXOOPylZGx2ZKft1
         XSgKeyI+flx13+OkXRh9nSCSCw2HGPpIcF4V+EutxoDgK3j/RJyhOTbap2ALhey7J8IE
         9AG95gLt1vPwEjE3ZTEE9OdOMks5wlUbH/sLrgNZ4oJ7vI9knLmH9u/m1XSoUZunrvgj
         lmEg==
X-Gm-Message-State: AO0yUKU1+H+gyZkP6xRv1klchRacclV628eiR4yNWOaMTXKvywewtemL
	wHXlcU6559awotGWceGJi9Q=
X-Google-Smtp-Source: AK7set9/EE2raGMoytste5SzOwD31oKFjlIJABzy3vfltf46sSpJUgS0bi1S35nFZu7qy7+P+NcL4Q==
X-Received: by 2002:a17:902:e844:b0:196:8dce:82eb with SMTP id t4-20020a170902e84400b001968dce82ebmr7551286plg.66.1675851490266;
        Wed, 08 Feb 2023 02:18:10 -0800 (PST)
Received: from localhost.localdomain ([112.20.108.204])
        by smtp.gmail.com with ESMTPSA id v23-20020a1709028d9700b0019926c7757asm3991058plo.289.2023.02.08.02.18.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Feb 2023 02:18:09 -0800 (PST)
From: chris.chenfeiyang@gmail.com
X-Google-Original-From: chenfeiyang@loongson.cn
To: w@1wt.eu,
	paulmck@kernel.org
Cc: Feiyang Chen <chenfeiyang@loongson.cn>,
	arnd@arndb.de,
	chenhuacai@kernel.org,
	jiaxun.yang@flygoat.com,
	chris.chenfeiyang@gmail.com,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] tools/nolibc: Include linux/fcntl.h and remove duplicate code
Date: Wed,  8 Feb 2023 18:17:50 +0800
Message-Id: <cf503323a85a90dcc8040a1b07a6448b97cf6b5c.1675851111.git.chenfeiyang@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1675851111.git.chenfeiyang@loongson.cn>
References: <cover.1675851111.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Feiyang Chen <chenfeiyang@loongson.cn>

Include linux/fcntl.h for O_* and AT_*. asm/fcntl.h is included
by linux/fcntl.h, so it can be safely removed.

Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
---
 tools/include/nolibc/sys.h   | 2 +-
 tools/include/nolibc/types.h | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index b5f8cd35c03b..c4818a9c8823 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -11,7 +11,6 @@
 #include "std.h"
 
 /* system includes */
-#include <asm/fcntl.h>   // for O_*
 #include <asm/unistd.h>
 #include <asm/signal.h>  // for SIGCHLD
 #include <asm/ioctls.h>
@@ -20,6 +19,7 @@
 #include <linux/loop.h>
 #include <linux/time.h>
 #include <linux/auxvec.h>
+#include <linux/fcntl.h> // for O_* and AT_*
 
 #include "arch.h"
 #include "errno.h"
diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
index fbbc0e68c001..a3651c514e2f 100644
--- a/tools/include/nolibc/types.h
+++ b/tools/include/nolibc/types.h
@@ -60,11 +60,6 @@
 #define MAXPATHLEN     (PATH_MAX)
 #endif
 
-/* Special FD used by all the *at functions */
-#ifndef AT_FDCWD
-#define AT_FDCWD       (-100)
-#endif
-
 /* whence values for lseek() */
 #define SEEK_SET       0
 #define SEEK_CUR       1
-- 
2.39.0

