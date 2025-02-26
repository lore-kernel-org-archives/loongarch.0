Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472B4218ACA
	for <loongarch@lists.linux.dev>; Wed, 26 Feb 2025 03:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740539094; cv=none; b=CLrssWWtVvtr8rq1//qYQWLUG2ebmf7xo7RX2eLuFVeLaWG4iLxTwvJ+/G6rQN4c8AmIQOw8jRdojptL1+RGXqM6yUycS6W5jJVxMFVVE0ha1wWfPw6/qTag+1g2KC/EYKUc8nfTSccEWjHonoT6R3zYyxYYcgjKuB2wbaWJPqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740539094; c=relaxed/simple;
	bh=EA8WmfBYImyBSqmV9OCSofgyjl1TDMa6hbVyzG3qnhA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ciq0Ta1YpoURdlMDXaImcGytGIyvPRWpaCC/GOjjk8+izRzXR75EkiVn5CcSQHY3gpd6JocpjtHYLSqXfE2bp0aG3TbFZ8pPpatm8MMsgJ8VGi8T7Cp7i7FjTbKqBpFt5snXYXfLjVKlE107CbIa2iBJrwX5+18vDVcDteQKHI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.54.90])
	by gateway (Coremail) with SMTP id _____8AxjmvOhL5n9eqCAA--.27660S3;
	Wed, 26 Feb 2025 11:04:46 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.54.90])
	by front1 (Coremail) with SMTP id qMiowMCxPseyhL5nLxIpAA--.23547S6;
	Wed, 26 Feb 2025 11:04:36 +0800 (CST)
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
	Qunqin Zhao <zhaoqunqin@loongson.cn>
Subject: [PATCH v4 4/6] MAINTAINERS: Add entry for Loongson RNG driver
Date: Wed, 26 Feb 2025 11:03:56 +0800
Message-Id: <20250226030358.15924-5-zhaoqunqin@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250226030358.15924-1-zhaoqunqin@loongson.cn>
References: <20250226030358.15924-1-zhaoqunqin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxPseyhL5nLxIpAA--.23547S6
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Xr1UZryUGrWxZFyxJr15Jrc_yoW3KFb_J3
	y7KayxXF4kJFn2yayxZFn7Aryaqw4xX3Wfu3Z7tw4rZa4qyasxAryDAFy7Gw15CrWYgF43
	XayxGr97ur17ZosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbfkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
	1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU36RRDUUUU

This patch adds an entry for Loongson RNG driver in the list of
maintainers.

Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
---
v4: Changed tile to "Add entry for ...".
    Lowcased "Maintainers" in commit message.

 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1b741b20f8..3f04f43ffe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13602,6 +13602,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
 F:	drivers/gpio/gpio-loongson-64bit.c
 
+LOONGSON CRYPTO DRIVER
+M:	Qunqin Zhao <zhaoqunqin@loongson.com>
+L:	linux-crypto@vger.kernel.org
+S:	Maintained
+F:	drivers/crypto/loongson/
+
 LOONGSON-2 APB DMA DRIVER
 M:	Binbin Zhou <zhoubinbin@loongson.cn>
 L:	dmaengine@vger.kernel.org
-- 
2.43.0

