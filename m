Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFD01AC44D
	for <loongarch@lists.linux.dev>; Thu,  2 Jan 2025 14:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735828498; cv=none; b=UJoXst6a1k5Q+Amf64bcdpGERL8sRzGruMT56YVjFeR6UQ1AAk96e9AT8dmW09jz2hlG4k7EcuA+D68kSVdm0t/lzxkBPV1pDWiw2TyL6piHopqbvVT5pmvrsnCG1coG5LLN6hHyj3FvLPK+DBFdHxj44zZfCaDsd9PB+Wj1bfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735828498; c=relaxed/simple;
	bh=yjo3lgCnAIIw41wgdwShrdXPc06nJja3GCo/aQKQUY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X43P1Bbd4OTOMtACgm5aMyMtG1gJViOaoyocw/YAw19mXSGGdCV5v3In8UhNbbJkSJj5AFaUkVaUHMEQcaMNoTiKQ7TSsNGtXtqdePcPQDDXw/A7PBWDNGW6e9FKRaYKbMxIqIxXmxyZ6NYgvvDI0LywX58qxFj9GMClFm46Bag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=oqxbWmqT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IycOK80m; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="oqxbWmqT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IycOK80m"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 5756913801BA;
	Thu,  2 Jan 2025 09:34:56 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Thu, 02 Jan 2025 09:34:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1735828496; x=1735914896; bh=Jm
	ZApDfc6PQP2PIajB+iFWAxA7IssZSdgAeB0E+r8mw=; b=oqxbWmqT3J0b33W6XO
	0MzdtecOeJpPLS9LPQh9JoThSm5GD8a4BXatc1TnmcxyLRiZtL8NU6ia9WczX8PM
	8lnpy7ijCUTuEBIfCpRhz05Yup0Hx3Ftm25OArRSA+sg8ZSUinz3+/j0USxzeCHm
	MELZTqLqJ4Km7VfRrjVlzIHiiFjpxetq87dxybnFDwpBRAMBbWuPImIY0OG3K648
	V8o467RUHHRkvyWl4uAbVohDZZnuGjH4pQViW0Ofv3F8KmNFQxpsi3LQtpQmi1Es
	/eFUdQHhZbtQEZXTFOPLVOjPNi+XFxCYqB9l3EhD1Hvgl3HKMqIzq+SjBFkM7Apt
	RQ9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1735828496; x=1735914896; bh=JmZApDfc6PQP2PIajB+iFWAxA7Is
	sZSdgAeB0E+r8mw=; b=IycOK80mDTYJIRN8u6aNDK1vnyU/vgJvtq9MXC5bAmNy
	QvvHs5DBUJjLpJXHta1h+Z6SypexfnniECrOQNMnUvmsWCB2GvuGVoEetMOvg74I
	pB7zYKlLKzd7JIXDv1vfCxnvA0E8+1wR3G0h12PRn3xaWO1BIQjG4jJh8HBxg2wY
	njwa7P3YHL9RFWKjr3RoCt9U+bYMRHTqDsWoszWCN/1OrYd1C8Uq3giXWZ6dsErX
	URLjRGDQWL5M8sQLjPAlnmqcqZSNRwIKPPVN8tbGxoQOS4WVgh1DaqCP9hRodPdV
	ZfHy0Z3/nb8fra2iieXky9+ZKjP6fwrQpxoxjhkWJg==
X-ME-Sender: <xms:D6R2Z4mP843sFGiiaxN7bRI0v7ICOGQpjIXLhlWBembZQQAwrhLOPQ>
    <xme:D6R2Z31P66vtKxMPL0StDDLzM_mB6-2rkwbSboCcOAWLeFvLiboDyiV-XGTaf9PPy
    Lql4RwDtmu_qGUDWTs>
X-ME-Received: <xmr:D6R2Z2p-N0F9K77YC88dHOpcIOLYkAQjvWsdowvtMHixLCGBdlr2SvE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudefvddgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecu
    hfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomheqnecuggftrfgrthhtvghrnhepffetueegkedtgfejveeuvdfghfegtddv
    gfehudeghfegheetueduheduveejtefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtgho
    mhdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplh
    hinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    khgvrhhnvghlseigvghntdhnrdhnrghmvgdprhgtphhtthhopehjihgrgihunhdrhigrnh
    hgsehflhihghhorghtrdgtohhmpdhrtghpthhtoheplhhoohhnghgrrhgthheslhhishht
    shdrlhhinhhugidruggvvhdprhgtphhtthhopegthhgvnhhhuhgrtggriheskhgvrhhnvg
    hlrdhorhhg
X-ME-Proxy: <xmx:D6R2Z0l7z1oSRl2uFcdQsfwc9IVSc-7cOPhVYmtczlb7FqyHBV_0Vg>
    <xmx:D6R2Z23YqkQiDPkC0fprh4hcTDADW1ojROVj2QtjkOk_yA19GrVtjQ>
    <xmx:D6R2Z7uwkkZJY7NhKj4ZEWvavuRFktWFjFJv8P0hQZFm9Rx3yfw7jA>
    <xmx:D6R2ZyXTPmCxBmo4bYNzfYNAG2fIV-GKD9GB2FnNdfvQLAWyHCnl9w>
    <xmx:EKR2Zy9acd8WyLYiOVl6Fxr1oG6UYHsJ4o2tWBtqaAT4BSfcZ8N_mb6a>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jan 2025 09:34:54 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Thu, 02 Jan 2025 14:34:40 +0000
Subject: [PATCH] loongarch: Disable FIX_EARLYCON_MEM when ARCH_IOREMAP is
 enabled
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250102-la-earlycon-fixed-map-v1-1-23fe3a6681c4@flygoat.com>
X-B4-Tracking: v=1; b=H4sIAP+jdmcC/xWMQQqAIBAAvxJ7bkEtI/pKdNhyq4WyUIgi/Ht2H
 IaZFyIH4Qhd8ULgS6IcPoMuC5hW8gujuMxglLFKK4MbIVPYnunwOMvNDnc60TVUt6OzY1tpyO0
 Z+Jf/tx9S+gABIH4cZwAAAA==
X-Change-ID: 20250102-la-earlycon-fixed-map-d6a48bd5b831
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1499;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=yjo3lgCnAIIw41wgdwShrdXPc06nJja3GCo/aQKQUY0=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhvSyJfxfT2+7927yT52sWcenhXMyrXqtwaFu2vaetY1Ta
 Y3x1VXnO0pZGMS4GGTFFFlCBJT6NjReXHD9QdYfmDmsTCBDGLg4BWAiNssY/ge7i+3P31rGtdA1
 rqNSo11x1zL1dtfvPM9eWXWqbBfLzGb4ZxMqwVGmIt57ik3hSGmLnyZDWC8La8TTBZzr1Zbbhhk
 yAAA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

When ARCH_IOREMAP is enabled, we are using always accessible DMW
for ioremap. It makes no sense to create a dedicated mapping for
earlycon given that we can access the region via DMW.

Disable FIX_EARLYCON_MEM when ARCH_IOREMAP is selected. This can
ease debugging for early mapping issues.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/loongarch/Kconfig              | 2 +-
 arch/loongarch/include/asm/fixmap.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 1c4d13aa677e2e04b9791882fba7523f93d6a69d..ad8a8cf75343799ea626be52f521fa75e7cbe07b 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -246,7 +246,7 @@ config MACH_LOONGSON64
 	def_bool 64BIT
 
 config FIX_EARLYCON_MEM
-	def_bool y
+	def_bool !ARCH_IOREMAP
 
 config PGTABLE_2LEVEL
 	bool
diff --git a/arch/loongarch/include/asm/fixmap.h b/arch/loongarch/include/asm/fixmap.h
index d2e55ae55bb9c499b9a685509bc26d663054b58e..905dc7a5f9fa52ac924fe832749f39283c28a9f8 100644
--- a/arch/loongarch/include/asm/fixmap.h
+++ b/arch/loongarch/include/asm/fixmap.h
@@ -12,7 +12,9 @@
 
 enum fixed_addresses {
 	FIX_HOLE,
+#ifdef CONFIG_FIX_EARLYCON_MEM
 	FIX_EARLYCON_MEM_BASE,
+#endif
 	__end_of_fixed_addresses
 };
 

---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20250102-la-earlycon-fixed-map-d6a48bd5b831

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>

