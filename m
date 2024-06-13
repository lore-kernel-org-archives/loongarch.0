Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A7413C9D8
	for <loongarch@lists.linux.dev>; Thu, 13 Jun 2024 07:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718264593; cv=none; b=n9V6sGvDg5BiiIMVmjtEXMrpjKyLqQimETo9dO7NK6PzovJAq25ZJT8eUI/wDufChEaWRCdqLzw6lk3rFkexoPwgDlWDmsMgeq1zzFck7K6S8BFrz5ETOaV3+JPZAi/o3+MKkKiFXxnh+mNgmsFonV5mPeTvDcl3UjQqSNddxfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718264593; c=relaxed/simple;
	bh=YehfgFC2fciO3pRMzakftx9BA51/qmvAe+pwvzKRskQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Pa2SA5Y1PBbr+AOifQM6QO5HbvJH+esc1tYQ6F7mmS/TzNgqkFobcMYYx4TEzfHgkGIHn8wFJOdC8MYSkx86u4MP1bRmYQ26Z2sA6ArmrzLE6EyPMcrM12mI0bO0iCIftjKhogjww+HIUPrqOrqjEmlRvA6sb3634j0N68jICFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.180.133.93])
	by gateway (Coremail) with SMTP id _____8DxDesLo2pmDm0GAA--.25922S3;
	Thu, 13 Jun 2024 15:43:07 +0800 (CST)
Received: from localhost.localdomain (unknown [10.180.133.93])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxusYKo2pmd2AeAA--.9308S2;
	Thu, 13 Jun 2024 15:43:06 +0800 (CST)
From: Hongchen Zhang <zhanghongchen@loongson.cn>
To: Markus Elfring <Markus.Elfring@web.de>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Alex Belits <abelits@marvell.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Nitesh Narayan Lal <nitesh@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Hongchen Zhang <zhanghongchen@loongson.cn>,
	stable@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH v3] PCI: pci_call_probe: call local_pci_probe() when selected cpu is offline
Date: Thu, 13 Jun 2024 15:42:58 +0800
Message-Id: <20240613074258.4124603-1-zhanghongchen@loongson.cn>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxusYKo2pmd2AeAA--.9308S2
X-CM-SenderInfo: x2kd0w5krqwupkhqwqxorr0wxvrqhubq/1tbiAQAHB2ZqUJQEggACsN
X-Coremail-Antispam: 1Uk129KBj93XoW7ZF1DKryktr1ktw1rJrWfXrc_yoW8Gr1fpF
	ZrG34Skr4kJF4UG3Wqqay8uFyFganrJa429a1xCwnxZFZxAF10y3Z7ArW3Jr1UWrWkZr1a
	v3WDAryUGFWUArbCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=

Call work_on_cpu(cpu, fn, arg) in pci_call_probe() while the argument
@cpu is a offline cpu would cause system stuck forever.

This can be happen if a node is online while all its CPUs are
offline (We can use "maxcpus=1" without "nr_cpus=1" to reproduce it).

So, in the above case, let pci_call_probe() call local_pci_probe()
instead of work_on_cpu() when the best selected cpu is offline.

Fixes: 69a18b18699b ("PCI: Restrict probe functions to housekeeping CPUs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Hongchen Zhang <zhanghongchen@loongson.cn>
---
v2 -> v3: Modify commit message according to Markus's suggestion
v1 -> v2: Add a method to reproduce the problem
---
 drivers/pci/pci-driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index af2996d0d17f..32a99828e6a3 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -386,7 +386,7 @@ static int pci_call_probe(struct pci_driver *drv, struct pci_dev *dev,
 		free_cpumask_var(wq_domain_mask);
 	}
 
-	if (cpu < nr_cpu_ids)
+	if ((cpu < nr_cpu_ids) && cpu_online(cpu))
 		error = work_on_cpu(cpu, local_pci_probe, &ddi);
 	else
 		error = local_pci_probe(&ddi);
-- 
2.33.0

