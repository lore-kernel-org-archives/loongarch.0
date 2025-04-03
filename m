Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405031898F8
	for <loongarch@lists.linux.dev>; Thu,  3 Apr 2025 02:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743648435; cv=none; b=QSw8fGd0L11D4dsTZPZysAZtN7hb1/Fxhs7SgKHuoCnWxRzxHtUYKIRlD1fwc/aJo8xJsRVZOT/r5+GVUnTBR/NihNaCbquQpqPep/ce9ouWBi4aom5sApCxXPApMOiAltBDLqojQf1wCfsctL8HR8vpIrDG6iL+EThq6bXxNCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743648435; c=relaxed/simple;
	bh=S3q9bb4U9e2oivwjcyGVae6pXFc0/ArY9TSeWTFYhXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S16gHslzSLB7Qzmzr/JBQY9Vr7LZi8mfbM8BedqriV1FeXvTmd8vErFuEFJWHxGsQXbl/JjuiqHhlbCycJIr5urwNWRVEsG1FYg5Ua8YvWvI9GszbsacLoQkd6shD9Y1D4wepurtSerf12IujmoOK1o5VPMr0tNwjJoGY7QSqic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.54.180])
	by gateway (Coremail) with SMTP id _____8AxWXGl9u1nb8evAA--.31090S3;
	Thu, 03 Apr 2025 10:47:01 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.54.180])
	by front1 (Coremail) with SMTP id qMiowMCx7xua9u1ndyJtAA--.61678S3;
	Thu, 03 Apr 2025 10:46:52 +0800 (CST)
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
Subject: [PATCH v7 6/6] MAINTAINERS: Add tpm_loongson.c to LOONGSON CRYPTO DRIVER entry
Date: Thu,  3 Apr 2025 10:47:50 +0800
Message-ID: <20250403024750.4448-2-zhaoqunqin@loongson.cn>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250403024750.4448-1-zhaoqunqin@loongson.cn>
References: <20250403024750.4448-1-zhaoqunqin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCx7xua9u1ndyJtAA--.61678S3
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7GFyftFyrAF48Jr1rCw1xJFc_yoW3Crc_Ca
	y7t3yxXr1kGFn2934FvF97Aw4YvrWrJ3Wxu3WUtw1fX34Utr98trnFyF48K3W3CrW5CFZx
	WayxGFn5Ar1avosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbSAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Wrv_
	ZF1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jVeHDUUUUU=

Changes to Loongson TPM driver would be best reviewed by the Loongson
crypto driver maintainers.

Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
---
v7: Added tag from Jarkko and Huacai
v6: "tpm_lsse.c" -> "tpm_loongson"
v4-v5: None

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 814205642..16fcd35ff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13606,6 +13606,7 @@ LOONGSON CRYPTO DRIVER
 M:	Qunqin Zhao <zhaoqunqin@loongson.com>
 L:	linux-crypto@vger.kernel.org
 S:	Maintained
+F:	drivers/char/tpm/tpm_loongson.c
 F:	drivers/crypto/loongson/
 
 LOONGSON-2 APB DMA DRIVER
-- 
2.45.2

