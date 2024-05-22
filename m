Received: from wfhigh4-smtp.messagingengine.com (wfhigh4-smtp.messagingengine.com [64.147.123.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0A656452
	for <loongarch@lists.linux.dev>; Wed, 22 May 2024 22:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716415344; cv=none; b=suJrBPusmjQz8YR20kGBPKPSZ2kMSMMdt5PslreEmMm5o/6dVExGutZECOK3AkQrcnkei8JB5fFkgb9nFPYRgSJbFaEr4SjY1+b/mQ6VppJ4AYUtOJreL8UaR8QOiNcKcxnp55aumLkaf8kywdraUSJIBWf18Q0t2DvQnWxBg1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716415344; c=relaxed/simple;
	bh=p2/PlDQriaIsR1jy5J5xFUSAUzQ9nze99NlrlTAGyLc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R01ckwe3CyvasHdO8fSC1zT3Gy9UGbSc7rTHDUOFMBgjS1LL0+Er6jwrDb1qWaF3TBicJ+fpAA/2RpXoxS35I268XfmcS2y3vL2CIpR7VmctBG+BkBNzii5bmPFntw4nephgzLe5XaXzsyblffVK+7MKdaEQA2suhxKG3yUyjXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=bOzprQDC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=o5TeU4xE; arc=none smtp.client-ip=64.147.123.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="bOzprQDC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="o5TeU4xE"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.west.internal (Postfix) with ESMTP id 964BD180010B;
	Wed, 22 May 2024 18:02:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 22 May 2024 18:02:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1716415341; x=1716501741; bh=1l
	VFWowAKoYeYcU9JPCxf0HAA1fler+xeLdc8O1dM1Q=; b=bOzprQDCkwcpY/U/yq
	52iFm9CRm59bLMfWfaip3iH+ewR11MRw/jsdJzrcFBblrEdrQdrL/2lxVJsstAL6
	nMKLjnuWGWSBRRd6Yl3wuWbr3+zu1wUsHZicLJWcWeRsWQLI78f/i+j3cOtwlGr7
	26FBDW+2sMBu/Dszl0nGyDNHow7rbBfayKheUG0Tu0tREwXKvT2VGEPYqgHoGfmQ
	rR5MLk34utcFKwSnanlS19HtS/G2A0fzPg+rlUDEX/AxWCFxrK8c5niiAMUKE1Zr
	yEM7U0BArROLNT3eHjAlulAzF5K4NUhq7U1CwOzfFejz2Zi4iH/HHrcwHm0z+NYm
	woyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1716415341; x=1716501741; bh=1lVFWowAKoYeY
	cU9JPCxf0HAA1fler+xeLdc8O1dM1Q=; b=o5TeU4xEMeVDxgn5xkmV14Rc6se5r
	dm5zGELI6FTJUHi8j1DPfq4oTxVGEberOR9F45twpKbLlyP6x67RETSG9+IoiCy5
	7qDNcy0QVYJl5QHnTYwBsUUjAB+mSs4DSUDOUsmxk01Pulx4Y1JWKFHI/ON9S0kU
	I6sTH/rab7QsUXJD4dD8x2ZkAV28sBvFdgH1NsLNn5+8zFKM9LuIm0N06RIpPTzY
	RaMH+oM7MaYH+LDkr3eLZt0XAA2XivY/J0br3fKRXO9dh97RSgFGTawFdgPCn1zE
	JaN3Hi9V1GZswQDncojXJF8PPZvWodyQ961PudOYcPr+BGS1jqp3QQnMw==
X-ME-Sender: <xms:bGtOZlTuV4wcp-XyWrzUbDXMrveVOvsa9FoRIdLh84Uq68e4UKYmdQ>
    <xme:bGtOZuwN9pbep6v0i0j4QlEsVU6wc2D3rPR0C4mgcWEAaxDexl5ccu5b243xTNGVI
    xPiYIWBWnC1d-XD_GA>
X-ME-Received: <xmr:bGtOZq1NNswyr_LbTkJb3fqMxw-cVEDh9R9XI_PQrCgNV9W1XVdIMnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeihedgtdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepgfevffejteegjeeflefgkeetleekhfeugfegvdeuueejkeejteek
    kedvfffffedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehf
    lhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:bGtOZtDsR6OsJs9hKGiOJvdnciwm4I8suh0f3dcsg-Ijc2n7vVLM1g>
    <xmx:bGtOZuh4ZhCLY4Rap-Qcd8Pq2Bzv5vCOLAfzHdp0TdPVc5emfr8yEw>
    <xmx:bGtOZhqHCDO6Hx2K0JvbcH7DIQnV5e3csMQUfGJRskEjkmOmooxjjw>
    <xmx:bGtOZphzmO4pwiHGlaeARZbe8mOO78aYMaYKDg-sT_x3u8ZArT05QQ>
    <xmx:bWtOZpWQrXuZecMQkyXaA6nXVUhGAgMoQDRGetJfWhUToIzKjqMyvH1p>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 May 2024 18:02:19 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 0/4] LoongArch: Bootloader interface fixes
Date: Wed, 22 May 2024 23:02:16 +0100
Message-Id: <20240522-loongarch-booting-fixes-v3-0-25e77a8fc86e@flygoat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGhrTmYC/4XNTQ7CIBAF4Ks0rMXwU0BdeQ/jgtIpJakdAw2xa
 Xp3aVe6MC7fm7xvFpIgBkjkUi0kQg4p4FiCPFTE9Xb0QENbMhFM1EwJTgfE0dvoetogTmH0tAs
 vSFRqDVyCcVYpUtbPCPuhjG/3kvuQJozz/ijzrf1vZk4Z1ersBOOOScOu3TB7tNPR4YNsahafk
 vgtiSIZYaBtzhpUffqW1nV9A2oz0wkKAQAA
To: Huacai Chen <chenhuacai@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1463;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=p2/PlDQriaIsR1jy5J5xFUSAUzQ9nze99NlrlTAGyLc=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhjS/7JyAguk2h26HP7MRmxF292BasOjkNrEP+6J1C9tjU
 uf91MrtKGVhEONikBVTZAkRUOrb0HhxwfUHWX9g5rAygQxh4OIUgIkotzEy/HgqtO8+W81dxQpF
 sbSzffWHsmXKD17QlZ/ueM+vL3uBFMP/slP7pA5esE669OnK5osfjxSembJ000zxezFv0nWfcJf
 PYQIA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Hi all,

This series fixed some issues on bootloader - kernel
interface.

The first two fixed booting with devicetree, the last two
enhanced kernel's tolerance on different bootloader implementation.

Please review.

Thanks

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Changes in v3:
- Polish all individual patches with comments received offline.
- Link to v2: https://lore.kernel.org/r/20240522-loongarch-booting-fixes-v2-0-727edb96e548@flygoat.com

Changes in v2:
- Enhance PATCH 3-4 based on off list discussions with Huacai & co.
- Link to v1: https://lore.kernel.org/r/20240521-loongarch-booting-fixes-v1-0-659c201c0370@flygoat.com

---
Jiaxun Yang (4):
      LoongArch: Fix built-in DTB detection
      LoongArch: smp: Add all CPUs enabled by fdt to NUMA node 0
      LoongArch: Fix entry point in image header
      LoongArch: Override higher address bits in JUMP_VIRT_ADDR

 arch/loongarch/include/asm/stackframe.h  | 2 +-
 arch/loongarch/kernel/head.S             | 2 +-
 arch/loongarch/kernel/setup.c            | 6 ++++--
 arch/loongarch/kernel/smp.c              | 5 ++++-
 arch/loongarch/kernel/vmlinux.lds.S      | 2 ++
 drivers/firmware/efi/libstub/loongarch.c | 2 +-
 6 files changed, 13 insertions(+), 6 deletions(-)
---
base-commit: 124cfbcd6d185d4f50be02d5f5afe61578916773
change-id: 20240521-loongarch-booting-fixes-366e13e7ca55

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>

