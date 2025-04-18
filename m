Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1BD02AE66
	for <loongarch@lists.linux.dev>; Fri, 18 Apr 2025 09:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744968767; cv=none; b=gbnVTjjoz4HV98QN3LKvGYevmj4BH1yIojEKEGK5wICWnsi/kCyBNvt0QBAJZse409xCffS7U07cHWtTL6SW48BxRNZNhaFJ5NWq3+0hAtVOxEzFlIUA83VoZzA4K7bx1Vn86nSbe2Tgu+spY2CRhLFFxrgJzXTthRlJykfCy34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744968767; c=relaxed/simple;
	bh=xlGgPVpqt2TPjugDY3fL3HsKO/7Xllow9Gh8xKfsZjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bJ8PM/Y8S+ag1UN9YPAJko4AOkNIWanGoLq5m5jvrHdZFrE+850tjR2rZl/bsFAwyHFmIPoMX/DoqZI2zz9i75QZgENVT7v/MNGb8Lr3ofdQr8aUcCJvZxypD2IywC1aGjvVap4vawa4ecZA7YGFS4BeP8mn2qMS7sHY1RRlZho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.54.180])
	by gateway (Coremail) with SMTP id _____8DxfWswHAJoJKLBAA--.58809S3;
	Fri, 18 Apr 2025 17:32:32 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.54.180])
	by front1 (Coremail) with SMTP id qMiowMCx_cYsHAJoGUKJAA--.15831S2;
	Fri, 18 Apr 2025 17:32:28 +0800 (CST)
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
To: herbert@gondor.apana.org.au,
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
Subject: [PATCH v8 0/5] Add Loongson Security Engine chip driver
Date: Fri, 18 Apr 2025 17:34:02 +0800
Message-ID: <20250418093407.1335-1-zhaoqunqin@loongson.cn>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCx_cYsHAJoGUKJAA--.15831S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCr43XFy5WrW7trW7KFWxuFX_yoW5XryDpF
	45C3yfCr4UJr47Gr93try8GFyfZas3Xr9IganrXw15Wr9xAa48XrW3CFyUCF47AF95Xry2
	vFZYkF4UGF1UJacCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvKb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1D
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
	1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_
	JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU
	0xZFpf9x07j5xhLUUUUU=

The Loongson Security Engine chip supports RNG, SM2, SM3 and SM4
accelerator engines. Each engine have its own DMA buffer provided
by the controller. The kernel cannot directly send commands to the
engine and must first send them to the controller, which will
forward them to the corresponding engine. Based on these engines,
TPM2 have been implemented in the chip, then let's treat TPM2 itself
as an engine.

v8: Like Lee said, the base driver goes beyond MFD scope. Since these
    are all encryption related drivers and SM2, SM3, and SM4 drivers
    will be added to the crypto subsystem in the future, the base driver
    need to be changed when adding these drivers. Therefore, it may be
    more appropriate to place the base driver within the crypto subsystem.

    Removed complete callback in all drivers. Removed the concepts of
    "channel", "msg" and "request" as they may be confusing. Used the
    concepts of "egnine" and "command" may be better.

v7: Addressed Huacai's comments.

v6: mfd :MFD_LS6000SE -> MFD_LOONGSON_SE,  ls6000se.c -> loongson-se.c

    crypto :CRYPTO_DEV_LS6000SE_RNG -> CRYPTO_DEV_LOONGSON_RNG,
    ls6000se-rng.c ->loongson-rng.c

    tpm: TCG_LSSE -> TCG_LOONGSON, tpm_lsse.c ->tpm_loongson.c

v5: Registered "ls6000se-rng" device in mfd driver.
v4: Please look at changelog in tpm and MAINTAINERS. No changes to mfd
    and crypto.
v3: Put the updates to the MAINTAINERS in a separate patch.

Qunqin Zhao (5):
  crypto: loongson - Add Loongson Security Engine chip controller driver
  crypto: loongson - add Loongson RNG driver support
  MAINTAINERS: Add entry for Loongson crypto driver
  tpm: Add a driver for Loongson TPM device
  MAINTAINERS: Add tpm_loongson.c to LOONGSON CRYPTO DRIVER entry

 MAINTAINERS                            |   7 +
 drivers/char/tpm/Kconfig               |   9 +
 drivers/char/tpm/Makefile              |   1 +
 drivers/char/tpm/tpm_loongson.c        |  78 ++++++++
 drivers/crypto/Kconfig                 |   1 +
 drivers/crypto/Makefile                |   1 +
 drivers/crypto/loongson/Kconfig        |  17 ++
 drivers/crypto/loongson/Makefile       |   3 +
 drivers/crypto/loongson/loongson-rng.c | 198 ++++++++++++++++++++
 drivers/crypto/loongson/loongson-se.c  | 239 +++++++++++++++++++++++++
 drivers/crypto/loongson/loongson-se.h  |  52 ++++++
 11 files changed, 606 insertions(+)
 create mode 100644 drivers/char/tpm/tpm_loongson.c
 create mode 100644 drivers/crypto/loongson/Kconfig
 create mode 100644 drivers/crypto/loongson/Makefile
 create mode 100644 drivers/crypto/loongson/loongson-rng.c
 create mode 100644 drivers/crypto/loongson/loongson-se.c
 create mode 100644 drivers/crypto/loongson/loongson-se.h


base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
-- 
2.45.2

