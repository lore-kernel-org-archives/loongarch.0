Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDDC2104
	for <loongarch@lists.linux.dev>; Tue,  8 Aug 2023 07:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1691481324;
	bh=nrjRfO2+8JOw7uXLUstSS+xBnROqeg8OtCZsp2REDi8=;
	h=From:To:Cc:Subject:Date:From;
	b=Qt2APqt0ngxzrHhS19KQer6aWYxpaiL0DRcgp4fo7Yk7SNK7qcatH6hcTCdzA1VVO
	 kN5sTTEW6bNMOPHPX9FEGsFWXEjilu0VsYOKO7xY04hn5qjFtUBbhxrlYmwmf9QURz
	 zlgOHLZPNNNLJEsg4G4pg7+refbR8aHn11+1CzDY=
Received: from stargazer.. (unknown [IPv6:2409:8a0c:2a4:2170:40dc:a500:81f0:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 9053F659AD;
	Tue,  8 Aug 2023 03:55:20 -0400 (EDT)
From: Xi Ruoyao <xry111@xry111.site>
To: loongarch@lists.linux.dev
Cc: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-kernel@vger.kernel.org,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH v2] LoongArch: Remove redundant "source drivers/firmware/Kconfig"
Date: Tue,  8 Aug 2023 15:55:05 +0800
Message-ID: <20230808075505.2481-1-xry111@xry111.site>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In drivers/Kconfig, drivers/firmware/Kconfig is sourced for all ports so
there is no need to source it in the port-specific Kconfig file.  And
sourcing it here also caused the "Firmware Drivers" menu appeared two
times: once in the "Device Drivers" menu, another time in the toplevel
menu.  This was really puzzling.

Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 arch/loongarch/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index e71d5bf2cee0..465759f6b0ed 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -662,5 +662,3 @@ source "kernel/power/Kconfig"
 source "drivers/acpi/Kconfig"
 
 endmenu
-
-source "drivers/firmware/Kconfig"
-- 
2.41.0

