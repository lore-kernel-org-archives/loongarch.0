Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54725BA45
	for <loongarch@lists.linux.dev>; Mon, 17 Jul 2023 14:14:17 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-991c786369cso601072266b.1
        for <loongarch@lists.linux.dev>; Mon, 17 Jul 2023 07:14:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689603255; x=1692195255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gVQUDvbd72HzDaHvGqRQhZSUCDSNH5EztpgqmZj5nDA=;
        b=BHQZD2JSVkW+rUz82ec0C1dRTjE6qEgnc5eqzQYS6wYJv4amFeUX5FN+GMpl91y0vx
         o2Rs3OGGKHEwsPnzyMjQ1lq4hKqGtaNooU9N8t+pv2SBdveQ26//0Yqw30/DCy31LWkm
         PQOrBuDCS8EuX+KdgaFXNmVI/t7a+sxRGIPLRNgue4qqJdSe7LunzwbK4FAEXsOtnDhn
         wG4F76BdwH/n0ttnP+yOoXcRRXNVD+hRUiFNe4MKcy2n9SRTgrNXg9Z7WNXvUVQ14/qz
         umvGr4HDSBF4soBU0rIo5wgO7VwACApMJwy+Q+6w7zuSXhpwX/68nbCd4IAYyx0BvkMc
         9bTA==
X-Gm-Message-State: ABy/qLa+DSV5no4Pns8Xo54GrAil5J5QUlG/xcH3+hzzeLK1BImj0A8u
	SpSWe2RHMTCFjwBA5NPbYGs=
X-Google-Smtp-Source: APBJJlEiUt/azu00EPizNVjp4L7pGfhIMBhDaPKIATmoDXYE3E+04oQCvGeSItuttfZErZDf65VeIQ==
X-Received: by 2002:a17:906:d965:b0:992:b020:ce4 with SMTP id rp5-20020a170906d96500b00992b0200ce4mr9741129ejb.51.1689603255066;
        Mon, 17 Jul 2023 07:14:15 -0700 (PDT)
Received: from costa-tp.bos2.lab ([77.137.71.188])
        by smtp.gmail.com with ESMTPSA id c26-20020a170906d19a00b0098e16f8c198sm9381796ejz.18.2023.07.17.07.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 07:14:14 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <siyanteng@loongson.cn>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Alexandre TORGUE <alexandre.torgue@foss.st.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Wu XiangCheng <bobwxc@email.cn>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	loongarch@lists.linux.dev (open list:LOONGARCH)
Subject: [PATCH v2] docs: move loongarch under arch
Date: Mon, 17 Jul 2023 17:13:13 +0300
Message-ID: <20230717141345.431342-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <87mszuwt4r.fsf@meer.lwn.net>
References: <87mszuwt4r.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=true
Content-Transfer-Encoding: 8bit

and fix all in-tree references.

Architecture-specific documentation is being moved into Documentation/arch/
as a way of cleaning up the top-level documentation directory and making
the docs hierarchy more closely match the source hierarchy.

Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---

Changes:
- added fix of MAINTAINERS and drivers/irqchip/Kconfig 

I'll continue with the rest architectures.
Thank you.


 Documentation/arch/index.rst                                  | 2 +-
 Documentation/{ => arch}/loongarch/booting.rst                | 0
 Documentation/{ => arch}/loongarch/features.rst               | 0
 Documentation/{ => arch}/loongarch/index.rst                  | 0
 Documentation/{ => arch}/loongarch/introduction.rst           | 0
 Documentation/{ => arch}/loongarch/irq-chip-model.rst         | 0
 Documentation/translations/zh_CN/arch/index.rst               | 2 +-
 .../translations/zh_CN/{ => arch}/loongarch/booting.rst       | 4 ++--
 .../translations/zh_CN/{ => arch}/loongarch/features.rst      | 4 ++--
 .../translations/zh_CN/{ => arch}/loongarch/index.rst         | 4 ++--
 .../translations/zh_CN/{ => arch}/loongarch/introduction.rst  | 4 ++--
 .../zh_CN/{ => arch}/loongarch/irq-chip-model.rst             | 4 ++--
 MAINTAINERS                                                   | 4 ++--
 drivers/irqchip/Kconfig                                       | 2 +-
 14 files changed, 15 insertions(+), 15 deletions(-)
 rename Documentation/{ => arch}/loongarch/booting.rst (100%)
 rename Documentation/{ => arch}/loongarch/features.rst (100%)
 rename Documentation/{ => arch}/loongarch/index.rst (100%)
 rename Documentation/{ => arch}/loongarch/introduction.rst (100%)
 rename Documentation/{ => arch}/loongarch/irq-chip-model.rst (100%)
 rename Documentation/translations/zh_CN/{ => arch}/loongarch/booting.rst (94%)
 rename Documentation/translations/zh_CN/{ => arch}/loongarch/features.rst (61%)
 rename Documentation/translations/zh_CN/{ => arch}/loongarch/index.rst (78%)
 rename Documentation/translations/zh_CN/{ => arch}/loongarch/introduction.rst (99%)
 rename Documentation/translations/zh_CN/{ => arch}/loongarch/irq-chip-model.rst (98%)

diff --git a/Documentation/arch/index.rst b/Documentation/arch/index.rst
index 8458b88e9b79..4b6b1beebad6 100644
--- a/Documentation/arch/index.rst
+++ b/Documentation/arch/index.rst
@@ -13,7 +13,7 @@ implementation.
    arm/index
    arm64/index
    ia64/index
-   ../loongarch/index
+   loongarch/index
    m68k/index
    ../mips/index
    nios2/index
diff --git a/Documentation/loongarch/booting.rst b/Documentation/arch/loongarch/booting.rst
similarity index 100%
rename from Documentation/loongarch/booting.rst
rename to Documentation/arch/loongarch/booting.rst
diff --git a/Documentation/loongarch/features.rst b/Documentation/arch/loongarch/features.rst
similarity index 100%
rename from Documentation/loongarch/features.rst
rename to Documentation/arch/loongarch/features.rst
diff --git a/Documentation/loongarch/index.rst b/Documentation/arch/loongarch/index.rst
similarity index 100%
rename from Documentation/loongarch/index.rst
rename to Documentation/arch/loongarch/index.rst
diff --git a/Documentation/loongarch/introduction.rst b/Documentation/arch/loongarch/introduction.rst
similarity index 100%
rename from Documentation/loongarch/introduction.rst
rename to Documentation/arch/loongarch/introduction.rst
diff --git a/Documentation/loongarch/irq-chip-model.rst b/Documentation/arch/loongarch/irq-chip-model.rst
similarity index 100%
rename from Documentation/loongarch/irq-chip-model.rst
rename to Documentation/arch/loongarch/irq-chip-model.rst
diff --git a/Documentation/translations/zh_CN/arch/index.rst b/Documentation/translations/zh_CN/arch/index.rst
index 6fa0cb671009..d4c1c729dde2 100644
--- a/Documentation/translations/zh_CN/arch/index.rst
+++ b/Documentation/translations/zh_CN/arch/index.rst
@@ -13,7 +13,7 @@
    ../riscv/index
    openrisc/index
    parisc/index
-   ../loongarch/index
+   loongarch/index
 
 TODOList:
 
diff --git a/Documentation/translations/zh_CN/loongarch/booting.rst b/Documentation/translations/zh_CN/arch/loongarch/booting.rst
similarity index 94%
rename from Documentation/translations/zh_CN/loongarch/booting.rst
rename to Documentation/translations/zh_CN/arch/loongarch/booting.rst
index fb6440c438f0..d2f55872904e 100644
--- a/Documentation/translations/zh_CN/loongarch/booting.rst
+++ b/Documentation/translations/zh_CN/arch/loongarch/booting.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. include:: ../disclaimer-zh_CN.rst
+.. include:: ../../disclaimer-zh_CN.rst
 
-:Original: Documentation/loongarch/booting.rst
+:Original: Documentation/arch/loongarch/booting.rst
 
 :翻译:
 
diff --git a/Documentation/translations/zh_CN/loongarch/features.rst b/Documentation/translations/zh_CN/arch/loongarch/features.rst
similarity index 61%
rename from Documentation/translations/zh_CN/loongarch/features.rst
rename to Documentation/translations/zh_CN/arch/loongarch/features.rst
index 3886e635ec06..82bfac180bdc 100644
--- a/Documentation/translations/zh_CN/loongarch/features.rst
+++ b/Documentation/translations/zh_CN/arch/loongarch/features.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. include:: ../disclaimer-zh_CN.rst
+.. include:: ../../disclaimer-zh_CN.rst
 
-:Original: Documentation/loongarch/features.rst
+:Original: Documentation/arch/loongarch/features.rst
 :Translator: Huacai Chen <chenhuacai@loongson.cn>
 
 .. kernel-feat:: $srctree/Documentation/features loongarch
diff --git a/Documentation/translations/zh_CN/loongarch/index.rst b/Documentation/translations/zh_CN/arch/loongarch/index.rst
similarity index 78%
rename from Documentation/translations/zh_CN/loongarch/index.rst
rename to Documentation/translations/zh_CN/arch/loongarch/index.rst
index 0273a08342f7..4bd24f5ffed1 100644
--- a/Documentation/translations/zh_CN/loongarch/index.rst
+++ b/Documentation/translations/zh_CN/arch/loongarch/index.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. include:: ../disclaimer-zh_CN.rst
+.. include:: ../../disclaimer-zh_CN.rst
 
-:Original: Documentation/loongarch/index.rst
+:Original: Documentation/arch/loongarch/index.rst
 :Translator: Huacai Chen <chenhuacai@loongson.cn>
 
 =================
diff --git a/Documentation/translations/zh_CN/loongarch/introduction.rst b/Documentation/translations/zh_CN/arch/loongarch/introduction.rst
similarity index 99%
rename from Documentation/translations/zh_CN/loongarch/introduction.rst
rename to Documentation/translations/zh_CN/arch/loongarch/introduction.rst
index 470c38ae2caf..cba04befc950 100644
--- a/Documentation/translations/zh_CN/loongarch/introduction.rst
+++ b/Documentation/translations/zh_CN/arch/loongarch/introduction.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. include:: ../disclaimer-zh_CN.rst
+.. include:: ../../disclaimer-zh_CN.rst
 
-:Original: Documentation/loongarch/introduction.rst
+:Original: Documentation/arch/loongarch/introduction.rst
 :Translator: Huacai Chen <chenhuacai@loongson.cn>
 
 =============
diff --git a/Documentation/translations/zh_CN/loongarch/irq-chip-model.rst b/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
similarity index 98%
rename from Documentation/translations/zh_CN/loongarch/irq-chip-model.rst
rename to Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
index fb5d23b49ed5..f1e9ab18206c 100644
--- a/Documentation/translations/zh_CN/loongarch/irq-chip-model.rst
+++ b/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. include:: ../disclaimer-zh_CN.rst
+.. include:: ../../disclaimer-zh_CN.rst
 
-:Original: Documentation/loongarch/irq-chip-model.rst
+:Original: Documentation/arch/loongarch/irq-chip-model.rst
 :Translator: Huacai Chen <chenhuacai@loongson.cn>
 
 ==================================
diff --git a/MAINTAINERS b/MAINTAINERS
index d0ccb621a660..b68512f1b65f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12282,8 +12282,8 @@ R:	WANG Xuerui <kernel@xen0n.name>
 L:	loongarch@lists.linux.dev
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git
-F:	Documentation/loongarch/
-F:	Documentation/translations/zh_CN/loongarch/
+F:	Documentation/arch/loongarch/
+F:	Documentation/translations/zh_CN/arch/loongarch/
 F:	arch/loongarch/
 F:	drivers/*/*loongarch*
 
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 4b9036c6d45b..5e54032f07c6 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -567,7 +567,7 @@ config IRQ_LOONGARCH_CPU
 	help
 	  Support for the LoongArch CPU Interrupt Controller. For details of
 	  irq chip hierarchy on LoongArch platforms please read the document
-	  Documentation/loongarch/irq-chip-model.rst.
+	  Documentation/arch/oongarch/irq-chip-model.rst.
 
 config LOONGSON_LIOINTC
 	bool "Loongson Local I/O Interrupt Controller"
-- 
2.41.0

