Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47FB28C039
	for <loongarch@lists.linux.dev>; Tue,  6 May 2025 03:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746501546; cv=none; b=d6KgR5zvc/2qm2lk1Uxc2nGmeguJXepp7YbGgp8aWIn9ZXk0ZyjlaFQGnayq9xLsoNw7+CfntVQfe6u/IlWpD41d0mCQlSk9GW1ycfOsVmYlUvQBc4ccBcl9UK+RgPjegL1rm4b+IoadXWltUc4fgG8eYdr021yF1qWwUOoiUF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746501546; c=relaxed/simple;
	bh=ryhKPoWUwe+Ng4U4DIgXodBgXBepgQ2tgOqcnAOfeD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cEjmz2rOubpsCVVTobAkG5DLyH5G1kZK2N8Y0I1yB1NzbIjTVdbo8xYeykbk5LRTi5QlfcoJawwytUj+crpPpwwKBpn+fFyp2Y7oLnuKKoGZxtvJxdIQpn32SdJOxzmvC5vD4eDgFvVI9pBkbwiNDfwlJ5oHH2RQMR26Y0tcsSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.54.178])
	by gateway (Coremail) with SMTP id _____8AxWXGkfxlorUrWAA--.24112S3;
	Tue, 06 May 2025 11:19:00 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.54.178])
	by front1 (Coremail) with SMTP id qMiowMCx7MSPfxloqre1AA--.770S5;
	Tue, 06 May 2025 11:18:53 +0800 (CST)
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
To: lee@kernel.org,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	peterhuewe@gmx.de,
	jarkko@kernel.org
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-crypto@vger.kernel.org,
	jgg@ziepe.ca,
	linux-integrity@vger.kernel.org,
	pmenzel@molgen.mpg.de,
	Qunqin Zhao <zhaoqunqin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH v9 3/5] MAINTAINERS: Add entry for Loongson crypto driver
Date: Tue,  6 May 2025 11:19:45 +0800
Message-ID: <20250506031947.11130-4-zhaoqunqin@loongson.cn>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250506031947.11130-1-zhaoqunqin@loongson.cn>
References: <20250506031947.11130-1-zhaoqunqin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCx7MSPfxloqre1AA--.770S5
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7XFy7urWfGryxCFyUurWUZFc_yoWDtFg_A3
	42g3yxXr1kJFn2kay09FZ3JrWa93yfX3WxC3Z7tw1fZ3sFyF98AFyDAryxG3W3urWj9F43
	uayxGrn7Cr17ZosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbfkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
	1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUxhiSDUUUU

This patch adds an entry for Loongson crypto driver in the list of
maintainers.

Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
---
v9: Added loongson-se.c/.h to the entry.
v8: "RNG" --> "crypto"
v7: Added Huacai's tag
v5-v6: None
v4: Changed tile to "Add entry for ...".
    Lowcased "Maintainers" in commit message.

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 69511c3b2..2d696671e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13931,6 +13931,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
 F:	drivers/i2c/busses/i2c-ls2x.c
 
+LOONGSON CRYPTO DRIVER
+M:	Qunqin Zhao <zhaoqunqin@loongson.cn>
+L:	linux-crypto@vger.kernel.org
+S:	Maintained
+F:	drivers/crypto/loongson/
+F:	drivers/mfd/loongson-se.c
+F:	include/linux/mfd/loongson-se.h
+
 LOONGSON-2 SOC SERIES CLOCK DRIVER
 M:	Yinbo Zhu <zhuyinbo@loongson.cn>
 L:	linux-clk@vger.kernel.org
-- 
2.45.2

