Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777E61F4C8B
	for <loongarch@lists.linux.dev>; Tue, 13 May 2025 08:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747124024; cv=none; b=A1tgM4jO8UHumnt5zT0Hh/IRUZgPHQIXJDlRA0EOSjxCYCRf3CTH+PfMrZbnpCgWQpra7hDlkcEtwWX74Sa6aBVgSoPSNPXMqIxzWupvqHSocaDATRTE05UABFc39Gb9WnxuIzIq87UMLGyFWsCXRCBAawGb6GrnChF2QWsP9Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747124024; c=relaxed/simple;
	bh=vIrOtqjlYg+DUwg4pg4iiXyAFZWjj8moR/4VGSVE0TQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HbdO3y1RxtKpn0O+7XuhMJb1c+h2PmHp7aTNI7OXtOew+wymUNWN3TAFQr60kTHVqI/7C42CZ83I8QkP1iotf3+MQ1098tjXQRO3jtRZZxNIov5kfnVX6hJIE5x1LbwUslZPTJbKtmbNovrQmC8BYnTVxggRn1DgpJN1l3Xs0uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.186])
	by gateway (Coremail) with SMTP id _____8AxlnAv_yJo4qDjAA--.43050S3;
	Tue, 13 May 2025 16:13:35 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.186])
	by front1 (Coremail) with SMTP id qMiowMDxuhos_yJoBnrNAA--.18239S2;
	Tue, 13 May 2025 16:13:34 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Xuerui Wang <kernel@xen0n.name>,
	stable@vger.kernel.org,
	loongarch@lists.linux.dev,
	Huacai Chen <chenhuacai@loongson.cn>,
	Haiyong Sun <sunhaiyong@loongson.cn>
Subject: [PATCH V2 for 6.1/6.6] LoongArch: Explicitly specify code model in Makefile
Date: Tue, 13 May 2025 16:13:21 +0800
Message-ID: <20250513081321.252766-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxuhos_yJoBnrNAA--.18239S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7GrW8XF15Cw17JFWxuw15GFX_yoWDGFgEgF
	y7Jw4vkr4fJrWDuw4a9FyrZw18Kw1DCFnIyF1Yvr17J3y3tryrGF4q9343ZF48t3yagrZY
	9FWkZF98Zr12vosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb78YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F4
	0EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_
	Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8l38UUUUUU==

commit e67e0eb6a98b261caf45048f9eb95fd7609289c0 upstream.

LoongArch's toolchain may change the default code model from normal to
medium. This is unnecessary for kernel, and generates some relocations
which cannot be handled by the module loader. So explicitly specify the
code model to normal in Makefile (for Rust 'normal' is 'small').

Cc: stable@vger.kernel.org
Tested-by: Haiyong Sun <sunhaiyong@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
V2: Add upstream commit id.

 arch/loongarch/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index a74bbcb05ee1..f2966745b058 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -55,7 +55,7 @@ endif
 
 ifdef CONFIG_64BIT
 ld-emul			= $(64bit-emul)
-cflags-y		+= -mabi=lp64s
+cflags-y		+= -mabi=lp64s -mcmodel=normal
 endif
 
 cflags-y			+= -pipe -msoft-float
-- 
2.47.1

