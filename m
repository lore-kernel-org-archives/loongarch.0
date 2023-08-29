Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE621174F0
	for <loongarch@lists.linux.dev>; Tue, 29 Aug 2023 13:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964B2C433C9;
	Tue, 29 Aug 2023 13:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693315993;
	bh=MSSDfUOC3gvLXz71PuLLf4zxD/dntXDkQq++7ilshuo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZJkqtlBT/FyWRh2AEGLFqDIFf1wc/qJiYnBzh3XDTsLUikcsOgWmYbcuZfPW3cfTh
	 PGueCxqzxXudoxyk0KjVkPACnOFLp9ERS7WAfZM3Qd9I3NEes1/3busVnZv0BxwY2I
	 7Hc6m39S3lXJp0drclG5yiYAyUVdWb94KfUHo/dwt1ZVZeaaa94T9h4W9rwBskPvTm
	 +jkydiRkTJnCoW2oXGNESDL7rib8sMpeyfg7Z8S9pP00LhSCQZJ0C7LBC7dLQ4qKfr
	 3r0mSJFZJOsFrbFRYVj8uso9tJi9ePnPzhJOoVOczkdoC8ryLvzQnirJL9415yR5Mx
	 pkcLY+4jtbbxQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Qi Hu <huqi@loongson.cn>,
	Miao HAO <haomiao19@mails.ucas.ac.cn>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Sasha Levin <sashal@kernel.org>,
	chenhuacai@kernel.org,
	gregkh@linuxfoundation.org,
	loongarch@lists.linux.dev
Subject: [PATCH AUTOSEL 6.1 14/15] LoongArch: Fix the write_fcsr() macro
Date: Tue, 29 Aug 2023 09:32:44 -0400
Message-Id: <20230829133245.520176-14-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230829133245.520176-1-sashal@kernel.org>
References: <20230829133245.520176-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.49
Content-Transfer-Encoding: 8bit

From: Qi Hu <huqi@loongson.cn>

[ Upstream commit 346dc929623cef70ff7832a4fa0ffd1b696e312a ]

The "write_fcsr()" macro uses wrong the positions for val and dest in
asm. Fix it!

Reported-by: Miao HAO <haomiao19@mails.ucas.ac.cn>
Signed-off-by: Qi Hu <huqi@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/loongarch/include/asm/loongarch.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index 62835d84a647d..3d15fa5bef37d 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -1488,7 +1488,7 @@ __BUILD_CSR_OP(tlbidx)
 #define write_fcsr(dest, val) \
 do {	\
 	__asm__ __volatile__(	\
-	"	movgr2fcsr	%0, "__stringify(dest)"	\n"	\
+	"	movgr2fcsr	"__stringify(dest)", %0	\n"	\
 	: : "r" (val));	\
 } while (0)
 
-- 
2.40.1

