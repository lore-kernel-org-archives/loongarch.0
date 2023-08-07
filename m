Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88519BA40
	for <loongarch@lists.linux.dev>; Mon,  7 Aug 2023 15:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E264C433CD;
	Mon,  7 Aug 2023 15:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691422983;
	bh=6F2ehvB66Ms9jWF39bnYTV60WrC8vf/eA8/nBR/P3/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A+/9FYqc7NzkxY9qtFa4pV3rcoAGj2HuuiUDQkDo+UljP3mFGXHSNZa2wCU4BMcIH
	 noEeQhEYoG6f0j+3J0mNWhY8asx0KhMGNnfVs2NMBYFPeHVF02IZ6hR9kKD3p936U7
	 HEzSWFWS2vCFS013B+7H/G1lZsF56vgYRnflEMbtnazOgEWN+pV5xU0Hzywd0wu1kl
	 hYeMs4dKXpB+Aqg7PJWyhhdVjS3yn1lbK9mJzF9EzRar6Gt9J+hMqqkOl6SFSHi11J
	 LEfp6QasWWLkKkwudx31Hjz7MVSh7fWWGBZ6Wn6R7qb4C3fZKekBldpgz+pUgx55ae
	 YnIKf9qV8llQA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 3/3] loongarch: remove <asm/export.h>
Date: Tue,  8 Aug 2023 00:42:50 +0900
Message-Id: <20230807154250.998765-3-masahiroy@kernel.org>
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

All *.S files under arch/loongarch/ have been converted to include
<linux/export.h> instead of <asm/export.h>.

Remove <asm/export.h>.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/loongarch/include/asm/Kbuild | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/loongarch/include/asm/Kbuild b/arch/loongarch/include/asm/Kbuild
index 6b222f227342..93783fa24f6e 100644
--- a/arch/loongarch/include/asm/Kbuild
+++ b/arch/loongarch/include/asm/Kbuild
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 generic-y += dma-contiguous.h
-generic-y += export.h
 generic-y += mcs_spinlock.h
 generic-y += parport.h
 generic-y += early_ioremap.h
-- 
2.39.2

