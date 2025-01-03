Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D2D1B87F3
	for <loongarch@lists.linux.dev>; Fri,  3 Jan 2025 12:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735906220; cv=none; b=MbXsaemVQfeDPpkifLVrFPNfMOWK2XMo2sYKeLcDXH766O5eBqeCM0BCduBQAvemusta6B4/1TF9bVECexf6l8ty2hBcXpTy6Qoja996MTu5JRk8XvHhywK9BRFb+PQaddsFPJ0h/ZBJARh5QocjIjV1oXQbxqfa0l5TzrSS+1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735906220; c=relaxed/simple;
	bh=AIL6/mJOjkxtMXHcYk+Pv6QMoKn2l92fjjhdKwyu00s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=luQBeIfCxCvSvyJ/mYfs8Dgko05EWenCyER6oXYK0l6+voAktaEpNrovnygweMM48HrdvLDysMsBlv39qKH131yeZl11Jh+j446UomJpNOGEWZkpcXRnC4wxTqoUEjOH9viMIhU2Vt9pLKg5ZqC0eolOpuakq1wcB3eT6W3mkao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=vWP70sPt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SvvcCkhD; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="vWP70sPt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SvvcCkhD"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id D73BF138078E;
	Fri,  3 Jan 2025 07:10:17 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Fri, 03 Jan 2025 07:10:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1735906217; x=1735992617; bh=8S
	HJbwgPYFlgbtymUhYh1Okwlcj4HGXnNAL6XspAmWo=; b=vWP70sPtolqEIyT/25
	VvkLWUqmfawAXr2G28PIzRz1A4kRGVBBbmve6zx5IFLhbCXmGyuSsJDz/Ej7poFK
	qMTdTNJTrYZQ6rxc3EquWwp0X/xgLN5NJg+FDe/F+DbDIob9jZ8Kn6Q3LdFwLrsF
	K/HPkxfb1sLzCJr41qOpe90G3jdYU0m7EQfkSo3IuhmFnrdtMZ5fUX4Qqo0Xe9GU
	Il2VLUzrC/6iVIqlyFz5SpMkMlEO5AtLRBbLnFi2SQGSKIjzBB1DZX62nTYhEOf4
	balSekPuhhn3v///wgXL0OgoOhTxR7qH5oVm+Z6Mp8+kJaoqZ17TadZV4JlGwUdE
	CPMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1735906217; x=1735992617; bh=8SHJbwgPYFlgbtymUhYh1Okwlcj4
	HGXnNAL6XspAmWo=; b=SvvcCkhDElA9XSVqEJIK6zmQoVPQMLEV8K4uQlIkRThz
	xRoSAoTp0Mcw8JkYN4O6TEYVJa0rF1OfKDQGfTT6Ihe7wDJhAzLBln7uyypdncbv
	ZHP7hc+Q5d1c0LvxEF+lo3X9VV7J4Tga88iZ25ImcfZSsZGtNA0pGl7QbYz7xNX3
	JJbxBc/tqFY1d4uPyftERYbka5A4WTcuI2q+I7lJzwHyeBUQ2c/37D6HOa+faFGo
	fDf8GL5o2bqXR/CT8c83B+FYNsXdJdVKGo05zhPYGT7r2aJor9I1VjKabDq3hITO
	rh+0nM+pTF3cQ1zQH38g5TodQPfjfxC81KypRPA7KA==
X-ME-Sender: <xms:qdN3Z1l0bNqeam1Gzjq0cnu_aZssP3QliLGnldoiimoSvaYpw_K7uQ>
    <xme:qdN3Zw2ctyiCm4bGNxo26YPxnUAX-20BNASVFTtdmoFNYAKYGmy8dVl9JTlJ85tsq
    FI8TRDSFjw_wBQb8lA>
X-ME-Received: <xmr:qdN3Z7p3vWUEkTfWSqY7Ovx8DxoiG-rzVLR7MRxYav2hanaxSfBVHhr5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudefgedgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecu
    hfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomheqnecuggftrfgrthhtvghrnhephfffgeejgfejieeugffgudegvdekffev
    geeuteetgeejveeiteeivedvffehlefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgr
    gihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphhtthhopeehpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehlohhonhhgrghrtghhsehlihhsthhsrdhl
    ihhnuhigrdguvghvpdhrtghpthhtohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrth
    drtghomhdprhgtphhtthhopegthhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepkhgvrhhnvghlseigvghntdhnrdhnrghmvg
X-ME-Proxy: <xmx:qdN3Z1mCmHvGtD0BwpkjYRZ72AW756iIkbe8T73vyHLHHrtjidliIg>
    <xmx:qdN3Zz06WzlcmTLvrkCADgmI4DFn39ma_qK1iCin50EoZoX4Go-l0A>
    <xmx:qdN3Z0s2TXny6hMA9hZQiDIHxatvSJVyjPBrGW_EERB_mXR8HEbhcA>
    <xmx:qdN3Z3URaY6oJBTF_C8zJEV_YTmK51luw1ROdQsliVDH40lUChe11A>
    <xmx:qdN3Zz-0KIf2QZ9EX2gmBbkh1foYVvteICGc_dOJoDlkC8hSWmAnLBSZ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jan 2025 07:10:16 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 03 Jan 2025 12:07:43 +0000
Subject: [PATCH v2] loongarch: time: Derive max_delta from prcfg1 tmrbits
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-la-misc-v2-1-fcc7c399e5e5@flygoat.com>
X-B4-Tracking: v=1; b=H4sIAA7Td2cC/z3MQQ6CMBCF4auQWVvTGVtRV97DsMB2gEmAmpYQC
 eHuFhYu/5eXb4XEUTjBo1gh8ixJwpiDTgW4rh5bVuJzA2kySHRRfa0GSU75K2qPprmbkiG/P5E
 b+R7Sq8rdSZpCXA54xn3dDatR09+YUaG6eVf6tyXL1jybfmlDPZ1dGKDatu0HLFBf8aAAAAA=
X-Change-ID: 20241223-la-misc-d610d14f947e
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3382;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=AIL6/mJOjkxtMXHcYk+Pv6QMoKn2l92fjjhdKwyu00s=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhvTyyyue+rGcTZSq7piwuPbbxd8KJ7Lr30cUn2Py3a5ux
 BHG7F/XUcrCIMbFICumyBIioNS3ofHigusPsv7AzGFlAhnCwMUpABOpqWJk6DvdprLHeYP0YcPZ
 VzjLJfQsD3+2uCM//+u0xoDLD702VjIyzD++mPGVXVG4SF98fO2lm9xOLKxXT9d8ubP1mvYEia1
 7eAA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

As per arch spec, maximum timer bits is configurable and
should not be hardcoded in any way.

Probe timer bits from prcfg1 and use that to determine
clockevent's max_delta to be conformance.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Changes in v2:
- Move probing to cpu-probe
- Link to v1: https://lore.kernel.org/r/20250102-la-misc-v1-1-8dc7db525e54@flygoat.com
---
 arch/loongarch/include/asm/cpu-info.h  | 1 +
 arch/loongarch/include/asm/loongarch.h | 1 -
 arch/loongarch/kernel/cpu-probe.c      | 2 ++
 arch/loongarch/kernel/time.c           | 2 +-
 4 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/include/asm/cpu-info.h b/arch/loongarch/include/asm/cpu-info.h
index 900589cb159de4e5997358443c5b5e3e50f92239..fb28ba9e3011c9256da4a9748de97236ae7f001f 100644
--- a/arch/loongarch/include/asm/cpu-info.h
+++ b/arch/loongarch/include/asm/cpu-info.h
@@ -57,6 +57,7 @@ struct cpuinfo_loongarch {
 	int			global_id; /* physical global thread number */
 	int			vabits; /* Virtual Address size in bits */
 	int			pabits; /* Physical Address size in bits */
+	int			timerbits; /* Width of timer in bits */
 	unsigned int		ksave_mask; /* Usable KSave mask. */
 	unsigned int		watch_dreg_count;   /* Number data breakpoints */
 	unsigned int		watch_ireg_count;   /* Number instruction breakpoints */
diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index 64ad277e096edd7d77af6f37e234d68e571764a4..a3cc4f8d4c4a0b0521ef2b76c87fa57eca417d75 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -466,7 +466,6 @@
 
 #define LOONGARCH_CSR_TCFG		0x41	/* Timer config */
 #define  CSR_TCFG_VAL_SHIFT		2
-#define	 CSR_TCFG_VAL_WIDTH		48
 #define  CSR_TCFG_VAL			(_ULCAST_(0x3fffffffffff) << CSR_TCFG_VAL_SHIFT)
 #define  CSR_TCFG_PERIOD_SHIFT		1
 #define  CSR_TCFG_PERIOD		(_ULCAST_(0x1) << CSR_TCFG_PERIOD_SHIFT)
diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
index cbce099037b2728b82ecb9c5aa58e05b07695c5a..06c98ddf29490571e8b927b4ca721c27ff7f0ea8 100644
--- a/arch/loongarch/kernel/cpu-probe.c
+++ b/arch/loongarch/kernel/cpu-probe.c
@@ -192,6 +192,8 @@ static void cpu_probe_common(struct cpuinfo_loongarch *c)
 	config = read_csr_prcfg1();
 	c->ksave_mask = GENMASK((config & CSR_CONF1_KSNUM) - 1, 0);
 	c->ksave_mask &= ~(EXC_KSAVE_MASK | PERCPU_KSAVE_MASK | KVM_KSAVE_MASK);
+	c->timerbits = (config & CSR_CONF1_TMRBITS) >> CSR_CONF1_TMRBITS_SHIFT;
+	c->timerbits += 1;
 
 	config = read_csr_prcfg3();
 	switch (config & CSR_CONF3_TLBTYPE) {
diff --git a/arch/loongarch/kernel/time.c b/arch/loongarch/kernel/time.c
index a07d7eff4dc5fb0f41f5fad02698ff7a84c7bc8a..ebfdab6b155585dbab08b7cc49cba627a59854ec 100644
--- a/arch/loongarch/kernel/time.c
+++ b/arch/loongarch/kernel/time.c
@@ -132,7 +132,7 @@ int constant_clockevent_init(void)
 #else
 	unsigned long min_delta = 1000;
 #endif
-	unsigned long max_delta = (1UL << 48) - 1;
+	unsigned long max_delta = CLOCKSOURCE_MASK(current_cpu_data.timerbits);
 	struct clock_event_device *cd;
 	static int irq = 0, timer_irq_installed = 0;
 

---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241223-la-misc-d610d14f947e

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>

