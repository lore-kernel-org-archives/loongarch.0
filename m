Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1E4FC17
	for <loongarch@lists.linux.dev>; Tue, 18 Jul 2023 15:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71956C433C7;
	Tue, 18 Jul 2023 15:34:11 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Zhihong Dong <donmor3000@hotmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH v5] LoongArch: Fix CONFIG_CMDLINE_EXTEND and CONFIG_CMDLINE_BOOTLOADER handling
Date: Tue, 18 Jul 2023 23:33:48 +0800
Message-Id: <20230718153348.3340811-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhihong Dong <donmor3000@hotmail.com>

Fix CONFIG_CMDLINE_EXTEND and CONFIG_CMDLINE_BOOTLOADER handling. The
touched function is bootcmdline_init(). There's already code handling
CONFIG_CMDLINE_FORCE that replaces boot_command_line with CONFIG_CMDLINE
and immediately `goto out`. There should be some similar logic to handle
CONFIG_CMDLINE_EXTEND and CONFIG_CMDLINE_BOOTLOADER, so this patch add
some code to fix it.

Signed-off-by: Zhihong Dong <donmor3000@hotmail.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
v4 -> v5: Update commit message and adjust the code logic.
v3 -> v4: Make CONFIG_CMDLINE appended to the end of command line (Huacai);
	Removed unnecessary #ifdef since CONFIG_CMDLINE is always a string on
	LoongArch
	Reworded comments
	Reworded the subject of commit message (Huacai)
v2 -> v3: Reworded the commit message again to make it imperative (Ruoyao)
v1 -> v2: Reworded the commit message so it's more imperative (Markus);
	Added `goto out` to FDT part (Huacai)

 arch/loongarch/kernel/setup.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 95e6b579dfdd..5a6f61ed567f 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -332,9 +332,25 @@ static void __init bootcmdline_init(char **cmdline_p)
 			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
 
 		strlcat(boot_command_line, init_command_line, COMMAND_LINE_SIZE);
+		goto out;
 	}
 #endif
 
+	/*
+	 * Append built-in command line to the bootloader command line if
+	 * CONFIG_CMDLINE_EXTEND is enabled.
+	 */
+	if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) && CONFIG_CMDLINE[0]) {
+		strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
+		strlcat(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
+	}
+
+	/*
+	 * Use built-in command line if the bootloader command line is empty.
+	 */
+	if ((IS_ENABLED(CONFIG_CMDLINE_BOOTLOADER) && !boot_command_line[0])
+		strscpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
+
 out:
 	*cmdline_p = boot_command_line;
 }
-- 
2.39.3

