Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792989095;
	b=D6XYQhX7j8491XR7JvcprOyACjR+XGf1+7fPKkmG7VWhl7qMNRY3lLVA1xkpJnCYNAEh
	 ROgZvJ0uXffH063nZCM/idXAEhFgTExBlXKGiyoZhOghyyDJY4BGGwkwD8AM0W9WyR86t
	 UgCtXIu1eqrB7SZVJi2/aaM9OUHuWttc9sfg/9M7tXgkeJ5DDgwuKVDs5tUvC8QIM9jHy
	 H9XQlSb708yE5GVDb7/L5WVVcIKZt+9rNmtteZFz6YELQTSDZCTPt4fL+5NJOt2hKabJt
	 cavHqPJbkMtK6tmdnramW9S//AZSlgTooTcmGskTo/58dG/Y6/44zhldQ1KEE4aGCig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989095;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=7efESmXQRXOKsU4q+RY+I8mql7lhNDcnar7TApQ4pmM=;
	b=icByjhdg5SvV54oLiKT9vQ1nwPW2o+ybXYD2jKLGkgKTWBlc6if7NEpOTD4huga5UWSm
	 xPRNoRduEQgOyLbZd+vMtPIm2iyvK8DffVy3NhLPmTMeFko/4y7mNzJ9tl7vI6nr6R+DP
	 JsnnKGyNb/NY/xKVEFpCfEte3iFoZvxRrok92tkfOzInx1pRCtky776Vovg9aM6Tk+iFD
	 60YoO4NCssKc2fWbwFBtznrSynVu2RkGShSkzq6dcADUdT2Q8wC8N5v0iTPVsQNfFpyBO
	 NmecHogSnhMSxAZppBIDe3/x3Zosihe3owdWrT+X/PGWTRJjPu+GadbNFVVJG6VfOtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC5A606A31A
	for <loongarch@lists.linux.dev>; Mon, 26 Oct 2026 04:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FC5A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8BxW_Ci195qal0ZAA--.8125S3;
	Mon, 26 Oct 2026 12:31:30 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJAxlMyh195qoTgwAA--.8141S2;
	Mon, 26 Oct 2026 12:31:30 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 0/4] loongson2-apb-cmc-dma: Fixes issues and pause/resume support
Date: Mon, 26 Oct 2026 12:31:19 +0800
Message-ID: <cover.1792988985.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
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
X-CM-TRANSID:qMiowJAxlMyh195qoTgwAA--.8141S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEMCGretPgBXAABsg
X-Coremail-Antispam: 1Uk129KBj9xXoW7Gw4DXF4rGrW3Aw18WF4ftFc_yoWxuFg_ZF
	yjvFWIqrWqgFy3tay3Xr18ArW3ZrWDW3WakF1Yqw1kWw1jk3Z3Jr97Zw15uFy7Xr1xZrn8
	uw48uF1xAw1FkosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU83UUUUUUUU==

Hi all:

This series fixes three bugs in the Loongson 2 APB CMC DMA driver and
adds pause/resume support on top.

Thanks.
Binbin

Binbin Zhou (4):
  dmaengine: loongson: loongson2-apb-cmc-dma: Fix cyclic residue wrap
    NULL dereference
  dmaengine: loongson: loongson2-apb-cmc-dma: Fix residue for queued
    descriptors
  dmaengine: loongson: loongson2-apb-cmc-dma: Program CNDTR when
    advancing sg
  dmaengine: loongson: loongson2-apb-cmc-dma: Add pause/resume support

 drivers/dma/loongson/loongson2-apb-cmc-dma.c | 134 +++++++++++++++++--
 1 file changed, 124 insertions(+), 10 deletions(-)


base-commit: aff5e6a77fc69a7c490246465940d18422d7c631
-- 
2.52.0

