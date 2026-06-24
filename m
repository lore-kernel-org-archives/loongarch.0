Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6761B3A8738
	for <loongarch@lists.linux.dev>; Wed, 24 Jun 2026 08:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782288986; cv=none; b=Wr6Uo1BwTw9+YUjmf6fUHPzQg2fsfnNkB2IkTxabjzla/oGE+hCppxbCgknYaTh7Zg7t6x5RbQQni14q0JKDR+xZ4Ybcgkkhopyokj4mm03jLwJnKsiS3tKN1gqIBpgpPZVbAdAukZEld+nsn1g21dwpFBJhQ4b+I+qDbyjPnxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782288986; c=relaxed/simple;
	bh=XD9QpzUEPCxx5VTxQq5KX+Df2lnNxrnqNRdyaXy2G3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HikNrVcQlb93VqW1mCT2EfFOe9YUI3gD0iZAqvmvjYTtEfsYkbqBZV8999rJQKCMEBSMGwxh4XoVWtRr7wlr0TxYMbFNdsO9p7pdadl3RHbiRniXb2yatrpqijMBmJHvgwiKXp/oG5d8bNvnIpkENv92pfekkIGP+VdppMkcjT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowADH4dhVkjtqwgWwFQ--.64963S2;
	Wed, 24 Jun 2026 16:16:22 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: defconfig: Enable generic I2C slave support
Date: Wed, 24 Jun 2026 16:16:18 +0800
Message-ID: <20260624081618.93699-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADH4dhVkjtqwgWwFQ--.64963S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr1DCr1UGrW5tw1kuryDJrb_yoW8WF1xpw
	n7Ar4DGF4rGF1fCa9rA34kWrZ0yasrJrsrWF13AFyUAa93A34UZr1ktF1DXF4qg393KrW0
	9F93KF9xtFWUKa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUj2YLD
	UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The DesignWare I2C slave object is now carried by the generic
`CONFIG_I2C_SLAVE` symbol:

  i2c-designware-core-$(CONFIG_I2C_SLAVE) += i2c-designware-slave.o

The LoongArch defconfigs still set the stale
`CONFIG_I2C_DESIGNWARE_SLAVE` symbol, which no longer carries that
provider object.  Switch the defconfigs to the current generic I2C slave
symbol so the intended slave support remains enabled.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/loongarch/configs/loongson32_defconfig | 2 +-
 arch/loongarch/configs/loongson64_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/configs/loongson32_defconfig b/arch/loongarch/configs/loongson32_defconfig
--- a/arch/loongarch/configs/loongson32_defconfig
+++ b/arch/loongarch/configs/loongson32_defconfig
@@ -728,7 +728,7 @@ CONFIG_HW_RANDOM_VIRTIO=m
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_PIIX4=y
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_SLAVE=y
+CONFIG_I2C_SLAVE=y
 CONFIG_I2C_DESIGNWARE_PCI=y
 CONFIG_I2C_GPIO=y
 CONFIG_SPI=y
diff --git a/arch/loongarch/configs/loongson64_defconfig b/arch/loongarch/configs/loongson64_defconfig
--- a/arch/loongarch/configs/loongson64_defconfig
+++ b/arch/loongarch/configs/loongson64_defconfig
@@ -750,7 +750,7 @@ CONFIG_TCG_LOONGSON=m
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_PIIX4=y
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_SLAVE=y
+CONFIG_I2C_SLAVE=y
 CONFIG_I2C_DESIGNWARE_PCI=y
 CONFIG_I2C_GPIO=y
 CONFIG_I2C_LS2X=y

