Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7636A15AD0
	for <loongarch@lists.linux.dev>; Mon, 26 Jun 2023 21:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BE50C433C8;
	Mon, 26 Jun 2023 21:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687816255;
	bh=aSLq5uHp6/F3LAD0eREO/jTQOhAVrAYg972K5sNmKu0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=agC99o7qr/lXPtorgCzcO1ZQ+no/KwjBLiT9jEhv3tQsZlv1Y47XTZ0rRUbFGdbVq
	 Xh3ItLr/WR/bDyNqUiKPHQTLl8U9Mi8DzJpxrmcnqhG4lk4iPxQknta88qM9rTOvA4
	 616sfNUn8Kwnpxc6glPtkBpv4J/jVPzfmoSjwQQl6wg1uD54sMS/G1K6pC7RCYBRsr
	 Y403MtuEUNz2zeMifFiO/vjgSw9tCrqE7KHr5Rx4xHw0dBrja5Tkv+pUvOr+f6iZW/
	 3CAdPeudJrKmelh6P6tbIoy37bVITKLC4X0b7bIw0XB8P8Q7FTygs8+3Hlem+eAw5a
	 1MXxpbbXUKqxA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Qi Hu <huqi@loongson.cn>,
	Miao HAO <haomiao19@mails.ucas.ac.cn>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Sasha Levin <sashal@kernel.org>,
	chenhuacai@kernel.org,
	git@xen0n.name,
	zhangqing@loongson.cn,
	lienze@kylinos.cn,
	loongarch@lists.linux.dev
Subject: [PATCH AUTOSEL 6.1 14/15] LoongArch: Fix the write_fcsr() macro
Date: Mon, 26 Jun 2023 17:50:30 -0400
Message-Id: <20230626215031.179159-14-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230626215031.179159-1-sashal@kernel.org>
References: <20230626215031.179159-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.35
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
2.39.2

