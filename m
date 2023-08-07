Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C37BBA40
	for <loongarch@lists.linux.dev>; Mon,  7 Aug 2023 15:43:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E1BC433C8;
	Mon,  7 Aug 2023 15:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691422980;
	bh=jDMeY2saM/bjkQWGvcr5EmllnisuWhQJChB6VTZohgw=;
	h=From:To:Cc:Subject:Date:From;
	b=LCTDe+pU4O/AkS9TsP5pBKpT2JbhWvoWJgJWoVi1TWL5RGOJcvxiOS3WR4OY/59c1
	 qvUmb37pIDhiPCjxScL2crEP3BiHi8c3RgojzbkzLa8MCFF5reRQXVu7FZHKrJBSKM
	 hGDFJYIQvk4XYEQHwb9M/FQMukLZlqSAKHY1I/HOrTrCeV6nWDNTD4kRxWrbMhw7N4
	 fElTg6Ml41AkaTvirqV4tu/RRI5P2g+Fhlzghp1kxhT/fXxGYIOLGGuMuYDiVpcdC7
	 tFviafZhxn23lFEZqn61BTzaTJXDmkC/p4zMDBnj3xl10R1Fhce1E1emYbF+gJGNmh
	 B2b4YYiU/PE8Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/3] loongarch: remove unneeded #include <asm/export.h>
Date: Tue,  8 Aug 2023 00:42:48 +0900
Message-Id: <20230807154250.998765-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no EXPORT_SYMBOL line there, hence #include <asm/export.h>
is unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/loongarch/kernel/mcount_dyn.S | 1 -
 arch/loongarch/lib/unaligned.S     | 1 -
 arch/loongarch/mm/tlbex.S          | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/loongarch/kernel/mcount_dyn.S b/arch/loongarch/kernel/mcount_dyn.S
index e16ab0b98e5a..482aa553aa2d 100644
--- a/arch/loongarch/kernel/mcount_dyn.S
+++ b/arch/loongarch/kernel/mcount_dyn.S
@@ -3,7 +3,6 @@
  * Copyright (C) 2022 Loongson Technology Corporation Limited
  */
 
-#include <asm/export.h>
 #include <asm/ftrace.h>
 #include <asm/regdef.h>
 #include <asm/stackframe.h>
diff --git a/arch/loongarch/lib/unaligned.S b/arch/loongarch/lib/unaligned.S
index 9177fd638f07..185f82d85810 100644
--- a/arch/loongarch/lib/unaligned.S
+++ b/arch/loongarch/lib/unaligned.S
@@ -9,7 +9,6 @@
 #include <asm/asmmacro.h>
 #include <asm/asm-extable.h>
 #include <asm/errno.h>
-#include <asm/export.h>
 #include <asm/regdef.h>
 
 .L_fixup_handle_unaligned:
diff --git a/arch/loongarch/mm/tlbex.S b/arch/loongarch/mm/tlbex.S
index 4ad78703de6f..ca17dd3a1915 100644
--- a/arch/loongarch/mm/tlbex.S
+++ b/arch/loongarch/mm/tlbex.S
@@ -3,7 +3,6 @@
  * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
  */
 #include <asm/asm.h>
-#include <asm/export.h>
 #include <asm/loongarch.h>
 #include <asm/page.h>
 #include <asm/pgtable.h>
-- 
2.39.2

