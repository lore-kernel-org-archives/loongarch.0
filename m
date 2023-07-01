Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFE423AE
	for <loongarch@lists.linux.dev>; Sat,  1 Jul 2023 08:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1688200394;
	bh=7UhTuuwe0giHTHwVCAK8zKVJbVOpd+nGblt2BadtYbQ=;
	h=From:To:Cc:Subject:Date:From;
	b=ZX5RI90VxkBak03kGFPggKWfGoJ/8aNMCpnd+67acQkH5Mq6oKrYi0qNaV3v3VjqN
	 rrToUA4c5rRrPiGs9LlecYcPN5hB3yszAxDbKXkQmaIbYXHPQLWGSht2EJg7X0GGJW
	 XFHHc304Uucf7F1a9FT+yria+hKUdd+gK5bvaZds=
Received: from stargazer.. (unknown [IPv6:240e:358:11ad:d900:dc73:854d:832e:4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 429EA66387;
	Sat,  1 Jul 2023 04:33:08 -0400 (EDT)
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH] loongarch: loongson3_defconfig: Enable CONFIG_JUMP_LABEL
Date: Sat,  1 Jul 2023 16:32:47 +0800
Message-ID: <20230701083247.177482-1-xry111@xry111.site>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As it's an optimization without any real disadvantages, let's enable it
like the defconfig of other architecture supporting it.

Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 arch/loongarch/configs/loongson3_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index 6cd26dd3c134..33a0f5f742f6 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -63,6 +63,7 @@ CONFIG_EFI_ZBOOT=y
 CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER=y
 CONFIG_EFI_CAPSULE_LOADER=m
 CONFIG_EFI_TEST=m
+CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_FORCE_LOAD=y
 CONFIG_MODULE_UNLOAD=y
-- 
2.41.0

