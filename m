Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614C47B
	for <loongarch@lists.linux.dev>; Sat, 20 Aug 2022 02:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0ECC433C1;
	Sat, 20 Aug 2022 02:58:04 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Arnd Bergmann <arnd@arndb.de>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-arch@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] LoongArch: Select PCI_QUIRKS to avoid build error
Date: Sat, 20 Aug 2022 10:57:55 +0800
Message-Id: <20220820025755.3110083-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PCI_LOONGSON is a mandatory for LoongArch and it is selected in Kconfig
unconditionally, but its dependency PCI_QUIRKS is missing and may cause
a build error when "make randconfig":

   arch/loongarch/pci/acpi.c: In function 'pci_acpi_setup_ecam_mapping':
>> arch/loongarch/pci/acpi.c:103:29: error: 'loongson_pci_ecam_ops' undeclared (first use in this function)
     103 |                 ecam_ops = &loongson_pci_ecam_ops;
         |                             ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/pci/acpi.c:103:29: note: each undeclared identifier is reported only once for each function it appears in

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCI_LOONGSON
   Depends on [n]: PCI [=y] && (MACH_LOONGSON64 [=y] || COMPILE_TEST [=y]) && (OF [=y] || ACPI [=y]) && PCI_QUIRKS [=n]
   Selected by [y]:
   - LOONGARCH [=y]

Fix it by selecting PCI_QUIRKS unconditionally, too.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 4abc9a28aba4..26aeb1408e56 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -111,6 +111,7 @@ config LOONGARCH
 	select PCI_ECAM if ACPI
 	select PCI_LOONGSON
 	select PCI_MSI_ARCH_FALLBACKS
+	select PCI_QUIRKS
 	select PERF_USE_VMALLOC
 	select RTC_LIB
 	select SMP
-- 
2.31.1

