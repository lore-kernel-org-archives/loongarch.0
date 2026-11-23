Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427130;
	b=hnUZ4alNQ/yJ75M+rIzb2V2bRqg5ZoFUDPYcuIwCTKQ57Ohlc+2ud5aqdu8Mpu6liCfI
	 MPZSJa1pNg3E7n6Q5h+xWJnf5u8t5ePc6DeKXGKAol4AZKKYjSPMi86vadkx/Yica33PC
	 EP2LAhZyQ8w5gX5J1BNLoPPf04nTShTcANsPs5otEt9SyDVhpbPUIdDAVLNftYR+Vs/K5
	 xl5JcnDNid3bGYdG9+T5ysRejTM1ftn7iYK2Zr+WA3cWcVMLnuHfgeOz7zYjbXfSuVs6h
	 pXb41lP3osTYMN8lLVsGdCWrf6DABfBiYyBwbp5gWCve5SYxnEWVe55GiA/fDM23scw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427130;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=y3UYMDoE62FnPRMaab0//uR3dPofijPadlX41Yz+0ZA=;
	b=jyoqoML7nE7POGg+0T8cZJ4xZVtN03qBevs6tHDZLkCvew2fnYMZ5/YO1bk6aOVPHdt3
	 XoU/MTURBwvr3bMb91jRa8Ejj9AX7tA8njQvsMx1g4kVL3zALTRkvN/hEjvcAXKp6xyls
	 ZHZlm4l4cVO4O1wcjmu7i9t7PCzy/gGU3s7j7KPndM3GcNa9xFOI6vCfcEmnjn4n4onas
	 BYvk3BprIvU3PH0AbQ02BEGfT7Dyx6a8JnyEKA2UZzCi8Kyz5YwXxtjJNeAx0EFcsO2b+
	 q7vSplZUizT4FSAPx7NvVtwtHZwSeywbKnpyVdeERzFK98wQowBCOpa6cLumM3xwcbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403C6606A333
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 09:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 403C6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.66])
	by gateway (Coremail) with SMTP id _____8Bxd7U3CwRrMDEiAA--.3999S3;
	Mon, 23 Nov 2026 17:45:27 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.66])
	by front1 (Coremail) with SMTP id qMiowJCxPs80CwRrgNo2AA--.43474S3;
	Mon, 23 Nov 2026 17:45:27 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Mark Brown <broonie@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	Bingxiong Li <libingxiong@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 5/5] MAINTAINERS: Add myself as Loongson SPI maintainer
Date: Mon, 23 Nov 2026 17:45:17 +0800
Message-ID: <8612d33a00246e3049e4cb849ef303bb93622bb6.1795425389.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1795425389.git.zhoubinbin@loongson.cn>
References: <cover.1795425389.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJCxPs80CwRrgNo2AA--.43474S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEACGsDnvwLCwAAsC
X-Coremail-Antispam: 1Uk129KBj9xXoW7Gr4UAw17GF1DGr47Gw4fCrX_yoW3GFb_A3
	Wxta1xWr1kAr17C3y8ZFn2vryaqayxC3WfC3ZrtwsrAa4Dtwn8tryqywnrG3WxCrZ8ur13
	ua17GryxurWxXosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb2kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU84xRDUUUUU==

Add myself as a maintainer for the Loongson SPI driver. I have been
working on the Loongson SPI flash and SPI IO controller drivers and
would like to help review and maintain them.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 70789ce6e507..8223f1b61348 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15738,6 +15738,7 @@ F:	include/dt-bindings/clock/loongson,ls2k-clk.h
 
 LOONGSON SPI DRIVER
 M:	Yinbo Zhu <zhuyinbo@loongson.cn>
+M:	Binbin Zhou <zhoubinbin@loongson.cn>
 L:	linux-spi@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/spi/loongson,ls2k-spi.yaml
-- 
2.52.0

