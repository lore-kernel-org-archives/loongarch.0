Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C19C2DE
	for <loongarch@lists.linux.dev>; Wed, 21 Jun 2023 10:06:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01570C433B9;
	Wed, 21 Jun 2023 10:05:57 +0000 (UTC)
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
	loongson-kernel@lists.loongnix.cn,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Set CPU#0 as the io master for FDT
Date: Wed, 21 Jun 2023 18:05:44 +0800
Message-Id: <20230621100544.109804-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ACPI systems set io masters by parsing ACPI MADT, FDT systems have no
MADT so we explicitly set CPU#0 as the io master. Otherwise CPU#0 will
be considered as hotpluggable.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/smp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
index d6dfb4c7ec75..46e611882136 100644
--- a/arch/loongarch/kernel/smp.c
+++ b/arch/loongarch/kernel/smp.c
@@ -207,6 +207,7 @@ static void __init fdt_smp_setup(void)
 	}
 
 	loongson_sysconf.nr_cpus = num_processors;
+	set_bit(0, &(loongson_sysconf.cores_io_master));
 #endif
 }
 
-- 
2.39.3

