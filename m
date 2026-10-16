Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7AA4E06F9
	for <loongarch@lists.linux.dev>; Fri, 16 Oct 2026 14:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160059; cv=none; b=hokmMS4DX8FGW0KGL4UcVFxOLHA6JnbWrTXi+Dm5/89fhDvpWH6DCwp/4Vskxa4U7zijohJiZ54cMNFvVjdUQoM0+hlwujmxBy6wucWnmKKm1WsuF0Jfom0JxDQPPRYJZOpNWEqn+RIDOsJ4xDAXfdadgGshQtC+nrNWvCn3f7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160059; c=relaxed/simple;
	bh=v/PyYmOYkrobiQR6yP/dzeIcQo4FVtDuMZYe8fPKbhs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IlqUpYdeACPgmh2ymc2Hv4SyuH1IMNsKkS09iRsPgWmVdo99wXgQpinRMIR+l/iuUQOsVS1FgLINyZaM6z8+ZNTkLVhOYCnQhUyNx7Wm6m/7mVIs7efB8wp0YH3gGsfbPVqnPOKyFhP/PN7e+/hba00MsF0TCrjBFbmWGFj/nIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZlW84mKf; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZlW84mKf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Lu
	gxmUDZtjZUlDtTeSS5xY6Q6NCzc214ZizX39XkYqA=; b=ZlW84mKfDRYEQBW2Bq
	ENDY/XlJuoloDLzd++5xc9hla1N0CQsmgcby2I/2LZeSHTO+DSCEmQ0602K2SnaL
	8P9RdMqCyWZIgkpNiF0p7sSXTdX2Qt5z6cIi5sr3XicagJNe0VURVbuBGiV2aIJn
	eL3Hq9fVUpd2HohUvMKlgEx98=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3NysnMdJq1dUUAg--.27711S7;
	Fri, 16 Oct 2026 22:14:05 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 5/6] irqchip/loongarch-cpu: validate MADT LIO-PIC entries
Date: Fri, 16 Oct 2026 22:13:56 +0800
Message-Id: <20261016141357.2793046-6-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016141357.2793046-1-yaojiale02@163.com>
References: <20261016141357.2793046-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3NysnMdJq1dUUAg--.27711S7
X-Coremail-Antispam: 1Uf129KBjvdXoW7JrW3JFyxXr4DuFWDZw4UCFg_yoWDWwb_ur
	n09asrJryj9F1Utr1ktr15X3sIqrWku3Z09rs2qF15C3yfJw1rAFZrJ3yfX3yUKr1vvFn3
	Gr4qvr1Syry2yjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sREMKZPUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7w2m4GrSMS2iigAA3o

The LIO-PIC MADT callback passes a typed record to the controller
initialization code without checking that the complete record is
present. A truncated firmware entry can therefore lead to out-of-bounds
field reads.

Reject incomplete LIO-PIC entries before passing them to the
initialization helper.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/irqchip/irq-loongarch-cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-loongarch-cpu.c b/drivers/irqchip/irq-loongarch-cpu.c
index 84ce24889488..6185825477f4 100644
--- a/drivers/irqchip/irq-loongarch-cpu.c
+++ b/drivers/irqchip/irq-loongarch-cpu.c
@@ -119,6 +119,9 @@ static int __init liointc_parse_madt(union acpi_subtable_headers *header,
 {
 	struct acpi_madt_lio_pic *liointc_entry = (struct acpi_madt_lio_pic *)header;
 
+	if (BAD_MADT_ENTRY(liointc_entry, end))
+		return -EINVAL;
+
 	return liointc_acpi_init(irq_domain, liointc_entry);
 }
 
-- 
2.34.1

