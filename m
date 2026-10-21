Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792593964;
	b=NpSmvQPN/4VtUncMW8Iby9tD7DKSAl0xCxHXtvRNdUC6qhcIjZz90Zcl00Wu9hM3jCBt
	 1JyIdBCk2UFgw16Hc4UJzBdvRfi7gdCrGRW6QavlDvAOvTb+mpgvgDO+MJurRGKU1DMp/
	 t1syoAAZUJGTG8/JYcm3jH32yhN92Aq92Oxvikw3EcdPUrQ63ZrjokGO1pCluQmnPEiLd
	 YFw0pA47UbdtiR8ybh4i3OWLuMq7LKBOiM13Zk9menSO5/HWcElOJLlePs8yM0arFHYsd
	 mpuNYrBGmB828Jg1Y2ZV9T+K/FnXmB0TDfRvE67YnExP3+goLymnBiQiKYBBENAs06w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593964;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=MatOHa22WtG+l0uamrIjaG0NC2JllSJQL/SZcG1SYnk=;
	b=bPWtg1J/p/fYaZBYSu0dv2G3LJtT37pwqacZTH6KAnYobpcq5rXYbADI3x25ht0tgGOB
	 VLdB5L8QK87PakYzVrW+P+SL/j2zmvqoFCkdi6xq/yAR6oD97czJtRdI8db+SpTzgD5FG
	 8lkwmnrqWLN9ZknZ3Xe5T36/tkIhDvQjL5z/hhJ9ZCg1AwO3V4Aa6aHnK5+VXW483/qrZ
	 ehmZbqowa+fE8WdVy3pkdXFJohV39rIapfM8eztX439nSUzbTHkeHLjOBU2GnblG3oYhF
	 IduuGOoQlWScgZRi10lyn5HCTuA0W/vH+m1gCmspbrb2hv0EtkiQOS7xjpNgwUZa5pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=C7dnPns2;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE6A606A335
	for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 14:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AE6A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=C7dnPns2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ma
	tOHa22WtG+l0uamrIjaG0NC2JllSJQL/SZcG1SYnk=; b=C7dnPns2P32vgzywFe
	bpTQKcDN75V5x/VBveIBCSruYf8OzOrgR262scCIwAvYaqs+0+tdTr8ohNNM3Av4
	07sh41SFyfhUji91XZ6dAxI93JFYQUxVLj69+zwqs1ioP/IS//+UZWolm3OKG+f1
	W2uMr0gGy7vTtktpeCdobykE4=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3998G0NhqjItXBw--.10228S2;
	Wed, 21 Oct 2026 22:45:27 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Tomasz Nowicki <tn@semihalf.com>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	Julien Grall <julien.grall@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org
Subject: [PATCH v2 0/6] irqchip: validate ACPI MADT entries before use
Date: Wed, 21 Oct 2026 22:45:18 +0800
Message-Id: <20261021144524.364143-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:_____wD3998G0NhqjItXBw--.10228S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar15XFWUXr1UtF18uFW7Jwb_yoW8CrWxpF
	W5KayYvr4fGrW7Arn3Aw4UXFy5Ja95JrW7tFWfta45ur1rK3WDXay2yFWYqF13Ar13G3ZF
	9r4jqF1xuFZ8AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jeLvNUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQcGQGrY0Aci1gAA3d

IRQ chip ACPI probing receives MADT records supplied by firmware. The
common probe path does not currently verify that the complete declared
entry is contained in the table, and several callbacks access fixed-size
or version-dependent records without checking their minimum size.
Malformed entries can therefore cause out-of-bounds reads during early
boot.

Add the common declared-range check first, then validate the concrete ITS,
GIC, LIO-PIC, and BIO-PIC records in their respective callbacks. Each patch
remains independently buildable and limits its changes to one parser
implementation.

The series was checked with scripts/checkpatch.pl. Each patch was also
checked individually and in series for application to the base commit
below.

Jiale Yao (6):
  ACPI: irqchip: validate MADT entry bounds before probing
  irqchip/gic-v3-its: validate MADT ITS entries
  irqchip/gic-v3: validate MADT records before use
  irqchip/gic-v5-its: validate MADT translate frames
  irqchip/loongarch-cpu: validate MADT LIO-PIC entries
  irqchip/loongson-eiointc: validate MADT BIO-PIC entries

---
Changes in v2:
- Use BAD_MADT_GICC_ENTRY() for version-dependent GICC records.
- Replace the open-coded distributor size check with BAD_MADT_ENTRY().
- Remove the redundant distributor check from gic_acpi_init().
- Add Fixes and Cc: stable@vger.kernel.org trailers.
- Rebase the series on the current tree.

 drivers/acpi/scan.c                    |  7 +++++++
 drivers/irqchip/irq-gic-v3-its.c       |  3 +++
 drivers/irqchip/irq-gic-v3.c           | 15 +++++++++++++++
 drivers/irqchip/irq-gic-v5-its.c       |  3 +++
 drivers/irqchip/irq-loongarch-cpu.c    |  3 +++
 drivers/irqchip/irq-loongson-eiointc.c | 10 ++++++++--
 6 files changed, 39 insertions(+), 2 deletions(-)


base-commit: a804c5742bff224d4cb4d25dd383554d598be32b
-- 
2.34.1

