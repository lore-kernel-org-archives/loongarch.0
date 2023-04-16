Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9567B
	for <loongarch@lists.linux.dev>; Sun, 16 Apr 2023 06:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1681625046; bh=nV+E3D/I12AeVl0Jle8VyjqlNjfsfAn8DFugz9AAAfg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EJEvC8FaMO5tdvFYj0Z1ZoAhV78m5Crdu9IfJh6XOY4nWSVSXHWz3bV50dRnmd4pw
	 LaR6XbIwXla+OCueHPRyMO6v92feuu8phPevcQ83gAOsewRq/nN1nS2fEJwH904Azg
	 B8kxoAkyhuBn6nAMFargrYPVKf7kR6k2vBdXNTjs=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E28246018A;
	Sun, 16 Apr 2023 14:04:05 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v4 02/12] LoongArch: Add exception subcode definitions for the watchpoint exception
Date: Sun, 16 Apr 2023 14:03:46 +0800
Message-Id: <20230416060356.3711529-3-kernel@xen0n.name>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416060356.3711529-1-kernel@xen0n.name>
References: <20230416060356.3711529-1-kernel@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/include/asm/loongarch.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index a8ead016f329..c438c90ecfbb 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -1408,7 +1408,9 @@ __BUILD_CSR_OP(tlbidx)
 #define EXCCODE_FPE		18	/* Floating Point Exception */
 	#define EXCSUBCODE_FPE		0	/* Floating Point Exception */
 	#define EXCSUBCODE_VFPE		1	/* Vector Exception */
-#define EXCCODE_WATCH		19	/* Watch address reference */
+#define EXCCODE_WATCH		19	/* WatchPoint Exception */
+	#define EXCSUBCODE_WPEF		0	/* ... on instruction Fetch */
+	#define EXCSUBCODE_WPEM		1	/* ... on Memory access */
 #define EXCCODE_BTDIS		20	/* Binary Trans. Disabled */
 #define EXCCODE_BTE		21	/* Binary Trans. Exception */
 #define EXCCODE_PSI		22	/* Guest Privileged Error */
-- 
2.40.0

