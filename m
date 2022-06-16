Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C434E23B6
	for <loongarch@lists.linux.dev>; Thu, 16 Jun 2022 12:13:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10113C34114;
	Thu, 16 Jun 2022 12:13:36 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: loongarch@lists.linux.dev,
	linux-arch@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Huacai Chen <chenhuacai@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] MAINTAINERS: Add maillist information for LoongArch
Date: Thu, 16 Jun 2022 20:14:56 +0800
Message-Id: <20220616121456.3613470-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now there is a dedicated maillist (loongarch@lists.linux.dev) for
LoongArch, add it for better development.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1fc9ead83d2a..dba5e89527a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11590,6 +11590,7 @@ F:	drivers/gpu/drm/bridge/lontium-lt8912b.c
 LOONGARCH
 M:	Huacai Chen <chenhuacai@kernel.org>
 R:	WANG Xuerui <kernel@xen0n.name>
+L:	loongarch@lists.linux.dev
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git
 F:	arch/loongarch/
-- 
2.27.0

