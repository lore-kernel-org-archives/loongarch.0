Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD38F1607A4
	for <loongarch@lists.linux.dev>; Tue,  5 Aug 2025 15:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754406201; cv=none; b=Ls4c3xwJaImAWLHDyUr80KH5zDS4UvnFneDR3A2uBV/LUUEC/rOj0zV4By/sOP49wmLxXdtxIg9Fyj2xs1TRgz8fjPscgBTkLxEWBecOTDxnn/aDH+qnJx7GxNkC57188pDcT46MtEaEss9woDbf+2lud7In17LodHslMDIslxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754406201; c=relaxed/simple;
	bh=W3t9oodd0h8mbXHDxSoPHsP9rVuywlZj0hRu4ydwEWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pBpU5A1UIBdhfUdSH8MCprei9xG6SMrsm19q2hUSPMhThCsTzMG6ZOmbYRDYIHT5h57wVLjSTgppTzFB0HtwNapyi6qxp+ssABfeFKvrsaX+tLexENyWQ6v/sqxXZLkOexgoNHPsK/jcd/FOiu5HlQh3XN6+mN6EFo6Eh9tqkoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=fFk72Kh4; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="fFk72Kh4"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 48DAC25DF5;
	Tue,  5 Aug 2025 17:03:17 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HNlgRMBm5Bq9; Tue,  5 Aug 2025 17:03:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1754406196; bh=W3t9oodd0h8mbXHDxSoPHsP9rVuywlZj0hRu4ydwEWo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fFk72Kh4+CrR07yXwFydJ9/1+KBGvQjx97zXYmWpSAb7O7lGVRO0gMtafnHjUQgUX
	 MmurAJeM29M4vXAFrgUnh3AJoBHVH1qwGLC7cW0xMAL/gse2wyFWLXp6tpWE1k3rh0
	 X0MPj4PgUn6cl6GiTtxjHZVjzyuQTmbglRd8pPicoyZxjLFxkfpmCrWHaPc2C1pPqP
	 Yq3LKT8k3XroHUz0CqVPb15D1djRzVnF5MXwaPAiQ1CFxgz2cf+KKpXO9+TV5YNnKu
	 sfvjPgTgqVzKJhBJHk3gjCQXsbcAIU7PtVrGEt0HppQWd6HC3+hXmNV2/HWpCd0Snj
	 hdnVr1URUY1fw==
From: Yao Zi <ziyao@disroot.org>
To: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v3 2/8] clk: loongson2: Allow specifying clock flags for gate clock
Date: Tue,  5 Aug 2025 15:01:41 +0000
Message-ID: <20250805150147.25909-3-ziyao@disroot.org>
In-Reply-To: <20250805150147.25909-1-ziyao@disroot.org>
References: <20250805150147.25909-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some gate clocks need to be supplied with flags, e.g., it may be
required to specify CLK_IS_CRTICAL for CPU clocks.

Add a field to loongson2_clk_board_info for representing clock flags,
and specify it when registering gate clocks. A new helper macro,
CLK_GATE_FLAGS, is added to simplify definitions.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/clk-loongson2.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-loongson2.c b/drivers/clk/clk-loongson2.c
index 27e632edd484..cc3fb13e770f 100644
--- a/drivers/clk/clk-loongson2.c
+++ b/drivers/clk/clk-loongson2.c
@@ -50,6 +50,7 @@ struct loongson2_clk_board_info {
 	const char *name;
 	const char *parent_name;
 	unsigned long fixed_rate;
+	unsigned long flags;
 	u8 reg_offset;
 	u8 div_shift;
 	u8 div_width;
@@ -105,6 +106,18 @@ struct loongson2_clk_board_info {
 		.bit_idx	= _bidx,			\
 	}
 
+#define CLK_GATE_FLAGS(_id, _name, _pname, _offset, _bidx,	\
+		       _flags)					\
+	{							\
+		.id		= _id,				\
+		.type		= CLK_TYPE_GATE,		\
+		.name		= _name,			\
+		.parent_name	= _pname,			\
+		.reg_offset	= _offset,			\
+		.bit_idx	= _bidx,			\
+		.flags		= _flags			\
+	}
+
 #define CLK_FIXED(_id, _name, _pname, _rate)			\
 	{							\
 		.id		= _id,				\
@@ -332,7 +345,8 @@ static int loongson2_clk_probe(struct platform_device *pdev)
 							  &clp->clk_lock);
 			break;
 		case CLK_TYPE_GATE:
-			hw = devm_clk_hw_register_gate(dev, p->name, p->parent_name, 0,
+			hw = devm_clk_hw_register_gate(dev, p->name, p->parent_name,
+						       p->flags,
 						       clp->base + p->reg_offset,
 						       p->bit_idx, 0,
 						       &clp->clk_lock);
-- 
2.50.1

