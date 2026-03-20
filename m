Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D7E35B62D
	for <loongarch@lists.linux.dev>; Fri, 20 Mar 2026 07:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773991564; cv=none; b=XNCVn/3JniBBAPAYEZrxRsnvFkgTwgzjE5nwBPH1cADVvXsUbKxfzTttvHbm1G1J6g0oZNHIlPqEcJ8j5TraCJdeF38yry6oht0BCmdLSySmp6cZMT3iWuCITmlVHr5kKOrqIZZfr756ktFkrfmdbFo/MrpfQApVafO2xVI9mIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773991564; c=relaxed/simple;
	bh=awCMUvIy6ZRW17G+oR+DQa1hoiCPmxVmkwwBFL72r+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dDJMZ3sJNflt2llzPZjuZp1Hym9ILotZHU4w3zOCtQTGPRH6ETC8gqvNxEFmDbtx+yRAVYjRUm7RrT+8vLnS2laoMItvrS9KNe/fmTEaxW20jRwOoQIlsoWCaiWSuSJ5+8QGN0ThgEZxtru85WZj1xs8hIfm6DxcxOefdu3I+VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.17])
	by gateway (Coremail) with SMTP id _____8AxQcCH9rxpuPYcAA--.24463S3;
	Fri, 20 Mar 2026 15:25:59 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.17])
	by front1 (Coremail) with SMTP id qMiowJDxaeCD9rxp7DxZAA--.40268S3;
	Fri, 20 Mar 2026 15:25:58 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-i2c@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/2] dt-bindings: i2c: loongson,ls2x: Add ls2k0300-i2c compatible
Date: Fri, 20 Mar 2026 15:25:46 +0800
Message-ID: <c235fbe469cb5173a73b343a9f317746160f4f88.1773991081.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773991081.git.zhoubinbin@loongson.cn>
References: <cover.1773991081.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxaeCD9rxp7DxZAA--.40268S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEMCGm84cQBQAAAs1
X-Coremail-Antispam: 1Uk129KBj9xXoWrtFWkCryDXw47tr1ktw45twc_yoWDWwbEy3
	WIqw1xJrs8AF1Fgw1jvr4xtrnxX3sFy3W8C3WDAF4kAw1jkrn8tF97J343K34fXrsxuFnx
	Wa1kGryIva17GosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2nYFDUUUU

Add "loongson,ls2k0300-i2c" dedicated compatible for representing I2C of
Loongson-2K0300 chip, because its HW integration is quiet different from
others.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml b/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
index 67882ec6e06a..ee09c6d9c5f0 100644
--- a/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     enum:
       - loongson,ls2k-i2c
+      - loongson,ls2k0300-i2c
       - loongson,ls7a-i2c
 
   reg:
@@ -24,6 +25,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.52.0

