Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA050664C6
	for <loongarch@lists.linux.dev>; Thu, 27 Mar 2025 02:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743041936; cv=none; b=KpMfxoDUMObJ5P1zTllkIidStMq6H3tVke+xa4o4vDt9mMUSDpn90JUk3SmsbjpiuRaLw4nn2OmCxKpkr1vmijTZIt8QdI6GbSEisbtDhrbGQHfDr+kZw7whc1lvLdHCKH+XKMSwLcfZuFY+Ayj5TMDc5rVRJHfh+VmGVHIMre8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743041936; c=relaxed/simple;
	bh=DlEwUZ/5a8Jqc6JdqoVt8d9UL5upaR9WJUWmUWNmivY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I5FcITwJqAfIeXpIpLTIe3J1zNOui4Zfu3TPlaodw5I6TaQnr7EwIaGLf4PwBMvdUq2/xxlzitgzUcPLhzxNy5Z227vBr4Z0v7yE5rfSk2jFlGN/2BqjETCi5t1EvCgNOvTohQccNIjJ9wukELr8dkLPp1uslgTou28uiglKVTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.54.180])
	by gateway (Coremail) with SMTP id _____8Bx366GteRnmL2nAA--.1180S3;
	Thu, 27 Mar 2025 10:18:46 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.54.180])
	by front1 (Coremail) with SMTP id qMiowMBxHcV3teRnOnJiAA--.29069S3;
	Thu, 27 Mar 2025 10:18:33 +0800 (CST)
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
Subject: [PATCH v6 6/6] MAINTAINERS: Add tpm_loongson.c to LOONGSON CRYPTO DRIVER entry
Date: Thu, 27 Mar 2025 10:19:40 +0800
Message-ID: <20250327021940.29969-2-zhaoqunqin@loongson.cn>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250327021940.29969-1-zhaoqunqin@loongson.cn>
References: <20250327021940.29969-1-zhaoqunqin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxHcV3teRnOnJiAA--.29069S3
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrXw1DtFykXrW8JryDWw1Dtwc_yoWxWrb_Aa
	y2ga97XF1kGFnrAa40vFZ3AryYvrWrJ3Wru3WDtw1fX34jyr90yrnFyF48K3W5CrW5CFZx
	WayxGF93Cr13ZosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
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
---
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

