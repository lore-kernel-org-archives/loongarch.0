Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B24627
	for <loongarch@lists.linux.dev>; Thu,  9 Feb 2023 03:24:28 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id ge7-20020a17090b0e0700b002312568942cso2481968pjb.3
        for <loongarch@lists.linux.dev>; Wed, 08 Feb 2023 19:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFDa6RzFjbYJQKnaADEQ469/RoyljuIaxBNPhmYoeo0=;
        b=Nn7SX3ixYjVrAo6eo2AYxJ79osyGC003C8QvKyqD4c079ZYifo5Hsbskj1nsoIiU6V
         CY1ePp2VQvoIQwN1a04RKC5y5RRz/xvI8xQgjFS1rh8Bi9Ggox3eOHqnuMy2r7ScjFrS
         2h6T9w5ltuHMESQlTQCbGuOVf9x2Kc5EbJhyIaqih396skv3yeqEsrS6rKwHIrE1yqBJ
         xv3qew1r3aPfx8zz8DKDC4o9u+Hu3epEz3VC3I26L4M5Fei8Qf66CS+YAIecOs3zJljX
         kT7T2rLsVm27XA/50qkOr+TuPkZ6BssD8g9bzj5DXyViTrE7csthf7kruq17KuqMQ32R
         BwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YFDa6RzFjbYJQKnaADEQ469/RoyljuIaxBNPhmYoeo0=;
        b=FPu7XasfT31TSxRcNVehOgWBebn4SN8RW3et7nntMzqi2ZkLqyZ+LzEqpj+kwNowAw
         V/odtW+KmLywtsw9nb8j5JQ+U8UQ+Daxf/awu4uqwv+JTewaxI9ZyHm+mILHPC0/k3wV
         uNZWwH3Fv6JXCZrqWFjFbkJ5tIenMpktgdNu7zhCXSn8VbYrQ+qrQrWEf3xBT64U6glk
         QLgdB8lKWsXRpKNhs9mQV4HPxAIaaEm2WAxKtVs7RJUXOWXFpmM3OtGR1nSdyWdz+Qlc
         VTDpj63yyP9cvKdE8kUBLug9HPC8WTKOSg9Gp9O3LeVmfua3mXoLTxJA10d/kUkVC2KY
         o3rg==
X-Gm-Message-State: AO0yUKUtk2RJdAZKdBnIW71F+s52c5a5cd5OyFk58GVn28AMSHJN6JyR
	Pe5I7dwhmES34a409xxmTl0=
X-Google-Smtp-Source: AK7set/w65ft3z8q4/tgNHWVFMOSbMGckfkblII+ehcJ1tYMIssiV/23jVMzxd0SisfCwE8+LUMc4A==
X-Received: by 2002:a17:902:e807:b0:196:8d48:8760 with SMTP id u7-20020a170902e80700b001968d488760mr10677068plg.31.1675913067897;
        Wed, 08 Feb 2023 19:24:27 -0800 (PST)
Received: from localhost.localdomain ([112.20.108.204])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902eac500b00192820d00d0sm216086pld.120.2023.02.08.19.24.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Feb 2023 19:24:27 -0800 (PST)
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
Subject: [PATCH v3 1/5] tools/nolibc: Include linux/fcntl.h and remove duplicate code
Date: Thu,  9 Feb 2023 11:24:12 +0800
Message-Id: <cf503323a85a90dcc8040a1b07a6448b97cf6b5c.1675907639.git.chenfeiyang@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1675907639.git.chenfeiyang@loongson.cn>
References: <cover.1675907639.git.chenfeiyang@loongson.cn>
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

