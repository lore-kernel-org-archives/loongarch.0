Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB89417A308
	for <loongarch@lists.linux.dev>; Wed, 19 Feb 2025 07:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739950373; cv=none; b=JyjOhebZFeE84ZeHpMUnHW/nk8TqwRD8Yuz5R+SlMGj40htL7ZcCC9zTyKxp2hYnO48BjLLfykV6g6S9VZMntXtYKDkA6ZjeLt4rUvdfpKz7ZU9QerIXcSHotDYAKAEpOKIrEou5IQmRW0PYBhU8dt1sseieiwq8k99S3Gw7smM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739950373; c=relaxed/simple;
	bh=WgiOFIEinVea8mtpI1tDJE0Ypcap5EdHprwgezfaCoA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D4DC87R+K2221UKboVNCbruuuItVBBlHENLkvW7Hj6k/E8kra8SK3wEs79lQpqRA8aroi1EnsZRoywth4O3Qsn6y0n4of4sJFlO27c+uI9p58kPeRRJUKx8CVmAuPKwX24CviaC407stnESKf7lokDHno+U4qqKD9WveTQF7Y1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.54.90])
	by gateway (Coremail) with SMTP id _____8CxG6wcibVnbLl6AA--.48492S3;
	Wed, 19 Feb 2025 15:32:44 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.54.90])
	by front1 (Coremail) with SMTP id qMiowMCxPscUibVnO7IbAA--.40817S2;
	Wed, 19 Feb 2025 15:32:36 +0800 (CST)
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
	Qunqin Zhao <zhaoqunqin@loongson.cn>
Subject: [PATCH V3 0/6] Drivers for Loongson security engine
Date: Wed, 19 Feb 2025 15:32:08 +0800
Message-Id: <20250219073214.16866-1-zhaoqunqin@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxPscUibVnO7IbAA--.40817S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Ar47Gw47tF4fKrWUXr15ZFc_yoW8WF4kpF
	45Aa4rCr4UJrZrGrn3J348uFyfXa4fXrW3KrW2qwn8Wr9IyFy8J3yakFyUAFsrJF1UJryI
	qFZ3Cr4UGF1UZacCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1D
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
	1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUxYiiDUUUU

Loongson security engine supports random number generation, hash,
symmetric encryption and asymmetric encryption. Based on these
encryption functions, TPM2 have been implemented in it.

mfd is the baser driver, crypto and tpm are users.

v3: Put the updates to the MAINTAINERS in a separate patch.
v2: Removed misc driver. Added tpm driver.

Qunqin Zhao (6):
  mfd: Add support for Loongson Security Module
  MAINTAINERS: Add maintainer for Loongson Security Module driver
  crypto: loongson - add Loongson RNG driver support
  MAINTAINERS: Add maintainer for Loongson RNG driver
  tpm: Add a driver for Loongson TPM device
  MAINTAINERS: Add tpm_lsse.c to LOONGSON CRYPTO DRIVER entry

 MAINTAINERS                            |  14 +
 drivers/char/tpm/Kconfig               |   9 +
 drivers/char/tpm/Makefile              |   1 +
 drivers/char/tpm/tpm_lsse.c            | 104 +++++++
 drivers/crypto/Kconfig                 |   1 +
 drivers/crypto/Makefile                |   1 +
 drivers/crypto/loongson/Kconfig        |   6 +
 drivers/crypto/loongson/Makefile       |   2 +
 drivers/crypto/loongson/ls6000se-rng.c | 190 +++++++++++++
 drivers/mfd/Kconfig                    |   9 +
 drivers/mfd/Makefile                   |   2 +
 drivers/mfd/ls6000se.c                 | 374 +++++++++++++++++++++++++
 include/linux/mfd/ls6000se.h           |  75 +++++
 13 files changed, 788 insertions(+)
 create mode 100644 drivers/char/tpm/tpm_lsse.c
 create mode 100644 drivers/crypto/loongson/Kconfig
 create mode 100644 drivers/crypto/loongson/Makefile
 create mode 100644 drivers/crypto/loongson/ls6000se-rng.c
 create mode 100644 drivers/mfd/ls6000se.c
 create mode 100644 include/linux/mfd/ls6000se.h


base-commit: 2816b0c949af89640b8dc05de53e650cbf1d55fb
-- 
2.43.0

