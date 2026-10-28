Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793163665;
	b=ES44MQmtg6w1Jre2P0wzRMjttA09K6j6XHSXHHj5U4i127zTbeF5T8Mwe/Sq7e74NRBv
	 Mp9sKK/zC7xehf3sL4x/MUOIRBzNYnuFPvWMkURIv0VS0CouUovpe31fVsM5LPSHIfTLC
	 wI01GRR/8/1XP2SmWk9IlLnYdPdlcBU8ODPibTjFJ8Pv5rVKZQm6BEWiEYFyS9AGX0WKa
	 Evzjz11vRj1VzXedpm+DfVFnCoZbjg1Vz9eTIIa/tLIt8C8+LMqcgJCcsEsaDAV6u8Owq
	 gd+Vp4Tw3PNBSv3skoOkeJUv7BM/GtvZCu3jQGyISzTZKoK/mFGheZM2dy8SNcKoMOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793163665;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=AC7iRAq5Yweq3ZZT8Va08ClThxzpcnLcDHG2orGA75g=;
	b=dDKTejfOKb5YJdFh/V/gU+tP1uarl4VD4ddeWIetyCH+JoEVEPrxdKxyTbTXPz7yWj6l
	 rXyNGLg/1l1fwzCpGh22PUAI2JVathIFgCk5s+kqStuUK2webKo8TaljhooptOJw9Q42c
	 OB5sNgnOZooY6tGF5HMQ4m5n4U99trJRKgbMzK7Ral8fKD/fsgzcouNtM9C7e1cnEslee
	 WZS7gIbe5YlrtWZY86+zh59AsTWhmnivQRBDKWh0NxvsOmHc2AgtO3t+XPOUw8E0TWPOs
	 eDMeCQAGX2V9q+l6ge2ZgBsUtdYMoQpBPkv1RgtSdgA2I6ZdLuyr+GnNJCTpOfZS6DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FwunI5mN;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094F6606A323
	for <loongarch@lists.linux.dev>; Wed, 28 Oct 2026 05:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 094F6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FwunI5mN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=AC
	7iRAq5Yweq3ZZT8Va08ClThxzpcnLcDHG2orGA75g=; b=FwunI5mNOLfAXtRzaX
	jqp5pWL7x3tZqnQO/Y/hJbjJWj3fOE5sXYVp7CdzXpjiHgKiq6eeJD5qewDes6iq
	zxs3OGuw3lnnORKTtoliSr9vnq+5psmUKAivSWwvr8QoItekl3aaj3nTt1VOWcnk
	1Mduv2gaI/RaAYNDLqPj/qH+k=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD31_V5geFquXTKDA--.16748S9;
	Wed, 28 Oct 2026 13:00:49 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Liupu Wang <wangliupu@loongson.cn>,
	Tianyang Zhang <zhangtianyang@loongson.cn>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 07/12] irqchip/loongarch-ir: validate MADT MSI-PIC entries
Date: Wed, 28 Oct 2026 13:00:34 +0800
Message-Id: <20261028050039.121080-8-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028050039.121080-1-yaojiale02@163.com>
References: <20261028050039.121080-1-yaojiale02@163.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD31_V5geFquXTKDA--.16748S9
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF4xZw13WFyfCw1UZrWrZrb_yoWDZwc_uF
	129a9rGrWjgr4UGw1xtry3Zry3tF48uFnY9r4Iyas8J3s5Zw13Zr17Z34fArZrKFW0vFn3
	GrZ8ZF4Syw17KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbyCJPUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQGTzWrhgYGZYQAA3h

The MSI-PIC callback reads the message address from a typed MADT record
without checking its size. Reject incomplete records before accessing
the field.

Fixes: 71619266e0a2 ("irqchip/loongarch-ir: Add IR (interrupt redirection) irqchip support")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/irqchip/irq-loongarch-ir.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-loongarch-ir.c b/drivers/irqchip/irq-loongarch-ir.c
index cb4ad34da058..111173fc4612 100644
--- a/drivers/irqchip/irq-loongarch-ir.c
+++ b/drivers/irqchip/irq-loongarch-ir.c
@@ -481,6 +481,9 @@ static int __init pch_msi_parse_madt(union acpi_subtable_headers *header, const
 {
 	struct acpi_madt_msi_pic *pchmsi_entry = (struct acpi_madt_msi_pic *)header;
 
+	if (BAD_MADT_ENTRY(pchmsi_entry, end))
+		return -EINVAL;
+
 	msi_base_addr = pchmsi_entry->msg_address - AVEC_MSG_OFFSET;
 
 	return pch_msi_acpi_init_avec(redirect_domain);
-- 
2.34.1

