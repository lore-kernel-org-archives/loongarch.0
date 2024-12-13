Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C5715F3F9
	for <loongarch@lists.linux.dev>; Fri, 13 Dec 2024 03:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734061839; cv=none; b=qmzrCKGHtXgALl+USolaokuOpWG4EiOO5tTspYn5sGvkNx6GEY8kzgKAHJvttwjgr8nJESSZnQrDJBR1ZbALThmIwX3hElRaDO5dL1zfyV9Vyk+MtLbwjTN1FvaTkEM/sQazq+oOYp5PXFmXdO9Ed62h9fBtodX6s1xpYS2rxQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734061839; c=relaxed/simple;
	bh=hiEC7arCdUSMBwLua35LiRBAuVwtm+9jEQwq35PRmnI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PXkX6pxN0n72/OOEjjt6yc2gRiyRR/qZDe+kBy2tKrGd0rG7yrdd0GUHAOeCQ9B8AVQ8/M8FkV+Y06JAevuz1h5cjmelnoMUtOjyUpcabxeyRTWy6ztb2YIlWUEqs0bIK4dQIK+lwhTb7iPYXaRPbYZOPNCZrQ4nuuUGSuR7DQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8BxPOIEr1tnL3BWAA--.37249S3;
	Fri, 13 Dec 2024 11:50:28 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMBxP+EDr1tnV3WBAA--.53391S2;
	Fri, 13 Dec 2024 11:50:27 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Jianmin Lv <lvjianmin@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH v3 0/2] irqchip/loongson-eiointc: Add multiple interrupt pin routing support
Date: Fri, 13 Dec 2024 11:50:24 +0800
Message-Id: <20241213035026.1643517-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxP+EDr1tnV3WBAA--.53391S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

There are four times EIOINTC_REG_ISR register group access in eiointc irq
handler, in order to get all irq status about 256 interrupt vectors. It
causes four times VM-exits since eiointc register are software emulated,
here multiple interrupt pin routing is introduced and each 64 interrupt
vector is routed to one interrupt pin.

With this method, there will be only once EIOINTC_REG_ISR register
group acces in irq handler, it reduces VM-exits.

---
v2 ... v3:
  1. Update to latest kernel version and solve some confliction.
  2. Add strict check about multiple interrupt pin support, only the first
     eiointc device support this since intterrupt pin is limited. In order
     to support multiple eiointc driver in future if there is in future.

v1 ... v2:
  1. Add different route_info handler as eiointc interrupt handler
     parameter, so that irq handler can read corresponding ISR
  2. Call function set_csr_ecfg() to enable cpu interrupt pin in eiointc
     driver inside.
---
Bibo Mao (2):
  irqchip/loongson-eiointc: Route interrupt parsed from bios table
  irqchip/loongson-eiointc: Add multiple interrupt pin routing support

 drivers/irqchip/irq-loongson-eiointc.c | 96 +++++++++++++++++++++++---
 1 file changed, 88 insertions(+), 8 deletions(-)


base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
-- 
2.39.3

