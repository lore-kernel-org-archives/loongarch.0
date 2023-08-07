Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27545BA40
	for <loongarch@lists.linux.dev>; Mon,  7 Aug 2023 15:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB7AC433CB;
	Mon,  7 Aug 2023 15:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691422981;
	bh=OtMYjEpo0UJCnbN5a1Kl1O+JGx2yqsNm3tCe/nTJnhs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aFhX0OM11ppGRAjT5kvPvm9ZeEbPJQSq/lAyqaZUHsAU3jj1p+vS7ivQhLdrm7ypC
	 9vNqR9X+MbnUChpkwJrd0W2hvlTv9tkuDEkiCaiUXeP6xqQU+qldf1ec0OmHhmBPtx
	 MPSPncicMtpi8nqs14ET/AlpUVIX+O/VkYO+DEuW8EiW5ke9ORW8D7b4fBsE/EOn9A
	 ALFlw6Itbq2nCQt9AkFYurN9Ucjm1uzVOugqP4YvCLurJyET9EA7Uz+OWactbR7bJp
	 32HDfsE1IbNNRiG0Q0d854itvqbcB+3tQQzpmzCDGyEE71WJQ2KAUrTXfXd6ij2vlA
	 1ZbqFV8hdnW3A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/3] loongarch: replace #include <asm/export.h> with #include <linux/export.h>
Date: Tue,  8 Aug 2023 00:42:49 +0900
Message-Id: <20230807154250.998765-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807154250.998765-1-masahiroy@kernel.org>
References: <20230807154250.998765-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit ddb5cdbafaaa ("kbuild: generate KSYMTAB entries by modpost")
deprecated <asm/export.h>, which is now a wrapper of <linux/export.h>.

Replace #include <asm/export.h> with #include <linux/export.h>.

After all the <asm/export.h> lines are converted, <asm/export.h> and
<asm-generic/export.h> will be removed.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/loongarch/kernel/fpu.S     | 2 +-
 arch/loongarch/kernel/mcount.S  | 2 +-
 arch/loongarch/lib/clear_user.S | 2 +-
 arch/loongarch/lib/copy_user.S  | 2 +-
 arch/loongarch/lib/memcpy.S     | 2 +-
 arch/loongarch/lib/memmove.S    | 2 +-
 arch/loongarch/lib/memset.S     | 2 +-
 arch/loongarch/mm/page.S        | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/kernel/fpu.S b/arch/loongarch/kernel/fpu.S
index 59f1572aa523..b4032deb8e3b 100644
--- a/arch/loongarch/kernel/fpu.S
+++ b/arch/loongarch/kernel/fpu.S
@@ -6,12 +6,12 @@
  *
  * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
  */
+#include <linux/export.h>
 #include <asm/asm.h>
 #include <asm/asmmacro.h>
 #include <asm/asm-extable.h>
 #include <asm/asm-offsets.h>
 #include <asm/errno.h>
-#include <asm/export.h>
 #include <asm/fpregdef.h>
 #include <asm/loongarch.h>
 #include <asm/regdef.h>
diff --git a/arch/loongarch/kernel/mcount.S b/arch/loongarch/kernel/mcount.S
index cb8e5803de4b..3015896016a0 100644
--- a/arch/loongarch/kernel/mcount.S
+++ b/arch/loongarch/kernel/mcount.S
@@ -5,7 +5,7 @@
  * Copyright (C) 2022 Loongson Technology Corporation Limited
  */
 
-#include <asm/export.h>
+#include <linux/export.h>
 #include <asm/ftrace.h>
 #include <asm/regdef.h>
 #include <asm/stackframe.h>
diff --git a/arch/loongarch/lib/clear_user.S b/arch/loongarch/lib/clear_user.S
index 9dcf71719387..0790eadce166 100644
--- a/arch/loongarch/lib/clear_user.S
+++ b/arch/loongarch/lib/clear_user.S
@@ -3,12 +3,12 @@
  * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
  */
 
+#include <linux/export.h>
 #include <asm/alternative-asm.h>
 #include <asm/asm.h>
 #include <asm/asmmacro.h>
 #include <asm/asm-extable.h>
 #include <asm/cpu.h>
-#include <asm/export.h>
 #include <asm/regdef.h>
 
 .irp to, 0, 1, 2, 3, 4, 5, 6, 7
diff --git a/arch/loongarch/lib/copy_user.S b/arch/loongarch/lib/copy_user.S
index fecd08cad702..bfe3d2793d00 100644
--- a/arch/loongarch/lib/copy_user.S
+++ b/arch/loongarch/lib/copy_user.S
@@ -3,12 +3,12 @@
  * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
  */
 
+#include <linux/export.h>
 #include <asm/alternative-asm.h>
 #include <asm/asm.h>
 #include <asm/asmmacro.h>
 #include <asm/asm-extable.h>
 #include <asm/cpu.h>
-#include <asm/export.h>
 #include <asm/regdef.h>
 
 .irp to, 0, 1, 2, 3, 4, 5, 6, 7
diff --git a/arch/loongarch/lib/memcpy.S b/arch/loongarch/lib/memcpy.S
index f5d4c3e65264..fa1148878d2b 100644
--- a/arch/loongarch/lib/memcpy.S
+++ b/arch/loongarch/lib/memcpy.S
@@ -3,11 +3,11 @@
  * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
  */
 
+#include <linux/export.h>
 #include <asm/alternative-asm.h>
 #include <asm/asm.h>
 #include <asm/asmmacro.h>
 #include <asm/cpu.h>
-#include <asm/export.h>
 #include <asm/regdef.h>
 
 .section .noinstr.text, "ax"
diff --git a/arch/loongarch/lib/memmove.S b/arch/loongarch/lib/memmove.S
index 71b81d271c73..82dae062fec8 100644
--- a/arch/loongarch/lib/memmove.S
+++ b/arch/loongarch/lib/memmove.S
@@ -3,11 +3,11 @@
  * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
  */
 
+#include <linux/export.h>
 #include <asm/alternative-asm.h>
 #include <asm/asm.h>
 #include <asm/asmmacro.h>
 #include <asm/cpu.h>
-#include <asm/export.h>
 #include <asm/regdef.h>
 
 .section .noinstr.text, "ax"
diff --git a/arch/loongarch/lib/memset.S b/arch/loongarch/lib/memset.S
index a45f6f92ee3b..06d3ca54cbfe 100644
--- a/arch/loongarch/lib/memset.S
+++ b/arch/loongarch/lib/memset.S
@@ -3,11 +3,11 @@
  * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
  */
 
+#include <linux/export.h>
 #include <asm/alternative-asm.h>
 #include <asm/asm.h>
 #include <asm/asmmacro.h>
 #include <asm/cpu.h>
-#include <asm/export.h>
 #include <asm/regdef.h>
 
 .macro fill_to_64 r0
diff --git a/arch/loongarch/mm/page.S b/arch/loongarch/mm/page.S
index 4c874a7af0ad..7ad76551d313 100644
--- a/arch/loongarch/mm/page.S
+++ b/arch/loongarch/mm/page.S
@@ -2,9 +2,9 @@
 /*
  * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
  */
+#include <linux/export.h>
 #include <linux/linkage.h>
 #include <asm/asm.h>
-#include <asm/export.h>
 #include <asm/page.h>
 #include <asm/regdef.h>
 
-- 
2.39.2

