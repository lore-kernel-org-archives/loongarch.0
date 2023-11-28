Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B981044367;
	Tue, 28 Nov 2023 21:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N1IHwzGw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C88DC433CA;
	Tue, 28 Nov 2023 21:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701205624;
	bh=6HoEwbrM1RqIbQiSdb1WvbUbUd/R80KpCgilb0WBcy0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N1IHwzGwuMwlZFdiVwho1/BLiw3+Q5yEdxgfXuoJOfrM0Hux/GcBzGvL7TecLwgDQ
	 eiEGH3o3m+R+SjIYmZzHGnHjvD3mYFX2N0Oz4u+LT5/yDA6326iwXMPGVctXPn5IJh
	 LhTbWXnPsd99QDK3g0XKiOG1HR5D/WCMylBxFDOKUohGbyurm4/WocCXcF7JRDhXJh
	 zRA3lxPMqhGuH1qU9AC1N/kZzS1zceyjVuIzMM5uMlS/YHpjZs0/XMu4IkuRd1PcIB
	 tx0GUHm3agxEYob/wPhUvBwZNtDp+kJaAdw1DEHk/djNNYshRK97fzD8Zfz2O1gNHS
	 JkV17Ju4u4fsw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	Sasha Levin <sashal@kernel.org>,
	chenhuacai@kernel.org,
	tangyouling@loongson.cn,
	xry111@xry111.site,
	wangrui@loongson.cn,
	zhangqing@loongson.cn,
	loongarch@lists.linux.dev
Subject: [PATCH AUTOSEL 6.6 20/40] LoongArch: Silence the boot warning about 'nokaslr'
Date: Tue, 28 Nov 2023 16:05:26 -0500
Message-ID: <20231128210615.875085-20-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128210615.875085-1-sashal@kernel.org>
References: <20231128210615.875085-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.3
Content-Transfer-Encoding: 8bit

From: Huacai Chen <chenhuacai@loongson.cn>

[ Upstream commit 902d75cdf0cf0a3fb58550089ee519abf12566f5 ]

The kernel parameter 'nokaslr' is handled before start_kernel(), so we
don't need early_param() to mark it technically. But it can cause a boot
warning as follows:

Unknown kernel command line parameters "nokaslr", will be passed to user space.

When we use 'init=/bin/bash', 'nokaslr' which passed to user space will
even cause a kernel panic. So we use early_param() to mark 'nokaslr',
simply print a notice and silence the boot warning (also fix a potential
panic). This logic is similar to RISC-V.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/loongarch/kernel/relocate.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/loongarch/kernel/relocate.c b/arch/loongarch/kernel/relocate.c
index 288b739ca88dd..1acfa704c8d09 100644
--- a/arch/loongarch/kernel/relocate.c
+++ b/arch/loongarch/kernel/relocate.c
@@ -102,6 +102,14 @@ static inline __init unsigned long get_random_boot(void)
 	return hash;
 }
 
+static int __init nokaslr(char *p)
+{
+	pr_info("KASLR is disabled.\n");
+
+	return 0; /* Print a notice and silence the boot warning */
+}
+early_param("nokaslr", nokaslr);
+
 static inline __init bool kaslr_disabled(void)
 {
 	char *str;
-- 
2.42.0

