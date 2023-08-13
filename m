Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725788488
	for <loongarch@lists.linux.dev>; Sun, 13 Aug 2023 15:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E19BC433C7;
	Sun, 13 Aug 2023 15:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691941986;
	bh=0/ELVUXgEaIea3krA/54nT4bkBgXmis9VnIpScrVMzA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BDHIOZpwbooJgRKFqvbXt4946xedoEekcJ/f9Zm/R07XgBWDAiUh2ImO+6KTGnJ4x
	 XQqq96pBTxM3oz5aHsT/Y+X4vRnEbBdfjMD/KgTmXCllNNv0NWPvq2dsFmEBURWoP9
	 I1qsblgvoWpQ7SpzlegxfOLUdTEjy+rZ6Ovb3B6qVBnLREc7pE+jwFZx0ROLq7BBJT
	 hnab9Zu0WLdv0HzuhDuZmmz1JA1soagxQ+z5GNXv1qqkYQMgw8r+VreVXQnhaal5wX
	 MD9g7Gw+KU2sBwA5cQ1UMlN04MFgRj081SSdc3xuzcP9cfi3vCDIa5jY+nKejHymQr
	 +iESFC5ACz5Bg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zhihong Dong <donmor3000@hotmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Sasha Levin <sashal@kernel.org>,
	chenhuacai@kernel.org,
	zhoubinbin@loongson.cn,
	tangyouling@loongson.cn,
	ardb@kernel.org,
	tglx@linutronix.de,
	yangtiezhu@loongson.cn,
	loongarch@lists.linux.dev
Subject: [PATCH AUTOSEL 6.4 52/54] LoongArch: Fix CMDLINE_EXTEND and CMDLINE_BOOTLOADER handling
Date: Sun, 13 Aug 2023 11:49:31 -0400
Message-Id: <20230813154934.1067569-52-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230813154934.1067569-1-sashal@kernel.org>
References: <20230813154934.1067569-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.10
Content-Transfer-Encoding: 8bit

From: Zhihong Dong <donmor3000@hotmail.com>

[ Upstream commit 83da30d73b86ab5898fb84f8b49c11557c3fcc67 ]

On FDT systems these command line processing are already taken care of
by early_init_dt_scan_chosen(). Add similar handling to the ACPI (non-
FDT) code path to allow these config options to work for ACPI (non-FDT)
systems too.

Signed-off-by: Zhihong Dong <donmor3000@hotmail.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/loongarch/kernel/setup.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 4444b13418f0e..a013da0e551a5 100644
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
+	if (IS_ENABLED(CONFIG_CMDLINE_BOOTLOADER) && !boot_command_line[0])
+		strscpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
+
 out:
 	*cmdline_p = boot_command_line;
 }
-- 
2.40.1

