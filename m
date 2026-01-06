Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C4E3101B8
	for <loongarch@lists.linux.dev>; Tue,  6 Jan 2026 01:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767663244; cv=none; b=ZpqbSavWi8vwkeqt5TFgUfEWadLqw43wh+/DRaDx2xu5lOsFDtSmpGikIi707uJ7agk1sGRqLOI3wb+5z+13j99dTKepQ9FCYiDIkEvLJOjpoMupPSGE6G2RrRk51nglsb9NPQ9adYNi+6z0BatwGiNiYWO5msikNUjWbaa1ulw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767663244; c=relaxed/simple;
	bh=J3V6TtuE5AMRP9eOnw0YCgFdBP3IELwK8SngCudlElk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YWyOJWwo7vA8olcXSY3IyyXPHjLkQoi7YHzWmmzpRBKXGt3M0PTgwV/HYHX1YPtpgweZYl8PUbCnj7Dum7M1pECjOwPHHJaZlFmw75sKvdHiYylcJDdgpC+CeMM6q1tafZ35ppY4HvT8W990PpVnhekWO71MGHLm4dvH10OWNuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.1])
	by gateway (Coremail) with SMTP id _____8Dx+8J_Zlxp9s0FAA--.17816S3;
	Tue, 06 Jan 2026 09:33:51 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.1])
	by front1 (Coremail) with SMTP id qMiowJBxKMF8ZlxpN4IPAA--.20395S2;
	Tue, 06 Jan 2026 09:33:49 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Xiaochuang Mao <maoxiaochuan@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 0/3] RTC: Add Loongson-2K0300 support
Date: Tue,  6 Jan 2026 09:33:30 +0800
Message-ID: <cover.1767663073.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxKMF8ZlxpN4IPAA--.20395S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQESCGlbUrYPYAACsh
X-Coremail-Antispam: 1Uk129KBj9xXoWrZr1rXr45JF13XFWftF1DJwc_yoWfKFbE93
	4I9a4xXwn8Xr1xJa43XF17WryfXrWjva1vkasrtw1Fq34xKry5tFZFk3W5JF1xWrW3ZF98
	XayxGFWrAw1SgosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb78YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8czVUUUUUU==

Hi all:

This patch set introduces the Loongson-2K0300 RTC, which has a similar
hardware design to the Loongson-1B, but without the alarm feature.

Thanks.
Binbin

==========
V2:
Patch (1/3):
 - New patch, correct Loongson-1C `interrupts` property;

Patch (2/3):
 - Drop Loongson-1C changes;

Patch (3/3):
 - Rename LS1C_RTC_CTRL_WORKAROUND to LOONGSON_RTC_CTRL_WORKAROUND for
   consistency.

Link to V1:
https://lore.kernel.org/all/cover.1766471839.git.zhoubinbin@loongson.cn/

Binbin Zhou (3):
  dt-binding: rtc: loongson: Correct Loongson-1C interrupts property
  dt-binding: rtc: loongson: Document Loongson-2K0300 compatible
  rtc: loongson: Add Loongson-2K0300 support

 .../devicetree/bindings/rtc/loongson,rtc.yaml | 14 ++++
 drivers/rtc/rtc-loongson.c                    | 71 ++++++++++++-------
 2 files changed, 61 insertions(+), 24 deletions(-)


base-commit: 16bd954c93360145bc77cc601e350913fc28182d
-- 
2.47.3

