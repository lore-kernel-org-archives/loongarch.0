Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9442E406
	for <loongarch@lists.linux.dev>; Fri,  3 Jan 2025 11:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735904219; cv=none; b=Nx1J6r5/1yKKCXkcM4wOGR7NKLddhXEFjhKHGD/6QfBZTjJt/3Rr5YezBuA4kBV6PWpUgLHiTVu84labQ1qFj9X0w0w8fwrOQPcKP5oVOJQSy7Ee2ISMdIni2iMjXZIB/wMVxQVOZAVUsGUbQY0/lnGpXzhO5+UzupfRgwDtEkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735904219; c=relaxed/simple;
	bh=dlGCj4ry1FvVi28Z9cUlLz+MJ/tVxJRIVqqFeetzlmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=d+1s21OM/rONNe9rN3qf/y/rI+g2Tvko8pBsOgAdnsODtz8crImot5gF8XweYeQctfmS1Htk6LpeKi8KQCPskqVXfFa2OJpPbq6Sq/nACUEXDG7BxUrldcyWU93NtNtJ37yFj3Tw65US1nLkWjPa3KUYsuYP0pX1x9LR1dObHlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=slfM7nzP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=J685Tuws; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="slfM7nzP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="J685Tuws"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id C3275138077D;
	Fri,  3 Jan 2025 06:36:55 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Fri, 03 Jan 2025 06:36:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1735904215; x=1735990615; bh=J1
	Vyxsix1ll2KGyFtI3EdKCeZVvi0D/NKHndzisBFgU=; b=slfM7nzPNXaghAK3QW
	t6tVI4OIn2qnHdgscx96bHnLvOX+Z9AIahJqmm+GGwNvnSyXWx+JRItLpJgx2Z94
	PLLsxEkFj/B6Yf949E/SWOPX3OPpwJk+MF5C7R+3qldVKXDFFUIks3rKOn1xGEoM
	8GiI+7zf7HfwjQYc/F3yPSW8/ihH9cViGvfAawFMjcNb/SZlJarToIqtPmbTuWQ4
	t7COX2kJ6lOQgPgadt+WQAzFKFe1CswPO7vAAOoEL6LKy6dMBP95gOMPX+xvH2nO
	tYSDFxglSMo+D/8G2UvNWA+v2+ZyHsiB2CsNDFsma7SIwPLVYLm4qL8WkEZoznqy
	/Dag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1735904215; x=1735990615; bh=J1Vyxsix1ll2KGyFtI3EdKCeZVvi
	0D/NKHndzisBFgU=; b=J685TuwsZGK4MMOljKxOgdozZmZPR8+ZFhbBeFS+TscP
	zUSOjhl888N0QqI9oTss4D839Z8A3sCBZzztel0z+h82u9wbJawUHY/+YKvYK2fg
	dIlOm6JekcDtmPjj+YgLGqKq4/XKanNBshKu0hka4eWePlwvYc3LzXOHF+mBfFTj
	RknXPyxwxNFeQdu6i9EzL37z8qlkqLrNUx5BSSEMTxENrQGv3Li7QdBjtfzVuG8Z
	IDBYis/BloiAPOtcQTSKFBYVgterP05BqCj5zScL1tMo4EIaJ2MuYjjtpjiAmy9S
	vkt0OF45wBksyJQDEusAwGdj/KFrbfxVAebqYer4hA==
X-ME-Sender: <xms:18t3Z_aTqaqgVbUSeUl6kwloM0B79OVhM2escUToBusakck_Lq_szw>
    <xme:18t3Z-Yf4QdVTMIVQ3g9U1xsg8y73Ugg2WQ9E6mD05ZEmG9xr-T9QllZSwHynQ_K8
    CaVmbMGj1wWTdC2mFQ>
X-ME-Received: <xmr:18t3Zx-R63D9PWzXInajflHXysCiyPh63twtd6KlkugbOtnwaAZdfyju>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudefgedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecu
    hfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomheqnecuggftrfgrthhtvghrnhephfffgeejgfejieeugffgudegvdekffev
    geeuteetgeejveeiteeivedvffehlefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgr
    gihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphhtthhopeehpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlohhonhhgrghrtghhsehlihhsthhsrd
    hlihhnuhigrdguvghvpdhrtghpthhtohepkhgvrhhnvghlseigvghntdhnrdhnrghmvgdp
    rhgtphhtthhopegthhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:18t3Z1oQJqgtZ0zPF4PlkVnCScKBpT-XxzW9IpsahrOsgb4EwkQAIg>
    <xmx:18t3Z6qWISag0ggVnXsYPLSNyvS3efzTdecxbgoRurHAcymUlLICDw>
    <xmx:18t3Z7R-SDs0Y6Rgw9PRe3vmNQugVvNZNZvZsgjMmXPcFDJFkBhedQ>
    <xmx:18t3Zyo8QbgOpa5ofaBh_BtIKCTCcsuZ0ueL4oMmq7y5e1Xhk-0Hvg>
    <xmx:18t3Z3Cy2Vk7rcUFUHwPJHic_xgxRPhlsbsCTtdA9Fqe2KezFcM59B9a>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jan 2025 06:36:54 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 03 Jan 2025 11:36:51 +0000
Subject: [PATCH v2] loongarch: Disable FIX_EARLYCON_MEM when ARCH_IOREMAP
 is enabled
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-la-earlycon-fixed-map-v2-1-b328ec2564f7@flygoat.com>
X-B4-Tracking: v=1; b=H4sIANLLd2cC/4WNTQqDMBCFryKz7hQTf5Cueg9xMSYTDaiRREKDe
 PfGXqDL7z3e904I7C0HeBUneI42WLdlkI8C1EzbxGh1ZpClbEpRSlwImfySlNvQ2A9rXGlH3VL
 djboZu0pA3u6e7/L29kPm2YbD+fS7ieJO/xmjQIGyMlxR23ZC1W+zpMnR8VRuheG6ri/NHHjpv
 AAAAA==
X-Change-ID: 20250102-la-earlycon-fixed-map-d6a48bd5b831
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1157;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=dlGCj4ry1FvVi28Z9cUlLz+MJ/tVxJRIVqqFeetzlmg=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhvTy09fPVIu+M/3Tt3sj7857O/p/C16xWC0VVCtfNaP51
 L+W3VvndJSyMIhxMciKKbKECCj1bWi8uOD6g6w/MHNYmUCGMHBxCsBEVhow/LPYrXZe+fbT1Me1
 NU9esh4L2nA7/V98xOba3yf9xQ8L1X5lZLg/3f3CsWtXL8U6znJn+HrA8tKBh+ubGZ52SzdFsuS
 /f84MAA==
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

When ARCH_IOREMAP is enabled, we are using always accessible DMW
for ioremap. It makes no sense to create a dedicated mapping for
earlycon given that we can access the region via DMW.

Disable FIX_EARLYCON_MEM when ARCH_IOREMAP is selected. This can
ease debugging for early mapping issues.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Changes in v2:
- Drop changes to fixedmap.h
- Link to v1: https://lore.kernel.org/r/20250102-la-earlycon-fixed-map-v1-1-23fe3a6681c4@flygoat.com
---
 arch/loongarch/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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

---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20250102-la-earlycon-fixed-map-d6a48bd5b831

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>

