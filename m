Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1DD15B8
	for <loongarch@lists.linux.dev>; Fri, 31 Mar 2023 02:53:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38709C433EF;
	Fri, 31 Mar 2023 02:53:35 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Huacai Chen <chenhuacai@loongson.cn>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH] LoongArch: Fix build error if CONFIG_SUSPEND is not set
Date: Fri, 31 Mar 2023 10:53:22 +0800
Message-Id: <20230331025322.442337-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We can see the following build error on LoongArch if CONFIG_SUSPEND is
not set:

  ld: drivers/acpi/sleep.o: in function 'acpi_pm_prepare':
  sleep.c:(.text+0x2b8): undefined reference to 'loongarch_wakeup_start'

Here is the call trace:

  acpi_pm_prepare()
    __acpi_pm_prepare()
      acpi_sleep_prepare()
        acpi_get_wakeup_address()
          loongarch_wakeup_start()

Root cause: loongarch_wakeup_start() is defined in arch/loongarch/power/
suspend_asm.S which is only built under CONFIG_SUSPEND. In order to fix
the build error, just let acpi_get_wakeup_address() return 0 if CONFIG_
SUSPEND is not set.

Fixes: 366bb35a8e48 ("LoongArch: Add suspend (ACPI S3) support")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Link: https://lore.kernel.org/all/11215033-fa3c-ecb1-2fc0-e9aeba47be9b@infradead.org/
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/acpi.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/loongarch/include/asm/acpi.h b/arch/loongarch/include/asm/acpi.h
index 4198753aa1d0..976a810352c6 100644
--- a/arch/loongarch/include/asm/acpi.h
+++ b/arch/loongarch/include/asm/acpi.h
@@ -41,8 +41,11 @@ extern void loongarch_suspend_enter(void);
 
 static inline unsigned long acpi_get_wakeup_address(void)
 {
+#ifdef CONFIG_SUSPEND
 	extern void loongarch_wakeup_start(void);
 	return (unsigned long)loongarch_wakeup_start;
+#endif
+	return 0UL;
 }
 
 #endif /* _ASM_LOONGARCH_ACPI_H */
-- 
2.39.1

