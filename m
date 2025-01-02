Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EFD1AF0DC
	for <loongarch@lists.linux.dev>; Thu,  2 Jan 2025 14:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735826721; cv=none; b=TGCtwUSiIgNic1x9rYM6c+dK/I/qYMJrk8G7zLDoINhpBdZuIxozRGSavlFQLyclrVJIzNameKyGIOCMYIHBy4qZYlCtlJpefudUxhic3haj9baQZfYyUKbTFT21lSSNl91R03RoMUA3nK4WGloM4J+MJuh4jDtDQR3PPSZJMMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735826721; c=relaxed/simple;
	bh=+5CGF9O/RU57EIjL3m6Q442i1J5aD7OVorgwgr+zyFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Hz4G5jWCCNrib5fxiNPteG+sVGy6j7Tfexe4vtly3gesp6R1Bm9uF0r+d77gIeBCd39aO3eBi9yj0cZI8hc2inY/FkDiyVVq272VKv7gAikAnHhuTUCa0EqNkCld05ahwkH/35u6niCovDRW9vSZShNqlEY5rhoAtO5fhHkbCXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=GXqDqKgW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EY80q0qm; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="GXqDqKgW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EY80q0qm"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D7A011140189;
	Thu,  2 Jan 2025 09:05:18 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 02 Jan 2025 09:05:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1735826718; x=1735913118; bh=+x
	d28Lfk1MGflNyBfVXynR3ChFgz2BoiZDllww0GjcA=; b=GXqDqKgWa1klJhShPj
	k4siqPVWo0T5/iW79OjSBNnA92xqi98lHKoxAPJ7Mfh/X/5BCIMe/uW7yxUIWu+z
	DkGHHhhVfU6M2CwNLBmxbtvn1jLRjnPDDfHeH8SxS7iunDxlIL4bildtCLDdcgAu
	mIjNvRYGFZo8JbhsGpPyF83lWFc0dRHEurJyvTVQ/XWa4PShRAJXsDQZp8mzDUuM
	uL6vXxNTVXIU/ZJyG86QbBCbfrCOfFuQUWWUcW1L0CiMZW8qXC3X5vz8cOg/+0MK
	hfu0m5o8A6EQ/G6tao5XYsuI07DQnm211LRAlV7Chs6ovc4GaszBpwRNVGlsA5R5
	H3+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1735826718; x=1735913118; bh=+xd28Lfk1MGflNyBfVXynR3ChFgz
	2BoiZDllww0GjcA=; b=EY80q0qmvJr+rZiYrzqRfyWIC6L4Kg+l7HIacKpHSpZb
	o8aZ5x/Ng/oehh8qUWj7vG2m6GwNhCROLHS9Agqbi24oftvwE6Rs3ErglDV556HC
	/+vkOSFucPF/PjbihgHbCLI/uji6nKknQeCHgvoKV/iQR06IXNbJzT2bpEw7APlg
	xrJMHYks7SJ3HNRCZ0rb2ELPZeOi69X0IZWLzI0IEVYwn+Rb1oHXvueIPwy/jArh
	xC6rt8UrTFFAw3wFb8NzEzxb73pYnMNgqsC/79A51Y87uP8rxcEmpbqW+bO0DfIM
	26RJxIsqxfPVdA0EjN5jcD0CMgf5UjGCzyIawSOn9A==
X-ME-Sender: <xms:Hp12Z-0Pvk3GpGurPHS6wOXCEdI9u7UtIiIqmPlaPVUlt0ni5n3tEA>
    <xme:Hp12ZxHSrVgpVPmRasIkZJxbnf_QFkHSC5U78pH1bYiiY0KlzcmSDQDRuYogDW0a1
    AiY5q9hIHOw2xOXYxQ>
X-ME-Received: <xmr:Hp12Z24PykmqJdoNtI6hlzBcOe7V-4t9S84eggIakCQ3xnSJxPKlGko>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudefvddgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecu
    hfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomheqnecuggftrfgrthhtvghrnhepffetueegkedtgfejveeuvdfghfegtddv
    gfehudeghfegheetueduheduveejtefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtgho
    mhdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptg
    hhvghnhhhurggtrghisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlohhonhhgrghr
    tghhsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrh
    hnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvrhhnvghlseig
    vghntdhnrdhnrghmvgdprhgtphhtthhopehjihgrgihunhdrhigrnhhgsehflhihghhorg
    htrdgtohhm
X-ME-Proxy: <xmx:Hp12Z_3RMNfPzXojn6thLP85gwyj1QvJHrwfd-2rnSPOHOkZZcsKcw>
    <xmx:Hp12ZxF78rOr1TUT228SWJ060JXjIwxnBdZTN6yWICV8syIJCYpR0w>
    <xmx:Hp12Z49IYisfy20hUYq9A2RBPEftMOEeHEpXbbkseJxZrfoRAHr-cA>
    <xmx:Hp12Z2nweh5gPRkL1om8ayXX4fzbOiUUNPyU17-nQf0FP3mOwb2Ovg>
    <xmx:Hp12Z6My5RtiUO2ttHIKqpYwkFqI5mHg9DoHSxAOYzVGbKGMX6l2hO_3>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jan 2025 09:05:16 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Thu, 02 Jan 2025 14:05:17 +0000
Subject: [PATCH] loongarch: time: Derive max_delta from prcfg1 tmrbits
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250102-la-misc-v1-1-8dc7db525e54@flygoat.com>
X-B4-Tracking: v=1; b=H4sIAByddmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIyNj3ZxE3dzM4mTdFDNDgxRDkzRLE/NUJaDqgqLUtMwKsEnRsbW1AEa
 unptZAAAA
X-Change-ID: 20241223-la-misc-d610d14f947e
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2205;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=+5CGF9O/RU57EIjL3m6Q442i1J5aD7OVorgwgr+zyFE=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhvSyuXInH/o5Ggc8Lr5h0pP+uLhtnatRV9yOKS/XJdc3P
 Visy2TWUcrCIMbFICumyBIioNS3ofHigusPsv7AzGFlAhnCwMUpABMxPcfwV3Dz3V+VXCk3N9W/
 PudQVv587eWUuLuvAiZfYZQpTdtQy8fw3+nhBFPJrzIvdjnav71i+fTX8bcTV5hwVmdM7uS9/PJ
 /FycA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

As per arch spec, maximum timer bits is configurable and
should not be hardcoded in any way.

Use prcfg1 tmrbits to determine clockevent's max_delta
to be conformance.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
LA32R doesn't have prcfg, maybe we should handle this
during cpu-probe and save it in cpuinfo_loongarch,

What's your opinion, Huacai?
---
 arch/loongarch/include/asm/loongarch.h | 1 -
 arch/loongarch/kernel/time.c           | 7 ++++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

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
diff --git a/arch/loongarch/kernel/time.c b/arch/loongarch/kernel/time.c
index a07d7eff4dc5fb0f41f5fad02698ff7a84c7bc8a..bde2297f139c2d5e26894a2ebc1748cc6fef3146 100644
--- a/arch/loongarch/kernel/time.c
+++ b/arch/loongarch/kernel/time.c
@@ -126,16 +126,21 @@ void sync_counter(void)
 
 int constant_clockevent_init(void)
 {
+	uint32_t tmrbits;
 	unsigned int cpu = smp_processor_id();
 #ifdef CONFIG_PREEMPT_RT
 	unsigned long min_delta = 100;
 #else
 	unsigned long min_delta = 1000;
 #endif
-	unsigned long max_delta = (1UL << 48) - 1;
+	unsigned long max_delta;
 	struct clock_event_device *cd;
 	static int irq = 0, timer_irq_installed = 0;
 
+	tmrbits = read_csr_prcfg1() & CSR_CONF1_TMRBITS;
+	tmrbits = tmrbits >> CSR_CONF1_TMRBITS_SHIFT;
+	max_delta = CLOCKSOURCE_MASK(tmrbits + 1);
+
 	if (!timer_irq_installed) {
 		irq = get_percpu_irq(INT_TI);
 		if (irq < 0)

---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241223-la-misc-d610d14f947e

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>

